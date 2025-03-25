`timescale 1ns/1ps
`include "repeated_adder.v"


module repeated_adder_tb;
    // Test bench signals
    reg clk;
    reg reset;
    reg start;
    reg [3:0] A;
    reg [3:0] B;
    wire [7:0] product;
    wire done;

    // Instantiate the repeated_adder
    repeated_adder uut (
        .clk(clk),
        .reset(reset),
        .start(start),
        .A(A),
        .B(B),
        .product(product),
        .done(done)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;
    end

    // Test stimulus
    initial begin
        // Initialize signals
        clk = 0;
        reset = 1;
        start = 0;
        A = 0;
        B = 0;

        // Release reset
        #20;
        reset = 0;
        #10;

        // Test case 1: 3 x 4 = 12
        A = 4'h3;
        B = 4'h4;
        start = 1;
        #10;
        start = 0;
        wait(done);
        if (product === 8'h0C)
            $display("Test case 1 passed: 3 x 4 = %d", product);
        else
            $display("Test case 1 failed: Expected 12, got %d", product);
        #20;

        // Test case 2: 7 x 5 = 35
        A = 4'h7;
        B = 4'h5;
        start = 1;
        #10;
        start = 0;
        wait(done);
        if (product === 8'h23)
            $display("Test case 2 passed: 7 x 5 = %d", product);
        else
            $display("Test case 2 failed: Expected 35, got %d", product);
        #20;

        // Test case 3: 15 x 15 = 225
        A = 4'hF;
        B = 4'hF;
        start = 1;
        #10;
        start = 0;
        wait(done);
        if (product === 8'hE1)
            $display("Test case 3 passed: 15 x 15 = %d", product);
        else
            $display("Test case 3 failed: Expected 225, got %d", product);

        // Add some delay and finish simulation
        #100;
        $display("Simulation completed");
        $finish;
    end

    // Optional: Generate VCD file for waveform viewing
    initial begin
        $dumpfile("repeated_adder_tb.vcd");
        $dumpvars(0, repeated_adder_tb);
    end

endmodule
