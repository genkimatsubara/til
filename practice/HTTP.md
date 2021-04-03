## curlコマンドで特定の記事の更新
```
curl -X PATCH -F 'article[title]=title updete' -F 'article[content]=content update' http://127.0.0.1:3000/articles/2
```

## curlコマンドで特定の記事の削除
```
curl -X DELETE http://127.0.0.1:3000/articles/2
```

## postmanで特定の記事の更新
![代替テキスト](https://i.gyazo.com/6b630bc5a35f203a98c794389d010c46.png)
## postmanで特定の記事の削除
![代替テキスト](https://i.gyazo.com/c6712a6db38ba04c4bf183682cc0efa8.png)