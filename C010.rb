#utf-8
info = gets.chomp.split(" ")
n = gets.chomp.to_i

a = info[0].to_i
b = info[1].to_i
r = info[2].to_i

for i in (0..n - 1)
  point = gets.chomp.split(" ")
  # print point.to_s  
  x = point[0].to_i
  y = point[1].to_i
  # print " x , y : " + x.to_s + ":" + y.to_s + "\n"
  if (x-a) * ( x - a ) + ( y - b ) * ( y - b ) >= r*r then
    print "silent\n"
  else
    print "noisy\n"
  end
end
