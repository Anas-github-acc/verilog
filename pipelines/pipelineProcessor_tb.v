module simuli;
    reg [3:0] rs1, rs2, rd, func;
    reg [7:0] addr;
    wire [15:0] zout;
    reg clk1, clk2;
    integer k, i;

    pipe pipe_inst (zout, rs1, rs2, rd, func, addr, clk1, clk2);

    // Clock generation (non-overlapping)
    initial begin
        clk1 = 0;
        forever #10 clk1 = ~clk1;
    end
    initial begin
        clk2 = 0;
        forever #10 clk2 = ~clk2;
    end

    // VCD dump
    initial begin
        $dumpfile("pipe.vcd");
        $dumpvars(0, simuli);
    end

    // Initialize register file
    initial begin
        #5;
        for (k = 0; k < 15; k = k + 1) begin
            pipe_inst.regbank[k] = k;
        end
    end

    // Test sequence
    initial begin
        // Initialize inputs
        rs1 = 0; rs2 = 0; rd = 0; func = 0; addr = 0;

        // Reset-like delay
        #20;

        // Test 1: Multiply (6 * 1 = 6 -> reg[10], mem[125])
        rs1 = 6; rs2 = 1; rd = 10; addr = 125; func = 2;
        #40 $display("Test 1: reg[10]=%d (expected 6), mem[125]=%d, zout=%d", pipe_inst.regbank[10], pipe_inst.membank[125], zout);

        // Test 2: Move A (reg[9] = 9 -> reg[12], mem[126])
        rs1 = 9; rs2 = 8; rd = 12; addr = 126; func = 3;
        #40 $display("Test 2: reg[12]=%d (expected 9), mem[126]=%d, zout=%d", pipe_inst.regbank[12], pipe_inst.membank[126], zout);

        // Test 3: Move B (reg[4] = 4 -> reg[13], mem[125])
        rs1 = 2; rs2 = 4; rd = 13; addr = 125; func = 4;
        #40 $display("Test 3: reg[13]=%d (expected 4), mem[125]=%d, zout=%d", pipe_inst.regbank[13], pipe_inst.membank[125], zout);

        #20 $finish;
    end
endmodule