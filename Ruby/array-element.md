# 配列の要素の変更、追加、削除

## 要素の変更
添字を指定して値を代入すると、指定した要素を変更することができる。
```
配列[添字] = 新しい値
```
元の大きさよりも大きい添字を指定すると、間の値がnilで埋められる。

## 要素の追加
`<<`を使うと配列の最後に要素を追加することができる。
```
a = []
a << 1
```
使用していない添字を指定して代入することもできる。<br>
元の大きさよりも大きい添字を指定すると、間の値がnilで埋められる。

## 要素の削除
配列内の特定の位置にある要素を削除したい場合は`delete_atメソッド`,`deleteメソッド`を使う<br>
`delete_atメソッド`引数に削除したい要素の添字を指定<br>
`deleteメソッド`はマッチする要素を全て削除する
```
a = [1, 2, 3]
a.delete_at(1)
p a # => [2, 3]
```
削除した値が戻り値となる<br>
存在しない添字を指定するとnilが返す

# 要素の取得
要素を取得するには、`配列名[添字]`を指定する
```
# 配列の定義
colors = ['red', 'blue', 'green']

# 要素の取得
p colors[0] # =>"red"
p colors[1] # =>"blue"
p colors[2] # =>"green"
# 配列がない場合はnil
p colors[10] # =>nil
```

# 配列の定義
colors = ['red', 'blue', 'green']

# 配列の追加
colors << "pink"
p colors
colors[4] = "yellow"
p colors

# 要素の変更
colors[1] = "black"
p colors

# 要素の取得
p colors[0]
p colors[1]
p colors[2]
# 配列がない場合はnil
p colors[100]

# 要素の削除
fruits = ['apple', 'banana', 'lemon', 'apple', 'peach']
fruits.delete_at(1)
p fruits
# マッチする要素をすべて削除
fruits.delete('apple')
p fruits
