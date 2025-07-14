`timescale 1ns / 1ps
module tb_Register_file();
  reg [15:0] data_in;
  reg clk;
  reg [3:0] write_addr, read_addr1, read_addr2;
  reg write_en;
  wire [15:0] read_port1, read_port2;

  Register_file dut(data_in, clk, write_addr, read_addr1, read_addr2, write_en, read_port1, read_port2);

  always #5 clk = ~clk;

  initial begin
    $dumpfile("reg_file.vcd");
    $dumpvars(0, tb_Register_file);
    clk = 0;

    $monitor("W_EN: %b | W_ADDR: %0d | D_IN: %0d | R1[%0d]: %0d | R2[%0d]: %0d",write_en, write_addr, data_in, read_addr1, read_port1, read_addr2, read_port2);

    //////////// Initialize ///////////
    data_in = 0; write_addr = 0; read_addr1 = 0; read_addr2 = 0; write_en = 0;

    /////////// Writting //////////////
    data_in = 5560;
    write_addr = 4;
    write_en = 1;
    
    #10 data_in = 76860;
    write_addr = 12;
    write_en = 1;
    
    ////////// Reading ////////////////
    #10 write_en = 0;
    read_addr1 = 4;
    read_addr2 = 12; 
    
    ////////// Writting ///////////////
    #10 data_in = 7380;
    write_addr = 9;
    write_en = 1;
    
    ////////// Reading /////////////////
    #10 write_en = 0;
    read_addr1 = 4;
    read_addr2 = 9;

    #10 $finish;
  end
endmodule
