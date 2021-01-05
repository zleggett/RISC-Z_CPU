`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2020 08:52:38 PM
// Design Name: 
// Module Name: mov_ext
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


module mov_ext(enable, reset, MovOp, MovIn, MovOut);
    input MovOp;
    input [7:0] MovIn;
    output reg [15:0] MovOut;
    input enable, reset;
    
    always @ (MovOp or MovIn)
    begin
        if (reset)
            MovOut = 0;
        else
        begin
            if (enable)
            begin
                if (MovOp == 0)
                    MovOut = { MovIn, {8{1'b0}} };
                else if (MovOp == 1)
                    MovOut = { {8{1'b0}}, MovIn };
            end
        end
    end
endmodule
