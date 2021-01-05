`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2020 08:52:38 PM
// Design Name: 
// Module Name: alu
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


module alu(enable, reset, ALUOp, a, b, r, n, z, o);
    input [3:0] ALUOp;
    input signed [15:0] a;
    input signed [15:0] b;
    output reg [15:0] r;
    output reg n, z, o;
    input enable, reset;
    
    always @*
    begin
        if (reset)
            r = 0;
        else
        begin
            if (enable)
            begin
                n = 0;
                z = 0;
                o = 0;
                case (ALUOp)
                    4'b0000: r = a;
                    4'b0001: begin
                                r = a + b; o = (a[15] ^ b[15]) ? 0:(r[15] ^ a[15]);
                             end
                    4'b0010: r = a & b;
                    4'b0011: r = ~(a & b);
                    4'b0100: r = a | b;
                    4'b0101: begin
                                r = a - b; o = (a[15] ^ b[15]) ? (r[15] ~^ b[15]):0;
                             end
                    4'b0110: r = a << b;
                    4'b0111: r = a <<< b;
                    4'b1000: r = a >> b;
                    4'b1001: r = a >>> b;
                    default: r = 0;
                endcase
                n = (r[15] == 1'b1) ? 1:0;
                z = (r == 0) ? 1:0;
            end
        end
    end
endmodule
