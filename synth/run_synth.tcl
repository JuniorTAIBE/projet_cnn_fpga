set part xc7a35tcpg236-1
file mkdir reports

read_vhdl -vhdl2008 ../rtl/counter8.vhd
read_xdc constraints.xdc

synth_design -top counter8 -part $part
opt_design
place_design
route_design

report_utilization    -file reports/utilization.rpt
report_timing_summary -file reports/timing.rpt
report_power          -file reports/power.rpt