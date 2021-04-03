# Gemの追加方法
- GemfileにGemを追加し保存
- bundleでインストール

# ransack
### 検索機能を実装できる
```
def index
  @q = User.all.ransack(params[:q])
  @users = @q.result(distinct: true)
```
`(destinct: true)`は結果の重複を防ぐオプション

### 検索フォームの作成
```
= search_form_for @q, class: 'my-5' do |f| 
  .form-group.row
    .col-sm-10
      = f.search_field :name_cont, class: 'form-control', placeholder: '検索ワード'
    .col-sm-2
      = f.submit class: ' btn btn-outline-primary'
```
`cont`はカラムの中のデータに部分一致しているのかどうかを調べる
`◯◯_cont`○◯の部分には自分で作ったカラム名を指定する。

### adminで検索フォームを作成する場合
```
= search_form_for [:admin, @q], class: 'my-5' do |f| 
  .form-group.row
    .col-sm-10
      = f.search_field :name_cont, class: 'form-control', placeholder: '検索ワード'
    .col-sm-2
      = f.submit class: ' btn btn-outline-primary'
```
`[:admin, @q]`とすることでusers_pathに遷移するのを防ぐことができる。

### 未解決・解決済みで検索フォームを作成する方法
- 検索フォームがない場合
```
def solved
  @questions = Question.where(status: 0)
  render :action => 'index'
end

def unsolved
  @questions = Question.where(status: )
  render :action => 'index'
end
```
これで未解決・解決済みを表示することができる。

- 検索フォームがある場合
```
# questions_controller

  def index
    @q = Question.ransack(params[:q])
    @questions = @q.result(distinct: true).page(params[:page]).per(10)
  end
  
  #(省略)

  def solved
    @q = Question.where(status: 0).ransack(params[:q])
    @questions = @q.result(distinct: true).page(params[:page]).per(10)
    render :action => 'index'
  end
  
  def unsolved
    @q = Question.where(status: 1).ransack(params[:q])
    @questions = @q.result(distinct: true).page(params[:page]).per(10)
    render :action => 'index'
  end
```
これで、解決済み・未解決の中で検索をすることができる。

### この時に起こったエラー
```
@questions = Question.where(status: 0)
render :action => 'index'
```
検索フォームがあるのに、この記述しかしていないので、search_form_forの`@q`がないというエラーが発生した！
```
@q = Question.ransack(params[:q])
    @questions = @q.result(distinct: true).page(params[:page]).per(10)
    render :action => 'index'
```
次に`@q`を作成するも解決済み・未解決を表示しても全ての質問が表示されてしまう
```
 @q = Question.where(status: 0).ransack(params[:q])
    @questions = @q.result(distinct: true).page(params[:page]).per(10)
    render :action => 'index'
```
`Question.where(status: 0)`を書くことにより、未解決の質問のみを表示することができた！





# kaminari
### ページネーション機能を実装
```
def index
  @q = User.ransack(params[:q])
  @users = @q.result(distinct: true).page(params[:page]).per(10)
end
```
`page`と`per`はkaminariで定義されたメソッド<br>
`per`メソッドの引数にどれだけのレコードが表示されたらページを増やすのかを指定することができる
