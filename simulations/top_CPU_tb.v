`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2020 03:09:54 PM
// Design Name: 
// Module Name: top_CPU_tb
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


module top_CPU_tb();
    reg clk;
    reg [3:0] inr;
    wire [15:0] outvalue;
    wire [15:0] instr;
    wire [9:0] pc_curr, pc_next;
    wire [15:0] alu_result;
    wire [1:0] SignOp, MuxC0, MuxC1, MuxC2, MuxC3, MuxC4, MuxC5;
    wire MovOp, RegW, MemW, MemR, enable;
    wire [2:0] BrOp;
    wire [3:0] ALUOp;
    wire [15:0] ExOut;
    wire [15:0] RO1, RO2, alu_b, WriteData, add1_r, add2_r, MovOut, readBus;
    wire [3:0] R1, R2, RD;
    reg reset;
    
   top_CPU TOP (clk, reset, inr, readBus, outvalue, instr, pc_curr, pc_next, alu_result, RegW, MemR, MemW, BrOp, ALUOp, MovOp, SignOp, MuxC0, MuxC1, MuxC2, MuxC3, MuxC4, MuxC5, ExOut, RO1, RO2, alu_b, WriteData, add1_r, add2_r, R1, R2, RD, MovOut, enable);
    
    initial
    begin
        $monitor("clk: %d, reset: %d, inr: %d, outvalue: %d", clk, reset, inr, outvalue);
        clk = 0; reset = 0; inr = 4'b0101;
        #10; clk = 1;
        #10; clk = 0;
        #10; clk = 1; inr = 4'b0101;
        #10; clk = 0;
        #10; clk = 1; inr = 4'b0110;
        #10; clk = 0;
        #10; clk = 1; inr = 4'b0101;
        #10; clk = 0;
        #10; clk = 1; inr = 4'b0001;
        #10; clk = 0;
        #10; clk = 1; inr = 4'b0111;
        #10; clk = 0;
        #10; clk = 1; inr = 4'b1000;
        #10; clk = 0;
        #10; clk = 1; inr = 4'b1001;
        #10; clk = 0;
        #10; clk = 1; inr = 4'b1001;
        #10; clk = 0;
        #10; clk = 1; inr = 4'b1010;
        #10; clk = 0;
        #10; clk = 1; inr = 4'b1010;
        #10; clk = 0;
        #10; clk = 1; inr = 4'b1010;
        #10; clk = 0;
        #10; clk = 1; inr = 4'b1010;
        #10; clk = 0;
        #10; clk = 1; inr = 4'b1000;
        #10; clk = 0;
        #10; clk = 1; inr = 4'b1000;
        #10; clk = 0;
        #10; clk = 1; inr = 4'b1000;
        #10; clk = 0;
        #10; clk = 1; inr = 4'b1000;
        #10; clk = 0;
        #10; clk = 1; inr = 4'b1000;
        #10; clk = 0;
        #10; clk = 1; inr = 4'b1000;
        #10; clk = 0;
        #10; clk = 1; inr = 4'b0001;
        #10; clk = 0;
        #10; clk = 1; inr = 4'b0000;
        #10; clk = 0;
        #10; clk = 1; inr = 4'b0000;
        #10; clk = 0;
    end
endmodule