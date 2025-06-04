module rca_8(
    input [7:0] a, b,
    input cin,
    output [7:0] s,
    output cout
);
    wire c1, c2, c3, c4, c5, c6, c7;  

    assign s[0] = a[0] ^ b[0] ^ cin;
    assign c1   = (a[0] & b[0]) | ((a[0] ^ b[0]) & cin);

    assign s[1] = a[1] ^ b[1] ^ c1;
    assign c2   = (a[1] & b[1]) | ((a[1] ^ b[1]) & c1);

    assign s[2] = a[2] ^ b[2] ^ c2;
    assign c3   = (a[2] & b[2]) | ((a[2] ^ b[2]) & c2);

    assign s[3] = a[3] ^ b[3] ^ c3;
    assign c4   = (a[3] & b[3]) | ((a[3] ^ b[3]) & c3);

    assign s[4] = a[4] ^ b[4] ^ c4;
    assign c5   = (a[4] & b[4]) | ((a[4] ^ b[4]) & c4);

    assign s[5] = a[5] ^ b[5] ^ c5;
    assign c6   = (a[5] & b[5]) | ((a[5] ^ b[5]) & c5);

    assign s[6] = a[6] ^ b[6] ^ c6;
    assign c7   = (a[6] & b[6]) | ((a[6] ^ b[6]) & c6);

    assign s[7] = a[7] ^ b[7] ^ c7;
    assign cout = (a[7] & b[7]) | ((a[7] ^ b[7]) & c7);
endmodule