# オブジェクト指向プログラミング（OOP）とは
「プログラムの作り方」の一つである。<br>
`OOP`では「オブジェクト」を中心として、JavaやPython、Rubyなど「オブジェクト指向機能を持つプログラミング言語」を用いてプログラムを作成する。<br>
オブジェクトとはデータと処理の集まりのことで、`OOP`とは、そのオブジェクト（モノ）と呼ばれる部品を作りながら、それを組み合わせてプログラムを作っていくようなイメージ。

# Rubyには、オブジェクト指向プログラミングをサポートするため以下の特徴がある

## 設計（クラス）
クラスはオブジェクトを作成するための設計図<br>
クラスはオブジェクトのデータと処理の組み合わせからなる。<br>
オブジェクトの共通する特徴をクラスでまとめることにより、プログラムの独立性、再利用性、拡張性を高めることができる。

## カプセル化（独立性）
カプセル化とは、機能ごとに処理をまとめ、その内容を隠蔽すること。<br>
カプセル化した機能をどのレベルまで公開するかを明確にすることで、外部から想定外な使い方をされる心配はなく無駄な障害を防ぐことができる。

## 継承（再利用性）
継承とは、プログラムの再利用性を高める考え方のこと。<br>
継承することで、あらかじめ定義されているクラスであるスーパークラスが持つ機能を引き継ぐことができる、これにより、継承するクラスでは、必要とする部分のみ定義すればよいので、スーパークラスで提供されている部分を再利用することができる。

## ポリモーフィズム（拡張性）
ポリモーフィズム、同じ処理で異なる動作を実現する考え方のこと。<br>
継承ばかりだと、同じ処理をするプログラムしか作成できないが、ポリモーフィズムは、同じ処理をする部分は共通化しつつも、違う処理にしたい部分は目的に合わせて変えることができる。

## まとめ
オブジェクトの共通する特徴をクラスでまとめることにより、プログラムの独立性、再利用性、拡張性を高めることができる。<br>
つまり、継承により機能を共通化して再利用しやすくし、カプセル化によってプログラムが独立でき、ポリモーフィズムによって機能を拡張しやすくなり、効率よくプログラムを開発することができる。
