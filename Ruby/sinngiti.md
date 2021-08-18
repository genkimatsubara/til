# 真偽値を返すメソッド
?で終わらせるメソッドは習慣として真偽値を返すメソッドになっている。

# メソッド
| メソッド | 内容 |
| :--- | :--- |
| nil? | nilの場合のみtrueを返し、それ以外はfalse | 
| empty? | 空の文字列や空の配列の場合にtrueを返す。nilに対して呼び出すとNoMethodErrorが発生する | 
| any? | 条件を満たす要素が１つでもあればtrueを返し、条件を満たす要素が0の場合はfalseを返します | 
| include? | 引数の文字列が含まれているならtrue、含まれていないならfalse | 
| odd? | 奇数ならtrue、偶数ならfalse | 
| even? | 偶数ならtrue、奇数ならfalse | 
| all? | 全ての要素がtrueであるならtrue | 
| none? | 全ての要素がfalseであるならfalse | 
| one? | trueである要素が1つ存在するか | 
| zero? | 0ならばtrue、0以外ならfalse |


array = []
hash = {}

# 要素があるのか
p ''.empty?
p 'abc'.empty?
p array.empty?
p hash.empty?

# 0であるか
p 0.zero?
p 12.zero?

# 引数の文字列が含まれているか
p 'matsubaragenki'.include?('g')
p 'matsubaragenki'.include?('po')

#奇数ならtrue、偶数ならfalse
p 1.odd?
p 2.odd?

#偶数ならtrue、奇数ならfalse
p 1.even?
p 2.even?

#オブジェクトがnilであればtrue、そうでなければfalse
p nil.nil?
p 'abc'.nil?
p 1.nil?

numbers = [1, 2, 3, 4, 5]
booleans = [false, true, false, false, false]

# 全ての要素がtrueであるか
p numbers.all? { |number| number.even? }
p booleans.all? 

# 全ての要素がfalseであるか
p numbers.none? { |number| number.even? }
p booleans.none?  

# trueである要素が一つ以上存在するのか
p numbers.any? { |number| number.even? }
p booleans.any?

# trueである要素が一つ存在するか
p numbers.one? { |number| number.even? }
p booleans.one?  
