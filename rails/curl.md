# curlコマンドとは
- さまざまなプロトコルに対応したデータを転送するためのコマンド

# 使い方
### GET(記事の一覧取得)
```
$ curl URL
```
### POST（記事の新規作成）
```
curl -X POST -F 'article[title]=hoge' -F 'article[content]=fuga' URL
```
### PUT（特定の記事を更新）
```
curl -X PUT -F 'article[title]=title updete' -F 'article[content]=content update' URL/:id
```
### DELETE(特定の記事を削除)
```
curl -X DELETE URL/:id
```
# エラー対応
```
curl: (7) Failed to connect to localhost port 3000: Connection refused
```
- このようなエラーが出たときは、`rails s`をした後に、もう一つ別のターミナルでログインした上で、`curl`を実行する必要がある。
