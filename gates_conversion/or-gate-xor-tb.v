module or_gate_xor_tb;
    reg a, b;
    wire y;
    
    or_gate_xor uut(
        .a(a),
        .b(b),
        .y(y)
    );
    
    initial begin
        $dumpfile("or_gate_xor_tb.vcd");
        $dumpvars(0, or_gate_xor_tb);
        
        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;
        
        $finish;
    end
    
    initial begin
        $monitor("Time = %0t, a = %b, b = %b, y = %b", $time, a, b, y);
    end
endmodule
