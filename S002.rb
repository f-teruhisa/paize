# 引用
# グラフ間の最短経路を求めるダイクストラ法をRubyソースコード
# http://ruby-rails.hatenadiary.com/entry/20140709/1404902249
# 
# 上記 記事より
#
class Graph
  class Node 
    attr_accessor :nid, :edges, :cost, :from_nid, :fixed
    # 
    # nid (Symbol)   e.g. :a
    # edges (Array)  e.g. [[cost, nid], [cost, nid], ...]
    # cost コスト値 (nil の場合コストが未設定)
    # from_nid nid格納 (nil の場合存在しない)
    # fixed 確定ノードか否かの判定フラグ
    def initialize(nid, edges=[], cost=nil, from_nid=nil, fixed=false)
      @nid, @edges, @cost, @from_nid, @fixed = nid, edges, cost, from_nid, fixed
    end
    # ノードの情報を表示
    def show
    # p "nid(cost/from_nid/fixed) -> edges"
    p "#{nid}(#{cost}/#{from_nid}/#{fixed}) -> #{edges}"
    end

  end

  def initialize
    @nodes = {}
  end
 
  # ノードを追加する
  def add_node(nid, edges)
    n = Node.new(nid, edges)
    @nodes[nid] = n
  end

  # 開始位置を設定
  def set_start(sid)
    # 開始位置を保存
    @sid = sid
 
    # ノードのダイクストラ法のためのデータを初期化
    # 開始ノードと同じノードだけコストを0にする 
    @nodes.each do |nid, node|
      node.cost = (@sid == nid) ? 0 : nil
      node.from_nid = nil
      node.fixed = false
    end
 
    # ダイクストラ法を実施
    dijkstra
  end

  # 終了地点までの経路を取得
  # 開始地点までの経路を辿れない場合nilを返す
  def route(gid)
    # 経路情報格納変数
    path = []
 
    # 終点ノードを格納
    node = @nodes[gid]
    path.push(node)
 
    # 開始地点に辿りつくか、経路を辿れなかくなるまでループ
    loop do
      # 前のノードを取得し経路情報を格納
      node = @nodes[node.from_nid]
      path.push(node)
 
      # 開始地点に辿り着いたらループを終了
      break if node.nid == @sid
 
      # 開始地点までの経路を辿れない場合nilを返す
      return nil if node.from_nid.nil?
    end
  
    # 終点から辿って格納したので順番を入れ替える
    # そして、nibだけを取り出した配列を返すf
    return path.reverse!.map { |node| node.nid }
  end


  # 終了地点までのコストを取得
  # ゴールにたどり着ける経路がない場合はFailを出力する
  def cost(gid)
    return @nodes[gid].cost || "Fail"
  end
 
  # 現在のグラフ情報を表示
  def show
    @nodes.map { |k, node| node.show } 
  end

  private
  # ダイクストラ法のアルゴリズムを実施する
  def dijkstra
    loop do
      # 確定ノード(fixed_node)を探す
      fixed_node = nil
      @nodes.each do |nib, node|
        next if node.fixed || node.cost.nil?
        fixed_node = node if fixed_node.nil? || node.cost < fixed_node.cost
      end
 
      # 全てのノードが確定ノードに成った場合ループを終了
      break if fixed_node.nil?
 
      # 確定フラグを立てる
      fixed_node.fixed = true
      # 確定ノードに隣接するノードのコストと経路情報を更新する
      fixed_node.edges.each do |edge_cost, edge_nid|
        # 隣接するノードまでのコストを計算
        cost = fixed_node.cost + edge_cost
        # 隣接するノードのコストが存在しない場合、もしくは、既に存在している値より計算した値が小さい(より短い経路)の場合
        if @nodes[edge_nid].cost.nil? || cost < @nodes[edge_nid].cost then
          # コストと経路情報を更新する
          @nodes[edge_nid].cost = cost
          @nodes[edge_nid].from_nid = fixed_node.nid
        end
      end
    end
  end
end

#########################################
## 処理を実施
#########################################
if __FILE__ == $0
 
  input = gets.chomp.split(" ")
  n = input[0].to_i
  m = input[1].to_i

  tmp = []

  # 探索する候補 の 配列
  # 上、左、右、下
  @dir = [ - n , -1 , 1, n ]

  m.times{ |i| 
    line = nil
    line = gets.chomp.split(" ")
    tmp = tmp + line
  }

  # データの関連性を用意する
  relation = { }

  # データを用意
  # 全てのノードからのエッジをデータを作成
  for i in (0..tmp.length-1)
    # 配列 初期化
    relation[i] = Array.new

    # 開始ノードと終了ノードを設定
    if tmp[i].to_s == "s" then
      sid = i
    elsif tmp[i].to_s == "g" then
      gid = i
    end

    @dir.each{ |x|
      # 接続する切片のポジションを推定する
      pt = i + x.to_i

      if x == -1 and i % ( n  ) == 0 then
       next
      end
      if x == 1 and i % ( n )  ==  n - 1    then
       next
      end

      if tmp[pt].to_i == 1 then
       next
      end

      if pt >= 0 and pt < tmp.length then
        relation[i].push( [1, pt] )
      end
    }
  end

  # グラフを作成
  g = Graph.new
 
  # グラフにノードを追加
  relation.each do |nid, edges|
    g.add_node(nid, edges)
  end
 
  # グラフに開始位置を設定
  g.set_start(sid)
 
  # 終了地点までの経路を取得
  # p "#{sid} から #{gid} の 最短経路 は #{g.route(gid)} です。"

  # 終了地点までのコストを取得
  # p "#{sid} から #{gid} の 時間 は #{g.cost(gid)} です。"
  print g.cost(gid)

  # グラフの情報を表示
  # g.show
end


