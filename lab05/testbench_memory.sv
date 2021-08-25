`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.11.2020 18:54:27
// Design Name: 
// Module Name: testbench_memory
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


module testbench_memory();
    logic clk, writeEnable;
    logic [3:0] writeAdress;
    logic [7:0] writeData;
    logic [3:0] readAdress1;
    logic [3:0] readAdress2;
    logic [7:0] readData1;
    logic [7:0] readData2;
    
    memory_module dut( clk,writeEnable,writeData,writeAdress,readAdress1,readAdress2,readData1,readData2);
    
    always
        begin
            clk = 1; #1;
            clk = 0; #1;
        end
    
    initial begin
        writeEnable = 1;
        writeAdress = 4'b0;
        writeData = 8'b0;
        readAdress1 = 4'b0;
        readAdress2 = 4'b0;
        for ( int i  = 4'b0; i <= 4'b1111; i++) begin
            #10;
            writeAdress = i;
            writeData = writeData + i;
            
            readAdress1 = i;
            readAdress2 = i;
            #10;
        end
     end
endmodule
