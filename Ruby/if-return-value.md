# if戻り値
最後に評価した値を返す。
ただしどの条件にも一致しない場合はnilを返す。

# 戻り値とは
戻り値とはプログラムから関数やメソッドを呼び出した際に受け取る値のこと。
「返り値」とも呼ぶ。

# 最後に評価した値を返す
drink = "水"

product_name = 
if drink == "水"
  "いろはす"
elsif drink == "炭酸"
  "コーラ"
else
  "その他"
end

p product_name
# =>"いろはす"

drink = "お茶"

product_name = 
if drink == "水"
  "いろはす"
elsif drink == "炭酸"
  "コーラ"
else
  "その他"
end

p product_name
# =>"その他"


# どの条件にも一致しない場合はnilを返す
drink = "お茶"

product_name = 
if drink == "水"
  "いろはす"
end

p product_name
# =>nil
