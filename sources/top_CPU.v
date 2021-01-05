`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2020 03:08:47 PM
// Design Name: 
// Module Name: top_CPU
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

module top_CPU(clk, reset, inr, readBus, outvalue, instr, pc_out, pc_in, result, RegW, MemR, MemW, BrOp, ALUOp, MovOp, SignOp, MuxC0, MuxC1, MuxC2, MuxC3, MuxC4, MuxC5, ExOut, RO1, RO2, alu_b, WriteData, add1_r, add2_r, R1, R2, RD, MovOut, enable);
    input clk;
    input [3:0] inr;
    input reset;
    output [15:0] readBus;
    output [15:0] outvalue, RO2, result;
    output MemW, MemR;
    
    output [15:0] pc_in, pc_out;
    output [15:0] instr, ExOut, RO1, alu_b, WriteData, add1_r, add2_r, MovOut, R1, R2, RD;
    output [1:0] SignOp, MuxC0, MuxC1, MuxC2, MuxC3, MuxC4, MuxC5;
    output MovOp, RegW, enable;
    output [2:0] BrOp;
    output [3:0] ALUOp;
    
    instr_mem INSTR (enable, pc_out[9:0], instr);
    data_mem DATA (MemW, MemR, result, RO2, readBus);
    control_and_datapath CAD (clk, reset, inr, readBus, outvalue, instr, pc_out, pc_in, result, RegW, MemR, MemW, BrOp, ALUOp, MovOp, SignOp, MuxC0, MuxC1, MuxC2, MuxC3, MuxC4, MuxC5, ExOut, RO1, RO2, alu_b, WriteData, add1_r, add2_r, R1, R2, RD, MovOut, enable);

endmodule


