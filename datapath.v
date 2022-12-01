// include

module datapath (
    input CLK, RegWrite, ALUSrc, MemWrite, ResultSrc, PCSrc, RegDst, Reset, MemtoReg,
    output [31:0] result_reg 
);

/* | Idea for result reg for testing assignment |
module RF ()
wire [31:0] result_reg;
assign result_reg = output_port_value [31:0];

*/

wire [31:0] ins_addr;
wire [31:0] next_PC;
wire [31:0] PCBranch;
wire [31:0] PCPlus4;
wire [31:0] Instr;
wire [31:0] WriteReg;

wire [4:0] ALUCtrl;
wire [31:0] SrcA;
wire [31:0] SrcB;
wire [31:0] SignImm;
wire [31:0] ALUResult;
wire Zero;

wire [31:0] WriteData;
wire [31:0] ReadData;
wire [31:0] Result;

assign PCPlus4 = ins_addr + 4;
assign PCBranch = PCPlus4 + (SignImm << 2);
assign next_PC = PCSrc ? PCBranch : PCPlus4;
assign WriteReg = RegDst ? Instr [15:11] : Instr [20:16];
assign SrcB = ALUSrc ? SignImm : WriteData;
assign Result = MemtoReg ? ReadData : ALUResult;

PC pc (
    .PC_Next(next_PC),
    .CLK (CLK),
    .Reset (Reset),
    .PCResult (ins_addr)
);

ins_mem imem (
    .addr(ins_addr),
    .out(Instr)
);

reg_file rf (
    .CLK (CLK),
    .w_en (RegWrite),
    .A1 (Instr [25:21]),
    .A2 (Instr [20:16]),
    .A3 (WriteReg),
    .WD3 (Result),
    .RD1 (SrcA),
    .RD2 (WriteData)
);

alu_dec ALU (
    .instr (Instr),
    .AluCtrl (ALUCtrl)
);

sign_extend extend (
    .extend (Instr [15:0]),
    .extended (SignImm)
);

ALU alu (
    .ALU_s (ALUCtrl),
    .a (SrcA),
    .b(SrcB),
    .c(ALUResult),
    .zero(Zero)
);

data_mem data_memory (
    .CLK (CLK),
    .A (ALUResult),
    .WD (WriteData),
    .RD (ReadData)
);




endmodule