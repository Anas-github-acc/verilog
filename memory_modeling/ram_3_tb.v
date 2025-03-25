`timescale 1ns/1ps
`include "ram_3.v"

module ram_3_tb;
    // Test bench signals
    reg [9:0] addr;
    reg [7:0] data_in;
    reg wr, cs, rd;
    wire [7:0] data_out;
    integer k, seed;
    
    
    // Instantiate RAM
    ram_3 uut (
        .addr(addr),
        .data_in(data_in),
        .wr(wr),
        .cs(cs),
        .rd(rd),
        .data_out(data_out)
    );
    

    initial begin
        for (k=0; k<=1024; k=k+1) begin
            #2 data_in=(k+k)%256; wr=1; cs=1;
            addr=k; wr=1; cs=0;
        end
        repeat(20)
        begin
            #2 addr=$random(seed)%1024;
            wr=0;
            #5 rd=1;
            $display("addr=%d, data_out=%d", addr, data_out);
        end
    end

    initial seed=20;

endmodule
