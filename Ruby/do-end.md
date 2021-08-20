# do...endと{}の一般的な使い分けについて
ブロック構文には、do～endで囲む方法と、{}で囲む方法とがあある。

- 改行を含む長いブロックを書く場合はdo...end
- 1行でコンパクトに書きたいときは{}


# timesのdo...end
5.times do |i|
  puts "Hello World"
end

# timesの{}
5.times { |i| puts "Hello World" }

colors = ['red', 'blue', 'green']
# eachのdo...end
colors.each do |color|
  puts color
end

# eachの{}
colors.each { |color| puts color }
