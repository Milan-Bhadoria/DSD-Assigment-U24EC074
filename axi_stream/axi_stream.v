`timescale 1ns / 1ps
module master(
     input clk,rst,
     input [15:0]data_in,
     input tready,
     output reg tvalid,
     output reg [15:0]tdata
);
  reg [15:0]temp;

  always@(posedge clk or posedge rst)begin
    if(rst)begin
       tvalid <= 0;
       tdata <= 0;
     end
   else begin  
     if(tvalid && tready)begin
      tdata <= data_in;
      tvalid <= 1; 
     end
     else if(!tvalid) tvalid <= 1;
   end
  end
endmodule

/////////////////// SLAVE //////////////////////

module slave(
   input clk,rst,
   input tvalid,
   input [15:0]tdata,
   output reg tready,
   output reg [15:0]data_out
);
 always@(posedge clk or posedge rst)begin
   if (rst)begin
     tready <= 0;
     data_out <= 0;
    end
    else begin
     if(tvalid && tready)begin
      data_out <= tdata;
      //tready <= 1;
      end
      else tready <= 1;
   end
 end 
endmodule
