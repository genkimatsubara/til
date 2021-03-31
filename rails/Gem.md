# Gemの追加方法
- GemfileにGemを追加し保存
- bundleでインストール

# ransack
### 検索機能を実装できる
```
def index
  @q = User.all.ransack(params[:q])
  @users = @q.result(distinct: true)
```
`(destinct: true)`は結果の重複を防ぐオプション

### 検索フォームの作成
```
= search_form_for @q, class: 'my-5' do |f| 
  .form-group.row
    .col-sm-10
      = f.search_field :name_cont, class: 'form-control', placeholder: '検索ワード'
    .col-sm-2
      = f.submit class: ' btn btn-outline-primary'
```
`cont`はカラムの中のデータに部分一致しているのかどうかを調べる
`◯◯_cont`○◯の部分には自分で作ったカラム名を指定する。

### adminで検索フォームを作成する場合

# kaminari
