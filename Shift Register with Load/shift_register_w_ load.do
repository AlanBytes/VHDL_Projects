-- Title: Shift Register.do
-- Name: Alan Bernal
-- 10/29/2025
##### Compile design
set project_name "shift_register_w_load"
vlib work
vcom $project_name.vhd
vsim work.${project_name}(mux) -t ns
##### Add I/0 signals to wave window
radix -decimal
add wave -divider "Inputs:"
add wave clk load d din
add wave -divider "Local:"
radix -binary
add wave q
add wave -divider "Outputs:"
add wave dout
add wave -divider "Simulation by: Alan Bernal"
##### Add stimuli data
force clk 0 0ns, 1 50 ns -r 100ns
force load 1 0ns, 0 100 ns
force d 0 0ns, 1 300 ns, 0 700ns

radix -binary
force din(0) 1 0ns
force din(1) 0 0ns
force din(2) 0 0ns
force din(3) 1 0ns

##### Run the simulation 
run 1200ns
wave zoomfull
configure wave -gridperiod 100ns
configure wave -timelineunits ns