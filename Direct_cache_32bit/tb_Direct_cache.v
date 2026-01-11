`timescale 1ns / 1ps
module tb_Direct_cache;

  reg clk;
  reg rst;
  reg [31:0] core_out;
  wire read_en;
  wire [31:0] memory_out;
  wire [7:0] core_in;
  wire [31:0] memory_in;
  wire flag_hit;
  wire flag_miss;
  wire core_ready;

  Direct_cache dut (
    .clk(clk),
    .rst(rst),
    .core_out(core_out),
    .memory_out(memory_out),
    .read_en(read_en),
    .core_in(core_in),
    .memory_in(memory_in),
    .flag_hit(flag_hit),
    .flag_miss(flag_miss),
    .core_ready(core_ready)
  );

  always #5 clk = ~clk;

  task send_addr(input [31:0] addr);
    begin
      core_out = addr;
     @(posedge clk);
      while (!core_ready)
       @(posedge clk);
     @(posedge clk);
    end
  endtask

  initial begin
    $dumpfile("Direct_cache.vcd");
    $dumpvars(0, tb_Direct_cache);

    clk = 0;
    rst = 1;
    core_out = 0;

    #10 rst = 0;

    send_addr(32'h1461); 
    send_addr(32'h512D);
    send_addr(32'h1461);
    send_addr(32'hF257);

    send_addr(32'h1461);
    send_addr(32'hF634);

    send_addr(32'h7D6B);
    send_addr(32'h8863);

    send_addr(32'h512D); 
    send_addr(32'h8863);

    #50 $finish;
  end
endmodule
