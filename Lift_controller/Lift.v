`timescale 1ns / 1ps
module Lift(
   input clk,reset,[1:0]in,
   output reg [2:0]floor
);
  localparam first = 2'b00,
             second = 2'b01,
             third = 2'b11;
    reg [1:0]p_s,n_s;
    always@(posedge clk) begin 
      if(reset)begin 
        p_s<=first;
      end
      else begin
        p_s<=n_s;
      end
    end
    
  always@(*)begin
    case(p_s)
      first : n_s = (in==2'b00) ? second : third;
      second : n_s = (in==2'b01) ? third : first;
      third : n_s = (in==2'b11) ? second : first;
      default : n_s = first;
    endcase
    if(p_s==first) floor = 1;
    if(p_s==second) floor = 2;
    if(p_s==third) floor = 4;
  end
endmodule
