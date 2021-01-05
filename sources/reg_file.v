`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2020 03:51:17 PM
// Design Name: 
// Module Name: reg_file
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


module reg_file(enable, reset, clk, inr, R1, R2, RD, RegW, WriteData, RO1, RO2, outvalue);
    input [3:0] inr;
    input [3:0] R1 = 0;
    input [3:0] R2 = 0;
    input [3:0] RD = 0;
    input RegW;
    input [15:0] WriteData;
    output reg [15:0] RO1;
    output reg [15:0] RO2;
    output reg [15:0] outvalue;
    reg [15:0] regs [15:0];
    reg [15:0] temp;
    input clk, enable, reset;
    
    integer i;
    initial
    begin
        for (i=0;i<=15;i=i+1)
            regs[i] = 0;
    end
    
    always @ (reset)
    begin
        if (reset)
        begin
            regs[0] = 0;
            regs[1] = 0;
            regs[2] = 0;
            regs[3] = 0;
            regs[4] = 0;
            regs[5] = 0;
            regs[6] = 0;
            regs[7] = 0;
            regs[8] = 0;
            regs[9] = 0;
            regs[10] = 0;
            regs[11] = 0;
            regs[12] = 0;
            regs[13] = 0;
            regs[14] = 0;
            regs[15] = 0;
        end
    end
    
    always @ (posedge clk or inr or R1 or R2 or RD)
    begin
        if (enable)
        begin
            RO1 = regs[R1];
            RO2 = regs[R2];
            outvalue = regs[inr];
        end
    end
    
    always @ (RegW or WriteData or negedge clk)
    begin
        if (enable)
        begin
            if (RegW == 1 && clk == 0)
            begin
                regs[RD] = WriteData;
                outvalue = regs[inr];
            end
        end  
    end
endmodule
