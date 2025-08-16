`timescale 1ns / 1ps
module tb_axi_str();
   reg clk,rst;
   reg [15:0]data_in;
   wire tready;
   wire tvalid;
   wire [15:0]tdata;
   wire [15:0] data_out;
   master dut(
    .clk(clk),
    .rst(rst),
    .data_in(data_in),
    .tready(tready),
    .tvalid(tvalid),
    .tdata(tdata)
   );
   
   slave uut(
    .clk(clk),
    .rst(rst),
    .tvalid(tvalid),
    .tdata(tdata),
    .tready(tready),
    .data_out(data_out)
   ); 
   
   always #5 clk = ~clk;
   initial begin
    $dumpfile("axi.vcd");
    $dumpvars(0, tb_axi_str);
    clk = 0;
    rst = 1;
    data_in = 1223;
    #7;
    rst = 0;
    #50;
    data_in = 5452;
    #50 $finish;
   end
endmodule
