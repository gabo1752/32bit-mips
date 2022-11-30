module ALU (
    input [3:0] ALU_s,
    input [31:0] a, b,
    output reg [31:0] c,
    output zero
);

assign zero = (c == 32'b0);
always @(*) begin 
    case (ALU_s) 
        0: c = a + b;
        1: c = a - b;
        2: c = a & b;
        3: c = a | b;
        4: c = ~a;
        5: c = (a < b) ? 1 : 0; // check SLT
        6: c = (a > b) ? 1 : 0;
        7: c = (a == b) ? 1 : 0;
        8: c = (a >= b) ? 1 : 0;
        9: c = (a <= b) ? 1 : 0;
        10: c = a << b;
        11: c = a >> b; 
    endcase
end

endmodule