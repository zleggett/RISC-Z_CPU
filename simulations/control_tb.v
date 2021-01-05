`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2020 03:06:10 PM
// Design Name: 
// Module Name: control_tb
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


module control_tb();
    reg [3:0] op;
    reg r;
    reg [1:0] ls, ad;
    wire [1:0] SignOp, MuxC0, MuxC1, MuxC2, MuxC3, MuxC4;
    wire MovOp, RegW, MemW, MemR;
    wire [2:0] BrOp;
    wire [3:0] ALUOp;
    
    control CON (op, r, ls, ad, RegW, MemR, MemW, BrOp, ALUOp, MovOp, SignOp, MuxC0, MuxC1, MuxC2, MuxC3, MuxC4);
    
    initial
    begin
        $monitor("Opcode: %d, R Field: %d, LS Field: %d, AD Field: %d, RegW: %d, MemR: %d, MemW: %d, BrOp: %d, ALUOp: %d, MovOp: %d, SignOp: %d, MuxC0: %d, MuxC1: %d, MuxC2: %d, MuxC3: %d, MuxC4: %d", op, r, ls, ad, RegW, MemR, MemW, BrOp, ALUOp, MovOp, SignOp, MuxC0, MuxC1, MuxC2, MuxC3, MuxC4);
        op = 4'b0001; r = 0; ls = 0; ad = 0;
        #10; op = 4'b0010;
        #10; op = 4'b0011;
        #10; op = 4'b0100;
        #10; op = 4'b0101;
        #10; op = 4'b0110;
        #10; op = 4'b0111;
        #10; op = 4'b1000;
        #10; op = 4'b1001;
        #10; r = 1; op = 4'b1001;
        #10; op = 4'b1010;
        #10; op = 4'b1011;
        #10; op = 4'b1100;
        #10; op = 4'b1101;
        #10; ls = 2'b10; op = 4'b1110;
        #10; ls = 2'b01; op = 4'b1110;
        #10; op = 4'b1111;
        #10; ad = 2'b10; op = 4'b1111;
        #10; ad = 2'b01; op = 4'b1111;
        #10; ad = 2'b11; op = 4'b1111;
        #10; op = 4'b0000;
    end
endmodule
