// create the test bench file for the cyclic_lamp module
// print each time we toogle the clock and the light value 
module cyclic_lamp_tb();
  reg clock;
  wire [2:0] light;
  cyclic_lamp uut(clock, light);
  initial begin
    clock = 0;
    #10
    repeat(10) begin
      $display("clock=%b, light=%b", clock, light);
      clock = ~clock;
      #5
    end
    $finish;
  end
endmodule
