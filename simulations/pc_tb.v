`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2020 05:51:56 PM
// Design Name: 
// Module Name: pc_tb
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


module pc_tb();
    reg clk;
    reg [9:0] in;
    wire [9:0] out;
    
    pc PC1 (clk, in, out);
    
    initial
    begin
        $monitor("Clock: %d, In: %d, Out: %d", clk, in, out);
        in = 10'b1010101010; clk = 0;
        #10; in = 10'b1111111111;
        #10; in = 0;
    end
    
    always
    begin
        #5; clk = ~clk;
    end
endmodule
