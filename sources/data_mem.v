`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2020 06:09:49 PM
// Design Name: 
// Module Name: data_mem
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


module data_mem(MemW, MemR, MemIn, WriteAddr, MemOut);
    input MemW, MemR;
    input [15:0] MemIn, WriteAddr;
    output reg [15:0] MemOut;
    reg [15:0] data [999:0];
    
    integer i;
    initial
    begin
       for (i=0;i<=999;i=i+1)
            data[i] = 0; 
    end
    
    always @ (MemW or MemR or MemIn or WriteAddr)
    begin
        if(MemW)
            data[WriteAddr[9:0]] <= MemIn;
        if(MemR)
            MemOut <= data[MemIn[9:0]];
        else
            MemOut <= 0;
    end
endmodule
