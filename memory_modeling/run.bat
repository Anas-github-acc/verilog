@echo off
iverilog -o sim.vvp ram_3.v ram_3_tb.v
vvp sim.vvp
gtkwave ram_3_tb.vcd wave.gtkw
