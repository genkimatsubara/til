## curlコマンドで特定の記事の更新
```
curl -X PUT -F 'article[title]=title updete' -F 'article[content]=content update' http://127.0.0.1:3000/articles/1
```

## curlコマンドで特定の記事の削除
```
curl -X DELETE http://127.0.0.1:3000/articles/1
```

## postmanで特定の記事の更新
![代替テキスト](https://i.gyazo.com/5e6f25861adb68f8a57dd9b9b4b104c7.png)

## postmanで特定の記事の削除
![代替テキスト](https://i.gyazo.com/276cadd23376626392509614e332e5fa.png)