# 意図的に例外を発生させる
例外を発生させる場合は`raise`メソッドを使う。<br>
`raise`メソッドに文字列を渡すと、その文字列がエラーメッセージになる。<br>
raiseメソッドに文字列だけを渡したときはRuntimeErrorクラスの例外が発生する。<br>
引数にエラーメッセージを渡すとRuntimeErrorクラス以外の例外クラスで例外を発生させることができる。<br>
`raise`メソッドに例外クラスのインスタンスを渡すこともできる。
```
raise "エラーメッセージ"
raise 発生させたい例外クラス
raise 発生させたい例外クラス, "エラーメッセージ"
```


```
begin
  raise NoMethodError
rescue => e
  p e
end
```
