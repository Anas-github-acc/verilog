module not_gate_nand(
    input a,
    output y
);

    nand(y, a, a);

endmodule
