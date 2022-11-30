module alu_dec (
    input [31:0] instr,
    output reg [3:0] ALUCtrl
);
    wire [5:0] funct = instr [5:0];
    wire [5:0] opcode = instr [31:26];


    always @(instr) begin
        casex ({opcode, funct}) 
            12'b10x011xxxxxx: ALUCtrl = 0; // lw and sw
            12'b000100xxxxxx: ALUCtrl = 1; // beq
            12'b000000100000: ALUCtrl = 0; // add
            12'b000000100010: ALUCtrl = 1; // sub
            12'b000000100100: ALUCtrl = 2; // and
            12'b000000100101: ALUCtrl = 3; // or
            12'b000000101010: ALUCtrl = 5; // slt
            default: ALUCtrl = 0;
        endcase
    end

endmodule