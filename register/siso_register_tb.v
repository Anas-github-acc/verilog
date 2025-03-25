`timescale 1ns / 1ps

module siso_register_tb;
    reg clk;
    reg rst;
    reg din;
    wire dout;

    siso_register uut (
        .clk(clk),
        .rst(rst),
        .din(din),
        .dout(dout)
    );

    always #5 clk = ~clk;


    initial begin
        clk = 0;
        rst = 0;
        din = 0;

        rst = 1;#10;
        rst = 0;

        din = 1;#10;
        din = 0;#10;
        din = 1;#10;
        din = 1;#10;
        din = 0;#10;
        din = 1;#10;

        $stop;
    end

    // initial begin
    //     $monitor("At time %t: din = %b, dout = %b, shift_reg = %b", $time, din, dout, uut.shift_reg);
    // end

endmodule
