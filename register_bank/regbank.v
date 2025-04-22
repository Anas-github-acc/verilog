module regbank (
    output [31:0] rdata1, rdata2,    // Read data outputs
    input [31:0] wrdata,            // Write data input
    input [4:0] rs1, rs2, dr,       // Register addresses for read (rs1, rs2) and write (dr)
    input write, reset, clock       // Control signals
);
    reg [31:0] regbank1 [0:31];     // 32 registers, each 32 bits
    integer k;

    // Continuous read assignments (combinational)
    assign rdata1 = regbank1[rs1];
    assign rdata2 = regbank1[rs2];

    // Sequential write and reset logic
    always @(posedge clock) begin
        if (reset) begin
            for (k = 0; k < 32; k = k + 1) begin
                regbank1[k] <= 0;
            end
        end
        else if (write) begin
            // Write data to the specified register
            regbank1[dr] <= wrdata;
        end
    end
endmodule