module xor_tb;
    reg a,b;
    wire y;
    xor_gate uut(a,b,y);
initial begin 
   $dumpfile("xor.vcd");
   $dumpvars(0,xor_tb);
   $display("done ");
   a=0;b=0;
   #10 a=0;b=1;
   #10 a=1;b=0;
   #10 a=1;b=1;
   #10 $finish;
end
endmodule