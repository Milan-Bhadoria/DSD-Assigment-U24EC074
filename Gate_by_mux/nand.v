module nand_gate(
  input a,b,
  output reg o
);
    always @(*) begin
        case (b)
           1'b0 : o = 1;
           1'b1 : o = ~a;
           endcase
        
    end
endmodule