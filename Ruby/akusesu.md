# アクセス修飾子
アクセス修飾子には以下の３つがあります。

## publicメソッド
public メソッドはクラスの外部からでも自由に呼び出せるメソッドである。<br>
initializeメソッド以外のインスタンスメソッドはデフォルトでpublicメソッドになる。<br>
また、自身のオブジェクトを呼び出す際に、先頭に「self」をつけますが、省略もできる。<br>
publicキーワードの下に定義されたメソッドはpublicメソッドになる。

## privateメソッド
クラス外部には公開されないメソッドでクラス内のメソッドから呼び出して使われるメソッドになります。(レシーバを指定して呼び出すことができない)<br>
privateを書いた以降に定義したメソッドは、すべてprivateになります。(privateメソッドになるのはインスタンスメソッドだけで、クラスメソッドはprivateキーワードの下に定義してもprivateにならない。)
privateキーワードは実際にはメソッドなので、引数を渡すことができる。(引数を渡した場合はその下の定義したメソッドの公開レベルは変更されない)<br>
Rubyの場合は「privateメソッドはそのクラスだけでなく、サブクラスでも呼び出せる」

## protectedメソッド
基本的に「private」メソッドと同様にクラス外部には公開されないメソッドでクラス内のメソッドから呼び出して使われるメソッドになる。<br>
protectedメソッドはそのメソッドを定義したクラス自身と、そのサブクラスのインスタンスメソッドからレシーバつきで呼び出せる。


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
