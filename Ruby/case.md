# case文
case文は、一つのオブジェクトや式に対する一致判定による分岐を行う。<br>
caseのあとに記述した式とwhen節に記述した式の値(評価結果)を上から順番に比較し、一致すればそのwhen節の本体に記述する処理が実行され、
when節の式の値にも一致しない場合は、else節に記述した処理が実行される。<br>
if文と同様、case文も最後に評価された指揮を戻り値として返す。(いずれの条件も成り立たなければnilを返す)<br>
when節には、複数の値、配列、範囲オブジェクト、メソッド、クラスを指定することができる。

## 構文
```
case 対象のオブジェクトや式
when 値1
 # 値1に一致する場合の処理
when 値2
 # 値2に一致する場合の処理
when 値3
 # 値3に一致する場合の処理
else
 # どれにも一致しない場合の処理
end
```

### caseを使う場面
複数の条件を指定する場合は、elsifを重ねるよりもcase文で書いた方がシンプルで読みやすい。


# caseと複数の値
signal = "yellow"

case signal
when "red"
  puts "stop"
when "green", "blue"
  puts "go"
when "yellow"
  puts "caution"
else
  puts "wrong signal"
end

# caseと範囲オブジェクト
age = 18

case age
when 0..2
  puts "baby"
when 3..6
  puts "little child"
when 7..12
  puts "child"
when 13..18
  puts "youth"
else
  puts "adult"
end

# caseと配列
array = [1, 2, 3]
number = 2

case number
when *array
  puts "number is 1~3"
when 4
  puts "number is 4"
else
  puts "number not 1~4."
end

# caseとメソッド
name = "松原弦希"

case name.length
when 1..3
  puts "Not enough characters"
when 4..10
  puts "Range of set number of characters"
when 10..nil # 10以上で上限なし
  puts "character count over"
end

# caseとクラス
object = [1,2,3]

case object
when String
  puts "class is a String."
when Array
  puts "class is a Array."
when Hash
  puts "class is a Hash."
else
  puts "class is other than String, Array, or Hash."
end
