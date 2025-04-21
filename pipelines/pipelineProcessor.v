module PipelineProcessor (
    input clk, reset,
    input [4:0] rs1, rs2, rd,
    input [3:0] func,
    input [31:0] addr,
    output [31:0] mem_out
);

    // Register File
    reg [31:0] register_file [0:31];

    // initial begin
    //     register_file[0] = 32'h00000001;
    //     register_file[1] = 32'h00000002;
    //     register_file[2] = 32'h00000003;
    //     register_file[3] = 32'h00000004;
    //     register_file[4] = 32'h00000005;
    //     register_file[5] = 32'h00000006;
    //     register_file[6] = 32'h00000007;
    //     register_file[7] = 32'h00000008;
    //     register_file[8] = 32'h00000009;
    //     register_file[9] = 32'h0000000A;
    //     $display("Register file initialized");
    // end

    // Pipeline Registers
    reg [31:0] A_EX, B_EX, ALU_OUT_MEM, MEM_OUT;
    reg [4:0] RD_EX, RD_MEM;
    reg [31:0] ADDR_EX, ADDR_MEM;
    reg [3:0] FUNC_EX;

    // Stage 1: Fetch & Decode
    always @(posedge clk) begin
        if (reset) begin
            A_EX <= 0;
            B_EX <= 0;
            RD_EX <= 0;
            FUNC_EX <= 0;
            ADDR_EX <= 0;
        end else begin
            A_EX <= register_file[rs1];
            B_EX <= register_file[rs2];
            RD_EX <= rd;
            FUNC_EX <= func;
            ADDR_EX <= addr;
        end
    end

    // Stage 2: Execute
    reg [31:0] alu_result;
    always @(posedge clk) begin
        if (reset) begin
            ALU_OUT_MEM <= 0;
            RD_MEM <= 0;
            ADDR_MEM <= 0;
        end else begin
            case (FUNC_EX)
                4'b0000: alu_result = A_EX + B_EX;
                4'b0001: alu_result = A_EX - B_EX;
                4'b0010: alu_result = A_EX & B_EX;
                4'b0011: alu_result = A_EX | B_EX;
                default: alu_result = 0;
            endcase
            ALU_OUT_MEM <= alu_result;
            RD_MEM <= RD_EX;
            ADDR_MEM <= ADDR_EX;
        end
    end

    // Stage 3: Write Back (and Memory Output)
    always @(posedge clk) begin
        if (reset) begin
            MEM_OUT <= 0;
        end else begin
            if (RD_MEM != 0)
                register_file[RD_MEM] <= ALU_OUT_MEM;
            MEM_OUT <= ALU_OUT_MEM; // Output to memory (no memory array here)
        end
    end

    assign mem_out = MEM_OUT;

endmodule