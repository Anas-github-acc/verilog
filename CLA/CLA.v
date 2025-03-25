module CLA(
    input [3:0] A,
    input [3:0] B,
    input Cin,
    output [3:0] Sum,
    output Cout 
);
    wire [3:0] G, P;    // Generate and Propagate signals for each bit
    wire [3:0] C;       // Carry signals for each bit
    
    assign G = A & B;
    assign P = A ^ B;
    
    // Calculate the carry signals using the CLA formula
    assign C[0] = Cin;
    assign C[1] = G[0] | (P[0] & Cin);
    assign C[2] = G[1] | (P[1] & C[1]); 
    assign C[3] = G[2] | (P[2] & C[2]);
    assign Cout = G[3] | (P[3] & C[3]);
    
    assign Sum = P ^ C[3:0];
    
endmodule

