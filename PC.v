module PC (
    input       [31:0]  PC_Next,
    input               CLK, Reset
    output reg  [31:0] PCResult
);

always @(posedge CLK) begin
    if (Reset == 1) 
        PCResult <= 32'h0;
    else 
        PCResult <= PC_Next;
end
endmodule