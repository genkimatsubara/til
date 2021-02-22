 # cloud9でrails開発環境作り
 - sudo yum update 管理者権限でアップデート
 - rvm install 2.5.1 cloud9にあるrvmを使ってRubyのバージョンを指定
 - rvm --default use 2.5.1 デフォルトにする
 - gem update --system gemをアップデートする
 - gem install bundler Bundlerをインストール
 - gem install rails -v 5.2.1 railsのインストール　「-v」でバージョン指定
 - brew install node Node.jsのインストール

# テンプレートエンジン
- ERB Railsのデフォルトで、HTMLに近い形をしているので、HTMLを知っていれば比較的簡単に理解することができる
- Slim,Haml タグの開始と終了を両方記述しなければならないERBにくらべて、インデントでツリー構造を表現しているので簡潔で読みやすい。

# render redirect_to
- render 表示させるViewファイルを指定("フォルダ名/Viewファイル名")
- redirect_to URL(HTTPリクエストメソッド）を指定("/URL/~/~/")
データの追加、更新、削除を行うときは「redirect_to」
データの取得を行うときは「render」

## redirect_to @userの意味
```
def create
   @user = User.new(user_params)
   if @user.save
      redirect_to @user
   else
      render :new
```
- `redirect_to @user`は`redirect_to user_url(user.id)`と同じ意味を持つ
- なので、セーブが成功した場合indexアクションにリダイレクトされるのではなく、showアクションにリダイレクトされる。

# 登録ボタンを押すとcreateアクションが呼び出される構造
-  viewにmethod=postがある場合

１. ユーザーからのアクションは全て、HTTPリクエストのGETメソッドかPOSTメソッドとしてWebサーバーに送られる。
2. HTTPリクエストのPOSTメソッドで送ったデータはparamsに入る
３. createアクションは、newのviewからPOSTされたフォームを読み込む
4. new からcreateへ送られてきたフォームの内容は params[:task] に入る。

# params
- paramsとはユーザーから送られてきた値が入っているもの。これを使ってサーバーサイドでお仕事をする

# リクエストからレスポンスまでの流れ
- `routes.rb`に`get '/users', to: 'users#index'`と書くことにより、URLの/usersを`GET`メソッドにより取得でき、それに対応するusersコントローラのindexアクションが呼び出される。（POSTではなくGETを使う理由は、一覧表示ではデータの書き換えは必要ではなく、データを取得したいだけなのでGETメソッドを使う）
- indexアクションに
```
def index
  @users = User.all
end
```
と書くことによって全てのユーザーのデータを取得できる。
- この記述だけでデータベースからデータを取得できる理由は、RailsにはModelにActiveRecordが適用されているおかげで、Rubyを用いてBDからデータを探したり、持ってきたりすることができる。
- そしてそれを画面に表示するには、ビューを書く必要あるので、indexアクションに紐づくindex.html.erbに
```
<% @users.each do |user| %>
    <li>
      <%= user.name, user %>
    </li>
  <% end %>
```
@users.eachでuserオブジェクト一つずつ取り出し表示することができる。
（データベースに検索されるタイムングはindexアクションでUser.allされたときではなく、検索結果が必要なタイミングで行われるので今回の場合は@users.eachが呼ばれた時）
- これでURLに/usersが送られるとユーザーの一覧画面が表示される。
