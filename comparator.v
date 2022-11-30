module comparator (
    input [31:0] a, b,
    output eq, neq, lt, lte, gt, gte
);

assign eq = (a == b);
assign neq = (a != b);
assign lt = (a < b);
assign lte = (a <= b);
assign gt = (a > b);
assign gte = (a >= b);

endmodule