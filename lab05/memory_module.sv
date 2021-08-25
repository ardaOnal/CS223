`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.11.2020 15:46:16
// Design Name: 
// Module Name: memory_module
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


module memory_module(input logic clk,writeEnable,input logic [7:0] writeData,input logic [3:0] writeAdress, input logic [3:0] readAdress1, input logic [3:0] readAdress2,  output logic [7:0] readData1, output logic [7:0] readData2);
    logic [7:0] RAM[15:0]; // 16x8 memory module
    
    always_ff @(posedge clk)
    begin
        if ( writeEnable)
            RAM[writeAdress] <= writeData;
    end  
    
    assign readData1 = RAM[readAdress1]; //Assigning the values in the speciced addresses to outputs
    assign readData2 = RAM[readAdress2];
endmodule
