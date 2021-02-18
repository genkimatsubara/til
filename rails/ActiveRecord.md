# ActiveRecordとは
- 「RubyとSQLの翻訳機」のようなもので、DBを操作するにはDB言語が必要だが、RailsにはModelにActiveRecordが適用されているおかげで、Rubyを用いてBDからデータを探したり、持ってきたりすることができる。なのでSQLを直に実行する必要はほぼなくなる。
- どのBDを使用してもActiveRecordのおかげですべてRubyで記述してくれるようにしてくれる
- all,find,find_byなどもActiveRecordがDBからオブジェクトを取り出すために用意してくれた検索メソッドである。

# ActiveRecordにはさまざまな機能が搭載されており、その中でも特に重要なもの
- モデルおよびモデル内のデータを表現する
- モデル同士の関連付け（アソシエーション）を表現する
- 関連づけられているモデル間の継承階層を表現する
- データをデータベースで永続化する前にバリデーション（検証）を行う
- データベースをオブジェクト指向スタイルで操作する

# 命名ルール
- モデルのクラス
単数形、語頭を大文字にする
- DBのテーブル
複数形、語はアンダースコアで区切られる

# スキーマのルール
Active Recordでは、データベースのテーブルで使うカラム名についても利用目的に応じたルールがある。
- 外部キー
このカラムはテーブル名の`単数形_id`にする必要があります。ActiveRecordがモデル間の関連付けを作成するときに参照されます。
- 主キー
デフォルトではidという名前のintegerカラムがテーブルの主キーに使われる。ActiveRcordマイグレーションでテーブルを作成するとこのカラムが自動的に作成される。

# ActiveRecordの検索メソッドについて
##  createとnewの違い
- create
```
user = User.create(name: "David", occupation: "Cord Artist")
```
`create`を実行すると新しいオブジェクトが返され、さらにデータベースに保存される。
- new
```
user = User.new
user.name = "David"
user.occupation = "Cord Artist"
```
`newメソッド`でインスタンスを作成する場合、オブジェクトは保存されない。`user.save`を実行して初めて、データベースにレコードがコミットされる。
## findメソッド
```
david = User.find(name: "David")
```
- `findメソッド`はidしか引数として受け付けず、id以外のものはエラーになる。
## destoryメソッド
- 全てのデータを削除する
```
User.destory_all
```
destory_allは全てのデータを削除するときに使う
- 一つのデータを削除する
```
user = User.find_by(name: "David")
user.destory
```
destoryはデータを一つ削除するときに使う。（先にオブジェクトを取得しなければ使えない）複数削除することも可
- Davidという名前のユーザーを検索して全て削除する
```
User.destroy_by(name: "David")
User.destroy_all
```
## update,save
- update,saveメソッドは、バリデーションに失敗するとfalseを返す。このとき実際にデータベース操作は行われない。しかし、このメソッドにはそれぞれ破壊的なバージョン(save!,update!)があり、こちらは、検証に失敗した場合にさらに厳しい対応、つまり`ActiveRecord:RecordInvalid`が発生する。
