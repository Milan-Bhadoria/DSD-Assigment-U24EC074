module fa(
    input a,b,
    input cin,
    output s,cout,g,p
); 
    xor m1(p,a,b);
    and m2(g,a,b);
    and  m3(pro,p,cin);
    or m4(cout,pro,g);
    xor m5(s,p,cin);
endmodule

module cla(
    input [7:0]a,b,
    input cin,
    output[7:0]s,
    output cout
);
    wire [7:0]g,p;
    wire [8:0] c;
    assign c[0] = cin;
    genvar i;
    generate
      for(i=0;i<8;i=i+1)begin 
        fa fai(.a(a[i]),.b(b[i]),.cin(c[i]),.s(s[i]),.cout(c[i+1]),.g(g[i]),.p(p[i]))  ;
      end
    assign cout = c[7];
    endgenerate
endmodule