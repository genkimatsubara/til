# Numericクラス
数値を表現するためのクラス

# クラス階層
- Numeric(数値)
  - Integer(整数)
    - Fixnum(小さい整数)
    - Bignum(大きい整数)
  - Float(浮動小数点数)
  - Rational(有理数)
  - Complex(複素数)

# Integer
整数を表すクラス
`1`,`0`,`-1`
### 文字列を数値に変換
Itegerクラスに変換するメソッド`to_i`
```
p "7".to_i
# => 7
```

# Float
実数を表現するためのクラス
Floatクラスに変換するメソッド`to_f`
```
p 7.to_f
# => 7.0
```
# Rational
有理数を表すクラス
有理数とは、分数にできる数のこと
Rationalオブジェクトは分子と分母という形式のオブジェクトとなる。
Rubyでは、`Rational`、`to_r` 、または`rationalize`メソッドを使用して、または`r`をリテラルにサフィックスすることによって、有理オブジェクトを作成できる。
Rationalオブジェクトは常に既約(それ以上約分できない状態)である事に注意する
```
p Rational(1, 3)       
# => (1/3)
p Rational('1/3')      
# => (1/3)
p '0.3'.to_r       
# => (3/10)
p '2/3'.to_r       
# => (2/3)
2/3r
# => (2/3)
0.3.rationalize  
# => (3/10)
```

# Complex
複素数を表すクラス
複素数とは実数と虚数の組み合わさった数のこと
「Complex」オブジェクトは実数部、虚数部の形式となる
`Complex`オブジェクトを作成するには、`Complex`、`Complex.rect`、`Complex.polar`、`Numeric#to_c`、`String#to_c`のいずれかを使用します。
