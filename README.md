# JA License

<img src="doc/JALicense.png" width=720>

総務省、電波利用ホームページの無線局検索をスマホから手軽に使えるようにしました。
移動運用のお供にしていだだけたら幸いです。

![](https://byob.yarr.is/JS2IIU-MH/JALicense/time)
[![License: MIT](https://img.shields.io/badge/License-MIT-brightgreen.svg)](LICENSE)

<img src="doc/JALicense_image.png" width=500>

## アプリ修正メモ
- 連続で検索する場合に、結果のリストが消されずに追記されてしまう
    - 変数クリアの間違いを修正
- テキストボックスで×を押した時の挙動、最初の状態に戻れるようにする
    - `ListView`で表示した内容をクリアさせるよう修正
- 小文字で入れても大文字にする
    - `TextEditingController`の`toUpperCase()`を指定
- リストの件数が多い時には下にスクロールできるようにする
    - `ListView`でラップする
- カラー指定を`Theme.of(context).colorScheme`で統一しました
- 地図が開くようにする
- QRZ.comが開くようにする
    - 地図はWebブラウザでGoogleMapsが開き、常置場所の地図を表示するようにしました。QRZ.comのコールサインページがあれば表示します。なければ、多分、QRZ.comのページがありませんページが表示されます。
- 移動運用の/P, /2などが入力されても検索できるようにしました

## 今後の追加機能
- JCCコードを表示させる
- JS2IIUを入力したらピカピカさせる！？

## 参考にしたページ
- [url_launcherを使ってハマった!](https://zenn.dev/flutteruniv_dev/articles/ee377ae7f1fe05)
- [［Flutter］ Dartの文字列操作チートシート](https://zenn.dev/tris/articles/bf623e5e65fac3)

