`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.12.2020 16:29:49
// Design Name: 
// Module Name: controller_module
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


module controller_module(input logic clk, reset, insMem, inputInstr,
input logic [2:0] opcode,input logic immediateBit, equals,output logic outcnt, 
addr, data, regWriteEnable, memWriteEnable, memToReg, jumpEnable, stopEnable,output logic [1:0] aluOp);
    logic [8:0] controlOutputs; 
    logic [8:0] tmpOut = 9'b0; 
    assign {addr, data, regWriteEnable, memWriteEnable, memToReg, stopEnable, aluOp} = controlOutputs;
    
    always_comb
        case ( opcode)
            4'b010: controlOutputs = 9'b10100011; // add
            4'b101: controlOutputs = 9'b00000010; // branch if equals
            4'b111: controlOutputs = 9'b00000100; // stop (wait)
            default: case ( {opcode, immediateBit})
                4'b000_0: controlOutputs = 9'b00010000; // store from reg
                4'b000_1: controlOutputs = 9'b11010000; // store to mem
                4'b001_0: controlOutputs = 9'b00101000; // load from mem to reg
                4'b001_1: controlOutputs = 9'b11100000; // load to reg
                default: controlOutputs = 9'b00000000; // does nothing
            endcase
        endcase
    assign outcnt = insMem;
    assign jumpEnable = equals;
endmodule
