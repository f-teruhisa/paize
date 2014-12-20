count = gets.chomp.to_i

count.times do |i|
    
    moji = gets.chomp.to_s 

    if md = moji.match(/(\d+)\.(\d+)\.(\d+)\.(\d+)/)
      if md[0].to_i >= 0 && md[0].to_i <= 255 && md[1].to_i >= 0 && md[1].to_i <= 255 && md[2].to_i >= 0 && md[2].to_i <= 255 && md[3].to_i >= 0 && md[3].to_i <= 255 
        print "True\n"
      else
        print "False\n"
      end
    else
      print "False\n"
    end

end

