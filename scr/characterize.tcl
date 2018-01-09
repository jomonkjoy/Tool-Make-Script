# Characterize and write_script for all modules 
current_design ChipLevel
characterize u1
current_design Adder16
write_script > "${script_path}adder16.wtcl"
current_design ChipLevel
characterize u2
current_design CascadeMod
write_script > "${script_path}cascademod.wtcl"
current_design ChipLevel
characterize u3
current_design Comparator
write_script > "${script_path}comp16.wtcl"
current_design ChipLevel
characterize u4
current_design Multiply8x8
write_script > "${script_path}mult8.wtcl"
current_design ChipLevel
characterize u5
current_design Multiply16x16
write_script > "${script_path}mult16.wtcl"
current_design ChipLevel
characterize u6
current_design MuxMod
write_script > "${script_path}muxmod.wtcl"
current_design ChipLevel
characterize u7
current_design PathSegment
echo "current_design PathSegment" > "${script_path}pathseg.wtcl"
echo "group -design mult -cell mult U100" >> "${script_path}pathseg.wtcl"
write_script >> "${script_path}pathseg.wtcl"
