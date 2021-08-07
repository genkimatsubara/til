# curl
さまざまなプロトコルに対応し、サーバからもしくはサーバへデータ転送を行うコマンド
HTTPのGETやPOSTはもちろん、HTTPSやFTP, Telnet, SMTP, IMAP, POP3など様々な通信プロトコルをサポートしている
```
curl [オプション] <URL>
```

# オプション
| オプション | 内容 |
| :--- | :--- |
| -X | メソッドの指定。これを指定しない場合はデフォルトでGETになる。 | 
| -I | レスポンスのヘッダーのみを取得して出力 | 
| -i | レスポンスのヘッダー、ボディ両方を取得して出力 | 
| -v | リクエストのヘッダー、レスポンスのヘッダー、ボディ両方を取得して出力 | 
| -o | ファイルの保存 | 
| -u | 認証情報の付与 | 
| -o | 出力ファイルの保存 | 
|  |  | 
|  |  | 
|  |  |   
|  |  | 
  

# curlコマンドで（GET,POST,PATCH,DELETE）の動作確認
(rails scaffoldで作成したものを使用)


## GET(記事一覧取得)
```
matsubaragenki@matsubaragenmarenoMacBook-Air ~ % curl http://localhost:3000/articles
<!DOCTYPE html>
<html>
  <head>
    <title>CurlExample</title>
    <meta name="csrf-param" content="authenticity_token" />
<meta name="csrf-token" content="Rxgu+YHJllFMsYHeZIoHV3amyWME1aa2M6P/ByeDAlmPYMg88tK4+mTNdiqHCGxa8+5noVpcPF8Dk9nb3h1Kig==" />
    

    <link rel="stylesheet" media="all" href="/assets/articles.self-e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855.css?body=1" data-turbolinks-track="reload" />
<link rel="stylesheet" media="all" href="/assets/scaffolds.self-e54348d3cefde5f535be218596af9c0f8596b6b453d874915c0fe2e312613615.css?body=1" data-turbolinks-track="reload" />
<link rel="stylesheet" media="all" href="/assets/application.self-f0d704deea029cf000697e2c0181ec173a1b474645466ed843eb5ee7bb215794.css?body=1" data-turbolinks-track="reload" />
    <script src="/assets/rails-ujs.self-81c572f39b69ead02e3f97fe43b76954a434591bc2837e3a35af212315e67569.js?body=1" data-turbolinks-track="reload"></script>
<script src="/assets/activestorage.self-1ed4604ac2170045f1ffca4edb81a75246661555e4f9cf682bb8a21825e32e1c.js?body=1" data-turbolinks-track="reload"></script>
<script src="/assets/turbolinks.self-569ee74eaa15c1e2019317ff770b8769b1ec033a0f572a485f64c82ddc8f989e.js?body=1" data-turbolinks-track="reload"></script>
<script src="/assets/articles.self-877aef30ae1b040ab8a3aba4e3e309a11d7f2612f44dde450b5c157aa5f95c05.js?body=1" data-turbolinks-track="reload"></script>
<script src="/assets/action_cable.self-69fddfcddf4fdef9828648f9330d6ce108b93b82b0b8d3affffc59a114853451.js?body=1" data-turbolinks-track="reload"></script>
<script src="/assets/cable.self-8484513823f404ed0c0f039f75243bfdede7af7919dda65f2e66391252443ce9.js?body=1" data-turbolinks-track="reload"></script>
<script src="/assets/application.self-66347cf0a4cb1f26f76868b4697a9eee457c8c3a6da80c6fdd76ff77e911715e.js?body=1" data-turbolinks-track="reload"></script>
  </head>

  <body>
    <p id="notice"></p>

<h1>Articles</h1>

<table>
  <thead>
    <tr>
      <th>Title</th>
      <th>Content</th>
      <th colspan="3"></th>
    </tr>
  </thead>

  <tbody>
  </tbody>
</table>

<br>

<a href="/articles/new">New Article</a>

  </body>
</html>
```
[![Image from Gyazo](https://i.gyazo.com/ce7cd908a449db2d2f25045c884a8768.png)](https://gyazo.com/ce7cd908a449db2d2f25045c884a8768)

  
## POST(記事新規作成）
```
matsubaragenki@matsubaragenmarenoMacBook-Air ~ % curl -X POST -F "article[title]=greeting" -F "article[content]=hello world" http://localhost:3000/articles
<html><body>You are being <a href="http://localhost:3000/articles/2">redirected</a>.</body></html>%   
```
[![Image from Gyazo](https://i.gyazo.com/481ab28c6cf7d1be2630fac1c58c8c8e.png)](https://gyazo.com/481ab28c6cf7d1be2630fac1c58c8c8e)

  
## PATCH(特定の記事を更新)
```
matsubaragenki@matsubaragenmarenoMacBook-Air ~ % curl -X PATCH -F "article[title]=greeting update" -F "article[content]=hello world update" http://localhost:3000/articles/2
<html><body>You are being <a href="http://localhost:3000/articles/2">redirected</a>.</body></html>%  
```
[![Image from Gyazo](https://i.gyazo.com/eb7154ccca189d91c3050f8b3cfe1bec.png)](https://gyazo.com/eb7154ccca189d91c3050f8b3cfe1bec)
  
## DELETE(特定の記事を削除)
```
matsubaragenki@matsubaragenmarenoMacBook-Air ~ % curl -X DELETE http://localhost:3000/articles/2
<html><body>You are being <a href="http://localhost:3000/articles">redirected</a>.</body></html>% 
```
[![Image from Gyazo](https://i.gyazo.com/d5ea10b6d0978c7774fa28b5719ab405.png)](https://gyazo.com/d5ea10b6d0978c7774fa28b5719ab405)
