`timescale 1ns/1ps
`include "alu_4bit.v"

module alu_4bit_tb();
    reg [1:0] in;
    reg [3:0] st;
    wire [4:0] out;

    alu_4bit uut (
        .in(in),
        .st(st),
        .out(out)
    );

    initial begin
        in = 2'b00;
        st = 4'b0000;
        #10;
        in = 2'b01;
        st = 4'b0001;
        #10;
        in = 2'b10;
        st = 4'b0010;
        #10;
        in = 2'b11;
        st = 4'b0011;
        #10;
        in = 2'b00;
        st = 4'b0100;
        #10;
        in = 2'b01;
        st = 4'b0101;
        #10;
        in = 2'b10;
        st = 4'b0110;
        #10;
        in = 2'b11;
        st = 4'b0111;
        #10;
        in = 2'b00;
        st = 4'b1000;
        #10;
        in = 2'b01;
        st = 4'b1001;
        #10;
        in = 2'b10;
        st = 4'b1010;
        #10;
        in = 2'b11;
        st = 4'b1011;
        #10;
        in = 2'b00;
        st = 4'b1100;
        #10;
        in = 2'b01;
        st = 4'b1101;
        #10;
        in = 2'b10;
        st = 4'b1110;
        #10;
        in = 2'b11;
        st = 4'b1111;
        #10;
        $finish;
    end
    initial begin
      $monitor("Time = %0t | in = %b | st = %b | out = %b", $time, in, st, out);
    end

endmodule