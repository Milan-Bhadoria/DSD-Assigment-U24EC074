`timescale 1ns / 1ps
module flip_flop(
    input D,clk,reset,preset,
    output reg Q
    );
    always@(posedge clk or posedge reset or posedge preset)begin
     if(preset)begin
    Q<=1;
    end
    else if(reset)begin
    Q<=0;
    end
    else begin 
    Q <= D;
    end
   end
endmodule

module Ring_counter(
    input clk,reset,preset,
    output [3:0] Q
);
    wire q0 , q1, q2 , q3;

    flip_flop t1(.D(q3), .clk(clk), .reset(0), .preset(preset), .Q(q0));
    flip_flop t2(.D(q0), .clk(clk), .reset(reset), .preset(0), .Q(q1));
    flip_flop t3(.D(q1), .clk(clk), .reset(reset), .preset(0),.Q(q2));
    flip_flop t4(.D(q2), .clk(clk), .reset(reset), .preset(0), .Q(q3));

   not n2(Q[0],~q0);
   not n3(Q[1],~q1);
   not n4(Q[2],~q2);
   not n5(Q[3],~q3);
endmodule
