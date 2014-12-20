#utf-8

#
# func check_ip
# param ip アドレス
# param log 用 ip アドレス
#
def check_ip( ip , log )

  log = log.split(".")

  ret = true
  for i in ( 0..3 ) 
    if ip[i].to_s == "*" then
      # print "[0-255]" + "\n"
      if log[i].to_i >= 0 and log[i].to_i <= 255 then
        # return true
        ret = ret && true
      else
        return false
      end
    elsif /\[(\d{1,3})\-(\d{1,3})\]/ =~ ip[i].to_s
      # print $1 + "-" +  $2 + "\n"
      if log[i].to_i >= $1.to_i && log[i].to_i <= $2.to_i then
        # return true
        ret = ret && true
      else
        return false
      end

    elsif /(\d{1,3})/ =~ ip[i].to_s
      # print $1 + "\n"
      if log[i] == $1 then
        # return true
        ret = ret && true
      else
        return false
      end
    else
      # print "" + "\n"
      return false
    end
  end 
  return ret
end 

limit = gets.to_s.chomp.split(".")
# print limit.to_s + "\n"
num = gets.to_s.chomp.to_i

for i in (0..num - 1 )
  log = gets.to_s.chomp
  /^([\d\.]+) - - \[(.*) \+0900\] \"GET (.+) HTTP\/1.1\" .+/ =~ log
  # 192.168.99.112 - - [10/Jul/2013:13:53:15 +0900] "GET /top.html HTTP/1.1" 404 1426 "http://facebook.com" "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.116 Safari/537.36"
  ip =  $1.to_s.chomp
  time = $2.to_s
  url = $3.to_s
  if check_ip( limit , ip ) then
    print ip.to_s + " " + time.to_s + " " + url.to_s + "\n"
  end
end


