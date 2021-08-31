# ファイルやディレクトリを扱うクラス
Rubyの標準ライブラリには、ファイルやディレクトリを扱うクラスがいくつかある。

## Fileクラス
ファイルアクセスのためのクラス。<br>
組み込みライブラリなので、requireなしで使うことができる。

## Dirクラス
ディレクトリの操作を行うためのクラス。<br>
組み込みライブラリなので、requireなしで使うことができる。

## FileUtilsモジュール
基本的なファイル操作を集めたモジュール。<br>
ファイルのコピーや削除などを便利に実行するためのメソッドが定義されている。

## Pathnameクラス
パス名をオブジェクト指向らしく扱うクラス。<br>
自分自身がファイル（またはディレクトリ）かどうかを返すメソッドや、新しいパス文字列を組み立てるメソッドなどが定義されている。

# 特定の形式のファイルやテキストデータを読み書きするライブラリ
Rubyでは単純なテキストファイルだけでなく、CSVファイルやJSONといった特定の形式のファイルやテキストデータを読み書きするライブラリも用意されている。

## CSVクラス
CSVファイルを読み書きする場合は、CSVクラスが使える。<br>
カンマ区切りだけでなく、タブ区切りのファイルを読み書きしたりすることも可能。

## JSONモジュール
JSONは`JavaScript Object Notation`の略で、JavaScriptと互換性のあるテキストフォーマットの一種。<br>
シンプルかつ軽量にオブジェクトの内容を表現できるため、JavaScriptだけでなくさまざまな言語やWebサービス間でデータを交換するときによく使われる。

## YAMLモジュール
YAMLは`YAML Ait't a Markup Language`の略で、インデントを使ってデータの階層構造を表現するテキストフォーマットの一種。<br>
Railsの設定ファイルなどでもYAMLは使われており、Rubyプログラミングの中でもよく見かけるデータ形式の一つ。

```
# File
File.open('./array.rb') do |f|
	puts f.read
end

puts File.size('./array.rb')

# Dir
puts Dir.entries('.')

# Dir.mkdir('ruby-output')

# FileUtils
require 'FileUtils'

FileUtils.cp('./array.rb', './array_backup.rb')

FileUtils.rm('./array_backup.rb')

# Pathname
require 'pathname'

ruby = Pathname.new('./ruby-output')
puts ruby.file?
puts ruby.directory?
puts ruby.join('sample.md').to_s


require 'csv'

CSV.open('file.csv', 'w') do |csv|
  csv << ['name', 'country', 'age']
  csv << ['Tanaka', 'japan', 23]
  csv << ['Benjamin', 'Canada', 18]
  csv << ['Lucas', 'Spain', 35]
end

p CSV.read('file.csv')

require 'json'

user = { name: 'Lucas', country: 'Spain', age: 35}

user_json = user.to_json
p user_json


require 'yaml'

yaml = <<TEXT
  apple:
    name:'Apple'
    color:'red'
    price:150
TEXT


fruit = YAML.load(yaml)

puts fruit
```
