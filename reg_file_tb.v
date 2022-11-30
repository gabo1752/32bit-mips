`timescale 1ns/1ns
`include "reg_file.v"

module reg_file_tb();
    reg CLK, w_en;
    reg [4:0] A1;
    reg [4:0] A2;
    reg [4:0] A3;
    reg [31:0] WD3;
    wire [31:0] RD1;
    wire [31:0] RD2;

reg_file dut (
    .CLK (CLK),
    .w_en (w_en),
    .A1 (A1),
    .A2 (A2), 
    .A3 (A3),
    .WD3 (WD3),
    .RD1 (RD1),
    .RD2 (RD2)
);

always #5 CLK = ~CLK;

initial begin
    $monitor("t = %d, RD1 = %d, RD2 = %d", $time, RD1, RD2);
    CLK = 0; w_en = 0; #5
    A1 = 3; A2 = 25; #5
    $finish;
    

end

endmodule