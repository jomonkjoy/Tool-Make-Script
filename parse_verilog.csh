# pre procees verilog/system_verilog

cat $1 \
| sed "s/ \+/ /g" \
| sed 's/\/\//\n/\/\/' \
| sed '/^ *\/\//d' \
| sed "s/ \+/ /g" \
| sed '/^ *$/d' \
| sed "s/\n/ /g" \
| sed 's/ module/\nmodule/g" \
| sed 's/input/\ninput/g" \
| sed 's/output/\noutput/g" \
| sed 's/inout/\ninout/g" \
| sed 's/always/\nalways/g" \
| sed 's/assign/\nassign/g" \
| sed 's/ endmodule/\nendmodule\n/g" \
| sed 's/\;/\;\n/g" \
| sed -e :1 -e 's/\(\[[^]]*\)[[:space:]]/\1/g;t1' \
| sed '/^ *$/d' > $2

