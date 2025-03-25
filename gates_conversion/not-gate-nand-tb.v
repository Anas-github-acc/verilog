module not_gate_nand_tb;
    reg a;
    wire y;
    
    not_gate_nand uut(
        .a(a),
        .y(y)
    );
    
    initial begin
        $dumpfile("not_gate_nand_tb.vcd");
        $dumpvars(0, not_gate_nand_tb);
        
        a = 0; #10;
        a = 1; #10;
        
        $finish;
    end
    
    initial begin
        $monitor("Time = %0t, a = %b, y = %b", $time, a, y);
    end
endmodule
