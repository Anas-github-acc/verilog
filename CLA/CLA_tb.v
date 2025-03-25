`timescale 1ns / 1ps
`include "OCLA.v"

module CLA_tb;
    reg [3:0] A;
    reg [3:0] B;
    reg Cin;
    wire [3:0] Sum;
    wire Cout;
    
    OCLA uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );
    
    initial begin
        A = 4'b0000;
        B = 4'b0000;
        Cin = 1'b0;
        #10;
        
        A = 4'b0001;
        B = 4'b0001;
        Cin = 1'b0;
        #10;
        
        A = 4'b0001;
        B = 4'b0001;
        Cin = 1'b1;
        #10;
        
        A = 4'b1111;
        B = 4'b1111;
        Cin = 1'b0;
        #10;
        
        A = 4'b1111;
        B = 4'b1111;
        Cin = 1'b1;
        #10;
        
        $finish;
    end
    initial begin
      $monitor("A=%b, B=%b, Cin=%b, Sum=%b, Cout=%b", A, B, Cin, Sum, Cout);
    end
endmodule