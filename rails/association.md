# アソシエーション
- モデル間の関連付けに使われる概念
- 例）どれが誰の投稿なのかを関連づけるのがアソシエーション
- アソシエーションを行う際は、そのモデルの親子関係がどのようになっているのかがとても大切。

## モデルの親子関係
- UserがいなくてはTweetは生まれないし、Tweetは必ず誰か一人のUserから生まれる。（Userが親で、Tweetが子）これが親子関係

## foreign_keyとは
- データには１つ１つ認識するためのidがある。これを`Primary Key(主キー)`と言い、Railsではidというカラム名でテーブル作成時に標準搭載されている。
- そして、`foreign key`というのは、その親の`id`(Primary Key)を保存するカラムのこと。これにより、どの親に所属しているのか？というのを識別することができる。
- 子のプロパティに`foreign_key`を追加する。`親のモデル名_id`という名前にするのが、Railsの命名規則。

## アソシエーションの記述
### has_many
- 例）UserはたくさんのTweetを持っている（User has many tweets）なので、Userモデルに`has_many :tweets`を記述。
- このように、子の方のモデル名は複数形で書く。
### belongs_to
- 例）Tweetは１つのUserに所属している（Tweet belongs to a User）なので、Tweetモデルに`belongs_to :user`を記述。
- こちらは１つなので単数形
### ※注意
- `user_id`の情報はフォームから送られていないので、追加で代入してあげないといけない。
- `current_user`でログイン中にユーザーの情報が取得できるため（つまり、ツイートした本人）、`current_user`を`@tweet_user_id`に代入する。

## アソシエーションしているデータの受け取り方
### 「ユーザーがツイートしたデータ」や「このツイートをしたユーザー」などの表示方法
- ユーザーがツイートしたデータは、`@user.tweets`これで「ユーザーに関連したツイート」を取得できる。tweetsと複数形になっていることに注意。この記述は、Userモデルに記述した`has_many　:tweets`によって決まる。
- このツイートをしたユーザーは、`@tweet.user`これで「このツイートをしたユーザー」を取得できる。Tweetモデルに記述した`belongs_to :user`により、単数形にすることで取得する。（こちらは、単数なので取得したデータも１つのみ）

## 投稿した記事にユーザーIDを保存できるようにする
- これをしないと誰がどの記事を投稿したのか判別できない。
- 最初は以下のようにやってしまいエラーが発生した
```
def create
  @question = Question.new(question_params,user_id: @current_user.id)
end
```
- ユーザーIDを保存するには、`pravate`の`question_params`に`merge`で`user_id`を受け取れるようにすれば良い
```
def create
  @question = Question.new(question_params)
end

def question_params
  params.require(:question).permit(:title, :body).merge(user_id: current_user.id)
end
```
これにより投稿したユーザーのIDを保存することができる。

## 上記と動作は同じだが以下のような書き方の方が推奨されている
```
def create
    @question = current_user.questions.new(question_params)
    if @question.save
      redirect_to questions_url, notice: "質問を「#{@question.title}」投稿しました。"
    else
      render :new
    end
  end
private
  def question_params
    params.require(:question).permit(:title, :body)
  end
  
```
