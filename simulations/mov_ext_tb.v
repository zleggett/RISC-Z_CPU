`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2020 05:44:55 PM
// Design Name: 
// Module Name: mov_ext_tb
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


module mov_ext_tb();
    reg MovOp;
    reg [7:0] MovIn;
    wire [15:0] MovOut;
    
    mov_ext ME (MovOp, MovIn, MovOut);
    
    initial
    begin
        $monitor("MovOp: %d, MovIn: %d, MovOut: %d", MovOp, MovIn, MovOut);
        MovIn = 8'b11111111; MovOp = 0;
        #10; MovOp = 1;
        #10; MovIn = 1; MovOp = 0;
        #10; MovOp = 1;
    end
endmodule
