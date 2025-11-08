## FSM Benchmark
## Alan Bernal
## 11/7/2025
######## Compile design
vlib work
vcom -2008 lab9.vhd
vsim work.fsm_bench(bhv)

########## Add I/O signals to wave window
add wave -divider  "Inputs:"
add wave clk rst input
add wave -divider  "States:"
add wave pr_state nx_state
add wave -divider  "Outputs:"
add wave output
add wave -divider  "Simulation by Alan Bernal"

radix -hex
######### Add stimuli data
force clk 0 0ns, 1 25ns -r 50ns
force rst 1 0ns, 0 50ns
#radix hexadecimal

force input 3C 50ns, 00 100ns, 1F 150ns, 00 200ns, AA 250ns, 00 300ns
 
########## Run the simulation
run 400 ns 
wave zoomfull
configure wave -gridperiod 100ns
configure wave -timelineunits ns