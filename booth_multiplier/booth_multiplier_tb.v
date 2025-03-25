`timescale 1ns/1ps
`include "booth_multiplier/booth_multiplier.v"


module booth_multiplier_tb;
  reg clk, rst, start;
  reg signed [3:0] X, Y;
  wire signed [7:0] Z;
  wire valid;
  
  booth_multiplier uut (
    .clk(clk),
    .rst(rst),
    .start(start),
    .X(X),
    .Y(Y),
    .valid(valid),
    .Z(Z)
  );
  
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  
  initial begin
    rst = 0;
    start = 0;
    X = 0;
    Y = 0;
    #10 rst = 1;
    
    // Test case 1: 2 x 3
    #10 X = 4'd2; Y = 4'd3; start = 1;
    #10 start = 0;
    @(posedge valid);
    $display("Test case 1: 2 x 3 = %d", Z);

    
    // Test case 2: -3 x 4
    #10 X = -4'd3; Y = 4'd4; start = 1;
    #10 start = 0;
    @(posedge valid);
    $display("Test case 2: -3 x 4 = %d", Z);
    
    // Test case 3: -2 x -2
    #10 X = -4'd2; Y = -4'd2; start = 1;
    #10 start = 0;
    @(posedge valid);
    $display("Test case 3: -2 x -2 = %d", Z);
    
    #20 $finish;
  end
  // print only test cases
  
  // initial begin
  //   $monitor("Time=%0t rst=%b start=%b X=%d Y=%d valid=%b Z=%d",
  //        $time, rst, start, X, Y, valid, Z);
  // end
endmodule

// module booth_multiplier_tb;

//     reg clk;
//     reg rst;
//     reg start;
//     reg [7:0] X;
//     reg [3:0] Y;
//     wire [7:0] Z;
//     wire valid;

//     // Instantiate the Unit Under Test (UUT)
//     booth_multiplier uut (
//         .clk(clk),
//         .rst(rst),
//         .start(start),
//         .X(X),
//         .Y(Y),
//         .Z(Z),
//         .valid(valid)
//     );

//     // Clock generation
//     initial begin
//         clk = 0;
//         forever #5 clk = ~clk;
//     end

//     initial begin
//         rst = 1; start = 0; X = 8'b0; Y = 4'b0; #100;
//         rst = 0; start = 1; X = 8'b10101010; Y = 4'b1010; #100;
//         start = 0; #100;
//         if (Z !== 8'b0) $display("Test case 1 failed");
//         if (valid !== 0) $display("Test case 1 failed");
//         start = 1; X = 8'b10101010; Y = 4'b1010; #100;
//         start = 0; #100;
//         if (Z !== 8'b0) $display("Test case 2 failed");
//         if (valid !== 0) $display("Test case 2 failed");
//         start = 1; X = 8'b10101010; Y = 4'b1010; #100;
//         start = 0; #100;
//         if (Z !== 8'b0) $display("Test case 3 failed");
//         if (valid !== 0) $display("Test case 3 failed");
//         start = 1; X = 8'b10101010; Y = 4'b1010; #100;
//         start = 0; #100;
//         if (Z !== 8'b0) $display("Test case 4 failed");
//         if (valid !== 0) $display("Test case 4 failed");
//         start = 1; X = 8'b10101010; Y = 4'b1010; #100;
//         start = 0; #100;
//         if (Z !== 8'b0) $display("Test case 5 failed");
//         if (valid !== 0) $display("Test case 5 failed");
//         start = 1; X = 8'b10101010; Y = 4'b1010; #100;
//         start = 0; #100;
//         if (Z !== 8'b0) $display("Test case 6 failed");
//         if (valid !== 0) $display("Test case 6 failed");
//         start = 1; X = 8'b10101010; Y = 4'b1010; #100;
//         start = 0; #100;
//         if (Z !== 8'b0) $display("Test case 7 failed");
//         if (valid !== 0) $display("Test case 7 failed");
//         start = 1; X = 8'b10101010; Y = 4'b1010; #100;
//         start = 0; #100;
//         if (Z !== 8'b0) $display("Test case 8 failed");
//         if (valid !== 0) $display("Test case 8 failed");
//         start = 1; X = 8'b10101010; Y = 4'b1010; #100;
//         start = 0; #100;
//         if (Z !== 8'b0) $display("Test case 9 failed");
//         if (valid !== 0) $display("Test case 9 failed");
//         start = 1; X = 8'b10101010; Y = 4'b1010; #100;
//         start = 0; #100;
//         if (Z !== 8'b0) $display("Test case 10 failed");
//         if (valid !== 0) $display("Test case 10 failed");

//         // End simulation
//         #100;

//         $display("Simulation completed");
//         $finish;
//     end


// endmodule
// ```