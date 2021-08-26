# アクセサメソッド
インスタンス変数をクラスの外部から参照するには、メソッドを作る必要がある<br>
また、インスタンス変数の内容を外部から変更した場合も変更ようのメソッドを定義する。<br>
インスタンス変数の値を読み書きするメソッドのことを「アクセサメソッド」という。<br>
Rubyの場合は、単純にインスタンスの内容を外部から読み書きするのであれば、`attr_accessor`というメソッドを使って<br>
メソッドの定義を省略することができる。<br>
インスタンス変数の内容を読み取り専用にしたい場合は`attr_accessor`の代わりに`attr_reader`メソッドを使う。<br>
逆に書き込み専用にしたい場合は`attr_writer`を使う。<br>
複数の引数を渡すと、複数のインスタンス変数に対してアクセサメソッドを作成することもできる。
```
attr_reader # rede (読む)
attr_writer # write (書く)
attr_accessor # access (読むと書くの両方)
```

```
# クラスを定義
class Shoes
	# 読み書き両方
  attr_accessor :name
	# 読み取り専用
  # attr_reader :name
  # 書き込み専用
	# attr_writer :name

  def initialize(name, price)
    @name = name
    @price = price
  end

  def brand
    puts "#{@name}の靴は、#{@price}円です"
  end
end

# インスタンスの作成
shoes= Shoes.new("NIKE", 10000)
shoes.brand
shoes.name = 'adidas'
hoes.brand
```
