`timescale 1ns / 1ps

module tb_mcu();
reg clk,reset;
wire [16:0]Out,PC,IR,A,B,F;


MCU m1(.clk(clk),.reset(reset),.PC(PC),.Out(Out),.IR(IR),.A(A),.B(B),.F(F));

initial
    begin
        clk=0;
        reset=1;
        #20;
        reset=0;
        #90;
        $finish;
    end 

always #5 clk=~clk;    

endmodule
