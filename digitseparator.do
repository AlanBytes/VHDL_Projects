## Compile desing 
set project_name "digitseparator" 
vlib work 
vcom $project_name.vho 
vsim work.digitseparator -t ns 
## Add I/O signals to wave windows 
add wave -divider "Inputs:" 
add wave abc
add wave -divider "Outputs:" 
add wave ww_a ww_b ww_c
add wave -divider "Simulation by: Alan Bernal" 
## Add stimuli data 
radix unsigned
force abc 000 0ns, 123 100ns, 876 200ns, 999 300ns
## Run the simulation 
run 400 ns 
wave zoomfull 
configure wave -gridperiod 100 ns 
configure wave -timelineunits ns