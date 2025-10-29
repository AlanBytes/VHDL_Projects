-- Title: Registrered Multiplexer
-- Name: Alan Bernal
-- 10/29/2025

##### Compile design
set project_name "hw7"
vlib work
vcom $project_name.vhd
vsim work.${project_name}(mux) -t ns

##### Add I/0 signals to wave window
radix -decimal
add wave -divider "Inputs:"
add wave clk x sel
add wave -divider "Outputs:"
add wave y
add wave -divider "Simulation by: Alan Bernal"

##### Add stimuli data
force clk 0 0ns, 1 50 ns -r 100ns

radix -unsigned
force sel 0 0ns, 1 100ns, 2 200ns, 3 300ns

radix -decimal
force x(0) 1 0ns
force x(1) 2 0ns
force x(2) 3 0ns
force x(3) 4 0ns

##### Run the simulation 
run 400ns
wave zoomfull
configure wave -gridperiod 100ns
configure wave -timelineunits ns