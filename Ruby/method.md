### 改行
`"\n"`<br>
「\」はoption + ¥

### 文字列の文字数を返す
length<br>
`"test".length => 4`

### ある文字が他の文字列に含まれているかどうか判定する
include?<br>
include?メソッドは、引数で指定した要素が、配列中に含まれているか判定するメソッド<br>

### 数値型の配列に変換する
`map(&:to_i)`

### 絶対値を取得
`abs`
```
num = (-5).abs
p num
```
### 一番小さい数値
`min`

### ランダムな数値を出力
`rand`メソッド
```
number = rand(1..100)
puts number

ランダムな数字が出力される
```