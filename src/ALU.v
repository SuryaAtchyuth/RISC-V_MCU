`timescale 1ns / 1ps

module ALU(
input [7:0] A,
input [7:0] B,
input [2:0]shift,
input [3:0] function_select,
output reg zero,neg,carry,
output overflow,
output reg [7:0] ALU_Result
);
reg s1,s2,c1;
always@(*)
    begin
        case(function_select)
            //Arithmatic Operations.
            4'b0000:
             ALU_Result= A + B ;
            
            4'b0001:
            ALU_Result = A - B ;
            
            4'b0010:
            ALU_Result = A * B;
            
            4'b0011:
            ALU_Result = A/B;
            
            
            //Bitwise Operations
            4'b0100:
            ALU_Result = A<<shift;
            
            4'b0101:
            ALU_Result = A>>shift;
            
            4'b0110:
            ALU_Result = {A[6:0],A[7]};
            
            4'b0111:
            ALU_Result = {A[0],A[7:1]};
            
            //Logic Operations.
            
            4'b1000:
            ALU_Result = A & B;
            
            4'b1001:
            ALU_Result = A | B;
            
            4'b1010:
            ALU_Result = A ^ B;
            
            4'b1011:
            ALU_Result = ~(A | B);
            
            4'b1100:
            ALU_Result = ~(A & B);
            
            4'b1101:
            ALU_Result = ~(A ^ B);
            
            
            default: ALU_Result = 0;
        endcase
  
       {carry,s1}<=A+B;
       {c1,s2}<=A[6:0]+B[6:0];           
    
  if(ALU_Result==1'b0)
        begin
            zero<=1'b1;
        end    
       else
        begin
            zero<=1'b0;
        end 
        
      if(ALU_Result[7]==1'b1)
        begin
            neg<=1'b1;
        end 
    else
        begin
             neg<=1'b0;
        end       
 end      
assign overflow=carry^c1; 

      
endmodule


