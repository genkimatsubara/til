# Action Meiler
Action Mailerを使うと、アプリケーションのメイラークラスやビューでメールを送信することができる。メイラーの動作はコントローラときわめて似通っている。メイラーはActionMailer::Baseを継承し、app/mailersに配置され、app/viewsにあるビューと結び付けられる。
### Mailer作成手順
1. メイラーを作成
```
rails g mailer UserMailer
```
```
# app/mailers/application_mailer.rb
class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  layout 'mailer'
end
```

# メール送信確認方法
## mailcatcher
シンプルなsmtpサーバを立てて、送信されたメールをブラウザ上で確認できるようにしてくれる。
## letter_opener_web
ローカル開発環境で送信したメールをブラウザ上で確認することができる<br>
`http://localhost:3000/letter_opener`にアクセスすることで送信されたメールを確認できる<br>
(cloud9でmailcatcherを実行しようとしたら、うまく実行出来ず原因はcloud9ではないかと考えられる。<br>
なので、メール確認のために代わりにletter_opener_webならcloud9でも使用することが出来た。)
### cloud9で使う方法
1. gemを追加
```
group :development do
  gem 'letter_opener_web'
end
```
2. ルーティング
```
mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
```
3. config デフォルトURLを指定(cloud9バージョン)
```
# config/environments/development.rb

config.action_mailer.default_url_options = { host: 'myapp.c9users.io/', port: $PORT, protocol: 'https'  }
config.action_mailer.delivery_method = :letter_opener_web
```



## 質問があった際に全員に対して質問があった旨をメールで通知する(自分は除く)
```
# question_mailer.rb
class QuestionMailer < ApplicationMailer
  default from: 'qanda@example.com'    
  def creation_email(user)
    @user = user
    mail(subject: '新規質問です',to: user.email, from: "qanda@example.com")
  end 
  def self.creation_email_questions
    @users = User.all
    @users.each do |user|
      QuestionMailer.creation_email(user).deliver_now
    end 
  end
end
```
```
# questions_controller.rb
  def create
    @question = current_user.questions.new(question_params)
    if @question.save
      QuestionMailer.creation_email_questions
      redirect_to questions_url, notice: "質問を「#{@question.title}」投稿しました。"
    else
      render :new
    end
  end
```
- これでも、全ユーザーにメールを送信することは可能だが、考え方が少し複雑な上にメイラーのビューで質問のタイトルや内容を表示するために@question使えない。<br>
```
# quesitons_controller
def create
    @question = current_user.questions.new(question_params)
    if @question.save
      User.all.each do |user|
        next if == current_user
        QuestionMailer.with(user: user, question: @question).creation_email.deliver_now
      end
      redirect_to questions_url, notice: "質問を「#{@question.title}」投稿しました。"
    else
```
```
# question_mailer
def creation_email
    @user = params[:user]
    @question = params[:question]
    mail(subject: '新規質問',to: @user.email, from: "qanda@example.com")
  end
```
- このように`with(question: @question)`と書くことでメイラーのアクションで`params[:question]`が使えるようになり、ビューでも@questionが使えるのでメールの内容を表示することができるようになる。

## 質問に対して回答があった場合は質問者および当該質問に回答したユーザーに対してメールで通知する。
### 質問者にメール
```
# answers_controller.rb
def create
    @answer = current_user.answers.new(answer_params)
    if @answer.save
      AnswerMailer.with(answer: @answer).creation_answer.deliver_later #回答があった場合質問者にメールで通知
      redirect_to "/questions/#{params[:question_id]}",  notice: "回答しました"
    else
      @question = Question.find(params[:question_id])
      render "questions/show"
    end
  end
```
```
# answer_mailer.rb
def creation_answer
    @answer = params[:answer]
    mail(subject: '回答',to: @answer.question.user.email, from: "qanda@example.com")
  end
```
@answerで回答した内容を取得<br>
メールの送信先を@answer紐付いたquestionからuserのeamilを取得している

### 当該質問に回答したユーザーに対してメール(自分は除く)

```
# answers_controller.rb
      answers = Answer.where(question_id: @answer.question_id)
      user_ids = answers.pluck(:user_id)
      users = User.where(id: user_ids)
      users.each do |user|
      users.each do |user|
        next if == current_user
        AnswerMailer.with(user: user, answer: @answer).creation_other_answers.deliver_later
end
```
- `with(user: user, answer: @answer)`でユーザーだけを繰り返して,回答された内容は固定したまま(@answer)にする
```
# answer_mailer.rb
def creation_other_answers
    @user = params[:user]
    @answer = params[:answer]
    mail(subject: '他の回答',to: @user.user.email, from: "qanda@example.com")
end
```
### ここで発生した問題
最初、メールの送信先を`@user.email`にしていたので、このままではeachで繰り返されたuser.idが入ってしまうのでメールアドレスではないのでメールが送信されない。<br>
解決するにはuser.idからメールアドレスを取得しなければならない。`@user.user.email`とすることでuser.idからメールアドレスを取得することができる。
