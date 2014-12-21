class Graph
  attr_accessor :length, :width, :count
  class Node
    attr_accessor :line, :pos, :nid, :edges, :cost, :from_nid, :fixed
    # line (Int) 線の場所 e.g. :2
    # pos (Int) 線の中で位置する場所 e.g. :1
    # nid (String)   e.g. :1-2
    # edges (Array)  e.g. [[cost, nid], [cost, nid], ...]
    # cost コスト値 (nil の場合コストが未設定)
    # from_nid nid格納 (nil の場合存在しない)
    # fixed 確定ノードか否かの判定フラグ
    def initialize(line, pos, nextLine, nextPos, cost=nil, from_nid=nil, fixed=false)
      @line, @pos, @nid, @edges, @cost, @from_nid, @fixed = line, pos, line.to_s + "-" + pos.to_s , [ nextLine.to_s + "-" + nextPos.to_s ] , cost, from_nid, fixed
    end

    # 
    def show
      p "#{nid}(#{cost}/#{from_nid}/#{fixed}) -> #{edges}"
    end


  end

  def initialize( length,  width, count ) 
    # Node を 格納する箱
    # nodes = { "node id" =>  "Node Object" } 
    @length, @width, @count = length, width, count
    @nodes = {}
  end

 
  # ノードを追加する
  def add_node(line, pos, nextPos)
    nextLineNo = whatsnext( line )   
    n1 = Node.new(line, pos, nextLineNo, nextPos )
    @nodes[ line.to_s +  "-" + pos.to_s ] = n1
    n2 = Node.new(nextLineNo, nextPos, line, pos )
    @nodes[ nextLineNo.to_s +  "-" + nextPos.to_s ] = n2

  end

  # 現在のグラフ情報を表示
  def show
    @nodes.map { |k, node| node.show } 
  end

  def route
    line = 1
    pos = @length
    loop do 
      n = @nodes[ line.to_s + "-" + pos.to_s ]
      unless n.nil? then
        # p "--"
        # n.show()

        # つながり先を取り出す( 一つ想定 )
        num = n.edges.pop()
        x = @nodes[num]
        line = x.line
        pos = x.pos
      end

      # p line.to_s + "--" + pos.to_s
      pos = pos - 1
      
      break if pos < 0
    end

    return line
  end

  private
  # 隣のラインを教えてくれる
  def whatsnext( lineNo )
    return lineNo < @length ? lineNo + 1 : @length - 1
  end

end



#########################################
## 処理を実施
#########################################
if __FILE__ == $0

  input =  gets.split( " " ).to_a

  # 入力値 設定
  # 縦の長さ
  length = input[0].to_i
  # 縦線の本数
  width = input[1].to_i
  # 横線の本数
  count = input[2].to_i

  # グラフを作成
  g = Graph.new( length, width , count )

  count.times{ |x|
    
    lineNo, linePos, nextLinePos = gets.chomp.split(" ")
    g.add_node( lineNo.to_i, linePos.to_i, nextLinePos.to_i )

  }

  # グラフの情報を表示
  # g.show();

  # グラフの探索
  puts g.route();

end
