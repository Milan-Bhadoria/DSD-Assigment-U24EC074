module FA (
   input a,b,cin,
   output sum,cout
);
    assign sum = (a^b)^cin;
    assign cout = (a^b)&cin | a&b;
endmodule

module HA (
    input c,d,
    output sum,cout
);
    assign sum = c^d;
    assign cout = c & d;
endmodule

module multi_8(
   input [7:0]a,
   input [7:0]b,
   output [15:0]o
);
    wire p[0:7][0:7];
    wire [35:0]ps;
    wire [49:0]c;
 
  genvar i,j;
  generate
    for (i=0;i<8;i=i+1) begin
        for (j=0;j<8;j=j+1) begin
          assign  p[i][j] = a[j] & b[i];
        end
    end
      endgenerate
  assign o[0] = p[0][0];
   HA i1(.c(p[1][0]), .d(p[0][1]), .sum(o[1]), .cout(c[0]));
   FA i2(.a(p[2][0]), .b(p[1][1]), .cin(c[0]), .sum(ps[0]), .cout(c[1]));
   FA i3(.a(ps[0]), .b(p[0][2]), .cin(c[1]), .sum(o[2]), .cout(c[2]));
   FA i4(.a(p[3][0]), .b(p[2][1]), .cin(c[2]), .sum(ps[1]), .cout(c[3]));
   FA i5(.a(ps[1]), .b(p[1][2]), .cin(c[3]), .sum(ps[2]), .cout(c[4]));
   FA i37(.a(ps[2]), .b(p[0][3]), .cin(c[4]), .sum(o[3]), .cout(c[5]));
   FA i6(.a(p[4][0]), .b(p[3][1]), .cin(c[5]), .sum(ps[3]), .cout(c[6]));
   FA i7(.a(ps[3]), .b(p[2][2]), .cin(c[6]), .sum(ps[4]), .cout(c[7]));
   FA i8(.a(ps[4]), .b(p[1][3]), .cin(c[7]), .sum(ps[5]), .cout(c[8]));
   FA i9(.a(ps[5]), .b(p[0][4]), .cin(c[8]), .sum(o[4]), .cout(c[9]));
   FA i10(.a(p[5][0]), .b(p[4][1]), .cin(c[9]), .sum(ps[6]), .cout(c[10]));
   FA i11(.a(ps[6]), .b(p[3][2]), .cin(c[10]), .sum(ps[7]), .cout(c[11]));
   FA i12(.a(ps[7]), .b(p[2][3]), .cin(c[11]), .sum(ps[8]), .cout(c[12]));
   FA i13(.a(ps[8]), .b(p[1][4]), .cin(c[12]), .sum(ps[9]), .cout(c[13]));
   FA i14(.a(ps[9]), .b(p[0][5]), .cin(c[13]), .sum(o[5]), .cout(c[14]));
   FA i15(.a(p[6][0]), .b(p[5][1]), .cin(c[14]), .sum(ps[10]), .cout(c[15]));
genvar n;
  generate
    for (n=0;n<4;n=n+1) begin : first
      FA i16(.a(ps[n+10]), .b(p[4-n][n+2]), .cin(c[n+15]), .sum(ps[n+11]), .cout(c[n+16]));
   end
  endgenerate
   FA i17(.a(ps[14]), .b(p[0][6]), .cin(c[19]), .sum(o[6]), .cout(c[20]));
   FA i18(.a(p[7][0]), .b(p[6][1]), .cin(c[20]), .sum(ps[15]), .cout(c[21]));
  
  genvar k;
  generate
    for (k=0;k<5;k=k+1) begin : second
    FA i38(.a(ps[k+15]), .b(p[5-k][k+2]), .cin(c[k+21]), .sum(ps[k+16]), .cout(c[k+22]));
   end
  endgenerate
   FA i19(.a(ps[20]), .b(p[0][7]), .cin(c[26]), .sum(o[7]), .cout(c[27]));
   FA i20(.a(p[7][1]), .b(p[6][2]), .cin(c[27]), .sum(ps[21]), .cout(c[28]));
  genvar l;
  generate 
    for (l=0;l<4;l=l+1) begin : third
    FA i21(.a(ps[l+21]), .b(p[5-l][l+3]), .cin(c[l+28]), .sum(ps[l+22]), .cout(c[l+29]));
   end
  endgenerate
   FA i22(.a(ps[25]), .b(p[1][7]), .cin(c[32]), .sum(o[8]), .cout(c[33]));
   FA i23(.a(p[7][2]), .b(p[6][3]), .cin(c[33]), .sum(ps[26]), .cout(c[34]));
  genvar m;
  generate
    for(m=0;m<3;m=m+1)begin : fourth
    FA i24(.a(ps[m+26]), .b(p[5-m][m+4]), .cin(c[m+34]), .sum(ps[m+27]), .cout(c[m+35]));
    end
     endgenerate
   FA i25(.a(ps[29]), .b(p[2][7]), .cin(c[37]), .sum(o[9]), .cout(c[38]));
   FA i26(.a(p[7][3]), .b(p[6][4]), .cin(c[38]), .sum(ps[30]), .cout(c[39]));
   FA i27(.a(ps[30]), .b(p[5][5]), .cin(c[39]), .sum(ps[31]), .cout(c[40]));
   FA i28(.a(ps[31]), .b(p[4][6]), .cin(c[40]), .sum(ps[32]), .cout(c[41]));
   FA i29(.a(ps[32]), .b(p[3][7]), .cin(c[41]), .sum(o[10]), .cout(c[42]));
   FA i30(.a(p[7][4]), .b(p[6][5]), .cin(c[42]), .sum(ps[33]), .cout(c[43]));
   FA i31(.a(ps[33]), .b(p[5][6]), .cin(c[43]), .sum(ps[34]), .cout(c[44]));
   FA i32(.a(ps[34]), .b(p[4][7]), .cin(c[44]), .sum(o[11]), .cout(c[45]));
   FA i33(.a(p[7][5]), .b(p[6][6]), .cin(c[45]), .sum(ps[35]), .cout(c[46]));
   FA i34(.a(ps[35]), .b(p[5][7]), .cin(c[46]), .sum(o[12]), .cout(c[47]));
   FA i35(.a(p[7][6]), .b(p[6][7]), .cin(c[47]), .sum(o[13]), .cout(c[48]));
    HA i36(.c(p[7][7]), .d(c[48]), .sum(o[14]), .cout(c[49]));
   assign o[15] = c[49];
endmodule