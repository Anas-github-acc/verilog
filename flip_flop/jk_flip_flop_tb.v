`timescale 1ns / 1ps

module jk_flip_flop_tb;

    reg clk;
    reg reset;
    reg j;
    reg k;
    wire q;

    jk_flip_flop uut (
        .clk(clk),
        .reset(reset),
        .j(j),
        .k(k),
        .q(q)
    );
 
    always begin
        #5 clk = ~clk;
    end

    initial begin
        clk = 0;
        j = 0;
        k = 0;
        reset = 0;

        #10 reset = 1;
        #10 reset = 0;
        
        #10 j = 1; k = 0;
        #10 j = 0; k = 1;
        #10 j = 1; k = 1;
        #10 j = 0; k = 0;

        #10 j = 1; k = 0;
        #10 j = 0; k = 1;
        #10 j = 1; k = 1;

        #20 $finish;
    end
    
endmodule