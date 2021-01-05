`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2020 05:27:22 PM
// Design Name: 
// Module Name: sign_ext_tb
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


module sign_ext_tb();
    reg [1:0] SignOp;
    reg [9:0] In0;
    reg [3:0] In1;
    reg [5:0] In2;
    reg [7:0] In3;
    wire [15:0] ExOut;
    
    sign_ext SE (SignOp, In0, In1, In2, In3, ExOut);
    
    initial
    begin
        $monitor("SignOp: %d, In0: %d, In1: %d, In2: %d, In3: %d, ExOut: %d", SignOp, In0, In1, In2, In3, ExOut);
        In0 = 10'b0010111010; In1 = 4'b0110; In2 = 6'b001101; In3 = 8'b00100101; SignOp = 0;
        #10; SignOp = 1;
        #10; SignOp = 2;
        #10; SignOp = 3;
        #10; In0 = 10'b1010111010; In1 = 4'b1110; In2 = 6'b101101; In3 = 8'b10100101; SignOp = 0;
        #10; SignOp = 1;
        #10; SignOp = 2;
        #10; SignOp = 3;
    end
endmodule
