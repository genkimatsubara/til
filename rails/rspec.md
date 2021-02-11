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
