# 四則演算子
| 演算子 | 意味 | 例 | 結果 |
| :--- | :--- | :--- | :--- |
| - | 引き算 | 6 - 2 | 4 |
| * | 掛け算 | 6 * 2 | 12 |
| / | 割り算 | 6 / 2 | 3 |
| % | 余り | 6 % 4 | 2 |

### 計算の優先順位
- 計算の優先度は ( ) の中が一番最初に計算される。
- 次いで * / % 、最後に + - という順番になる。


# 比較演算子
| 利用例 | 意味 |
| :--- | :--- |
| a < b | aがbよりも小さい |
| a > b | aがbよりも大きい |
| a <= b | aがb以下である |
| a >= b | aがb以上である |
| a != b | aとbは等しくない |
| a == b | aとbは等しい |


# 文字列の比較
puts "HELLO" == "HELLO" # true
puts "HELLO" == "hello" # false
puts "HELLO" != "WORLD" # true
puts "HELLO" != "HELLO" # false

# 数値の比較
puts 0 <= 1 # true
puts 0 > 1 # false
puts 0 >= 1 # false
puts 0 == 1 # false
puts 0 == 0 # true
puts 0 != 1 # true
