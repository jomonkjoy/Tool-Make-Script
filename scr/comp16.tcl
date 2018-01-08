# Script file for constraining Comparator 
set rpt_file "comp16.rpt"
set design "comp16"
current_design Comparator
source "${script_path}defaults.tcl"
# Define design environment 
set_load 2.5 cp_out
set_driving_cell -lib_cell FD1 [all_inputs]
# Override auto wire load selection 
set_wire_load_model -name "05x05"
set_wire_load_mode enclosed
# Define design constraints 
set_input_delay 1.35 -clock $clk_name {ain bin}
set_output_delay 5.1 -clock $clk_name {cp_out}
set_max_area 0
compile
if {[shell_is_in_xg_mode]==0} {
write -hier -o "${db_path}${design}.db"
} else {
write -format ddc -hier -o "${ddc_path}${design}.ddc"
}
source "${script_path}report.tcl"
