
word = gets.chomp

md = word.split(" ")
num =  md[0].to_i
unit =  md[1].to_s

if unit == "km" 
  num = num * 1000000
elsif unit == "m"
  num = num * 1000
elsif unit == "cm"
   num = num * 10
end
puts num
