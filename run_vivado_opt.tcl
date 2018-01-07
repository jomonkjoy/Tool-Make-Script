# Gathering TCL Args
set DESIGN [lindex $argv 0]
set DEVICE [lindex $argv 1]
set EDIF_FILE [lindex $argv 2]
set XDC_FILE [lindex $argv 3]
# Reading EDIF/NGC file
read_edif ../Src/${DESIGN}.edf
# Linking Design
link_design -part ${DEVICE} -edif_top_file ../Src/${DESIGN}.edf
# Running Logic Optimization
opt_design
# Adding Constraints
read_xdc ${XDC_FILE}
# Saving Run
write_checkpoint -force ./${DESIGN}_opt.dcp
# Creating opt reports
report_utilization -file ${DESIGN}_utilization_opt.rpt
report_timing_summary -max_paths 10 -nworst 1 -input_pins -
report_io -file ${DESIGN}_io_opt.rpt
report_clock_interaction -file ${DESIGN}_clock_interaction_opt.rpt
exit
