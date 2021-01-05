`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2020 05:57:38 PM
// Design Name: 
// Module Name: top
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


module control_and_datapath(clk, reset, inr, readBus, outvalue, instr, pc_out, pc_in, result, RegW, MemR, MemW, BrOp, ALUOp, MovOp, SignOp, MuxC0, MuxC1, MuxC2, MuxC3, MuxC4, MuxC5, ExOut, RO1, RO2, alu_b, WriteData, add1_r, add2_r, R1, R2, RD, MovOut, enable);
    input clk;
    input [3:0] inr;
    input reset;
    input [15:0] readBus, instr;
    output [15:0] outvalue, RO2, result, pc_out;
    output MemW, MemR, enable;
    
    output [15:0] pc_in;
    output [15:0] ExOut, RO1, alu_b, WriteData, add1_r, add2_r, MovOut, R1, R2, RD;
    output [1:0] SignOp, MuxC0, MuxC1, MuxC2, MuxC3, MuxC4, MuxC5;
    output MovOp, RegW;
    output [2:0] BrOp;
    output [3:0] ALUOp;
   
    pc PC (enable, reset, clk, pc_in, pc_out);
    adder ADD1 (enable, reset, 1, pc_out, add1_r);
    //assign pc_out = 0;
    //instr_mem INSTR (enable, pc_out[9:0], instr);
    //assign instr = 16'b0001001000110001;
    control CON (reset, instr[3:0], instr[4], instr[9:8], instr[5:4], RegW, MemR, MemW, enable, BrOp, ALUOp, MovOp, SignOp, MuxC0, MuxC1, MuxC2, MuxC3, MuxC4);
    
    mux_4to1 C0 (enable, MuxC0, instr[15:12], instr[7:4], 1, 0, R1);
    mux_4to1 C1 (enable, MuxC1, 0, instr[11:8], instr[15:12], instr[7:4], R2);
    mux_4to1 C2 (enable, MuxC2, instr[7:4], instr[15:12], 1, 0, RD);
    
    sign_ext SIGN (enable, reset, SignOp, instr[15:6], instr[7:4], instr[11:6], instr[15:8], ExOut);
    adder ADD2 (enable, reset, ExOut, pc_out, add2_r);
    mov_ext MOV (enable, reset, MovOp, instr[15:8], MovOut);
    
    //assign R1 = 4'b0101;
    //assign R2 = 4'b0000;
    //assign RD = 4'b0011;
    
    reg_file REG (enable, reset, clk, inr, R1[3:0], R2[3:0], RD[3:0], RegW, WriteData, RO1, RO2, outvalue);
    //assign RO1 = 0;
    mux_4to1 C3 (enable, MuxC3, RO2, ExOut, MovOut, 0, alu_b);
    
    alu ALU (enable, reset, ALUOp, RO1, alu_b, result, neg, zero, overflow);
    
    branch_control BRC (reset, BrOp, neg, zero, MuxC5);
    //data_mem DATA (MemW, MemR, result, RO2, MemOut);
    
    mux_4to1 C4 (enable, MuxC4, result, readBus, add1_r, 0, WriteData);
    mux_4to1 C5 (enable, MuxC5, add1_r, result, add2_r, 0, pc_in);
endmodule
