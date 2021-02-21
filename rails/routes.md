# ルーティング
- 「どのようなURLへどのようなHTTPメソッドでアクセスされたら、どのコントローラのどのアクションを呼び出したいか」をconfig/rontes.rbに定義します。このように、アクセスを受けて適切なアクションへと案内する仕組みを、ルーティングと呼びます。

# ヘルパーメソッド
```
                    Prefix Verb   URI Pattern                                             Controller#Action
              admin_users GET    /admin/users(.:format)                                   admin/users#index
                          POST   /admin/users(.:format)                                   admin/users#create
           new_admin_user GET    /admin/users/new(.:format)                               admin/users#new
          edit_admin_user GET    /admin/users/:id/edit(.:format)                           admin/users#edit
               admin_user GET    /admin/users/:id(.:format)                               admin/users#show
                          PATCH  /admin/users/:id(.:format)                               admin/users#update
                          PUT    /admin/users/:id(.:format)                               admin/users#update
                          DELETE /admin/users/:id(.:format)                                admin/users#destroy

```
- Prefixに（_psth)をつける

# RESTfulメリット
- 美しくわかりやすいインターフェイスを実現できること
- URLやHTTPメソッドを何にするかを悩む時間を節約できる
- 他の開発者が設計を理解しやすくなる
- 潜在的に外部のシステムと連携がしやすくなる

# resources
- Railsでは、一覧、詳細、登録、更新、削除というよくある機能群を提供するために必要となるルート一式を、resourcesというメソッドを使って定義することはできます。resourcesを使うと、アクションごとにgetメソッドやpostメソッドを使ってルートを定義する代わりに、一発で７つのアクションに対応する７つのルートを定義できる。
- resourcesはあくまでも典型的なCRUDを簡単に定義するだけの仕組みに過ぎず、何もかもをresourcesを使って定義しなければならないわけではない。

# resources :usersのルート
## HTTP動詞　　パス　　アクション　　目的
- `GET  /users  users#index  全てのユーザーの一覧を表示`
- `GET  /users/new  users#new  ユーザーを一つ作成するためのHTMLフォームを返す`
- `POST /users  users#create  ユーザーを一つ作成する`
- `GET  /users/:id  users#show  特定のユーザーを表示`
- `GET  /users/:id/edit  users#edit  ユーザー編集用のHTMLフォームを一つ返す`
- `PATCH PUT  /users/:id  users#update  特定のユーザーを更新する`
- `DELETE  /users/:id  users#destroy  特定のユーザーを削除する`
