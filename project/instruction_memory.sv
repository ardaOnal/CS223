`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.12.2020 17:02:00
// Design Name: 
// Module Name: instruction_memory
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


module instruction_memory(input logic [4:0] address, output logic [15:0] instruction);
    // This is a Read Only Memory that does multipication which is taken from the document
    always_comb
            case ( address)
                5'b00000: instruction = 16'b001_0_0000_0000_0000;
                5'b00001: instruction = 16'b001_0_0000_0001_0001;
                5'b00010: instruction = 16'b001_1_0010_00000000;
                5'b00011: instruction = 16'b001_1_1111_00000000;
                5'b00100: instruction = 16'b001_1_0100_00000001;
                5'b00101: instruction = 16'b101_01001_0010_0001;
                5'b00110: instruction = 16'b010_0_1111_1111_0000;
                5'b00111: instruction = 16'b010_0_0010_0010_0100;
                5'b01000: instruction = 16'b101_00101_0000_0000;
                5'b01001: instruction = 16'b000_0_0000_1111_1111;
            default: instruction = 16'b111_0000000000000;
            endcase
endmodule
