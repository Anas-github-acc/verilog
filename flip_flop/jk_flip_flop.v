 module jk_flip_flop (
    input clk,
    input reset,
    input j,
    input k,
    output q
);
  
      reg q;
  
      always @(posedge clk or posedge reset) begin
          if (reset) begin
              q <= 0;
          end else begin
              if (j & ~k) begin
                  q <= 1;
              end else if (~j & k) begin
                  q <= 0;
              end else if (j & k) begin
                  q <= ~q;
              end
          end
      end

endmodule