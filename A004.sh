# 確認 結果出力
rm A004.result
touch A004.result
rm A004.ans
touch A004.ans
# LineNo LinePos NextLinePos
cat <<EOF | ruby A004.rb |tee A004.result
7 4 5
1 3 1
3 2 2
2 3 5
3 4 4
1 6 6
EOF


cat <<EOF >>  A004.ans
3
EOF

diff A004.ans A004.result

# 確認 結果出力
rm A004.result
touch A004.result
rm A004.ans
touch A004.ans
# LineNo LinePos NextLinePos
cat <<EOF | ruby A004.rb |tee A004.result
5 5 8
3 3 4
1 3 2
4 2 2
2 1 2
2 4 4
3 1 1
1 4 3
4 3 4
EOF


cat <<EOF >>  A004.ans
1
EOF

diff A004.ans A004.result
