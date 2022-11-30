module main_dec (
    input [31:0] instr,
    input zero,
    output RegWrite, ALUSrc, MemWrite, ResultSrc, Branch, RegDst, MemtoReg //Jump,
);

wire [5:0] opcode;
assign opcode = instr [31:26];

wire [5:0] funct;
assign funct = instr [5:0];

// I and J type instructions
wire is_lw = (opcode == 6'b100011);
wire is_sw = (opcode == 6'b101011);
wire is_beq = (opcode == 6'b000100);

// R-instructions 
wire is_add = (opcode == 6'b000000) & (funct == 6'b100000);
wire is_sub = (opcode == 6'b000000) & (funct == 6'b100010);
wire is_and = (opcode == 6'b000000) & (funct == 6'b100100);
wire is_or =  (opcode == 6'b000000) & (funct == 6'b100101);
wire is_slt = (opcode == 6'b000000) & (funct == 6'b101010);


assign RegWrite = is_lw | (opcode == 6'b000000);
assign ALUSrc = is_lw | is_sw;
assign MemWrite = is_sw;
assign ResultSrc = is_lw;
assign Branch = is_beq; // | jal
assign RegDst = (opcode == 6'b000000);
assign MemtoReg = is_lw;
endmodule