# rangeについて
Rubyには「1から5まで」「文字`a`から文字`e`まで」のように、値の範囲を表すオブジェクトがある<br>
これを範囲オブジェクトという
```
最初の値..最後の値（最後の値を含む）
最初の値...最後の値（最後の値を含まない）
```
`..`と`...`の違いは最後の値を範囲に含めるか含めないか<br>
1..5であれば5が範囲に含まれる。<br>
1...5の場合は末尾の5が範囲に含まれない(4.99999...までが含まれる)<br>
範囲オブジェクトを変数に入れず、直接include?のようなメソッドを呼び出すときは、範囲オブジェクトは()で囲む必要がある。<br>
これは`..`や`...`の優先順位が低いため。<br>

# Rangeクラス
範囲オブジェクトのクラス。範囲オブジェクトは文字どおり何らかの意味での範囲を表します。
数の範囲はもちろん、日付の範囲や、「"a" から "z" まで」といった文字列の範囲を表すこともできます。
### 範囲オブジェクトを生成
```
Range.new(1, 5) # 1 以上 5 以下
1..5            # 同上
1...5           # 1 以上 5 未満
```


範囲オブジェクトはRangeクラスのオブジェクトである。
範囲オブジェクトはRangeクラスのインスタンスである。

## 配列や文字列
配列に対して添字の代わりに範囲オブジェクトを渡すと、指定した範囲の要素を取得することができる

## n以上m以下、n以上m未満の判定
<や>のような記号（不等号）を使うよりも範囲オブジェクトを使った方がシンプルにかける

## case文と使う
範囲オブジェクトはcase文と組み合わせることができる。

## 値が連続する配列を作成する
範囲オブジェクトに対してto_aメソッドを呼び出すと、値が連続した配列を作成できる。
[]の中に*と範囲オブジェクトを書いても同じように配列を作成できる。
(*を使って複数の値を配列に展開することをsplat展開という）

## 繰り返し処理を行う
範囲オブジェクトを配列に変換すれば、配列として繰り返し処理を行うことができる。
配列に変換しなくても、範囲オブジェクトに対して直接eachメソッドを呼び出す苦ともできる。
stepメソッドを呼び出すと、値の増やす間隔を指定できる。。

## succメソッド
succメソッドは、指定した整数や文字列の次に当たる整数や文字列を返すメソッド。


```
# 範囲オブジェクトに含まれる要素数を取得
p (1..5).size

# 指定した文字が範囲内にあるか調べる
p (0..5)include(5)

# 始端、終端の要素を取り出す
p (1..5).first
p (1..5).last

# n個おきに処理を繰り返す
(1..10).step(3) { |n| p n}

# かな範囲
p ('あ'..'お')