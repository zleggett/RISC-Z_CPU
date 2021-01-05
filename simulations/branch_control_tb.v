`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2020 03:30:11 PM
// Design Name: 
// Module Name: branch_control_tb
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


module branch_control_tb();
    reg [2:0] BrOp;
    reg neg;
    reg zero;
    wire [1:0] muxc5;
    
    branch_control BRC (BrOp, neg, zero, muxc5);
    
    initial
    begin
    $monitor("BrOp: %d, Negative: %d, Zero: %d, MuxC5(output): %d", BrOp, neg, zero, muxc5);
    neg = 0; zero = 0; BrOp = 3'b000;
    #10; BrOp = 3'b001;
    #10; BrOp = 3'b110;
    #10; BrOp = 3'b010;
    #10; zero = 1; BrOp = 3'b010;
    #10; BrOp = 3'b011;
    #10; zero = 0; BrOp = 3'b011;
    #10; BrOp = 3'b100;
    #10; neg = 1; BrOp = 3'b100;
    #10; BrOp = 3'b101;
    #10; neg = 0; BrOp = 3'b101;
    end
endmodule
