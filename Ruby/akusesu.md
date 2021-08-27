# アクセス修飾子
アクセス修飾子には以下の３つがある。

## publicメソッド
`public`メソッドはクラスの外部からでも自由に呼び出せるメソッド。<br>
`initialize`メソッド以外のインスタンスメソッドはデフォルトで`public`メソッドになる。<br>
また、自身のオブジェクトを呼び出す際に、先頭に`self`を付けるが、省略もできる。<br>
`public`キーワードの下に定義されたメソッドは`public`メソッドになる。

## privateメソッド
クラス外部には公開されないメソッドで、クラス内のメソッドから呼び出して使われるメソッド。(レシーバを指定して呼び出すことができない)<br>
`private`を書いた以降に定義したメソッドは、すべてprivateになる。(`private`メソッドになるのはインスタンスメソッドだけで、クラスメソッドは`private`キーワードの下に定義しても`private`にならない。)
`private`キーワードは実際にはメソッドなので、引数を渡すことができる。(引数を渡した場合はその下の定義したメソッドの公開レベルは変更されない)<br>
Rubyの場合は「`private`メソッドはそのクラスだけでなく、サブクラスでも呼び出せる」

## protectedメソッド
基本的に`private`メソッドと同様にクラス外部には、公開されないメソッドでクラス内のメソッドから呼び出して使われるメソッド<br>
`protected`メソッドは、そのメソッドを定義したクラス自身と、そのサブクラスのインスタンスメソッドからレシーバつきで呼び出せる。


```
# public
class Shoes
  def initialize(name)
    @name = name
  end
	# デフォルトはpublic
  def brand
    puts "これは#{@name}の靴です"
  end
end

shoes = Shoes.new("NIKE")
# publicはクラスの外部から呼び出せる
shoes.brand

# private
class User
	attr_accessor :name
  def initialize(name)
    @name = name
		# 関数形式では呼び出せる
		# selfは付けることができない
		greeting
  end 

  private

	def greeting
		puts "#{@name} hello"
	end
end

user = User.new('abe')
# インスタンス.privateメソッドの形式では呼び出せない
# user.greeting

# protected
class Product
  attr_accessor :name
  def initialize(name)
    @name = name
		# selfをつけると呼び出せる
	  self.buy
  end

	protected
	
	def buy
		puts "#{@name}を買う"
	end
end

product = Product.new('PC')
```
