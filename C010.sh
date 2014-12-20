#! /bin/sh

#
# a b R　　　#工事現場のx座標,工事現場のy座標,工事現場の騒音の大きさ
# N　　　　　#木陰の数
# x_1 y_1　　#木陰1のx座標,木陰1のy座標
# x_2 y_2　　#木陰2のx座標,木陰2のy座標
# ...
# x_N y_N　　#木陰Nのx座標,木陰Nのy座標
#
# 

cat <<EOF | ruby C010.rb 
20 10 10
3
25 10
20 15
70 70
EOF
# Answer
# ---
# noisy
# noisy
# silent
# ---
# 

cat <<EOF | ruby C010.rb 
50 50 100
4
0 0
0 100
100 0
100 100
EOF
# Answer
# ---
# noisy
# noisy
# noisy
# noisy
# ---
# 
