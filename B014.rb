# main
# 立方体の大きさ
input = gets.chomp.to_s.split(" ")

#
xnum = input[0].to_i
ynum = input[1].to_i
znum = input[2].to_i

# puts input.to_s + "\n"
#
matrix = Array.new(xnum){ Array.new(ynum){ Array.new(znum) } }

for z in (0..znum-1) 
  for x in (0..xnum-1)  
    y = 0 
    line = gets.chomp.to_s
    line.chars { |ch| 
      matrix[x][y][z] = ch
      # puts "( #{x} , #{y}, #{z} ) : " + ch.to_s 
      y = y + 1
    }
  end
  # puts "\n"
  blank = gets.chomp.to_s 
  # puts blank.to_s + "\n"
end

# p matrix[0]


(znum-1).downto(0) { |z|
  0.upto(ynum-1) { |y|
    flg = false
    (xnum-1).downto(0) { |x|
      # puts "( #{x} , #{y}, #{z} ) : " + matrix[x][y][z].to_s 
      if matrix[x][y][z] == "#" then
        flg = true 
        next           
      end
    }
    if flg then
      print "#"
    else
      print "."
    end
  }
  print "\n"
}
