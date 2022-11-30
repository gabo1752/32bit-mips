module mux2x1 (
    input   [31:0] a, b,
    input   s,
    output  [31:0] y
); 

assign y =  (s) ? a : b;

endmodule