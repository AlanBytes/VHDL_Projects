## Timed FSM.do
## Alan Bernal 
## 12/1/2025 
######## Compile design 
vlib work 
vcom -2008 timedfsm.vhd 
vsim work.timedfsm(bhv) 
 
########## Add I/O signals to wave window 
add wave -divider  "Inputs:" 
add wave rst clk x
add wave -divider  "Inputs:" 
add wave T1 T2 count pr_state
add wave -divider  "Outputs:" 
add wave y 
add wave -divider  "Simulation by Alan Bernal" 
 
radix -decimal 
######### Add stimuli data 
force clk 0 0ns, 1 50ns -r 100ns  
force rst 1 0ns, 0 25ns 
force x 0 0ns, 1 200ns, 0 400ns, 1 600ns, 0 950ns 
########## Run the simulation 
run 1600 ns  
wave zoomfull 
configure wave -gridperiod 100ns 
configure wave -timelineunits ns 