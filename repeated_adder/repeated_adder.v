module repeated_adder (
    input clk,         
    input reset, 
    input start,  
    input [3:0] A,  
    input [3:0] B,    
    output reg [7:0] product, 
    output reg done   
);

    localparam IDLE = 1'b0; 
    localparam MULTIPLY = 1'b1;

    reg state;          // Current state
    reg [3:0] A_reg;   // Multiplicand register
    reg [3:0] B_reg;   // Multiplier register
    reg [7:0] prod_reg; // Product register

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            // Reset all registers
            state <= IDLE;
            A_reg <= 4'b0;
            B_reg <= 4'b0;
            prod_reg <= 8'b0;
            done <= 1'b0;
        end else begin
            case (state)
                IDLE: begin
                    done <= 1'b0;
                    if (start) begin
                        A_reg <= A;
                        B_reg <= B;
                        prod_reg <= 8'b0;
                        state <= MULTIPLY;
                    end
                end
                
                MULTIPLY: begin
                    if (B_reg != 0) begin
                        prod_reg <= prod_reg + A_reg;
                        B_reg <= B_reg - 1;
                    end else begin
                        done <= 1'b1;
                        state <= IDLE;
                    end
                end
            endcase
        end
    end

    always @(*) begin
        product = prod_reg;
    end

endmodule