# 前日になると自動でメールを送信する
- `whenever`を使う
- 前日にメールを自動送信したい場合、毎日定時実行して登録した日付の前日になった時だけメールを送る

### メイラー
```
class UserMailer < ApplicationMailer
  default from: 'task@example.com'
  def notice_deadline(task)
    @task = task
    mail(subject: '期限', to: @task.user.email, from: 'task@example.com')
  end
  def self.notice_deadline_users
    time_range = (Time.now.midnight - 1.day)
    tasks = Task.where('deadline' => time_range)
    tasks.each do |task|
      UserMailer.notice_deadline(task).deliver_now
    end
  end
end
```
- 最初はこの書き方をしていたが、メイラーでクラスメソッドを定義するやり方はあまりないのでこれでも動くがやめた方がいい。

```
class UserMailer < ApplicationMailer
  default from: 'task@example.com'
  def notice_deadline
      time_range = (Time.now.midnight - 1.day)
      tasks = Task.where('deadline' => time_range)
      tasks.each do |task|
        mail(subject: '期限', to: task.user.email, from: 'task@example.com')
      end
  end
end
```
- 次に`each`で全ユーザーに対してメールを送ろうとするがこれでは、最後に登録されたユーザーにしかメールがされない。
- `each`の中には対処のユーザーがいるが、送信されるのは一人だけになってしまう。
