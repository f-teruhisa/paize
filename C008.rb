# 
line1 = gets.chomp.split(" ")
line2 = gets.chomp

first = line1[0].to_s
second = line1[1].to_s

# print "---\n"
# print line1.to_s + "\n"
# print line1.to_s.length.to_s + "\n"
# print line2.to_s + "\n"
# pos1 =  line2.to_s.length.to_s 
# pos2 =  line2.to_s.length.to_s + "\n"

pos1 = pos2 = 0

moji = ""

while line2.to_s.index( first , pos2 ) != nil
  pos1 = line2.to_s.index(first, pos2)
  pos2 = line2.to_s.index(second, pos1 )
  moji =  line2.to_s[pos1 + first.length , pos2 - ( pos1 + first.to_s.length ) ]

  if moji.length != 0
    print moji + "\n"
  else
    print "<blank>" + "\n"
  end
end
