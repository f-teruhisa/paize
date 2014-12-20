#! /bin/sh

#
# 
#
# 

cat <<EOF | ruby B004.rb 
192.168.186.70
3
192.168.110.238 - - [10/Jul/2013:18:40:43 +0900] "GET /top.html HTTP/1.1" 404 8922 "http://gi-no.jp" "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.116 Safari/537.36"
192.168.186.70 - - [10/Jul/2013:18:52:12 +0900] "GET /top.html HTTP/1.1" 404 3628 "http://facebook.com" "Mozilla/5.0 (Windows NT 5.1; rv:22.0) Gecko/20100101 Firefox/22.0"
192.168.105.56 - - [10/Jul/2013:20:13:52 +0900] "GET /top.html HTTP/1.1" 200 1863 "http://paiza.jp" "Mozilla/5.0 (iPad; CPU OS 6_0_1 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Mobile/10A523 Safari/8536.25"
EOF
# Answer
# ---
# 192.168.186.70 10/Jul/2013:18:52:12 /top.html
# ---
# 
cat <<EOF | ruby B004.rb 
192.168.[0-100].*
3
192.168.99.112 - - [10/Jul/2013:13:53:15 +0900] "GET /top.html HTTP/1.1" 404 1426 "http://facebook.com" "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.116 Safari/537.36"
192.168.81.20 - - [10/Jul/2013:15:06:33 +0900] "GET /hogehoge.html HTTP/1.1" 404 4374 "http://paiza.jp" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.116 Safari/537.36"
192.168.223.58 - - [10/Jul/2013:21:32:01 +0900] "GET /hoge.html HTTP/1.1" 304 6601 "http://paiza.jp" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:22.0) Gecko/20100101 Firefox/22.0"
EOF
# Answer
# ---
# 192.168.99.112 10/Jul/2013:13:53:15 /top.html
# 192.168.81.20 10/Jul/2013:15:06:33 /hogehoge.html
# ---
# 
