# Script file for constraining Multiply8x8 
set rpt_file "mult8.rpt"
set design "mult8"
current_design Multiply8x8
source "${script_path}defaults.tcl"
# Define design environment 
set_load 2.2 res
set_driving_cell -lib_cell FD1P [all_inputs]
set_drive 0 $clk_name
# Define design constraints 
set_input_delay 1.35 -clock $clk_name {op1 op2}
set_max_area 0
compile
if {[shell_is_in_xg_mode]==0} {
write -hier -o "${db_path}${design}.db"
} else {
write -format ddc -hier -o "${ddc_path}${design}.ddc"
}
source "${script_path}report.tcl"
