`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.12.2020 17:17:18
// Design Name: 
// Module Name: datapath_module
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


module datapath_module(input logic clk, reset, loadProgramCount,
output logic [4:0] outputCount,input logic [15:0] instruction,input logic address, data, regWriteEnable, 
memWriteEnable, memToReg, jumpEnable, stopEnable,input logic [1:0] aluOp,output logic equals,
output logic [3:0] addressMem,output logic [7:0] writeMemData,input logic [7:0] readMemData);
    
    logic [4:0] countTmp;
    logic [7:0] regData, readReg1, readReg2;
    logic [7:0] sum;
    logic [3:0] regAddr;
    logic [31:0] rom;
    
    always_ff @( posedge clk, posedge reset)
        if (reset) outputCount <= 5'b0000;
        else if ( (loadProgramCount && ~stopEnable) || jumpEnable) outputCount <= countTmp;

    assign countTmp = jumpEnable ? instruction[12:8] : (outputCount + 1);
    
    register_file registerfile( clk, reset, regWriteEnable, instruction[7:4], instruction[3:0], regAddr, regData,
                     readReg1, readReg2);
    assign regAddr = address ? instruction[11:8] : instruction[7:4];
    assign regData = data ? instruction[7:0] : ( memToReg ? readMemData : sum);
    
    
    alu ArithmeticLogicUnit( aluOp, readReg1, readReg2, sum, equals);
    assign addressMem = memWriteEnable ? (address ? instruction[11:8] : instruction[7:4]) : instruction[3:0];
    assign writeMemData = data ? instruction[7:0] : readReg2;
endmodule
