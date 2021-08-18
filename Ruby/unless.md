# unless文
ifは条件式の結果が真だったときに処理を実行するが、それとは反対に、偽だったときに処理を実行する`unless`という処理構文がある。<br>
`unless`でも`else`を使うことができるが、`elsif`のような機能はない。<br>
`unless`で表現できることはすべて`if`でも表現可能。<br>

### unlessと使う場面
条件の内容として直感的に把握しやすい方を利用するため、`unless`を選ぶことがある。

## 構文
```
unless 条件式
  # 条件式が偽(false)のとき、実行したい処理
else
  # 条件式が真(true)のとき、実行したい処理
end
```
### unlessを使う際の注意点
- `unless`と`else`の併用<br>
`unless`を`else`とともに利用すると、コードが読みづらいので、elseを使う場合はifを使う方が良い。
- `unless`と`not演算子`の併用<br>
二重否定になってしまい読みづらいため。
- `unless`と`||`の併用<br>
`||`は左から右へ順番に式を評価し、結果が真の場合にその値を返しため、さらにそれをunlessで否定すると読みづらいため。


# unless文
age = 18
unless age >= 20
  puts "未成年者にお酒は提供できません"
end

# 読みづらいunless文の例

# unlessとelse
age = 21
unless age >= 20
  puts "未成年者にお酒は提供できません"
else
  puts "お酒が飲めます"
end

# unlessとnot
number = 10
unless !number.even?
  puts "偶数です"
end

# unlessと||
color = "green"
unless color == "red" || color == "blue"
  puts "赤と青ではない"
end
