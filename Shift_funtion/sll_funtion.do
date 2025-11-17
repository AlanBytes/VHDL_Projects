## Shifter Logical Function
## Alan Bernal
## 11/17/2025
######## Compile design
vlib work
vcom -93 hw9.vhd
vsim work.sll_funtion(shift_logical)

########## Add I/O signals to wave window
add wave -divider  "Inputs:"
radix -decimal
add wave shift 

radix -binary
add wave x 

add wave -divider  "Outputs:"
radix -decimal
add wave y
add wave -divider  "Simulation by Alan Bernal"
######### Add stimuli data
force shift 2 0ns, 4 200ns, 6 400ns, -2 600ns, -4 800ns, -6 1000ns
radix -decimal

force x 24 0ns;
radix -binary
########## Run the simulation
run 1200 ns 
wave zoomfull
configure wave -gridperiod 100ns
configure wave -timelineunits ns