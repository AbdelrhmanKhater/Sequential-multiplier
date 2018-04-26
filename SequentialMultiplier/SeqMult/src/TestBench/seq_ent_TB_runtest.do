SetActiveLib -work
comp -include "$DSN\src\Sequential.vhd" 
comp -include "$DSN\src\TestBench\seq_ent_TB.vhd" 
asim TESTBENCH_FOR_seq_ent 
wave 
wave -noreg m
wave -noreg q
wave -noreg prod
wave -noreg clk
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$DSN\src\TestBench\seq_ent_TB_tim_cfg.vhd" 
# asim TIMING_FOR_seq_ent 
