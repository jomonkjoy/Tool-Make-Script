# Script file for constraining path_segment 
set rpt_file "pathseg.rpt"
set design "pathseg"
current_design PathSegment
source "${script_path}defaults.tcl"
# Define design environment 
set_load 2.5 [all_outputs]
set_driving_cell -lib_cell FD1 [all_inputs]
set_drive 0 $clk_name
# Define design rules 
set_max_fanout 6 {S1 S2}
# Define design constraints 
set_input_delay 2.2 -clock $clk_name {R1 R2}
set_input_delay 2.2 -clock $clk_name {R3 R4}
set_input_delay 5 -clock $clk_name {S2 S1 OP}
set_max_area 0
# Perform path segmentation for multiplier 
group -design mult -cell mult U100
set_input_delay 10 -clock $clk_name mult/product*
set_output_delay 5 -clock $clk_name mult/product*
set_multicycle_path 2 -to mult/product*
compile
if {[shell_is_in_xg_mode]==0} {
write -hier -o "${db_path}${design}.db"
} else {
write -format ddc -hier -o "${ddc_path}${design}.ddc"
}
source "${script_path}report.tcl"
report_timing_requirements -ignore >> "${log_path}${rpt_file}"
