

limit = gets.chomp.to_i
# print limit.to_s + "\n"

num = 0

for i in (0..limit - 1)
  input = gets.chomp.split(" ")

  need = input[0].to_i
  have = input[1].to_i 
  price = input[2].to_i

  if need - have > 0  then
    num = num + ( need - have ) * price 
  end
end

print num.to_s + "\n"
