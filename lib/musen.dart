// MusenResp
// /musen/listのレスポンスからトータルカウントを取り出したい
// MusenResp.fromJson(####)渡すのは resJson['musenInformation']
class MusenResp {
  // final String musenInformation;
  // final String musen;
  final String lastUpdateDate;
  final String totalCount;

  MusenResp(this.lastUpdateDate, this.totalCount);

  // MusenResp.fromJson(Map<String, dynamic> json)
  //     : musen = json['musen'],
  //       musenInformation = json['musenInformation'];

  MusenResp.fromJson(Map<String, dynamic> json)
      : lastUpdateDate = json['lastUpdateDate'],
        totalCount = json['totalCount'];

  Map<String, dynamic> toJson() => {
        // 'musen': musen,
        // 'musenInformation': musenInformation,
        'lastUpdateDate': lastUpdateDate,
        'totalCount': totalCount,
      };
}

// 使わない
class StationInfo {
  // listInfo
  final String no;
  final String name;
  final String tdfkCd;
  final String radioStationPurpose;
  final String licenseDate;
  // datailInfo
  final String address;
  final String radioStationCategory;
  final String validDate;
  final String movementArea;
  final String radioSpec;

  StationInfo(
    this.no,
    this.name,
    this.tdfkCd,
    this.radioStationPurpose,
    this.licenseDate,
    this.address,
    this.radioStationCategory,
    this.validDate,
    this.movementArea,
    this.radioSpec,
  );

  StationInfo.fromJson(Map<String, dynamic> json)
      : no = json['listInfo']['no'],
        name = json['listInfo']['name'],
        tdfkCd = json['listInfo']['tdfkCd'],
        radioStationPurpose = json['listInfo']['radioStationPurpose'],
        licenseDate = json['listInfo']['licenseDate'],
        address = json['detailInfo']['address'],
        radioStationCategory = json['detailInfo']['radioStationCategory'],
        validDate = json['detailInfo']['validDate'],
        movementArea = json['detailInfo']['movementArea'],
        radioSpec = json['detailInfo']['radioSpec'];

  Map<String, dynamic> toJson() => {
        'no': no,
        'name': name,
        'tdfkCd': tdfkCd,
        'radioStationPurpose': radioStationPurpose,
        'licenseDate': licenseDate,
        'address': address,
        'radioStationCategory': radioStationCategory,
        'validDate': validDate,
        'movementArea': movementArea,
        'radioSpec': radioSpec,
      };
}

// ListInfoResp.fromJson(####)渡すのは resJson['musen'][k]['listInfo']
class ListInfoResp {
  final String name;
  final String radioStationPurpose;
  final String tdfkCd;
  final String no;
  final String licenseDate;

  ListInfoResp(
    this.name,
    this.radioStationPurpose,
    this.tdfkCd,
    this.no,
    this.licenseDate,
  );

  ListInfoResp.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        radioStationPurpose = json['radioStationPurpose'],
        tdfkCd = json['tdfkCd'],
        no = json['no'],
        licenseDate = json['licenseDate'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'radioStationPurpose': radioStationPurpose,
        'tdfkCd': tdfkCd,
        'no': no,
        'licenseDate': licenseDate,
      };
}

// DetailInfoResp.fromJson(####)渡すのは resJson['musen'][k]['detailInfo']
class DetailInfoResp {
  final String radioSpec1;
  final String radioStationPurpose;
  final String note;
  final String permittedOperatingHours;
  final String address;
  final String licenseDate;
  final String broadcastMatter;
  final String commMatter;
  final String office;
  final String validTerms;
  final String commPartner;
  final String startingLimit;
  final String broadcastDistrict;
  final String workPersonName;
  final String identificationSignals;
  final String radioStationNumber;
  final String radioStationCategory;
  final String movementArea;
  final String radioEuipmentLocation;
  final String licenseNumber;
  final String name;

  DetailInfoResp(
    this.radioSpec1,
    this.radioStationPurpose,
    this.note,
    this.permittedOperatingHours,
    this.address,
    this.licenseDate,
    this.broadcastMatter,
    this.commMatter,
    this.office,
    this.validTerms,
    this.commPartner,
    this.startingLimit,
    this.broadcastDistrict,
    this.workPersonName,
    this.identificationSignals,
    this.radioStationNumber,
    this.radioStationCategory,
    this.movementArea,
    this.radioEuipmentLocation,
    this.licenseNumber,
    this.name,
  );

  DetailInfoResp.fromJson(Map<String, dynamic> json)
      : radioSpec1 = json['radioSpec1'],
        radioStationPurpose = json['radioStationPurpose'],
        note = json['note'],
        permittedOperatingHours = json['permittedOperatingHours'],
        address = json['address'],
        licenseDate = json['licenseDate'],
        broadcastMatter = json['broadcastMatter'],
        commMatter = json['commMatter'],
        office = json['office'],
        validTerms = json['validTerms'],
        commPartner = json['commPartner'],
        startingLimit = json['startingLimit'],
        broadcastDistrict = json['broadcastDistrict'],
        workPersonName = json['workPersonName'],
        // 末尾の空白を削除する
        identificationSignals = json['identificationSignals'].trim(),
        radioStationNumber = json['radioStationNumber'],
        radioStationCategory = json['radioStationCategory'],
        movementArea = json['movementArea'],
        radioEuipmentLocation = json['radioEuipmentLocation'],
        licenseNumber = json['licenseNumber'],
        name = json['name'];

  Map<String, dynamic> toJson() => {
        'radioSpec1': radioSpec1,
        'radioStationPurpose': radioStationPurpose,
        'note': note,
        'permittedOperatingHours': permittedOperatingHours,
        'address': address,
        'licenseDate': licenseDate,
        'broadcastMatter': broadcastMatter,
        'commMatter': commMatter,
        'office': office,
        'validTerms': validTerms,
        'commPartner': commPartner,
        'startingLimit': startingLimit,
        'broadcastDistrict': broadcastDistrict,
        'workPersonName': workPersonName,
        'identificationSignals': identificationSignals,
        'radioStationNumber': radioStationNumber,
        'radioStationCategory': radioStationCategory,
        'movementArea': movementArea,
        'radioEuipmentLocation': radioEuipmentLocation,
        'licenseNumber': licenseNumber,
        'name': name,
      };
}
