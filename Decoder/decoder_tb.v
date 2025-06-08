module deco_tb ();
  reg x,y,z,En; 
  wire [7:0]o;

  deco dut(x,y,z,En,o);
  initial begin
    $dumpfile("deco.vcd");
    $dumpvars(0, deco_tb);
    for(integer j=0;j<2;j=j+1)begin
        En = j;
    if (En==1)begin
    for(integer i=0;i<8;i=i+1)begin
      {x,y,z} = i;

        $display("Input: x=%b, y=%b, z=%b → Output: o=%b", x, y, z, o);
      #10;
    end
    end
    if(En==0)begin
    for(integer i=0;i<8;i=i+1)begin
      {x,y,z} = i;

        $display("Input: x=%b, y=%b, z=%b → Output: o=%b", x, y, z, o);
      #10;
    end
    end
    end
    $display("Test done");
    #10 $finish;
  end
endmodule