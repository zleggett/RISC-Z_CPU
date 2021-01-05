`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2020 05:09:57 PM
// Design Name: 
// Module Name: mux_4to1_tb
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


module mux_4to1_tb();
    reg [1:0] control;
    reg [15:0] a;
    reg [15:0] b;
    reg [15:0] c;
    reg [15:0] d;
    wire [15:0] out;
    
    mux_4to1 M1 (control, a, b, c, d, out);
    
    initial
    begin
        $monitor("Control: %d, Input A: %d, Input B: %d, Input C: %d, Input D: %d, Output: %d", control, a, b, c, d, out);
        a = 4'b0001; b = 2; c = 3; d = 4; control = 0;
        #10; control = 1;
        #10; control = 2;
        #10; control = 3;
    end
endmodule
