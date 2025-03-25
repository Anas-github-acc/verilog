module ram_3(
    input wire [9:0] addr,    // 10-bit address
    input wire [7:0] data_in, // 8-bit data input
    input wire wr,            // Write enable
    input wire cs,            // Chip select
    input wire rd,            // Read enable
    output reg [7:0] data_out // Output must be reg since assigned in always block
);

    reg [7:0] mem [0:1023]; // Memory array: 1024 x 8-bit


    always @(wr or cs or rd or addr or data_in)
    begin
        if (wr) mem[addr] <= data_in;
        if (rd) data_out <= mem[addr];
    end

endmodule




// module ram_3(
//   data_out,
//   data_in,
//   addr,
//   wr,
//   cs,
//   rd
// );

// parameter addr_size = 10, word_size = 8, memory_size = 1024;
// input [addr_size-1:0] addr;
// input [word_size-1:0] data_in;
// input wr, cs, rd;

// output [word_size-1:0] data_out;
// reg [word_size-1:0] mem [memory_size-1:0];
// assign data_out = mem[addr];
// always @(wr or cs or rd or addr or data_in)
// begin
//   if (wr) mem[addr] <= data_in;
//   if (rd) data_out <= mem[addr];
// end

// endmodule