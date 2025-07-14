`timescale 1ns / 1ps
module Register_file(
     input [15:0] data_in,
     input clk,
     input [3:0] write_addr, read_addr1, read_addr2,
     input write_en,
     output [15:0]read_port1, read_port2
);
  reg [15:0] register [15:0];
  always @(posedge clk)begin
    if(write_en)begin
       register[write_addr] <= data_in;
    end
  end
  
  assign read_port1 = register[read_addr1];
  assign read_port2 = register[read_addr2];
endmodule
