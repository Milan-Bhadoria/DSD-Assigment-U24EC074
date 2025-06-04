module rca_8(
    input [7:0] a, b,
    input cin,
    output reg [7:0] s,
    output reg cout
);
    reg c1, c2, c3, c4, c5, c6, c7;  
  always@(*) begin
    s[0] = a[0] ^ b[0] ^ cin;
    c1   = (a[0] & b[0]) | ((a[0] ^ b[0]) & cin);

    s[1] = a[1] ^ b[1] ^ c1;
    c2   = (a[1] & b[1]) | ((a[1] ^ b[1]) & c1);

    s[2] = a[2] ^ b[2] ^ c2;
    c3   = (a[2] & b[2]) | ((a[2] ^ b[2]) & c2);

    s[3] = a[3] ^ b[3] ^ c3;
    c4   = (a[3] & b[3]) | ((a[3] ^ b[3]) & c3);

    s[4] = a[4] ^ b[4] ^ c4;
    c5   = (a[4] & b[4]) | ((a[4] ^ b[4]) & c4);

    s[5] = a[5] ^ b[5] ^ c5;
    c6   = (a[5] & b[5]) | ((a[5] ^ b[5]) & c5);

    s[6] = a[6] ^ b[6] ^ c6;
    c7   = (a[6] & b[6]) | ((a[6] ^ b[6]) & c6);

    s[7] = a[7] ^ b[7] ^ c7;
    cout = (a[7] & b[7]) | ((a[7] ^ b[7]) & c7);
  end
endmodule