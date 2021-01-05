`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2020 08:52:38 PM
// Design Name: 
// Module Name: control
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


module control(reset, op, r, ls, ad, RegW, MemR, MemW, enable, BrOp, ALUOp, MovOp, SignOp, MuxC0, MuxC1, MuxC2, MuxC3, MuxC4);
    input [3:0] op;
    input r, reset;
    input [1:0] ls, ad;
    output reg [1:0] SignOp = 0, MuxC0 = 0, MuxC1 = 0, MuxC2 = 0, MuxC3 = 0, MuxC4 = 0;
    output reg MovOp = 0, RegW = 0, MemW = 0, MemR = 0;
    output reg [2:0] BrOp = 0;
    output reg [3:0] ALUOp = 0;
    output reg enable = 1;
    
    always @ (op or r or ls or ad or reset)
    begin
        if (reset)
        begin
            SignOp = 0; MuxC0 = 0; MuxC1 = 0; MuxC2 = 0; MuxC3 = 0; MuxC4 = 0;
            MovOp = 0; RegW = 0; MemW = 0; MemR = 0;
            BrOp = 0; ALUOp = 0; enable = 1;
        end
        else
        begin
            case(op)
                4'b0000: begin
                            RegW = 0;
                            MemW = 0;
                            enable = 0;
                         end
                4'b0001: begin
                        RegW <= 1'b1;
                        MemR <= 1'b0;
                        MemW <= 1'b0;
                        BrOp <= 3'b000;
                        ALUOp <= 4'b0001;
                        MuxC0 <= 2'b00;
                        MuxC1 <= 2'b01;
                        MuxC2 <= 2'b00;
                        MuxC3 <= 2'b00;
                        MuxC4 <= 2'b00;
                      end
                4'b0010: begin
                        RegW <= 1'b1;
                        MemR <= 1'b0;
                        MemW <= 1'b0;
                        BrOp <= 3'b000;
                        ALUOp <= 4'b0010;
                        MuxC0 <= 2'b00;
                        MuxC1 <= 2'b01;
                        MuxC2 <= 2'b00;
                        MuxC3 <= 2'b00;
                        MuxC4 <= 2'b00;
                      end
                4'b0011: begin
                        RegW <= 1'b1;
                        MemR <= 1'b0;
                        MemW <= 1'b0;
                        BrOp <= 3'b000;
                        ALUOp <= 4'b0011;
                        MuxC0 <= 2'b00;
                        MuxC1 <= 2'b01;
                        MuxC2 <= 2'b00;
                        MuxC3 <= 2'b00;
                        MuxC4 <= 2'b00;
                      end
                4'b0100: begin
                        RegW <= 1'b1;
                        MemR <= 1'b0;
                        MemW <= 1'b0;
                        BrOp <= 3'b000;
                        ALUOp <= 4'b0100;
                        MuxC0 <= 2'b00;
                        MuxC1 <= 2'b01;
                        MuxC2 <= 2'b00;
                        MuxC3 <= 2'b00;
                        MuxC4 <= 2'b00;
                      end
                4'b0101: begin
                        RegW <= 1'b1;
                        MemR <= 1'b0;
                        MemW <= 1'b0;
                        BrOp <= 3'b000;
                        ALUOp <= 4'b0101;
                        MuxC0 <= 2'b00;
                        MuxC1 <= 2'b01;
                        MuxC2 <= 2'b00;
                        MuxC3 <= 2'b00;
                        MuxC4 <= 2'b00;
                      end
                4'b0110: begin
                        RegW <= 1'b1;
                        MemR <= 1'b0;
                        MemW <= 1'b0;
                        BrOp <= 3'b000;
                        ALUOp <= 4'b0001;
                        SignOp <= 2'b11;
                        MuxC0 <= 2'b01;
                        MuxC2 <= 2'b00;
                        MuxC3 <= 2'b01;
                        MuxC4 <= 2'b00;
                      end
                4'b0111: begin
                        RegW <= 1'b1;
                        MemR <= 1'b0;
                        MemW <= 1'b0;
                        BrOp <= 3'b000;
                        ALUOp <= 4'b0100;
                        MovOp <= 1'b0;
                        MuxC0 <= 2'b01;
                        MuxC2 <= 2'b00;
                        MuxC3 <= 2'b10;
                        MuxC4 <= 2'b00;
                      end
                4'b1000: begin
                        RegW <= 1'b1;
                        MemR <= 1'b0;
                        MemW <= 1'b0;
                        BrOp <= 3'b000;
                        ALUOp <= 4'b0100;
                        MovOp <= 1'b1;
                        MuxC0 <= 2'b01;
                        MuxC2 <= 2'b00;
                        MuxC3 <= 2'b10;
                        MuxC4 <= 2'b00;
                      end
                4'b1001: begin
                        if (r == 1'b0)
                        begin
                            RegW <= 1'b1;
                            MemR <= 1'b0;
                            MemW <= 1'b0;
                            BrOp <= 3'b001;
                            ALUOp <= 4'b0000;
                            SignOp <= 2'b00;
                            MuxC2 <= 2'b10;
                            MuxC4 <= 2'b10;
                        end
                        else if (r == 1'b1)
                        begin
                            RegW <= 1'b0;
                            MemR <= 1'b0;
                            MemW <= 1'b0;
                            BrOp <= 3'b110;
                            ALUOp <= 4'b0001;
                            MuxC0 <= 2'b10;
                            MuxC1 <= 2'b00;
                            MuxC3 <= 2'b00;
                        end
                      end
                4'b1010: begin
                        RegW <= 1'b0;
                        MemR <= 1'b0;
                        MemW <= 1'b0;
                        BrOp <= 3'b010;
                        ALUOp <= 4'b0101;
                        SignOp <= 2'b01;
                        MuxC0 <= 2'b00;
                        MuxC1 <= 2'b01;
                        MuxC3 <= 2'b00;
                      end
                4'b1011: begin
                        RegW <= 1'b0;
                        MemR <= 1'b0;
                        MemW <= 1'b0;
                        BrOp <= 3'b011;
                        ALUOp <= 4'b0101;
                        SignOp <= 2'b01;
                        MuxC0 <= 2'b00;
                        MuxC1 <= 2'b01;
                        MuxC3 <= 2'b00;
                      end
                4'b1100: begin
                        RegW <= 1'b1;
                        MemR <= 1'b0;
                        MemW <= 1'b0;
                        BrOp <= 3'b100;
                        ALUOp <= 4'b0101;
                        SignOp <= 2'b01;
                        MuxC0 <= 2'b00;
                        MuxC1 <= 2'b01;
                        MuxC3 <= 2'b00;
                      end
                4'b1101: begin
                        RegW <= 1'b0;
                        MemR <= 1'b0;
                        MemW <= 1'b0;
                        BrOp <= 3'b101;
                        ALUOp <= 4'b0101;
                        SignOp <= 2'b01;
                        MuxC0 <= 2'b00;
                        MuxC1 <= 2'b01;
                        MuxC3 <= 2'b00;
                      end
                4'b1110: begin
                        if (ls == 2'b10)
                        begin
                            RegW <= 1'b1;
                            MemR <= 1'b1;
                            MemW <= 1'b0;
                            BrOp <= 3'b000;
                            ALUOp <= 4'b0001;
                            MuxC0 <= 2'b00;
                            MuxC1 <= 2'b00;
                            MuxC2 <= 2'b00;
                            MuxC3 <= 2'b00;
                            MuxC4 <= 2'b01;
                        end
                        else if (ls == 2'b01)
                        begin
                            RegW <= 1'b0;
                            MemR <= 1'b0;
                            MemW <= 1'b1;
                            BrOp <= 3'b000;
                            ALUOp <= 4'b0000;
                            MuxC0 <= 2'b00;
                            MuxC1 <= 2'b11;
                            MuxC3 <= 2'b00;
                        end
                      end
                4'b1111: begin
                        if (ad == 2'b00)
                        begin
                            RegW <= 1'b1;
                            MemR <= 1'b0;
                            MemW <= 1'b0;
                            BrOp <= 3'b000;
                            ALUOp <= 4'b0110;
                            SignOp <= 2'b10;
                            MuxC0 <= 2'b00;
                            MuxC2 <= 2'b01;
                            MuxC3 <= 2'b01;
                            MuxC4 <= 2'b00;
                        end
                        else if (ad == 2'b10)
                        begin
                            RegW <= 1'b1;
                            MemR <= 1'b0;
                            MemW <= 1'b0;
                            BrOp <= 3'b000;
                            ALUOp <= 4'b0111;
                            SignOp <= 2'b10;
                            MuxC0 <= 2'b00;
                            MuxC2 <= 2'b01;
                            MuxC3 <= 2'b01;
                            MuxC4 <= 2'b00;
                        end
                        else if (ad == 2'b01)
                        begin
                            RegW <= 1'b1;
                            MemR <= 1'b0;
                            MemW <= 1'b0;
                            BrOp <= 3'b000;
                            ALUOp <= 4'b1000;
                            SignOp <= 2'b10;
                            MuxC0 <= 2'b00;
                            MuxC2 <= 2'b01;
                            MuxC3 <= 2'b01;
                            MuxC4 <= 2'b00;
                        end
                        else if (ad == 2'b11)
                        begin
                            RegW <= 1'b1;
                            MemR <= 1'b0;
                            MemW <= 1'b0;
                            BrOp <= 3'b000;
                            ALUOp <= 4'b1001;
                            SignOp <= 2'b10;
                            MuxC0 <= 2'b00;
                            MuxC2 <= 2'b01;
                            MuxC3 <= 2'b01;
                            MuxC4 <= 2'b00;
                        end
                      end
            endcase
        end     
    end
endmodule