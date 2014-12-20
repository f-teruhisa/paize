

limit = gets.chomp.to_i
# print limit.to_s + "\n"

num = 0

for i in (0..limit - 1)
  num = num + gets.to_s.chomp.to_i
end

print num.to_s + "\n"
