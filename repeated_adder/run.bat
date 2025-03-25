@echo off
iverilog -o sim.vvp repeated_adder.v repeated_adder_tb.v
vvp sim.vvp
gtkwave repeated_adder_tb.vcd wave.gtkw
