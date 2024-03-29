# クラス、インスタンス変数、メソッドの関係
オブジェクトとは、データと処理の集まりのこと。<br>
そのオブジェクトを作成するための設計図がクラス。<br>
クラスは、内部にデータを保持し、さらに自分が保持しているデータを利用する独自のメソッドを持つことができる。<br>
データを保持する役割をしているのが、インスタンス変数である。<br>
インスタンス変数（データ）はクラスから作成されるオブジェクトごとに固有のものになる。<br>
そして、クラス内で定義されたメソッドは、クラスから作成されたオブジェクトに対してメソッド（処理）を呼び出すことができる。<br>
インスタンス変数（データ）は、クラス内のすべてのメソッド（処理）で共通して使用することができる。<br>

# 「オブジェクト」「モノ」として
オブジェクトを作成する上で、必要なデータ（インスタンス変数）、処理（メソッド）をまとめ、それをクラスに定義する。<br>
クラスの名前は、名前だけで何を行うオブジェクトかがわかるように、そのオブジェクトの果たす役割と一致しているものにする。<br>
クラス名は何かしらの役割を持つオブジェクトとして捉えるため、名詞を用いる。<br>

# 命名の品詞について
クラス名、変数名は`名詞`にする。<br>
複数の値を「配列」や「ハッシュ」で変数に代入する場合は、`複数形`にする。<br>
`名詞＋名詞`を使う場合は、1番目の名詞は`形容詞`とみなし、2番目の名詞だけが`複数形`になるものとする。<br>
メソッド名はできるだけ`動詞`にする。
ただし、`getterメソッド`のように、属性値を返す（ように見える）ものは名詞でもよい。<br>
`動詞`と`名詞`とどちらの意味でも用いられる単語は、どちらも用いる。
