`timescale 1ns / 1ps

module d_flip_flop_tb;

    reg clk;
    reg reset;
    reg d;
    wire q; // output

    // Instantiate the Unit Under Test (UUT)
    d_flip_flop uut (
        .clk(clk),
        .reset(reset),
        .d(d),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    initial begin
        reset = 1;d = 0;#100;
        reset = 0;d = 1;#10;
        if (q !== 1) $display("Test case 1 failed");
        d = 0;#10;
        if (q !== 0) $display("Test case 2 failed");

        // Test case 3: Toggle D
        repeat (5) begin
            d = ~d;
            #10;
            if (q !== d) $display("Test case 3 failed at time %t", $time);
        end

        // Test case 4: Reset
        reset = 1;
        #10;
        if (q !== 0) $display("Test case 4 failed");

        // End simulation
        #100;
        $display("Simulation completed");
        $finish;
    end

    // Optional: Waveform generation
    initial begin
        $dumpfile("d_flip_flop_tb.vcd");
        $dumpvars(0, d_flip_flop_tb);
    end

endmodule