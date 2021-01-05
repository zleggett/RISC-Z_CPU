`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2020 08:52:38 PM
// Design Name: 
// Module Name: adder
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


module adder(enable, reset, a, b, y);
    input reset;
    input signed [15:0] a;
    input signed [15:0] b;
    output reg [15:0] y;
    input enable;
    
    always @ (a or b or reset)
    begin
        if (reset)
            y = 0;
        else
        begin
            if (enable)
                y = a + b;
        end
    end
endmodule
