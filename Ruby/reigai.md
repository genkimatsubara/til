# 例外とは
例外(Exception)とは文字どおり、プログラムの実行中(場合によっては実行前)に発生した「例外的な問題」のこと。<br>
「エラーが起きてプログラムの実行を続けることができなくなった状態」とも言える。<br>
プログラマが特に手を打たなければ、例外が発生した時点でプログラムの実行は終了する。しかし、意図的にそのエラーを捕捉し、
プログラムを続行させることもできる。<br>
また、例外は捕捉するだけでなく「これはプログラムが続行できない異常事態」として例外を意図的に発生させることもできる。

# 例外の捕捉
## 捕捉しない
- システムエラーの場合<br>
RailsのようなWebアプリケーションフレームワークでは、例外発生時の共通処理が最初から組み込まれている。<br>
具体的にはエラーメッセージやバックトレースをログに書き込み、ユーザに対してはエラーの発生を画面上で通知してくれる。<br>
なので、自分でrescueをせずとも、フレームワークに例外処理をゆだねることができる。

## 捕捉する
- 業務エラーの場合<br>
「業務エラー」は業務設計の中で想定されている範囲内で処理が分岐し、正常終了できなかった場合のエラーをさす。<br>
しかし、例外の発生がある程度予想できる処理であれば、条件分岐や問題の有無を事前に確認できるメソッドを使う。
- 途中でエラーが発生しても続行したいケース<br>
一人のユーザの例外によって他のユーザーの処理にも影響を与えるなど

### 構文
```
begin
  # 例外が起こりうる処理
rescue
  # 例外が発生した場合の処理
end
```

# 例外オブジェクト
Rubyでは発生した例外自身もオブジェクトになっている。
そのため例外オブジェクトのメソッドを呼び出すことで、発生した例外に関する情報を取得することができる。




jgjっふg
