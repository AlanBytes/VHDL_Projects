## Compile desing
set project_name "array_slices"
vlib work
vcom $project_name.vho
vsim work.${project_name} -t ns
## Add I/O signals to wave windows
add wave -divider "Inputs:"
add wave row column
add wave -divider "Outputs:"
add wave slice1 slice2 slice3 slice4
add wave -divider "Simulation by: Alan Bernal"
## Add stimuli data
force refclk 0 0ns, 1 10ns -r 20ns
force rst 1 0ns, 0 20ns
## Run the simulation
run 300ns
wave zoomfull
configure wave -gridperiod 100ns
configure wave -timelineunits ns