module cyclic_lamp(clock, light);
  input clock;
  output reg [2:0] light; //light is a vector
  parameter s0=2'b00, s1=2'b01, s2=2'b10; // parameter declaration as constant
  parameter RED=3'b100, GREEN=3'b010, YELLOW=3'b001;
  reg[1:0] state; //state as two bit variable
  reg[27:0] count=0;
  reg clock_out;
  always@( posedge clock )
    begin
      count<=count+1;
      if (count==100000000)
      begin count<=0;
        clock_out=~clock_out;
      end
    end
  always@(posedge clock_out )
    case (state)
      s0: state<=s1;
      s1: state<=s2;
      s2: state<=s0;
      default: state<=s0;
    endcase
  always@(state)
    case(state)
      s0: light=RED;
      s1: light=GREEN;
      s2: light=YELLOW;
      default light=RED;
  endcase
endmodule