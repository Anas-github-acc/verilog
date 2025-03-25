module xor_gate_nand(
    input a,
    input b,
    output y
);

    wire nand_out, nand_a, nand_b;
    
    nand(nand_out, a, b);
    nand(nand_a, a, nand_out);
    nand(nand_b, b, nand_out);
    nand(y, nand_a, nand_b);

endmodule
