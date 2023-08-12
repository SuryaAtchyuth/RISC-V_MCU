`timescale 1ns / 1ps

module Data_mem(
    input clk,
    input [7:0] mem_in,
    input [7:0] addr,
    input wr,
    output [7:0] mem_out
    );
      
    reg [7:0] ram [255:0];   
    reg [8:0] addr_reg;   
    always @ (posedge clk)
    begin 
        if (wr)
            ram[addr]<=mem_in;
        else 
            addr_reg<=addr;        
    end
    
    assign mem_out=ram[addr];
endmodule
