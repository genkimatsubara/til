# 擬似変数
疑似変数の値を変更することはできません。擬似変数へ代入すると文法エラーになります。

# 擬似変数の例
| 擬似変数 | 意味 |
| :--- | :--- |
| true | TrueClass クラスの唯一のインスタンス |
| false | FalseClass クラスの唯一のインスタンス |
| nil | NilClass クラスの唯一のインスタンス |
| self | オブジェクト自身 |
| `__FILE__` | 現在のソースファイル名 |
| `__LINE__` | 現在のソースファイル中の行番号 |
| `__ENCODING__` | 現在のソースファイルのスクリプトエンコーディング |


# true
p true.frozen?

# false
p false.frozen?

# nil
p nil.frozen?

# self
class User
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def sayHi
    puts "hi i am #{self.name}"
  end

end

jon = User.new('jon')
p jon.sayHi


# 現在のソースファイル名
p "#{__FILE__}"

# 現在のファイルの絶対パス
p File.expand_path(__FILE__)

# 現在のソースファイルの行行番号
p "Helloは#{__LINE__}行目"

# 現在のソースファイルのスクリプトエンコーディング
p "#{__ENCODING__}"
