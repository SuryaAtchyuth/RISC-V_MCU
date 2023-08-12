`timescale 1ns / 1ps

module Instruction_Decoder(
    input [16:0] instruction,
    output  RW, DA, [1:0]MD,[1:0]BS, PS, [2:0]MW,[3:0]FS, MA, MB, [2:0]AA, [2:0]BA, CS
    );
    
reg RW_WIRE, PS_WIRE,MW_WIRE, MA_WIRE, MB_WIRE, CS_WIRE;
reg [2:0]DA_WIRE; 
reg [1:0]MD_WIRE;
reg [1:0]BS_WIRE;
reg [3:0]FS_WIRE;
reg [2:0]AA_WIRE;
reg [2:0]BA_WIRE;
reg[4:0]opcode; 
    
parameter NOP = 5'b00000; 
parameter BZ =	5'b00011;
parameter LD = 5'b01001; 
parameter MOV = 5'b01111;
parameter JR  = 5'b01011;
parameter XOR  = 5'b00101;
parameter JMPL = 5'b10001;
parameter ADDIU  = 5'b10010;
parameter ST =	5'b00100; 
parameter IN = 5'b00001; 
parameter LSL = 5'b00110;
parameter JMP = 5'b10000; 
parameter SUB = 5'b01100;
parameter BNZ =	5'b01000;
parameter AND = 5'b00010;  
parameter OR = 5'b01110; 
parameter ADD  = 5'b01101; 
parameter SLT = 5'b01010; 
parameter CMP =	5'b00111; 
parameter OUT = 5'b10011; 
parameter ADDI = 5'b10100; 

always@(*) begin

opcode = instruction[16:12]; 

case(opcode)
    NOP:
    begin   
    RW_WIRE = 1'b0; DA_WIRE = 3'b000; MD_WIRE = 2'b00;BS_WIRE = 2'b00;PS_WIRE = 1'b0;MW_WIRE = 1'b0;FS_WIRE = 4'b0000; MA_WIRE = 1'b0; MB_WIRE = 1'b0; AA_WIRE = 3'b000; BA_WIRE = 3'b000; CS_WIRE = 1'b0;
    end 
    
    IN:
    begin 
    RW_WIRE = 1'b1; DA_WIRE = instruction[11:9]; MD_WIRE = 2'b10;BS_WIRE = 2'b00;PS_WIRE = 1'b0;MW_WIRE = 1'b0;FS_WIRE = 4'b0000; MA_WIRE = 1'b0; MB_WIRE = 1'b0; AA_WIRE = instruction[8:6]; BA_WIRE = 3'b000; CS_WIRE = 1'b0;  
    end 
    
    AND:
    begin   
    RW_WIRE = 1'b1; DA_WIRE = instruction[11:9]; MD_WIRE = 2'b00;BS_WIRE = 2'b00;PS_WIRE = 1'b0;MW_WIRE = 1'b0;FS_WIRE = 4'b1001; MA_WIRE = 1'b0; MB_WIRE = 1'b0; AA_WIRE = instruction[8:6]; BA_WIRE = instruction[5:3]; CS_WIRE = 1'b0;
    end 
    
    BZ:
    begin 
    RW_WIRE = 1'b0; DA_WIRE = 3'b000; MD_WIRE = 2'b00;BS_WIRE = 2'b01;PS_WIRE = 1'b0;MW_WIRE = 1'b0;FS_WIRE = 4'b1000; MA_WIRE = 1'b0; MB_WIRE = 1'b1; AA_WIRE = instruction[8:6]; BA_WIRE = 3'b000; CS_WIRE = 1'b1;
    end 
    
    ST:begin 
    RW_WIRE = 1'b0; DA_WIRE = instruction[11:9]; MD_WIRE = 2'b00;BS_WIRE = 2'b00;PS_WIRE = 1'b0;MW_WIRE = 1'b1;FS_WIRE = 4'b0000; MA_WIRE = 1'b0; MB_WIRE = 1'b0; AA_WIRE = instruction[8:6]; BA_WIRE = instruction[5:3]; CS_WIRE = 1'b0;
    end
    
    XOR:
    begin  
    RW_WIRE = 1'b1; DA_WIRE = instruction[11:9]; MD_WIRE = 2'b00;BS_WIRE = 2'b00;PS_WIRE = 1'b0;MW_WIRE = 1'b0;FS_WIRE = 4'b0011; MA_WIRE = 1'b0; MB_WIRE = 1'b0; AA_WIRE = instruction[8:6]; BA_WIRE = instruction[5:3]; CS_WIRE = 1'b0;  
    end 
    
    LSL:
    begin  
    RW_WIRE = 1'b1; DA_WIRE = instruction[11:9]; MD_WIRE = 2'b00;BS_WIRE = 2'b00;PS_WIRE = 1'b0;MW_WIRE = 1'b0;FS_WIRE = 4'b0110; MA_WIRE = 1'b0; MB_WIRE = 1'b0; AA_WIRE = instruction[8:6]; BA_WIRE = 3'b000; CS_WIRE = 1'b0;
    end
    
    CMP:
    begin  
    RW_WIRE = 1'b0; DA_WIRE = 3'b000; MD_WIRE = 2'b00;BS_WIRE = 2'b10;PS_WIRE = 1'b0;MW_WIRE = 1'b0;FS_WIRE = 4'b0000; MA_WIRE = 1'b0; MB_WIRE = 1'b0; AA_WIRE = instruction[8:6]; BA_WIRE = 3'b000; CS_WIRE = 1'b0; 
    end 
    
    BNZ:
    begin  
    RW_WIRE = 1'b0; DA_WIRE = 3'b000; MD_WIRE = 2'b00;BS_WIRE = 2'b11;PS_WIRE = 1'b1;MW_WIRE = 1'b0;FS_WIRE = 4'b1000; MA_WIRE = 1'b0; MB_WIRE = 1'b1; AA_WIRE = instruction[8:6]; BA_WIRE = 3'b000; CS_WIRE = 1'b1; 
    end 
    
    LD:
    begin  
    RW_WIRE = 1'b1; DA_WIRE = instruction[11:9]; MD_WIRE = 2'b01;BS_WIRE = 2'b00;PS_WIRE = 1'b0;MW_WIRE = 1'b0;FS_WIRE = 4'b0000; MA_WIRE = 1'b0; MB_WIRE = 1'b0; AA_WIRE = instruction[8:6]; BA_WIRE = 3'b000; CS_WIRE = 1'b0;  
    end
     
    SLT:begin 
    RW_WIRE = 1'b1; DA_WIRE = instruction[11:9]; MD_WIRE = 2'b00;BS_WIRE = 2'b00;PS_WIRE = 1'b0;MW_WIRE = 1'b0;FS_WIRE = 4'b1010; MA_WIRE = 1'b0; MB_WIRE = 1'b0; AA_WIRE = instruction[8:6]; BA_WIRE = instruction[5:3]; CS_WIRE = 1'b0;
    end
    
    JR:
    begin  
    RW_WIRE = 1'b0; DA_WIRE = 3'b000; MD_WIRE = 2'b00;BS_WIRE = 2'b01;PS_WIRE = 1'b0;MW_WIRE = 1'b0;FS_WIRE = 4'b1000; MA_WIRE = 1'b0; MB_WIRE = 1'b1; AA_WIRE = instruction[8:6]; BA_WIRE = 3'b000; CS_WIRE = 1'b1;  
    end
     
    SUB:
    begin 
    RW_WIRE = 1'b1; DA_WIRE = instruction[11:9]; MD_WIRE = 2'b00;BS_WIRE = 2'b00;PS_WIRE = 1'b0;MW_WIRE = 1'b0;FS_WIRE = 4'b0010; MA_WIRE = 1'b0; MB_WIRE = 1'b0; AA_WIRE = instruction[8:6]; BA_WIRE = instruction[5:3]; CS_WIRE = 1'b0; 
    end 
    
    ADD:
    begin  
    RW_WIRE = 1'b1; DA_WIRE = instruction[11:9]; MD_WIRE = 2'b00;BS_WIRE = 2'b00;PS_WIRE = 1'b0;MW_WIRE = 1'b0;FS_WIRE = 4'b0001; MA_WIRE = 1'b0; MB_WIRE = 1'b0; AA_WIRE = instruction[8:6]; BA_WIRE = instruction[5:3]; CS_WIRE = 1'b0;  
    end 
    OR:
    begin 
    RW_WIRE = 1'b1; DA_WIRE = instruction[11:9]; MD_WIRE = 2'b00;BS_WIRE = 2'b00;PS_WIRE = 1'b0;MW_WIRE = 1'b0;FS_WIRE = 4'b0100; MA_WIRE = 1'b0; MB_WIRE = 1'b1; AA_WIRE = instruction[8:6]; BA_WIRE = 3'b000; CS_WIRE = 1'b0;
    end
     
    MOV:
    begin 
    RW_WIRE = 1'b1; DA_WIRE = instruction[11:9]; MD_WIRE = 2'b00;BS_WIRE = 2'b00;PS_WIRE = 1'b0;MW_WIRE = 1'b0;FS_WIRE = 4'b0001; MA_WIRE = 1'b0; MB_WIRE = 1'b0; AA_WIRE = instruction[8:6]; BA_WIRE = instruction[5:3]; CS_WIRE = 1'b0; 
    end
    
    JMP:
    begin  
    RW_WIRE = 1'b0; DA_WIRE = 3'b000; MD_WIRE = 2'b00;BS_WIRE = 2'b00;PS_WIRE = 1'b0;MW_WIRE = 1'b1;FS_WIRE = 4'b0000; MA_WIRE = 1'b0; MB_WIRE = 1'b0; AA_WIRE = instruction[8:6]; BA_WIRE = instruction[5:3]; CS_WIRE = 1'b0; 
    end 
    
    JMPL:
    begin 
    RW_WIRE = 1'b1; DA_WIRE = instruction[11:9]; MD_WIRE = 2'b00;BS_WIRE = 2'b00;PS_WIRE = 1'b0;MW_WIRE = 1'b0;FS_WIRE = 4'b1100; MA_WIRE = 1'b0; MB_WIRE = 1'b0; AA_WIRE = instruction[8:6]; BA_WIRE = 3'b000; CS_WIRE = 1'b0; 
    end
     
    ADDIU:
    begin 
    RW_WIRE = 1'b1; DA_WIRE = instruction[11:9]; MD_WIRE = 2'b10;BS_WIRE = 2'b00;PS_WIRE = 1'b0;MW_WIRE = 1'b0;FS_WIRE = 4'b0000; MA_WIRE = 1'b0; MB_WIRE = 1'b0; AA_WIRE = instruction[8:6]; BA_WIRE = 3'b000; CS_WIRE = 1'b0; 
    end 
    
    OUT:
    begin 
    RW_WIRE = 1'b0; DA_WIRE = 3'b000; MD_WIRE = 2'b00;BS_WIRE = 2'b11;PS_WIRE = 1'b1;MW_WIRE = 1'b0;FS_WIRE = 4'b1000; MA_WIRE = 1'b0; MB_WIRE = 1'b1; AA_WIRE = instruction[8:6]; BA_WIRE = 3'b000; CS_WIRE = 1'b1; 
    end 
    
    ADDI:
    begin
    RW_WIRE = 1'b1; DA_WIRE = instruction[11:9]; MD_WIRE = 2'b00;BS_WIRE = 2'b00;PS_WIRE = 1'b0;MW_WIRE = 1'b0;FS_WIRE = 4'b0100; MA_WIRE = 1'b0; MB_WIRE = 1'b1; AA_WIRE = instruction[8:6]; BA_WIRE = 3'b000; CS_WIRE = 1'b0; 
    end 
    
    default: 
    begin
        RW_WIRE = 1'b0; DA_WIRE = 3'b000; MD_WIRE = 2'b00;BS_WIRE = 2'b00;PS_WIRE = 1'b0;MW_WIRE = 1'b0;FS_WIRE = 4'b0000; MA_WIRE = 1'b0; MB_WIRE = 1'b0; AA_WIRE = 3'b000; BA_WIRE = 3'b000; CS_WIRE = 1'b0;
    end 
    
    endcase
end
assign RW = RW_WIRE;
assign DA = DA_WIRE;
assign MD = MD_WIRE;
assign BS = BS_WIRE;
assign PS = PS_WIRE;
assign MW = MW_WIRE;
assign FS = FS_WIRE;
assign MA = MA_WIRE;
assign MB = MB_WIRE;
assign AA = AA_WIRE;
assign BA = BA_WIRE;
assign CS = CS_WIRE;
endmodule
