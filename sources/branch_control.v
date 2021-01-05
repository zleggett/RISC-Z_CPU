`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2020 08:52:38 PM
// Design Name: 
// Module Name: branch_control
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


module branch_control(result, BrOp, neg, zero, muxc5);
    input [2:0] BrOp;
    input neg, zero, result;
    output reg [1:0] muxc5 = 0;
    
    always @ (BrOp, neg, zero)
    begin
        if (result)
            muxc5 = 0;
        else
        begin
            case(BrOp)
                3'b000: muxc5 = 2'b00;
                3'b001: muxc5 = 2'b10;
                3'b110: muxc5 = 2'b01;
                3'b010: muxc5 = (zero == 1'b1) ? 2'b10:2'b00;
                3'b011: muxc5 = (zero == 1'b1) ? 2'b00:2'b10;
                3'b100: muxc5 = (neg == 1'b1) ? 2'b00:2'b10;
                3'b101: muxc5 = (neg == 1'b1) ? 2'b10:2'b00;
            endcase
        end
    end
    endmodule
