# Script file for constraining CascadeMod 
# Constraints are set at this level and then a 
# hierarchical compile approach is used 
set rpt_file "cascademod.rpt"
set design "cascademod"
current_design CascadeMod
source "${script_path}defaults.tcl"
# Define design environment 
set_load 2.5 [all_outputs]
set_driving_cell -lib_cell FD1 [all_inputs]
set_drive 0 $clk_name
# Define design constraints 
set_input_delay 1.35 -clock $clk_name {data1 data2}
set_input_delay 3.5 -clock $clk_name cin
set_input_delay 4.5 -clock $clk_name {rst start}
set_output_delay 5.5 -clock $clk_name comp_out
set_max_area 0
# Use compile-once, dont_touch approach for Comparator 
set_dont_touch u12
compile
if {[shell_is_in_xg_mode]==0} {
write -hier -o "${db_path}${design}.db"
} else {
write -format ddc -hier -o "${ddc_path}${design}.ddc"
}
source "${script_path}report.tcl"
