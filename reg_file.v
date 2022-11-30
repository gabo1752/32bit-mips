module reg_file (
    // 32 registers available on register file
    // A1 read port -> RD1 read output
    // A2 read port -> RD2 read output
    // A3 write port (WD3 -> A3) if WE3
    input              CLK, w_en,
    input          [4:0]  A1, A2, A3,
    input          [31:0] WD3,
    output     reg [31:0] RD1, RD2
); 

reg     [31:0] mem [0:31];
// integer i;

// initial begin 
//     for (i = 0; i < 32; i = i + 1)
//         mem[i] = 32'd0;
//     mem[3] = 32'd43223;
//     mem[4] = 32'd31415;
//     mem[25] = 32'd4324;
// end

always @(posedge CLK) begin
    RD1 <= mem[A1];
    RD2 <= mem[A2];
    if (w_en)
        mem[A3] <= WD3;
end

endmodule