`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.12.2020 17:40:36
// Design Name: 
// Module Name: singleCycleProcessor
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


module singleCycleProcessor(input logic clk, reset, nextInstruction, inputInstr,
output logic [4:0] outcnt,input logic [15:0] instrInMem, inputInstruction,
output logic memWriteEnable,output logic [3:0] addressMem,
output logic [7:0] writeMemData,input logic [7:0] readMemData);
    
    logic [15:0] instruction;         
    logic equals, stopEnable,  data, regWriteEnable,addr, memToReg, jumpEnable, loadcnt;
    logic [1:0] aluOp;
    
    always_ff @( posedge clk, posedge reset) begin
        if ( reset)
            instruction <= 16'b011_0000000000000;
        else if ( ~stopEnable) begin
            if ( nextInstruction)
                instruction <= instrInMem;
            else if ( inputInstr)
                instruction <= inputInstruction;
            else
                instruction <= 16'b011_0000000000000;
        end
    end
    
    // Calling the controller module
    controller_module controller( clk, reset, nextInstruction, inputInstr, instruction[15:13], instruction[12], equals, loadcnt,
                           addr, data, regWriteEnable, memWriteEnable, memToReg, jumpEnable, stopEnable, aluOp);
    // Using the control outputs from the controller in the datapath
    datapath_module datapath( clk, reset, loadcnt, outcnt, instruction,
                       addr, data, regWriteEnable, memWriteEnable, memToReg, jumpEnable, stopEnable, aluOp,
                       equals, addressMem, writeMemData, readMemData);
endmodule