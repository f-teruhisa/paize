#! /bin/sh
cat <<EOF | ruby C008.rb 
<abc> <xyz>
hoge<abc>piyo<xyz>
EOF

cat <<EOF | ruby C008.rb 
<abc> <xyz>
<abc>123<abc>456<xyz>789<xyz>
EOF

cat <<EOF | ruby C008.rb 
<abc> <xyz>
<abc><xyz>789<xyz>
EOF

cat <<EOF | ruby C008.rb 
<abc> <xyz>
<abc>123<xyz>456<abc>789<xyz> momo <abc> gegeg<xyz>
EOF
# answer
#
cat <<EOF | ruby C008.rb 
<abc> <ijk>
<abc>xxxx<ijk>yyyyyy<abc>zzz<ijk>
EOF
# Answer
# xxxx
# zzz
#
cat <<EOF | ruby C008.rb 
<paiza> <poh>
<paiza><poh>
EOF
# Answer
# <blank>
cat <<EOF | ruby C008.rb 
<Banana> <Cupcake>
ApplePie<Banana>Bread<Cupcake>Apple<Banana><Cupcake>
EOF
# Answer
# Bread
# <blank>

