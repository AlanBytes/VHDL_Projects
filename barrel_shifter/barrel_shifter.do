## Compile desing  
set project_name "hw6"  
vlib work  
vcom $project_name.vho  
vsim work.hw6 -t ns  

## Add I/O signals to wave windows  
add wave -divider "Inputs:"  
add wave -noupdate -format Logic -radix decimal shift
add wave -noupdate -format Logic -radix HEX x
add wave -divider "Outputs:"  
add wave -noupdate -format Logic -radix HEX ww_y 
add wave -divider "Simulation by: Alan Bernal"  

## Add stimuli data  
force shift 0 0ns, 1 100ns, 6 200ns, 7 300ns, 8 400ns, 0 500ns, -1 600ns, -6 700ns, -7 800ns, -8 900ns
force x 0x0F 0ns, 0xF0 500ns

## Run the simulation  
run 1000 ns 
wave zoomfull  
configure wave -gridperiod 10ns  
configure wave -timelineunits ns