# 
line1 = gets.chomp.split(" ")

params = line1[0].to_i - 1
all = line1[1].to_i - 1
top = line1[2].to_i - 1

#print "params:" + params.to_s + "\n"
#print "all:" + all.to_s + "\n"
#print "top:" + top.to_s + "\n"


points = []
line2 = gets.chomp.split(" ")
for i in (0..params)
   points[i] = line2[i]
end
#print points.to_s + "\n"

list = [0, 0, 0, 0]

for i in (0..all)
  moji = gets.chomp.split( " " )
  #puts "moji:" + moji.to_s + "\n"
  # list[i] = 0
  for k in (0..moji.length - 1) 
    list[i] = list[i].to_f + moji[k].to_f * points[k].to_f
    #print k.to_s + ")" + list[i].to_s + "\n" 
  end
end 


# print list.sort!
array = list.sort!
# print array
for j in (0..2)
  print array[array.length - 1 - j].round.to_s + "\n"
end

