`timescale 1ns/1ps
`include "pipeline.v"

module stimuli;
    parameter N = 10;
    
    reg [N-1:0] A, B, C, D;
    reg clk;
    wire [N-1:0] F;
    
    // Instantiate the pipeline module
    pipeline uut (
        .F(F), 
        .A(A), 
        .B(B), 
        .C(C), 
        .D(D), 
        .clk(clk)
    );

    
    initial begin
        $dumpfile("waveform.vcd");  
        $dumpvars(0, stimuli);      // Dump all variables
        $dumpvars(1, uut);          // Dump internal pipeline registers
    end

    
    // Clock generation
    always #5 clk = ~clk;
    
    initial begin
    clk = 0;  
    A = 10; B = 5; C = 8; D = 3; 
    
    #10;
    A = 15; B = 7; C = 12; D = 4;
    
    #10;
    A = 20; B = 10; C = 14; D = 6;
    
    #10;
    A = 25; B = 12; C = 18; D = 8;
    
    #10; 
    $finish;
end

    
    initial begin
        $monitor("Time=%0t A=%d B=%d C=%d D=%d | F=%d", $time, A, B, C, D, F);
    end
endmodule