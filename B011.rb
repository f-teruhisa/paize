#utf-8

#
limit = gets.to_s.chomp.split(" ")
# print "-- " + limit.to_s + " -- \n"

n = limit[0].to_i
m = limit[1].to_i - 1
# print "n:" + n.to_s + "\n"
# print "m:" + m.to_s + "\n"
page =  m / n + 1
# print "page:" + page.to_s + "\n"

mod =  m % n
# print "mod:" + mod.to_s + "\n"

if ( page % 2 ) == 1 then
  # print "[odd]:".to_s  + "\n"
  print m + ( ( n - mod - 1 ) * 2 + 1 ) + 1
  print "\n"
else
  # print '[even]:'.to_s  + "\n"
  print  m + 1 - ( mod * 2 + 1 ) 
  print "\n"
end 

# num = gets.to_s.chomp.to_i

# 何ページかどうか？
# ページ数は 偶数か奇数か?

# 偶数の場合には、
# ( 裏側 )

# 1..n の 位置で どの場所か？

# 奇数の場合には、
# ( 表側 ) 
# 1..n の 位置で どの場所か？




