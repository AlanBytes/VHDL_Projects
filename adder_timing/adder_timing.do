## Compile desing
set project_name "lab4"
vlib work
vcom $project_name.vho
vsim work.adder_timing -t ns
## Add I/O signals to wave windows
add wave -divider "Inputs:"
add wave clk a b c
add wave -divider "Outputs:"
add wave reg_sum
radix -decimal
add wave -divider "Simulation by: Alan Bernal"
## Add stimuli data
force clk 0 0ns, 1 10ns -r 20ns

force a 2 0ns, 10 20ns, 255 40ns
force b 1 0ns, 12 20ns, 255 40ns
force c 3 0ns, 0 20ns,  255 40ns
## Run the simulation
run 80ns
wave zoomfull
configure wave -gridperiod 80ns
configure wave -timelineunits ns