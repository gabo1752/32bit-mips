`timescale 1ns/1ns
`include "ins_mem.v"

module ins_mem_tb();
    reg     [31:0]  addr;
    wire    [31:0]  out;

    ins_mem dut (
        .addr (addr),
        .out (out)
    );

initial begin 
    $monitor("t=%d      addr_in=%d      addr_out=%d \n", $time, addr, out);
    addr = 0; #5
    addr = 2; #5
    addr = 5; #5
    $finish;
end

endmodule
