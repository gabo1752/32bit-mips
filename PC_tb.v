`timescale 1ns/1ns
`include "PC.v"

module PC_tb ();
    reg [31:0] PC_Next;
    reg Reset, CLK, w_en;
    wire [31:0] PCResult;

    PC dut (
        .PC_Next     (PC_Next),
        .Reset       (Reset),
        .CLK         (CLK),  
        .w_en        (w_en),
        .PCResult    (PCResult)   
    );

    always #5 CLK = ~CLK;

    initial begin
        CLK = 0; Reset = 0; PC_Next = 32'h123; w_en = 1; #5
        Reset = 0; w_en = 1; #10
        PC_Next = 32'd5; #5

        $display("%0d",PCResult);
        $finish;
    end

endmodule