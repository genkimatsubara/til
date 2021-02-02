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
