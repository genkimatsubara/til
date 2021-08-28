# moduleとは
複数のメソッドや定数を一箇所にまとめることができる。

# moduleの定義
```
module モジュール名
  # モジュールの定義(メソッドや定数など)
end
```

# moduleの用途
- 継承を使わずにクラスにインスタンスメソッドを追加する、もしくは上書きする(ミックスイン)。
- 複数のクラスに大して共通の特異メソッド(クラスメソッド)を追加する(ミックスイン)。
- クラス名や定数名の衝突を防ぐため名前空間を作る。
- 関数的メソッドを定義する。
- シングルトンオブジェクトのように扱って設定値などを保持する。

# moduleとclassの違い
- モジュールからインスタンスを作成することはできない
- 他のモジュールやクラスを継承することはできない



```
module Driver
  def self.run
    puts 'run'
  end
  
  def self.stop
    puts 'stop'
  end
end

Driver.run
Driver.stop

# module
# - 名前空間

def movie_encode
end

def movie_export
end

module Movie

  VERSION = 1.1

  def self.encode
    puts "encoding..."
  end

  def self.export
    puts "exporting..."
  end

end

Movie.encode
Movie.export
p Movie::VERSION

# module
# - ミックスイン

module Debug

  def info
    puts "#{self.class} debug info ..."
  end

end

class Player
  include Debug
end

class Monster
  include Debug
end

Player.new.info
Monster.new.info
```
