# include、extend、prependの違いについて
モジュールをクラスに`include`して機能を追加することをミックスインという。<br>
ミックスイン先のクラスは基本的にどんなクラスでも良い。<br>
また、一つのクラスに複数のモジュールをミックスインすることもできる。<br>
Rubyではミックスインを利用することで多重継承に似たしくみを実現する。<br>
Rubyのモジュールのミックスインでは、以下の３つの方法があります。

## include
`include`を使うと、モジュールで定義したメソッドがインスタンスメソッドとして呼び出せるようになる。

## extend
`extend`を使うと、モジュール内のメソッドをそのクラスの特異メソッド(クラスメソッド)にすることができる。

## prepend
`prepend`を使うと、同名のメソッドがあった場合にミックスインしたクラスよりも先にモジュールのメソッドが呼ばれるため、既存メソッドの置き換えることができる。<br>
指定したモジュールを継承チェインの「先頭に追加する」ことで、既にで定義されているメソッドを「オーバーライド」する。

```
# モジュールを定義
module Say_en
  def hello_en
    puts "Hello"
  end

  def hello_jp
    puts "Hello"
  end
end

# クラスを定義
class Say
  # モジュールをミックスイン
  prepend Say_en

  def hello_jp
    puts "こんにちは"
  end
end

greeting = Say.new

# インスタンスメソッドを実行
greeting.hello_jp
greeting.hello_en

```
