module and_gate_xor(
    input a,
    input b,
    output y
);

    wire xor_out, not_xor_out;
    
    xor(xor_out, a, b);
    xor(not_xor_out, xor_out, 1'b1);
    xor(y, not_xor_out, 1'b1);

endmodule
