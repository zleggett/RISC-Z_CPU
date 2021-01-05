`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2020 04:26:29 PM
// Design Name: 
// Module Name: adder_tb
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


module adder_tb();
    reg [15:0] a;
    reg [15:0] b;
    wire [15:0] result;
    
    adder ADD (a, b, result);
    
    initial
    begin
        $monitor("Input A: %d, Input B: %d, Result: %d", a, b, result);
        a = 0; b =0;
        #10; a = 20; b = -10;
        #10; a = 13000; b = 20000;
        #10; a = 16000; b = 8000;
        #10; a = 42000; b = 69;
    end
endmodule
