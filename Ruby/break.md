# breakとreturnの違いについて
## break
「繰り返し処理からの脱出」になる。<br>
入れ子になった繰り返し処理では一番内側のループだけが中断の対象
## return
「（繰り返し処理のみならず）メソッドからの脱出」になる。<br>
returnの役割はあくまで「メソッドからの脱出」なので、returnを呼び出した場所がメソッドの内部でなければエラーになる。


```
# break
def block_break
  10.times do |n|
    break if (n + 1).even?
    puts "hello! #{n + 1}回目"
  end

  puts "完了！"
end

block_break


# return
def block_return
  10.times do |n|
    return if (n + 1).even?
    puts "hello! #{n + 1}回目"
  end

  puts "完了！"
end

block_return


def break_method
 ('a'..'e').each do |i|
   break if i == 'c'
   puts i
 end
 puts '----end----'
end

break_method

#=>
a
b
----end----
```
