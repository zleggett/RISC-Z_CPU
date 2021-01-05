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

module top_CPU(clk, reset, inr, outvalue);
    input clk;
    input [3:0] inr;
    input reset;
    output [15:0] outvalue;
    
    wire [15:0] pc_in, pc_out, readBus, RO2, result;
    wire [15:0] instr, ExOut, RO1, alu_b, WriteData, add1_r, add2_r, MovOut, R1, R2, RD;
    wire [1:0] SignOp, MuxC0, MuxC1, MuxC2, MuxC3, MuxC4, MuxC5;
    wire MovOp, RegW, enable, MemW, MemR;
    wire [2:0] BrOp;
    wire [3:0] ALUOp;
    
    instr_mem INSTR (enable, pc_out[9:0], instr);
    data_mem DATA (MemW, MemR, result, RO2, readBus);
    control_and_datapath CAD (clk, reset, inr, readBus, outvalue, instr, pc_out, result, RO2, MemW, MemR, enable);
endmodule


