`timescale 1ns / 1ps
module Direct_cache #(parameter width = 32,
   parameter size = 8,
   parameter block_size = 4,
   parameter block_number = 1024,
   parameter tag_bits = width - $clog2(block_number)- $clog2(block_size)  // 20bits
)(
  input clk,rst,
  input [width-1:0]core_out,
  input [block_size*size-1:0]memory_out,
  output reg read_en,
  output reg[size-1:0]core_in,
  output reg [width-1:0]memory_in,
  output reg flag_hit,
  output reg flag_miss,
  output reg core_ready
  );
  localparam init = 3'b000;
  localparam check = 3'b001;
  localparam hit = 3'b010;
  localparam miss = 3'b011;
  localparam del = 3'b100;
  localparam write = 3'b101;
  
  reg [2:0] curr_state,next_state;
  
   reg valid[block_number-1:0];
   integer i;
   initial begin
    for (i=0; i<block_number; i=i+1)
     valid[i] = 0;
   end

   reg [(4*size)-1:0]block[block_number-1:0];  
   reg [tag_bits-1:0]tag[block_number-1:0];
   wire[($clog2(block_number)-1):0]index; 
   reg [width-1:0]addr_buffer;
   
   assign index = core_out[(width-tag_bits)-1:$clog2(block_size)];
   
   always@(posedge clk or posedge rst)begin
     if(rst)begin
       curr_state <= init;
     end
     else begin
       curr_state <= next_state;
     end
   end
   
   always@(*)begin
    core_ready = 1'b0;
    case(curr_state)
      init: begin
        flag_hit = 1'b0;
        flag_miss = 1'b0;
        read_en = 1'b0;
       next_state = check;
      end
      
      check: begin
        if(valid[index] && tag[index]==(core_out[width-1:$clog2(block_number)+$clog2(block_size)]))begin 
         next_state = hit;  
        end   
        else begin
         next_state = miss;
        end
      end 
      
      hit: begin 
        flag_hit = 1'b1;
        flag_miss = 1'b0;
        read_en = 1'b0;
        core_ready = 1'b1;
        case(core_out[$clog2(block_size)-1:0])
         2'b00 : core_in = block[index][size-1:0]; 
         2'b01 : core_in = block[index][2*size-1:size]; 
         2'b10 : core_in = block[index][3*size-1:2*size]; 
         2'b11 : core_in = block[index][4*size-1:3*size]; 
        endcase 
       next_state = init;
      end
      
      miss: begin
       flag_miss = 1'b1;
       flag_hit = 1'b0;
       read_en = 1'b1;
       memory_in = core_out;
       addr_buffer = core_out;
       next_state = del;
      end 
      
      del: begin
        read_en = 1'b1;
        next_state = write;
      end 
      
      write: begin 
       case(addr_buffer[$clog2(block_size)-1:0])
        2'b00 : core_in = memory_out[size-1:0]; 
        2'b01 : core_in = memory_out[2*size-1:size]; 
        2'b10 : core_in = memory_out[3*size-1:2*size]; 
        2'b11 : core_in = memory_out[4*size-1:3*size];
        endcase  
         block[index] = memory_out;
        tag[index] =  addr_buffer[width-1:$clog2(block_number)+$clog2(block_size)];
        valid[index] = 1'b1;  
        core_ready = 1'b1;
        next_state = init;
      end
      
     default : next_state = init;
    endcase
   end
   
   main_memory m1(
     .clk(clk),
     .read_en(read_en),
     .memory_in(memory_in),
     .memory_out(memory_out)
   );
   
  always @(posedge clk) begin
   $display("T=%0t | idx=%0d valid=%b tag=%h block=%h flag_hit=%h",
           $time,
           index,
           valid[index],
           tag[index],
           block[index],
           flag_hit);
  end
 endmodule

  
  //////////////////////////////// MAIN  MEMORY ////////////////////////////////////////
   module main_memory#(parameter width = 32,
   parameter depth = 65536,
   parameter size = 8
  )(
   input clk,
   input read_en,
   input [width-1:0]memory_in,
   output reg [4*size-1:0]memory_out
 );
   reg [size-1:0]memory[depth-1:0];
   integer i;
   
   initial begin
     for(i=0;i<depth;i=i+1)begin
         memory[i] = (2*i)+1;
     end 
   end
   always@(posedge clk)begin
    if(read_en )begin
     memory_out <= {memory[memory_in],memory[memory_in+1],memory[memory_in+2],memory[memory_in+3]};
    end 
   end
 endmodule
