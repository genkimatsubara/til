# let
- letの上書きを多用すると、Specのコード行数が大きくなったときに、どのletが最終的に使われているのかが分かりづらくなるという難点がある。適切なバランスで利用するように意識する。

# Specが失敗したときの調査法
- Specが失敗したときには、「失敗したSpecの場所」　と　「どのような理由で失敗したか」　が結果として表示される。
- 「失敗したSpecの場所」 を知るには、以下の出力をみれば、問題のファイルと行を知ることができる。
```
# ./spec/system/tasks_spec.rb:20:in `block (4 levels) in <top (required)>'
```
- 「どのような理由で失敗したか」 を見るには、「Failure/Error」 の部分に着目する。
```
Failure/Error: visit login_path
          Selenium::WebDriver::Error::WebDriverError:
            unable to connect to chromedriver
```

# テスト実行時に起こったエラーの解決法

```
Failure/Error: visit login_path
          Selenium::WebDriver::Error::WebDriverError:
            unable to connect to chromedriver
```
- cloud9にchromedriveが入っていなかった為このようなエラーが起きた。
```
$ curl https://intoli.com/install-google-chrome.sh | bash
```
このコマンドでインストールすればこのエラーは解決できる！！！

# テスト実行時に起こったエラー２

```
NameError:
       undefined local variable or method `　' for 
.
.
.
# ./spec/system/tasks_spec.rb:20:in `block (4 levels) in <top (required)>'

```
- メソッド名が違うというようなエラーで、tasks_spec.rbの20行目が怪しいというエラー文が書かれており、よく調べると原因は２０行目に全角スペースが入っていたことでした。

# スクリーンショットを活用する
- System Specでは、失敗した画面の最終的なスクリーンショットが保存されます。スクリーンショットの保存先は、失敗したSpecの結果部分に表示されます。
```
[Screenshot]: tmp/screenshots/failures_r_spec_example_groups_nested_nested_3_nested_2_エラーとなる_819.png
```
- スクリーンショットを見ることで得られる情報は多いので、原因調査の際にはスクリーンショットを確認すること。



# モデルスペック
モデルをテストすればアプリケーションのコアとなる部分をテストすることになる<br>
モデルスペックには次のようなテストを含める<br>
- 有効な属性で初期化された場合は、モデルの状態が有効（valid）になっていること
- バリデーションを失敗させるデータであれば、モデルの状態が有効になっていないこと
- クラスメソッドとインスタンスメソッドが期待通りに動作すること<br>
※ 一時的にバリデーションをコメントアウトしたり、テストを書き換えたりして、結果が変わることを確認する！

### Rspecで等値のエクスペクテーションを書くときは`==`ではなく`eq`を使う

# テストデータを簡単に用意してくれるRubyライブラリFactory Bot
気軽のファクトリを使うとスピードの面で高いコストになる。だが、遅いテストは何もテストがない状態よりもずっと良い

### FactoryBot.buildを使うと新しいテストオブジェクトをメモリ内に保存する 
### FactoryBot.createを使うとアプリケーションのテスト用データベースにオブジェクトを永続化する
可能な限りFactoryBot.createよりもFactoryBot.buildを使う。こうすればテストデータベースにデータを追加する回数が減るので、パフォーマンス面のコストを削減できる。

### モデルスペックで詰まったところ

# コントローラスペック

# レスポンススペック

# システムスペック

# Capybaraの初期準備

# システムスペックとレスポンススペックの違い
システムスペックはユーザーが実際に操作した時の動作を確かめるもので、一方レスポンススペックはリクエストを送ったらどのようなステータスコードがレスポンスされるのかを調べるのも

