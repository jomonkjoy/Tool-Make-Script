# Initial compile with estimated constraints
source "${script_path}initial_compile.tcl"
current_design ChipLevel
if {[shell_is_in_xg_mode]==0} {
write -hier -o "${db_path}ChipLevel_init.db"
} else {
write -format ddc -hier -o "${ddc_path}ChipLevel_init.ddc"
}
# Characterize and write_script for all modules 
source "${script_path}characterize.tcl"
# Recompile all modules using write_script constraints 
remove_design -all
source "${script_path}recompile.tcl"
current_design ChipLevel
if {[shell_is_in_xg_mode]==0} {
write -hier -out "${db_path}ChipLevel_final.db"
} else {
write -format ddc -hier -out "${ddc_path}ChipLevel_final.ddc"
}
