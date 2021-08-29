# 独自の例外クラス
例外クラスは独自に定義することも可能。
例外クラスを定義する場合は特別な理由がない限り、`StandardError`クラスか、そのサブクラスを継承する。(Exceptionクラスは直接継承しないようにする。)
### 構文
```
class # 独自のエラー名 <  StandardError
  # 実行処理
end
```
```
class MyError < StandardError; end

begin
  if x == 3
    raise MyError
  end
  p 100 / x
rescue MyError
  puts "not 3!"
end
```
