`include "nand_gate.v"

module test(
    input a,
    input b,
    input c, 
    output reg [1:0] out
);

wire t1, t2, t3, t4, t5, t6, t7;

always @(*) begin
    nand_gate n1 (.a(a), .b(b), .y(t1));
    nand_gate n2 (.a(a), .b(t1), .y(t2));
    nand_gate n3 (.a(b), .b(t1), .y(t3));
    nand_gate n4 (.a(t2), .b(t3), .y(t4));
    nand_gate n5 (.a(c), .b(t4), .y(t5));
    nand_gate n6 (.a(t4), .b(t5), .y(t6));
    nand_gate n7 (.a(c), .b(t5), .y(t7));
    nand_gate n8 (.a(t1), .b(t6), .y(out[1]));
    nand_gate n9 (.a(c), .b(t7), .y(out[0]));
end

// reg t1, t2, t3, t4, t5, t6, t7;
// always @(*) begin
//     t1 = ~(a & b);
//     t2 = ~(a & t1);
//     t3 = ~(b & t1);
//     t4 = ~(t2 & t3);
//     t5 = ~(c & t4);
//     t6 = ~(t4 & t5);
//     t7 = ~(c & t5);
//     out[1] = !(t1 & t6);
//     out[0] = !(c & t7);
// end

endmodule
