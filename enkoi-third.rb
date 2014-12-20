

input = gets.chomp.split(" ")

range = input[0].to_i
width = input[1].to_i

# print input.to_s + "\n"

max = 0
tmp = 0

mem = []

for i in (0..width - 1)

  mem[i] = gets.chomp.to_i

  tmp = tmp + mem[i]
  if i + 1 > range then
    tmp = tmp - mem[i - range]
    if tmp  > max then
      max = tmp
    end
  else
    max = tmp
  end

  # print mem.to_s + "\n"
  # print max.to_s + "\n"
end

# print mem.to_s + "\n"

print max.to_s + "\n"
