module half_adder_tb (
  input a,
  input b,
  output s,
  output c
);

  reg a;
  reg b;
  wire s;
  wire c;

  half_adder ha(
    .a(a),
    .b(b),
    .s(s),
    .c(c)
  );

  initial begin
    a = 0;
    b = 0;
    #10 a = 1,b = 1;
    #10 a = 0,b = 1;
    #10 a = 1,b = 0;
    #10 a = 1,b = 1;
    #10 $finish;
  end
endmodule