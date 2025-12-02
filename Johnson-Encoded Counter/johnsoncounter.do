## Johnson Counter
## Alan Bernal 
## 12/1/2025 
######## Compile design 
vlib work 
vcom -2008 johnsoncounter.vhd 
vsim work.johnsoncounter(bhv) 
 
########## Add I/O signals to wave window 
add wave -divider  "Inputs:" 
add wave clk rst  
add wave -divider  "Outputs:" 
add wave output 
add wave -divider  "Simulation by Alan Bernal" 
 
radix -binary 
######### Add stimuli data 
force clk 0 0ns, 1 50ns -r 100ns  
force rst 1 0ns, 0 70ns 
########## Run the simulation 
run 1200 ns  
wave zoomfull 
configure wave -gridperiod 100ns 
configure wave -timelineunits ns 