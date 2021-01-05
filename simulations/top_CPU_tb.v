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
    reg reset;
    
   top_CPU TOP (clk, reset, inr, outvalue);
    
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