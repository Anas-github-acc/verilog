`include "regbank.v"

module regbank_tb;
    reg [4:0] rs1, rs2, dr;         // Register addresses
    reg clock, write, reset;        // Control signals
    reg [31:0] wrdata;              // Write data
    wire [31:0] rdata1, rdata2;     // Read data
    integer k;

    // Instantiate the register bank
    regbank REG (
        .rdata1(rdata1),
        .rdata2(rdata2),
        .wrdata(wrdata),
        .rs1(rs1),
        .rs2(rs2),
        .dr(dr),
        .write(write),
        .reset(reset),
        .clock(clock)
    );

    // Clock generation (10 time units period, 5 time units per half-cycle)
    initial begin
        clock = 0;
        forever #5 clock = ~clock;
    end

    // VCD dump for waveform
    initial begin
        $dumpfile("testregbank32.vcd");
        $dumpvars(0, regbank_tb);
    end

    // Test sequence
    initial begin
        // Initialize inputs
        reset = 0;
        write = 0;
        rs1 = 0;
        rs2 = 0;
        dr = 0;
        wrdata = 0;

        // Reset the register bank
        #10 reset = 1;
        #10 reset = 0;

        // Write 10*k to each register (k from 0 to 31)
        for (k = 0; k < 32; k = k + 1) begin
            #10 dr = k; wrdata = 10 * k; write = 1;
            #10 write = 0;
        end

        // Read pairs of registers and verify
        for (k = 0; k < 32; k = k + 2) begin
            #10 rs1 = k; rs2 = k + 1;
            #5; // Wait for read data to stabilize
            $display("reg[%2d]=%d (expected %d), reg[%2d]=%d (expected %d)",
                     rs1, rdata1, 10*k,
                     rs2, rdata2, 10*(k+1));
        end

        // End simulation
        #20 $finish;
    end
endmodule