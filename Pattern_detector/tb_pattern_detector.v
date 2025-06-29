`timescale 1ns / 1ps
module tb_Sequence_detector();
  reg clk,x;
  wire y;

  Sequence_detector dut(clk,x, y);

  always #5 clk = ~clk;

  initial begin
    clk = 0;
    x = 0; #10;
x = 1; #10;
x = 1; #10;
x = 0; #10;
x = 1; #10;
x = 0; #10;
x = 0; #10;
x = 1; #10;
x = 1; #10;
x = 1; #10;
x = 0; #10;
x = 1; #10;
x = 0; #10;
x = 0; #10;
x = 0; #10;
x = 1; #10;
x = 1; #10;
x = 0; #10;
x = 1; #10;
x = 1; #10;
x = 1; #10;
x = 1; #10;
x = 0; #10;
x = 0; #10;
x = 0; #10;
x = 0; #10;
x = 1; #10;
x = 0; #10;
x = 1; #10;
x = 1; #10;
x = 1; #10;
x = 0; #10;
    $dumpfile("edge.vcd");
    $dumpvars(0, tb_Sequence_detector);
    $monitor("x=%b | y=%b | clk=%b",  x, y, clk);
    #30;
    $finish;
  end
endmodule
