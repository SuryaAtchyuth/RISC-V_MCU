`timescale 1ns / 1ps


module Reg_f(

   input [2:0] Aa, 
   input [2:0]Ba, 
   input [2:0]Da,
   input[7:0]Din,
   input clk, 
   input write,
   output  [7:0]A,
   output [7:0]B
    );
        
reg [7:0] RB [7:0];

integer i;

initial
for(i=0;i<8;i=i+1)
begin
    RB[i] <=7;  
end
assign  A = RB[Aa];
assign  B = RB[Ba];

always @(posedge clk)
if ( write & Da!=0)
begin
     RB[Da] <= Din ;
end     
endmodule

