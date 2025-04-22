module pipe (
    output [15:0] zout,
    input [3:0] rs1, rs2, rd,
    input clk1, clk2,
    input [3:0] func,
    input [7:0] addr
);
    reg [15:0] l1a, l1b, l2z, l3z;
    reg [7:0] l1add, l2add, l3add;
    reg [3:0] l1func, l1rd, l2rd;
    reg [15:0] regbank [0:15];
    reg [15:0] membank [0:255];

    assign zout = l3z;

    // Stage 1: Fetch/Decode (clk1)
    always @(posedge clk1) begin
        l1a <= regbank[rs1];
        l1b <= regbank[rs2];
        l1func <= func;
        l1rd <= rd;
        l1add <= addr;
    end

    // Stage 2: Execute (clk2)
    always @(posedge clk2) begin
        case (l1func)
            0: l2z <= l1a + l1b;
            1: l2z <= l1a - l1b;
            2: l2z <= l1a * l1b;
            3: l2z <= l1a;
            4: l2z <= l1b;
            5: l2z <= l1a & l1b;
            6: l2z <= l1a | l1b;
            7: l2z <= l1a ^ l1b;
            8: l2z <= ~l1a;
            9: l2z <= ~l1b;
            10: l2z <= l1a >> 1;
            11: l2z <= l1b << 1;
            default: l2z <= 0;
        endcase
        l2rd <= l1rd;
        l2add <= l1add;
    end

    // Stage 3: Destination Register/Write Back to Register (clk1)
    always @(posedge clk1) begin
        regbank[l2rd] <= l2z;
        l3z <= l2z;
        l3add <= l2add;
    end

    // Stage 4: Write Back to Memory (clk2)
    always @(posedge clk2) begin
        membank[l3add] <= l3z;
    end
endmodule