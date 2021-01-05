`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2020 06:04:37 PM
// Design Name: 
// Module Name: alu_tb
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


module alu_tb();
    reg [3:0] ALUOp;
    reg [15:0] a;
    reg [15:0] b;
    wire [15:0] result;
    wire neg, zero, overflow;
    
    alu ALU1 (ALUOp, a, b, result, neg, zero, overflow);
    
    initial
    begin
        $monitor("ALUOp: %d, Input A: %d, Input B: %d, Result: %d, Negative: %d, Zero: %d, Overflow: %d", ALUOp, a, b, result, neg, zero, overflow); 
        ALUOp = 4'b0001; a = 0; b = 0;
        #10; a = 43; b = 25;
        #10; ALUOp = 4'b0010;
        #10; ALUOp = 4'b0011;
        #10; ALUOp = 4'b0100;
        #10; ALUOp = 4'b0101;
        #10; a = 16'b0111111111111111; b = 16'b0111111111111111; ALUOp = 4'b0001;
        #10; a = 16'b0111111111111111; b = 16'b1111111111111111; ALUOp = 4'b0101;
        #10; a = 200; b = 200; ALUOp = 4'b0101;
        #10; a = 60; b = 2; ALUOp = 4'b0110;
        #10; ALUOp = 4'b0111;
        #10; ALUOp = 4'b1000;
        #10; ALUOp = 4'b1001;
        #10; a = -60; b = 2; ALUOp = 4'b0110;
        #10; ALUOp = 4'b0111;
        #10; ALUOp = 4'b1000;
        #10; ALUOp = 4'b1001;
        #10; ALUOp = 4'b0000;
    end
endmodule
