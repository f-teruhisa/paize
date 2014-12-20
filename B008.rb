#utf-8
info = gets.chomp.split(" ")

n = info[0].to_i
m = info[1].to_i

calc = 0
if n > 0 and m > 0 then
  for i in (0..m - 1)
    tmp = 0
    line = gets.to_s.chomp.split(" ")
    # print line.to_s + "\n"
    for j in (0..n - 1)
      tmp = tmp + line[j].to_i
      # print "tmp : " + tmp.to_s + "\n"
    end
    if tmp > 0 then
      calc = calc + tmp
    end 
    # print "calc : " + calc.to_s + "\n"
  end 

  print calc.to_s + "\n"

end 

