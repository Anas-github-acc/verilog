`timescale 1ns / 1ps
`include "pipelineProcessor.v"

module PipelineProcessor_tb;
    reg clk, clk2, reset;
    reg [4:0] rs1, rs2, rd;
    reg [3:0] func;
    reg [31:0] addr;
    wire [31:0] mem_out;

    // Instantiate the Pipeline Processor
    PipelineProcessor uut (
        .clk(clk),
        .reset(reset),
        .rs1(rs1),
        .rs2(rs2),
        .rd(rd),
        .func(func),
        .addr(addr),
        .mem_out(mem_out)
    );

    // initial begin
    //     $dumpfile("waveform.vcd");  
    //     $dumpvars(0, PipelineProcessor_tb);
    //     $dumpvars(1, uut);
    // end

    always #5 clk = ~clk; // Clock toggles every 5ns (Period = 10ns)

    initial begin
        // Initialize signals
        clk = 0; reset = 1;
        rs1 = 0; rs2 = 0; rd = 0; func = 4'b0000; addr = 0;
        #10 reset = 0;

        #10 rs1 = 5; rs2 = 6; rd = 10; func = 4'b0000; addr = 32'h1000;
        
        // #20 rs1 = 3; rs2 = 4; rd = 11; func = 4'b0001; addr = 32'h1004;
        
        // #20 rs1 = 7; rs2 = 8; rd = 12; func = 4'b0010; addr = 32'h1008;
        
        // #20 rs1 = 9; rs2 = 10; rd = 13; func = 4'b0011; addr = 32'h100C;
        
        #50 $stop;
        $finish;
    end

    initial begin
        $monitor("Time = %0t | clk1 = %b | rs1 = %d | rs2 = %d | func = %b | mem_out = %d",
              $time, clk, rs1, rs2, func, mem_out);

    end

endmodule
