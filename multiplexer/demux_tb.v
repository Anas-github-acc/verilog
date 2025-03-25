`timescale 1ns/1ps
//`include "demux_1to8.v"

module tb_demux_1to8();

reg in;
reg [2:0] sel; 
wire [7:0] out; 

demux_1to8 uut (
    .in(in),
    .sel(sel),
    .out(out)
);

initial begin
    $display("Time\t in\t sel\t out");
    $monitor("%0t\t %b\t %b\t %b", $time, in, sel, out);
    
    in = 1; sel = 3'b000; #10;  
    in = 1; sel = 3'b001; #10; 
    in = 1; sel = 3'b010; #10;
    in = 1; sel = 3'b011; #10;
    in = 1; sel = 3'b100; #10;
    in = 1; sel = 3'b101; #10;
    in = 1; sel = 3'b110; #10;
    in = 1; sel = 3'b111; #10;

    $finish;
end

endmodule
