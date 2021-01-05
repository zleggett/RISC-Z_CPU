`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2020 08:52:38 PM
// Design Name: 
// Module Name: mux_4to1
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


module mux_4to1(enable, control, a, b, c, d, out);
    input [1:0] control;
    input [15:0] a, b, c, d;
    output reg [15:0] out;
    input enable;
    
    always @ (control or a or b or c or d) 
    begin
        if (enable)
        begin
            case (control)
                2'b00: out = a;
                2'b01: out = b;
                2'b10: out = c;
                2'b11: out = d;
            endcase
        end
    end
endmodule
