# 例外クラス
すべての例外クラスはExceptionクラスを継承している。<br>
その下には多くの例外クラスがサブクラスとしてぶらさがっている。

# StandardErrorクラス
通常のプログラムで発生する可能性の高い例外クラスを束ねるためのクラス

| サブクラス | 意味 |
| :--- | :--- |
| ArgumentError | 引数の数があっていないときや、数は合っていて、期待される振る舞いを持ってはいるが、期待される値ではないときに発生する。 |
| EncodingError | エンコーディング関連の例外の基底クラス。 |
| FiberError | `Fiber`に関するエラーが起きると発生する。 |
| IOError | 入出力でエラーが起きると発生する。 |
| EOFError | ファイルの終わりに達してから、なんらかの`IO`操作をすると発生する。 |
| IndexError | 添字が範囲外のときに発生する。 |
| KeyError | `key`に対応する`value`がない場合に発生する。 |
| LocalJumpError | スコープを出てしまった`Proc`からの`return`、`break`、`retry`で発生する。 |
| NameError | 未定義のローカル変数や定数を使用したときに発生する。 |
| NoMethodError | 定義されていないメソッドの呼び出しが行われたときに発生する。 |
| NoMatchingPatternError | パターンマッチでどの条件にも一致せず、else節もない場合に発生する。 |
| RangeError | 範囲に関する例外。範囲外の数値変換などにより発生する。 |
| RegexpError | 正規表現のコンパイルに失敗した場合に発生する。 |
| RuntimeError | 実行時例外。例外を指定しない`raise`の呼び出しはこの例外を発生させる。 |
| FrozenError | フローズンオブジェクトを変更しようとした時に発生する。 |
| SystemCallError | システムコールが失敗した時に発生する例外。 |
| ThreadError | `Thread`関連のエラーが起きたときに発生する。 |
| TypeError | メソッドの引数に期待される型ではないオブジェクトや、期待される振る舞いを持たないオブジェクトが渡された時に発生する。 |
| ZeroDivisionError | 整数に対して整数の0で除算を行ったときに発生する。 |
