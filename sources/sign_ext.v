`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2020 08:52:38 PM
// Design Name: 
// Module Name: sign_ext
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


module sign_ext(enable, reset, SignOp, In0, In1, In2, In3, ExOut);
    input [1:0] SignOp;
    input [9:0] In0;
    input [3:0] In1;
    input [5:0] In2;
    input [7:0] In3;
    output reg [15:0] ExOut;
    input enable, reset;
    
    always @ (SignOp or In0 or In1 or In2 or In3 or reset)
    begin
        if (reset)
            ExOut = 0;
        else
        begin
            if (enable)
            begin
                case (SignOp)
                    2'b00: ExOut = { {6{In0[9]}}, In0 };
                    2'b01: ExOut = { {12{In1[3]}}, In1 };
                    2'b10: ExOut = { {10{In2[5]}}, In2 };
                    2'b11: ExOut = { {8{In3[7]}}, In3 };
                endcase
            end
        end
    end
endmodule
