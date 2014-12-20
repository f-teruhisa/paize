# Global 変数
# 解析結果 格納Hash 
@words = {}

# Hash 初期化
("a".."z").to_a.each { |letter| 
  @words[letter] = 0   
}
# p @words 

input = gets.chomp.to_s
# @words = input.chars.to_a
# p input.to_s

# 結果出力 用
def display_result()
  @words.each { |key,value|
    print key + " " + value.to_s + "\n"
  }  
  # p @words
end

# 二つの連想配列を結合させる
def merge( arr1 , arr2 , plus )

   arr1.each { |key, value|
     arr1[key] = arr1[key].to_i + arr2[key].to_i * plus
   }           
   return arr1 
end

# データ解析
def calc( letter , len )
   # p "calc: check " + letter.to_s + ":" + len.to_s  + ":" + letter.length.to_s
   # 内部変数 初期化
   tmp = {}
   ("a".."z").to_a.each { |w|
     tmp[w] = 0
   }

   # ポイントが配列の長さを超えている場合は終了
   return tmp if len > letter.length

   l = len.to_i
   count = ""

   while l.to_i < letter.length do
  
     if /[0-9]/.match("#{letter[l]}") then
       # p "number: #{len}:" + letter[l].to_s
       # 文字列として数値を結合
       count = count + letter[l].to_s
     elsif /[a-z]/.match("#{letter[l]}") then
       # p "words:#{len}:" + letter[l].to_s
       if count.to_s == "" then
         tmp[ letter[l] ] = tmp[ letter[l] ] + 1
       else
         tmp[ letter[l] ] = tmp[ letter[l] ] + 1 * count.to_i 
         count = ""
       end
     elsif /[\(]/.match("#{letter[l]}") then
       # p "kigou s:#{len}:" + letter[l].to_s + " -- "
       ret = {}
       ret, l = calc( letter, l+1 )
       if count.to_s == "" then
         tmp = merge( tmp, ret, 1 )
       else
         tmp = merge( tmp, ret, count.to_i )
         count = ""
       end
     elsif /[\)]/.match("#{letter[l]}") then
       # p "kigou e:#{len}:" + letter[l].to_s
       return [ tmp , l ]
     end

      l = l + 1
   end

   return [ tmp, l ] 
end


# データインプツ
@words, moge = calc(input.chars.to_a, 0 )

# 結果出力
display_result()

