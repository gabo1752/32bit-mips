`timescale 1ns/1ns
`include "sign_extend.v"

module sign_extend_tb ();
    reg [15:0] extend;
    wire [31:0] extended;

sign_extend dut (
    .extend (extend),
    .extended (extended)
);


initial begin
    $monitor("t = %0d, extend = %0b, extended = %0b", $time, extend, extended);
    extend = 16'hF234; #5
    $finish;
end


endmodule
