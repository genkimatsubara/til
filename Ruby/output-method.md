# print / puts / p の違い

# print
- 引数を順番に出力
- 改行しない
- 配列、ハッシュはそのまま出力
- 戻り値は`nil`
- `to_s`メソッドで文字列に変換される
- 改行を入れる場合は改行文字`\n`をつける(ダブルクォーテーションでないと使えない)

# puts
- 引数と改行を順番に出力
- 引数がなければ改行のみ
- 戻り値は`nil`
- 配列は要素と改行を順番に出力
- ハッシュはそのまま出力
- `to_s`メソッドで文字列に変換される
- 改行を入れる場合は改行文字`\n`をつける(ダブルクォーテーションでないと使えない)


# p
- 引数と改行を順番に出力
- 引数のオブジェクトが文字列、数値かをわかりやく標準出力
- 戻り値は引数のオブジェクト
- 配列、ハッシュはそのまま出力
- `\n`や`\t`などのエスケープ文字もそのまま出力する
- デバック用


print "Hello"
print "World\n"

puts "Hello"
puts "World\n"

p "Hello"
p "World\n"

array = ["red", "blue", "green"]

print array
puts array
p array

hash = {"name" => "松原", "age" => 21}

print hash
puts hash
p hash
