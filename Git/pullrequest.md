# プルリクエストやり方
- 編集したいリポジトリをクローンする
```
git clone https://github.com ~~~
```
- 編集したいディレクトリに入る
```
cd 〇〇
```
- 新しいブランチを作成
```
git checkout -b <新しいブランチ名>
```
- そこでコードを編集しコミット
```
git add .
git commit -m 'メッセージ'
```
- プッシュを行う
```
git push origin <新しいブランチ名>
```
- プルリクエストを行う
- レビューをしてもらう
- OKならマージをする
- githubのmasterブランチの状態を自分のワークツリーにも取り入れる
```
git checkout master
```
masterブランチに戻る
- masterブランチの内容を取り込む
```
git pull origin master
```
使わないブランチは削除する
```
git branch -d 〇〇
```
# プルリク用のディレクトリを削除してしまったとき、あげたプルリクを編集する方法
```
% git fetch
% git branch -a
* main
 remotes/origin/HEAD -> origin/main
 remotes/origin/main
 remotes/origin/output
 remotes/origin/pull
 remotes/origin/pullreq
 remotes/origin/rails_output
% git checkout pull
Branch 'pull' set up to track remote branch 'pull' from 'origin'.
Switched to a new branch 'pull'
% git branch
 main
* pull
```
