module tb_mux_8to1;

reg [7:0] in;       // 8-bit input
reg [2:0] sel;      // 3-bit select line
wire out;           // 1-bit output

mux_8to1 DUT (
    .in(in),
    .sel(sel),
    .out(out)
);

initial begin
    in = 8'b00000001; sel = 3'b000;
    #10;
    in = 8'b00000010; sel = 3'b001;
    #10;
    in = 8'b00000100; sel = 3'b010;
    #10;
    in = 8'b00001000; sel = 3'b011;
    #10;
    in = 8'b00010000; sel = 3'b100;
    #10;
    in = 8'b00100000; sel = 3'b101;
    #10;
    in = 8'b01000000; sel = 3'b110;
    #10
    in = 8'b10000000; sel = 3'b111;
    #10;
    $finish;
end
initial begin
    $monitor("Time = %0t | in = %b | sel = %b | out = %b", $time, in, sel, out);
end

endmodule
