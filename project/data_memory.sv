`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.12.2020 16:51:49
// Design Name: 
// Module Name: data_memory
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


module dataMemory(input logic clk, reset, writeEnable, input logic [3:0] readAddress1, readAddress2, 
input logic [7:0] writeData,output logic [7:0] readData1, readData2);

    logic [7:0] memory [15:0]; // 16x8 memory module

    // initialize data to 0
    initial begin
        memory[0] = 8'b0;
        memory[1] = 8'b0;
        memory[2] = 8'b0;
        memory[3] = 8'b0;
        memory[4] = 8'b0;
        memory[5] = 8'b0;
        memory[6] = 8'b0;
        memory[7] = 8'b0;
        memory[8] = 8'b0;
        memory[9] = 8'b0;
        memory[10] = 8'b0;
        memory[11] = 8'b0;
        memory[12] = 8'b0;
        memory[13] = 8'b0;
        memory[14] = 8'b0;
        memory[15] = 8'b0;
    end

    always_ff @( posedge clk, posedge reset)
        if ( reset) begin
            for ( int i = 0; i < 16; i++) begin
                memory[i] = 8'b0;
            end
        end
        else if ( writeEnable)
            memory[readAddress1] <= writeData;

    assign readData1 = memory[readAddress1];
    assign readData2 = memory[readAddress2];
endmodule
