# Slimを使ってビューを効率よく書く
- gemに追加
```
gem 'slim-rails'
gem 'html2slim'
```
gemに定義し、bundleでインストールする

- app/views/layoutsディレクトリにあるERB形式のファイルをerb2slimコマンドを利用してSlimに変更する
```
bundle exec erb2slim app/views/layouts/ --delete
```

-Bootstrapを導入
gemに定義
```
gem 'bootstrap'
```
bundleでインストール

- CSSにも効率よく表現できる形式としてSassが利用される。Sassが提供する「SCSS」を使う。
```
mv app/assets/stylesheets/application.css app/assets/stylesheets/application.scss
```
拡張子をscssにする。

- Bootstrapをscssにimportする。 
