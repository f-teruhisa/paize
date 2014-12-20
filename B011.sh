#! /bin/sh

#
# 
# 入力される値
# バインダーのポケットの数nと名刺の番号mが半角スペース区切りで入力されます
# n(バインダーのポケットの数) m(名刺の番号) 
#
# すべてのテストケースで以下の条件を満たします。
# 
# nとmは整数で以下を満たします。
# 1 ≦ n ≦ 100,000
# 1 ≦ m ≦ 100,000
# 

cat <<EOF | ruby B011.rb 
3 1
EOF
# Answer
# ---
# 6
# ---
# 

cat <<EOF | ruby B011.rb 
3 6
EOF
# Answer
# ---
# 1 
# ---
# 

cat <<EOF | ruby B011.rb 
3 8
EOF
# Answer
# ---
# 11 
# ---
# 

cat <<EOF | ruby B011.rb 
3 12
EOF
# Answer
# ---
# 7
# ---
# 

cat <<EOF | ruby B011.rb 
157 1518
EOF
# Answer
# ---
# 1309
# ---
# 
