module siso_register (
    input wire clk,
    input wire rst,
    input wire din,
    output wire dout
);
    // 4-bit shift register
    reg [3:0] shift_reg;

    // Shift logic
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            shift_reg <= 4'b0000; // Reset the register
        end else begin
            shift_reg <= {shift_reg[2:0], din}; // Shift left and insert din
        end
    end

    // Output the last bit
    assign dout = shift_reg[3];

endmodule