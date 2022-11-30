module data_mem (
    input CLK, w_en,
    input [31:0] A,
    input [31:0] WD,
    output reg [31:0] RD
); 

reg [31:0] mem [0:4095]; // constraining memory right here

always @(posedge CLK) begin
    if (w_en)
        mem[A] <= WD;
    else
        RD <= mem[A];

        
end

endmodule