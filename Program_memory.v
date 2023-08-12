`timescale 1ns / 1ps

module Program_memory(
    input [7:0] addr,
    output [16:0] inst
    );

integer i;
reg [16:0] ml[0:255];
initial
begin
    for(i=0;i<255;i=i+1)
        begin
            ml[i]<=0;
        end 
 end   
   
always @(addr);
assign inst=ml[addr];
endmodule

