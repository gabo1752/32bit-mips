module ins_mem (
    input       [31:0]    addr,
    output      [31:0]    out
);

reg     [31:0]  mem [0:1023]; // 1 kB of memory for the instruction memory

integer i;
initial begin
    // initialize default values with 0's
    for (i = 0; i < 1024; i = i + 1)
        mem [i] = 32'h0;
    // change non-default values
    mem[4] = 32'd32;
    mem[5] = 32'd456;
end

assign out = mem [addr];


endmodule