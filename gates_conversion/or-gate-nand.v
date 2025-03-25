module or_gate_nand(
    input a,
    input b,
    output y
);

    wire nand_a, nand_b;
    
    nand(nand_a, a, a);
    nand(nand_b, b, b);
    nand(y, nand_a, nand_b);

endmodule
