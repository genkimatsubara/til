# 破壊的メソッドについて
レシーバにあたるオブジェクトの値そのものを変更してしまうメソッドのこと。<br>
「!」で終わるメソッドは習慣として「使用する際は注意が必要」という意味を持つ。<br>
「!」で終わるメソッドは「?」で終わるメソッドほど慣習が明確ではない。<br>
Rubyでは，「!」がついていれば破壊的メソッドであるという決まりはない。「!」が付かない破壊的メソッドがある。

## 非破壊的メソッド
非破壊的メソッドとは、上記の破壊的メソッドとは違いオブジェクトであるレシーバ自身の値は変更しない。

## オブジェクトの動き
非破壊的メソッドでは、新しいオブジェクトが生成されて値が変更される。<br>
破壊的メソッドでは、オブジェクトがもつ値そのものが変更される。

# メソッド
| メソッド | 内容 |
| :--- | :--- |
| upcase(!) | すべて大文字にする | 
| downcase(!) | すべて小文字にする | 
| reverse(!) | 文字順を逆にする | 
| compact(!) | 自身から nil を取り除いた配列を生成して返す | 

# 「!」がつかない破壊的メソッド
例)
```
Array#push
Array#insert
Array#replace
Array#delete
String#insert
String#concat
String#clear
Hash#replace
Hash#shift
```


# 破壊的メソッド
a = 'ruby'

a.upcase
p a

a.upcase!
p a

# オブジェクトの働き
b = 'HELLO'

c = b.downcase
p b.object_id
p c.object_id

c = b.downcase!
p b.object_id
p b.object_id

# 「!」がつかない破壊的メソッド
s = '明日の天気は'
p s
s.concat('雨です')
p s

array = ['red', 'blue', 'green']
p array
array.shift
p array

hash = {red:'赤', blue:'青', green:'緑'}
p hash
hash.delete(:red)
p hash
