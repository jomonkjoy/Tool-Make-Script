# Script file for constraining Multiply16x16 
set rpt_file "mult16.rpt"
set design "mult16"
current_design Multiply16x16
source "${script_path}defaults.tcl"
# Define design environment 
set_load 2.2 res
set_driving_cell -lib_cell FD1 [all_inputs]
set_drive 0 $clk_name
# Define design constraints 
set_input_delay 1.35 -clock $clk_name {op1 op2}
set_max_area 0
# Define multicycle path for multiplier 
set_multicycle_path 2 -from [all_inputs] -to [all_registers -data_pins -edge_triggered]
# Ungroup DesignWare parts 
set designware_cells [get_cells -filter "@is_oper==true"]
if {[sizeof_collection $designware_cells] > 0} {
   set_ungroup $designware_cells true
}
compile
if {[shell_is_in_xg_mode]==0} {
write -hier -o "${db_path}${design}.db"
} else {
write -format ddc -hier -o "${ddc_path}${design}.ddc"
}
source "${script_path}report.tcl"
report_timing_requirements -ignore >> "${log_path}${rpt_file}"
