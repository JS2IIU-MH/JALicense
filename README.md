# JA License

<img src="doc/JALicense.png" width=500>

総務省、電波利用ホームページの無線局検索をスマホから手軽に使えるようにしました。
移動運用のお供にしていだだけたら幸いです。

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

## 今後の追加機能
- 地図が開くようにする
- QRZ.comが開くようにする
- JS2IIUを入力したらピカピカさせる！？
