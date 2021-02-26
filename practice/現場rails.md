# プラクティス
# リクエストからレスポンスまでの流れについて(GET編)一覧画面の表示
- `routes.rb`に`get '/users', to: 'users#index'`と書くことにより、URLの/usersを`GET`メソッドにより取得できる。（POSTではなくGETを使う理由は、一覧表示ではデータの書き換えは必要ではなく、データを取得したいだけなのでGETメソッドを使う)
- そしてそれに対応するusers`コントローラ`のindexアクションが呼び出される。 コントローラに以下の記述をし、ユーザーの全てのデータを取得する。
```
def index
  @users = User.all
end
```
- この記述だけで`データベース`からデータを取得できる理由は、Railsには`モデル`にActiveRecordが適用されているおかげで、Rubyを用いてBDからデータを探したり、持ってくることができる。
- そしてそれを画面上に表示するには、`ビュー`を書く必要あるので、indexアクションに紐づくindex.html.erbを書く
```
<% @users.each do |user| %>
    <li>
      <%= user.name, user %>
    </li>
  <% end %>
```
- @users.eachでuserオブジェクト一つずつ取り出し表示することができる。（データベースに検索されるタイムングはindexアクションでUser.allされたときではなく、検索結果が必要なタイミングで行われるので、今回の場合は@users.eachが呼ばれた時）
### これでURLに/usersが送られるとユーザーの一覧画面が表示される。
# リクエストからレスポンスまでの流れについて(POST編)
### 新規作成ページを表示する
- `routes.rb`に`resources :tasks`と書くことにより、URLの/tasks/newを`GET`メソッドにより取得できる。そうするとtasksコントローラのnewアクションが呼ばれ
```
def new
  @task = Task.new
end
```
- このように書くことで新しいオブジェクトを作成する
### タスク名(name)を入力する
- 次に値を入れるためにビューを編集する。newアクションに紐づくnew.heml.slimに名前の入力用フォームを作成する。
```
= form_with model: @task, local: true do |f|
  .form-group
    = f.label :name
    = f.text_field :name, class: 'form-cotrol'
  = f.submit nil, class: 'btn btn-primary'
```
- form_withによって次のようなHTMLが生成される。
```
<form action="/tasks" accept-charset="UTF-8" method="post"><input name="utf8" type="hidden" value="✓"><input type="hidden" name="authenticity_token" value="0/MwK3LxN24WXfQNV5cFYZkbRSoRsL9QEomdh2h+Hr2BpWQqeW95LO7MM4ZZGoz56y+mHx0hMETSwAW18fqKvw=="><div class="form-group"><label for="task_name">Name</label><input class="form-cotrol" type="text" name="task[name]" id="task_name"></div><input type="submit" name="commit" value="登録" class="btn btn-primary" data-disable-with="登録"></form>
```
- `action`="/tasks"は一覧画面の/tasksではなく、createアクションを呼ぶためのものである。`form_with`に渡されている`model: @task`は新しいオブジェクトなので、createアクションが呼ばれる。（action="/tasks/1"だった場合は、モデルが既存の状態なのでupdateアクションが呼ばれる）railsが自動推定してくれる。
### 作成ボタンを押す
- formに`method="post"`がある場合`name="task[name]"`に入った値はparamsに代入される。createアクションは、newのviewからPOSTされたフォームを読み込む。しかし、このままではフォームから不正な値が送られてきた場合、意図しないデータの登録をしてしまうので、このように記述することで指定したカラムのみを取得することができる。もし、許可されいないカラムがparams内に存在した場合、そのデータは取得されず無視される。
```
 def task_params
params.require(:task).permit(:name)
 end
```
これにより安全なデータのみがTask.newに入る。
そして@task.saveされることでデータベースの保存される。
```
def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to @task
    else
      render :new
    end
 end
```
### タスク詳細ページに遷移する
- データベースへの保存が成功した場合、リダイレクト先を@taskとすることで詳細ページに遷移する。redirect_to @taskはredirect_to task_url(task.id)と同じ意味を持つ
![代替テキスト](https://i.gyazo.com/4d39488e599c1751e722b29594b62144.jpg)
![代替テキスト](https://i.gyazo.com/25d4ac64cf21ac57515d06df90d2afc3.png)
![代替テキスト](https://i.gyazo.com/98ab7600e6ff9bdd0e54e71de51a9e72.png)
