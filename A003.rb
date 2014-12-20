

# EMPTY 0
# WHITE 1
# BLACK 2

@board = []

# 色が変化する候補
# 左上、上、右上、左、右、左下、下、右下
@dir = [ -9 , -8 , -7 , -1 , 1, 7 , 8 , 9 ]

#
# param
# param
# return boolean 色の変更が可能かどうか
#
def can_board_change( pos, diff,  color )

  # 対応ポジションが不明な場合
  if pos < 0 or pos > 63 then
    return false
  end

  # 対象のポジションが不明な場合は失敗
  # あるいは、空コマの場合には、失敗
  if @board[pos+diff] == nil or @board[pos+diff] == 0 then
    return false
  end 

  # 右左が壁だった場合には失敗
  if diff == -1 and ( pos ) % 8 == 0 then
    return false
  elsif diff == 1 and ( pos ) % 8 == 7 then
    return false
  elsif diff == 7 and ( pos ) % 8 == 0 then
    return false
  elsif diff == 9 and ( pos ) % 8 == 7 then
    return false
  elsif diff == -9 and ( pos ) % 8 == 0 then
    return false
  elsif diff == -7 and ( pos ) % 8 == 7 then
    return false
  elsif diff == -8 and ( pos ) / 8 == 0 then
    return false
  elsif diff == 8 and ( pos ) / 8 == 7 then
    return false
  end

 # 斜め

  # 一緒だったら 探索を終了する
  if @board[pos+diff] == color then
    @board[pos] = color
    return true
  # 色が異なれば、探索を続ける
  else
    if can_board_change( pos+diff, diff, color ) then
      @board[pos] = color
      return true
    end
  end


  # イレギュラー は 失敗とする
  return false
end

def board_change( x , y , color )
  x = x - 1
  y = y - 1
  pos = x+y*8

  # 指定ポジを変更する
  @board[pos] = color

  for n in (0..@dir.length - 1)
    # print "#{@dir[n]}"
    can_board_change( pos, @dir[n], color)
  end
  # print "\n"

end


# borad 初期化
def board_init()

  for i in ( 0..63) 
    @board[i] = 0
  end

  board_change(4, 4, 1)
  board_change(5, 4, 2)
  board_change(4, 5, 2)
  board_change(5, 5, 1)
end
# 盤面 表示
def board_display()
  print " 12345678\n"
  print "1"  

  for i in ( 0..63) 
    if @board[i] == 0 then
      print "-"
    elsif @board[i] == 1 then
      print "o"
    elsif @board[i] == 2 then
      print "x"
    end
  
    if i % 8 == 7 then
      print "\n"
      print i / 8 + 2
    end
  end

  print "########\n"
end

def board_result()
  white = 0
  black = 0
  for i in ( 0..63) 
    if @board[i] == 1 then
      white = white + 1
    elsif @board[i] == 2 then
      black = black + 1
    end 
  end

  if black < 10 then
    print "0#{black}-"
  else
    print "#{black}-"
  end

  if white < 10 then
    print "0#{white} "
  else
    print "#{white} "
  end


  if white > black then
    print "The white won!" 
  elsif white < black then
    print "The black won!"
  else  
    print "Draw!" 
  end
end 
# main

board_init()
## board_display()

# 手数
n = gets.chomp.to_i

n.times { |i|
  line= gets.chomp.to_s.split(" ")
  # print line.to_s + "\n"
  color = line[0] == "W" ? 1 : 2 
  x = line[1].to_i
  y = line[2].to_i
  board_change( x , y , color )
  # board_display()
  # board_result()
  # print "\n"
}

# board_display()
board_result()
