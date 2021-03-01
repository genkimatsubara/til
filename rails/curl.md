# curlコマンドとは
- さまざまなプロトコルに対応したデータを転送するためのコマンド

# 使い方
### GET
```
$ curl URL
```

# エラー対応
```
curl: (7) Failed to connect to localhost port 3000: Connection refused
```
- このようなエラーが出たときは、`rails s`をした後に、もう一つ別のターミナルでログインした上で、`curl`を実行する必要がある。
