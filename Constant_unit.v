`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2022 02:56:00 AM
// Design Name: 
// Module Name: Constant_unit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Constant_unit(
    input [16:0]IM,
    input  CS,
    output reg cu_out
    );

  always@(CS)
      begin 
        cu_out<=IM[5:0]; 
      end      
    
endmodule


