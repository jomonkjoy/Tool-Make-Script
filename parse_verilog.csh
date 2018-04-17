# pre procees verilog/system_verilog

cat $1 \
| sed “s/ \+/ /g” \
| sed ‘s/\/\//\n/\/\/‘ \
| sed ‘/^ *$/d’ \
| sed ‘/^ *$/d’ \
| sed ‘/^ *$/d’ > $2