`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.12.2020 18:26:54
// Design Name: 
// Module Name: top_module
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


module topModule(input logic clk,input logic [4:0] buttons,input logic [15:0] inputInstruction,
output logic [15:0] nextInstruction,output logic [6:0] seg,output logic dp,
output logic [3:0] an);

    logic [4:0] count;
    logic memWrite;
    logic [3:0] addressMem;
    logic [3:0] addressSevSeg = 4'b0;
    logic [7:0] writeMemData, readMemData, readSevSegData;
    logic switchInstruction, reset, prevData, nextData, nextInstr; // buttons
    
    // set the button inputs and outputs
    debouncer inputInstrBtn( clk,  buttons[4], switchInstruction); // center
    debouncer resetBtn( clk,  buttons[3], reset);           // up
    debouncer prevDataBtn( clk, buttons[2], prevData);     // left
    debouncer nextDataBtn( clk,  buttons[1], nextData);     // right
    debouncer nextInstrBtn( clk,  buttons[0], nextInstr);   // down
    
    always_ff @( posedge clk, posedge reset)
    begin
        if ( reset)
            addressSevSeg <= 4'b0;
        else if ( prevData)
            addressSevSeg <= addressSevSeg - 1;
        else if ( nextData)
            addressSevSeg <= addressSevSeg + 1;
    end
    
    // create processor and memories
    singleCycleProcessor processor( clk, reset, nextInstr, switchInstruction, count, nextInstruction, inputInstruction, memWrite, addressMem, writeMemData, readMemData);
    instruction_memory instMem( count, nextInstruction);
    dataMemory dataMem( clk, reset, memWrite, addressMem, addressSevSeg, writeMemData, readMemData, readSevSegData);
    SevenSegmentDisplay display( clk, addressSevSeg, 4'b0, readSevSegData[7:4], readSevSegData[3:0], seg, dp, an);
endmodule
