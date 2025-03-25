module alu_4bit (
    input [1:0] in,
    input [3:0] st,
    output reg [4:0] out
);

always @(*) begin
    if(st == 4'b0000) out = in[0] & in[1];
    else if(st == 4'b0001) out = in[0] | in[1];
    else if(st == 4'b0010) out = in[0] ^ in[1];
    else if(st == 4'b0011) out = in[0] + in[1];
    else if(st == 4'b0100) out = in[0] - in[1];
    else if(st == 4'b0101) out = in[0] * in[1];
    else if(st == 4'b0110) out = in[0] / in[1];
    else if(st == 4'b0111) out = in[0] % in[1];
    else if(st == 4'b1000) out = in[0] << in[1];
    else if(st == 4'b1001) out = in[0] >> in[1];
    else if(st == 4'b1010) out = in[0] >>> in[1];
    else if(st == 4'b1011) out = in[0] <<< in[1];
    else if(st == 4'b1100) out = ~in[0] & in[1];
    else if(st == 4'b1101) out = ~in[0] | in[1];
    else if(st == 4'b1110) out = ~in[0] ^ in[1];
    else if(st == 4'b1111) out = ~in[0] + in[1];
    else out = 2'b00;
    // case (st)
    //     4'b0000: out = in[0] & in[1];
    //     4'b0001: out = in[0] | in[1];
    //     default: out = 1'b0;
    // endcase
end

endmodule
