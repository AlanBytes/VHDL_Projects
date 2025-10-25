### Compile Desing
set project_name "reg_mux"
vlib work
vcom reg_mux.vhd
vsim work.reg_mux(reg_mux)

#### Add I/O Signals to wave window
add wave -divider "Simuation by:"
add wave -divider "Alan Bernal"
add wave -divider "9/5/2025"
add wave -divider "Lab #"
add wave -divider "Inputs:"
add wave -binary clk
radix -unsigned
add wave a b c
add wave -divider "Outputs:"
add wave y

#### add stimuli daa
force clk 0 0ns, 1 40ns -r 80ns
force a 2 0ns, 3 80ns
force b 4 0ns, 5 240ns
force sel 0 0ns, 1 160ns, 2 320ns

#### Run the simulation
run 400 ns 
wave zoomfull
configure wave -gridperiod 100ns
configure wave -timelineunits ns