`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2020 08:52:38 PM
// Design Name: 
// Module Name: pc
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


module pc(enable, reset, clk, in, out);
    input clk, enable, reset;
    input [15:0] in = 0;
    output reg [15:0] out;
    reg first;
    reg [15:0] temp;
    
    initial
    begin
        first = 1;
    end
    
    always @ (posedge clk)
    begin
        if (reset)
            first = 1;
        else
        begin
            if (enable)
            begin
                if (first == 1)
                begin
                    out = 0;
                    first = 0;
                    //temp = in;
                end
                else    
                    //out = in;
                    out = temp;
                    //temp = in;
                end
        end
    end
    
    always @ (in)
    begin
        if (enable)
            temp = in;
    end
endmodule
