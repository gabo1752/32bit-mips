`timescale 1ns/1ns
`include "ALU.v"
module ALU_tb ();
    reg [2:0] ALU_s;
    reg [31:0] a, b;
    wire [31:0] c;
    wire c_out;

    ALU dut (
        .ALU_s (ALU_s),
        .a (a),
        .b (b), 
        .c (c), 
        .c_out (c_out)
    );

initial begin 
    $monitor("t = %0d, a = %0d, b = %0d\nc = %0d, c_out = %0d", $time, a, b, c, c_out);
    a = 1; b = 3; ALU_s = 5; #5
    $finish;

end

endmodule