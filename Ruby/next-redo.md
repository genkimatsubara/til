# next / redo について
# next
繰り返し処理を途中で中断し、次の繰り返し処理に進める場合はnextを使う。
入れ子になった繰り返し処理では一番内側のループだけが中断の対象となる。

# redo
繰り返し処理をやりなおしたい場合はredoを使う。<br>
ここでいう「やりなおし」は初回からやりなおすのではなく、その回の繰り返し処理の最初に戻る、という意味

```
areas = ['東京', '北海道', '沖縄']
count = 0
areas.each do |area|
  count += 1
  answer = 'ない'
  puts "#{area}に行ったことありますか？#{answer}"
  redo if answer != 'ある' && count < 2 count = 0 
end
  

```
