module deco(
  input x,y,z,
  input En,
  output reg [7:0]o
);
always @(* ) begin
 if(En==0)begin
   o[7] = (~x & ~y) & ~z;
   o[6] = (~x & ~y) & z;
   o[5] = (~x & y) & ~z;
   o[4] = (~x & y) & z;
   o[3] =  (x & ~y) & ~z;
   o[2] =  (x & ~y) & z;
   o[1] =  (x & y) & ~z;
   o[0] =  (x & y) & z;
 end
   else begin
    x=1'bx;
    y=1'bx;
    z=1'bx;
    o=8'bx;
   end
end
endmodule