module bcd(
    input [3:0]in,
    output reg[7:0]o
);
    always @(*) begin
        if (in<=9) begin
            o[7:4] = 4'b0000;
        o[3:0] = in;
        end
    else begin
        o[7:4] = 4'b0001;
        o[3:0] = in - 4'b1010;
    end
    end
endmodule