`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2020 04:00:00 PM
// Design Name: 
// Module Name: reg_file_tb
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


module reg_file_tb();
    reg [3:0] R1;
    reg [3:0] R2;
    reg [3:0] RD;
    reg RegW;
    reg [15:0] WriteData;
    wire [15:0] RO1;
    wire [15:0] RO2;
    
    reg_file REG (R1, R2, RD, RegW, WriteData, RO1, RO2);
    
    initial
    begin
        $monitor("R1: %d, R2: %d, RD: %d, RegW: %d, WriteData: %d, RO1: %d, RO2: %d", R1, R2, RD, RegW, WriteData, RO1, RO2);
        RegW = 0; R1 = 0; R2 = 1;
        #10;
        RegW = 1; RD = 0; WriteData = 0; R1 = 0; R2 = 1;
        #10; RD = 1; WriteData = 1;
        #10; RD = 2; WriteData = 2;
        #10; RD = 3; WriteData = 3;
        #10; RD = 4; WriteData = 4;
        #10; RD = 5; WriteData = 5;
        #10; RD = 6; WriteData = 6;
        #10; RD = 7; WriteData = 7;
        #10; RD = 8; WriteData = 8;
        #10; RD = 9; WriteData = 9;
        #10; RD = 10; WriteData = 10;
        #10; RD = 11; WriteData = 11;
        #10; RD = 12; WriteData = 12;
        #10; RD = 13; WriteData = 13;
        #10; RD = 14; WriteData = 14;
        #10; RD = 15; WriteData = 15;
        #10; RegW = 0; R1 = 0; R2 = 1;
        #10; R1 = 2; R2 = 3;
        #10; R1 = 4; R2 = 5;
        #10; R1 = 6; R2 = 7;
        #10; R1 = 8; R2 = 9;
        #10; R1 = 10; R2 = 11;
        #10; R1 = 12; R2 = 13;
        #10; R1 = 14; R2 = 15;
    end
endmodule
