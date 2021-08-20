# 繰り返し処理

## for
集合的なオブジェクト（配列やハッシュ）、それから範囲を表すオブジェクトの要素数分だけ何らかの処理を繰り返すことができる命令
```
for 変数 in 配列やハッシュ do
  # 実行したい処理
end
```

## each
Arrayクラスには、eachメソッドが用意されており、配列オブジェクトに対して、eachメソッドを実行すると、
配列に含まれている要素を順に取り出して繰り返し処理が行われる
```
配列やハッシュ.each do |変数|
  # 実行したい処理
end
```

## while
while文は指定した条件が真である間、処理を繰り返す
```
while 条件式(真であれば実行) do
  # 実行したい処理
end
```

## until
until文は指定した条件が偽である間、処理を繰り返す
```
while 条件式(偽であれば実行) do
  # 実行したい処理
end
```

## loop
loopを使えば、breakでループを終了させない限りループし続ける処理を実装できます。
```
loop do
  # 実行したい処理
end
```

## times
配列を使わずに、単純にn回処理を繰り返したい場合は、Integerクラスのtimesメソッドを使う
```
繰り返し回数.times do |変数|
  # 実行したい処理
end
```

## upto,downto
nからmまで数値を1つずつ増やしながら何か処理をしたい場合は、Integerクラスのuptoメソッドを使う
```
開始値.upto(終了値) { 実行したい処理 }
```
nからmまで数値を1つずつ減らしながら何か処理をしたい場合は、Integerクラスのdowntoメソッドを使う
```
開始値.downto(終了値) { 実行したい処理 }
```

## step
値を増やす間隔を指定できる
さきほど紹介したtimesでは、実は任意の整数しか指定できませんでしたが、stepを使えば少数も扱えます。
```
開始式.step(上限値、一度に増減する大きさ){}
```

# 繰り返し処理用の制御構造
### break
繰り返し処理を脱出することができる<br>
breakに引数を渡すと、while文やfor文の戻り値になる。引数を渡さない場合はnil<br>
繰り返し処理が入れ子になっている場合は、一番内側の繰り返し処理で脱出する。

### next
繰り返し処理を途中で中断し、次の繰り返し処理を進めることができる

### redo
繰り返しをやりなおしたい場合に使う
「やりなおし」は初回からやりなおすのではなく、その回の繰り返し処理の最初に戻るということ



colors = ['red', 'blue', 'green', 'black', 'white']
scores = { '安倍': 100, '伊藤': 90, '田中': 70 }

# forと範囲オブジェクト
for i in 10..15 do
  p i
end

# forで配列を繰り返す
for color in colors do
  p color
end

# forでハッシュを繰り返す
for name, score in scores do
  p "#{name}の点数は#{score}点です"
end  


# eachと範囲オブジェクト
(10..15).each do |i|
  p i
end
  
# eachで配列を繰り返す
colors.each do |color|
  p color
end
  
# eachでハッシュを繰り返す
scores.each do |name, score|
  p "#{name}の点数は#{score}点です"
end  

# while
i = 0

while i < 10 do
  p "#{i}回目:while"
  i += 1
end

# until
i = 0
until i == 5 do
  p "#{i}回目:until" 
  i += 1
end

# loop
i = 0
loop do
  p "#{i}回目:loop" 
  i += 1
  if i == 5
    break
  end
end

# times
10.times do |i|
  if i == 7
    next
  end
  p "#{i}回目:times"
end

10.times { |i| p "#{i}回目:times" }

# upto
10.upto(14) { |i| p "#{i}回目:upto" }

# downto
14.downto(10) { |i| p "#{i}回目:downto" }

# step
1.step(10, 2) { |i| p i }
