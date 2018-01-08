# Script file for constraining MuxMod 
set rpt_file "muxmod.rpt"
set design "muxmod"
current_design MuxMod
source "${script_path}defaults.tcl"
# Define design environment 
set_load 2.2 Y_IN
set_driving_cell -lib_cell FD1 [all_inputs]
# Define design constraints 
set_input_delay 1.35 -clock $clk_name {D R F UPC}
set_input_delay 2.35 -clock $clk_name MUX_CNT
set_output_delay 5.1 -clock $clk_name {Y_IN}
set_max_area 0
compile
if {[shell_is_in_xg_mode]==0} {
write -hier -o "${db_path}${design}.db"
} else {
write -format ddc -hier -o "${ddc_path}${design}.ddc"
}
source "${script_path}report.tcl"
