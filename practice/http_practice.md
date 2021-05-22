# HTTPについて説明してください
 
 &emsp;Webページを表示するには、WebブラウザがWebサーバに対して、コンテンツを要求し、Webサーバが要求されたコンテンツをWebブラウザに返している。しかし、転送されたままのコンテンツでは、人間は見にくいのでブラウザが人間の見やすい形にして表示してくれている。

&emsp;このように、WebブラウザとWebサーバやりとりを行う際は、`HTTP(Hypertext Transfer Protocol)`というネットワークプロトコルが利用されている。HTTPには、コンテンツをやりとりするうえで必要なさまざまな手順が定義されている。

&emsp;例えば、Webブラウザに`https://tech-essentials.work/questions`とこのようなURLを指定した場合、HTTPSを使ってtech-essentials.workというWebサーバにアクセスし、questionsというコンテンツを要求している。
（HTTPとHTTPSの主な違いは、通信が暗号化されているかされていないか）

&emsp;HTTPを使うやりとりで、WebブラウザがWebサーバに対してコンテンツを要求することを「HTTPリクエスト」、WebサーバがWebブラウザに要求されたコンテンツを返すことを「HTTPレスポンス」という。


&emsp;HTTPリクエストは「リクエスト行」「メッセージヘッダー」「メッセージボディ」の3つに分けることができる。

- リクエスト行
　Webサーバに対してどのような処理を依頼するのかを伝える情報が含まれている

- メッセージヘッダー
　Webブラウザの種類や、対応しているデータのタイプ、データの圧縮方法、言語などの情報を伝える

- メッセージボディ
　Webサーバにデータを送るために使われる。空の場合もある。


&emsp;HTTPレスポンスは、「ステータス行」「メッセージヘッダー」「メッセージボディ」の3つに分けることができる。

- ステータス行
　WebブライざにWebサーバ内での処理の結果を伝える。

- メッセージヘッダー
　Webサーバのソフトウェア情報や、返信するデータのタイプ、データの圧縮方法などの情報を伝える。

- メッセージボディ
　HTMLや画像などのデータを格納する

&emsp;HTTPリクエストを使って、Webサーバとやりとりする際に要求内容を伝えているのはHTTPメソッドである。Webサイトを見る時によく使われるHTTPメソッドに「GET」と「POST」がある。
&emsp;画像の一枚目では`Request Method GET`と書かれておりGETメソッドが使われている。GETメソッドは主にコンテンツを取得する時に使えわれる。Webサーバに対して、データを送信する時にはPOSTメソッドが使われる

ステータスコード
&emsp;リクエストに対するWebサーバでの処理の結果を示す３桁の数字のこと。画像の一枚目ではリクエストが正常に受理されているので、ステータスコードが`200 OK`となっている
 
|ステータスコード|意味|
|---|:---|
| 100 continue | リクエストの継続中を通知する |
| 200 OK | リクエストが正常に受理されたことを通知する |
| 301 Moved Parmanently | リクエストされたコンテンツが移動したことを通知する |
| 302 Found | リクエストされたコンテンツが一時的に移動（別の場所で発見）したことを通知する |
| 304 Not Modified | リクエストされたコンテンツが未更新であることを通知する。Webブラウザに一時保存されたコンテンツが表示される |
| 400 Bad Request | リクエストが不正であることを通知する |
| 404 Not Found | リクエストされたコンテンツが未顕出であることを通知する |
| 500 Internal Server Error | リクエスト処理中にサーバ内部でエラーが発生したことを通知する |
| 503 Service Unavailable | アクセス集中やメンテナンスなどの理由で一時的な処理不可であることを通知する |

![Chrome画像](https://i.gyazo.com/0d058941ecdaaee254ef4a0f65cdcdb8.png)
![Chrome画像](https://i.gyazo.com/6463b67e70290408965076c5d2fbf69e.png)