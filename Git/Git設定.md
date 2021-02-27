# Gitのインストール手順
- Macにはデフォルトでインストールされている

# Gitの初期設定（ターミナル）
- ユーザー名の登録
```
git config --global user.name "(自分のGitHubの名前)"
```
- メールアドレスの登録
```
git config --global user.email "(自分のメールアドレス)"
```
- Gitで使うエディタの登録
```
git config --global core.editer "atom --wait"
```
- 設定内容の確認
```
cat ~/ .gitconfig
```
# コマンドにエイリアスをつける
- コマンド入力が楽になる
```
例）
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.br branch
git config --global alias.co checkout
```
`config`は設定を変更するコマンド。`--global`はPC全体のことを示す。
