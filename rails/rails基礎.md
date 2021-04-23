 # cloud9でrails開発環境作り
 - `sudo yum update` 管理者権限でアップデート
 - `rvm install 2.5.1` cloud9にあるrvmを使ってRubyのバージョンを指定
 - `rvm --default use 2.5.1` デフォルトにする
 - `gem update --system` gemをアップデートする
 - `gem install bundler` Bundlerをインストール
 - `gem install rails -v 5.2.1` railsのインストール　「-v」でバージョン指定
 - #brew install node Node.jsのインストール

# アプリケーション作成の準備
- `rails new アプリケーション名[オプション]` アプリケーションの雛形を作成
- `cd アプリケーション名` ディレクトリに移動
- `rails db:create` データベースを作成
- `gem slim-rails``gem html2slim`を`bundle` slimを使えるようにする
- `bundle exec erb2slim app/views/layouts/ --delete` slimに変更する
- `gem bootstrap`を`bundle` bootstrapを導入

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




