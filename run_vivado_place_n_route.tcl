# Gathering TCL Arg
set DESIGN [lindex $argv 0]
read_checkpoint ./${DESIGN}_opt.dcp
# Placing Design
place_design
write_checkpoint -force ./${DESIGN}_place.dcp
# Routing Design
route_design
# Saving Run
write_checkpoint -force ./${DESIGN}_route.dcp
# Creating route reports
report_timing_summary -max_paths 10 -nworst 1 -input_pins -
report_drc -file ${DESIGN}_drc_route.rpt
exit
