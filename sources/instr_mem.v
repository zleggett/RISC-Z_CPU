`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2020 06:09:49 PM
// Design Name: 
// Module Name: instr_mem
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


module instr_mem(enable, pc, out);
    input [9:0] pc;
    output reg [15:0] out;
    reg [15:0] instructions [999:0];
    input enable;
    
    initial
    begin
        $readmemb("instructions.mem", instructions);
    end
    
    always @ (pc)
    begin
        if (enable)
            out = instructions[pc];
    end
endmodule
