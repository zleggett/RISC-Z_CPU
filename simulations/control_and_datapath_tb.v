`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2020 08:22:11 PM
// Design Name: 
// Module Name: control_and_datapath_tb
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


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2020 07:19:51 PM
// Design Name: 
// Module Name: top_tb
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


module control_and_datapath_tb();
    reg clk;
    reg [3:0] inr;
    reg [15:0] readBus;
    wire [15:0] outvalue;
    wire [15:0] instr;
    wire [9:0] pc_curr, pc_next;
    wire [15:0] alu_result;
    wire [1:0] SignOp, MuxC0, MuxC1, MuxC2, MuxC3, MuxC4, MuxC5;
    wire MovOp, RegW, MemW, MemR, enable;
    wire [2:0] BrOp;
    wire [3:0] ALUOp;
    wire [15:0] ExOut;
    wire [15:0] RO1, RO2, alu_b, WriteData, add1_r, add2_r, MovOut;
    wire [3:0] R1, R2, RD;
    reg reset;
    
    control_and_datapath CAD (clk, reset, inr, readBus, outvalue, instr, pc_curr, pc_next, alu_result, RegW, MemR, MemW, BrOp, ALUOp, MovOp, SignOp, MuxC0, MuxC1, MuxC2, MuxC3, MuxC4, MuxC5, ExOut, RO1, RO2, alu_b, WriteData, add1_r, add2_r, R1, R2, RD, MovOut, enable);
    
    initial
    begin
        $monitor("Clock: %d, Inr: %d, Outvalue: %d, Instrucion: %d, Current PC: %d, Next PC: %d, ALU Result: %d, RegW: %d, MemR: %d, MemW: %d, BrOp: %d, ALUOp: %d, MovOp: %d, SignOp: %d, MuxC0: %d, MuxC1: %d, MuxC2: %d, MuxC3: %d, MuxC4: %d, MuxC5: %d, ExOut: %d, RO1: %d, RO2: %d, ALU B: %d, WriteData: %d, add1_r: %d, add2_r: %d, R1: %d, R2: %d, RD: %d, MovOut: %d, Enable: %d", clk, inr, outvalue, instr, pc_curr, pc_next, alu_result, RegW, MemR, MemW, BrOp, ALUOp, MovOp, SignOp, MuxC0, MuxC1, MuxC2, MuxC3, MuxC4, MuxC5, ExOut, RO1, RO2, alu_b, WriteData, add1_r, add2_r, R1, R2, RD, MovOut, enable);
        clk = 0; reset = 0; inr = 4'b0101;
        #10; clk = 1;
        #10; clk = 0;
        #10; clk = 1; inr = 4'b0110;
        #10; clk = 0;
        #10; clk = 1; inr = 4'b0001;
        #10; clk = 0;
        #10; clk = 1; inr = 4'b0101;
        #10; clk = 0;
        #10; clk = 1; inr = 4'b0110;
        #10; clk = 0;
        #10; clk = 1; inr = 4'b0111;
        #10; clk = 0;
        #10; clk = 1; inr = 4'b1000;
        #10; clk = 0;
        #10; clk = 1; inr = 4'b1000;
        #10; clk = 0;
        #10; clk = 1; inr = 4'b0001;
        #10; clk = 0;
        #10; clk = 1; inr = 4'b0001;
        #10; clk = 0;
        #10; clk = 1; inr = 4'b0000;
        #10; clk = 0;
        #10; clk = 1; inr = 4'b0000;
        #10; clk = 0;
        #10; clk = 1; inr = 4'b0001;
        #10; clk = 0;
        #10; clk = 1; inr = 4'b0000;
        #10; clk = 0;
        #10; clk = 1; inr = 4'b0000;
        #10; clk = 0;
    end
endmodule
