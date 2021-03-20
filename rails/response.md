# Railsにおけるリクエストからレスポンスまでの流れについて説明してください

### リクエストからレスポンスまでの流れについて（GET編）
- `/users`というパスに対してGETリクエストがWebサーバに送られる。<br>
（POSTではなくGETを使う理由は、一覧表示ではデータの書き換えは必要ではなく、データを取得したいだけなのでGETを使う)
- WebサーバがGETリクエストを受け取り`routes.rb`の`resources :users`により、それに対応するコントローラのアクションが呼び出される。
- コントローラのindexアクションで全ユーザーのデータを取得する。
```
def index
  @users = User.all
end
```
（この記述だけでデータベースからデータを取得できる理由は、RailsにはモデルにActiveRecordが継承されているので、Rubyを用いてBDからデータを探したり、持ってくることができる。）
- indexアクションに紐づくindex.html.erbを編集する<br>
@users.eachでuserオブジェクト一つずつ取り出し表示することができる。
```
<% @users.each do |user| %>
    <li>
      <%= user.name, user %>
    </li>
  <% end %>
```

（データベースに検索されるタイムングはindexアクションでUser.allされたときではなく、検索結果が必要なタイミングで行われるので、今回の場合は@users.eachが呼ばれた時）
- Webサーバからindex.html.erbで編集したHTML形式のレスポンスが返される。
- Webブラウザが処理して画面にユーザー一覧が表示される

# リクエストからレスポンスまでの流れについて（POST編）
### 新規作成ページを表示する
- `/tasks/new`というパスに対してGETリクエストがWebサーバに送られる。
- WebサーバがGETリクエストを受け取り`routes.rb`の`resources :tasks`により、それに対応するコントローラのアクションが呼び出される。
- コントローラのnewアクションで新しいオブジェクトを作成
```
def new
  @task = Task.new
end
```
### タスク名（name）を入力する
- 入力フォームを作成するためnewアクションに紐づくnew.heml.slimを編集する
 ```
= form_with model: @task, local: true do |f|
  .form-group
    = f.label :name
    = f.text_field :name, class: 'form-cotrol'
  = f.submit nil, class: 'btn btn-primary'
```
- form_withによってHTMLが生成される。
```
<form action="/tasks" accept-charset="UTF-8" method="post">
　　　　　<input name="utf8" type="hidden" value="✓">
　　　　　<input　type="hidden"name="authenticity_token"value="0/MwK3LxN24WXfQNV5cFYZkbRSoRsL9QEomdh2h+Hr2BpWQqeW95LO7MM4ZZGoz56y+mHx0hMETSwAW18fqKvw==">
     　　<div class="form-group">
       　　　　　<label for="task_name">Name</label>
            　　<input class="form-cotrol" type="text" name="task[name]" id="task_name">
         </div>
         <input type="submit" name="commit" value="登録" class="btn btn-primary" data-disable-with="登録"></form>
```
### 作成ボタンを押す
- form_withで生成されるmethod: postによって、フォーム内容を送信するときにPOSTメソッド指定され、`routes.rb`の`resources :tasks`でPOSTリクエストに対応する/tasksを受け取り、createアクションが実行される
- task_paramsで取得したデータをTask.newの引数にしてインスタンスを作成
```
 def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to @task
    else
      render :new
    end
 end
 
 
 private
 
 def task_params
   # require(:task)は生成されたHTMLのname="task[name]"のtaskと関連している。
   # permit(:name)で指定したカラムのみ取得する。
   # リクエストボディの「入力されたタスク名」がRailsによりparamsオブジェクトの中にハッシュのような構造で入る
   params.require(:task).permit(:name)
 end

```



### タスク詳細ページに遷移する
- データベースへの保存が成功した場合、リダイレクト先を@taskとすることで詳細ページに遷移する。<br>
（redirect_to @taskはredirect_to task_url(task.id)と同じ意味を持つ）

![代替テキスト](https://i.gyazo.com/4d39488e599c1751e722b29594b62144.jpg)

![代替テキスト](https://i.gyazo.com/25d4ac64cf21ac57515d06df90d2afc3.png)


![代替テキスト](https://i.gyazo.com/98ab7600e6ff9bdd0e54e71de51a9e72.png)
