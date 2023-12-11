import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'musen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JA License',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 5, 14, 62)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'JA Callsign Search'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();
  String searchResult = "総務省電波利用ホームページの\n検索結果を表示します。";
  List detailInfo = [];
  List listInfo = [];
  var gitemCount = 0;
  String searchCallsign = '';
  List outStr = [];
  RegExp regJACall = RegExp(r'^[J78][A-S][0-9][A-Z]{2,3}');

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final String text = _controller.text.toUpperCase();
      _controller.value = _controller.value.copyWith(
        text: text,
        selection:
            TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String genResultString(ListInfoResp listInfo, DetailInfoResp detailInfo) {
    String out = '';

    // int.parse(string)
    var _i = listInfo.no;
    var _name = listInfo.name;
    var _location = detailInfo.radioEuipmentLocation;
    var _licDate = detailInfo.licenseDate;
    var _licValid = detailInfo.validTerms;
    var _moveArea = detailInfo.movementArea;
    var _radioSpec = detailInfo.radioSpec1;

    out = '[$_i/$gitemCount] $_name\n$_location\n$_licDate から $_licValid\n';
    out = '$out$_moveArea\n$_radioSpec';
    debugPrint(out);

    return out;
  }

  Card genResultCard(ListInfoResp listInfo, DetailInfoResp detailInfo) {
    var searchResult = genResultString(listInfo, detailInfo);
    var gCard = Card(
      child: Row(children: <Widget>[
        Text(searchResult),
      ]),
    );

    return gCard;
  }

  Future<void> qrzSearch(String callSign) async {
    debugPrint(callSign);
    debugPrint(regJACall.hasMatch(callSign).toString());

    if ((callSign.length > 5) & (regJACall.hasMatch(callSign))) {
      // final url = Uri.parse('http://www.tele.soumu.go.jp/musen/list');
      final httpsUri = Uri(
        scheme: 'https',
        host: 'www.tele.soumu.go.jp',
        path: '/musen/list',
        queryParameters: {
          'ST': 1,
          'OF': 2,
          'DA': 1,
          'SC': 1,
          'DC': 1,
          'OW': 'AT',
          'MA': callSign
        }.map(((key, value) => MapEntry(key, value.toString()))),
      );
      var response = await http.get(httpsUri);
      var jsonResponse = jsonDecode(response.body);

      var resMusen = MusenResp.fromJson(jsonResponse['musenInformation']);
      var itemCount = int.parse(resMusen.totalCount);
      // gitemCount = itemCount;

      setState(() {
        gitemCount = itemCount;
        // clear search result information
        detailInfo.clear();
        listInfo.clear();
        outStr.clear();
        if (itemCount > 0) {
          // detailInformation取得
          for (int i = 0; i < itemCount; i++) {
            detailInfo.add(DetailInfoResp.fromJson(
                jsonResponse['musen'][i]['detailInfo']));
            listInfo.add(
                ListInfoResp.fromJson(jsonResponse['musen'][i]['listInfo']));
            outStr.add(
                '[${i + 1}/$gitemCount] ${detailInfo[i].address} (${detailInfo[i].identificationSignals})\n${detailInfo[i].radioEuipmentLocation}\n${detailInfo[i].licenseDate}から${detailInfo[i].validTerms}\n${detailInfo[i].movementArea}\n${detailInfo[i].radioSpec1}');
          }
          searchResult =
              '常置場所＝${listInfo[0].tdfkCd}\n  ※データ更新日：${resMusen.lastUpdateDate}';
        }
      });
    } else {
      setState(() {
        searchResult = 'コールサイン入力を確認してください。';
      });
    }
    debugPrint(searchResult);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.bold,
            )),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
        children: <Widget>[
          const Gap(20),
          // const Text(
          //   "Callsign",
          //   style: TextStyle(fontSize: 20),
          // ),
          const Gap(10),
          SizedBox(
            width: 300,
            child: TextFormField(
              textCapitalization: TextCapitalization.characters,
              keyboardType: TextInputType.text,
              enabled: true,
              maxLength: 12,
              style: const TextStyle(fontSize: 22),
              controller: _controller,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: "callsign",
                // helperText: "Callsign here",
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  onPressed: () {
                    _controller.clear();
                    debugPrint('_controller.text: ${_controller.text}');
                    setState(() {
                      searchCallsign = "";
                      gitemCount = 0;
                      searchResult = "総務省電波利用ホームページの\n検索結果を表示します。";
                    });
                  },
                  icon: const Icon(Icons.clear),
                ),
              ),
              onFieldSubmitted: (callsign) {
                // qrzSearch(callsign);
                searchCallsign = callsign;
                debugPrint(callsign);
              },
            ),
          ),
          const Gap(10),
          ElevatedButton(
            onPressed: () {
              qrzSearch(_controller.text);
              setState(() {
                searchResult = "検索中です。お待ちください。";
              });

              debugPrint('search pressed');
              debugPrint(_controller.text);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              fixedSize: const Size(300, 50),
              textStyle: const TextStyle(fontSize: 22),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            child: const Text('Search'),
          ),
          const Gap(20),
          Text(
            searchResult,
            style: const TextStyle(fontSize: 18),
          ),
          const Gap(20),
          ListView.builder(
              padding: const EdgeInsets.all(1.0),
              shrinkWrap: true,
              itemCount: gitemCount,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 150,
                  padding: const EdgeInsets.all(10),
                  color: Theme.of(context).colorScheme.secondary,
                  child: Text(
                    outStr[index],
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
