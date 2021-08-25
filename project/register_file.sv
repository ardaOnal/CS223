`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.12.2020 16:57:03
// Design Name: 
// Module Name: register_file
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


module register_file(input logic clk, reset, writeEnable,
input logic [3:0] readAddress1, readAddress2, writeAddress, input logic [7:0] writeData, output logic [7:0] readData1, readData2);

    logic [7:0] register [15:0]; // 16x8 register module
    // This module is the same as memory module but name register file??
    // initialize data to 0
    initial begin
        register[0] = 8'b0;
        register[1] = 8'b0;
        register[2] = 8'b0;
        register[3] = 8'b0;
        register[4] = 8'b0;
        register[5] = 8'b0;
        register[6] = 8'b0;
        register[7] = 8'b0;
        register[8] = 8'b0;
        register[9] = 8'b0;
        register[10] = 8'b0;
        register[11] = 8'b0;
        register[12] = 8'b0;
        register[13] = 8'b0;
        register[14] = 8'b0;
        register[15] = 8'b0;
    end

    always_ff @( posedge clk, posedge reset)
        if ( reset) begin
            for ( int i = 0; i < 16; i++) begin
                register[i] = 8'b0;
            end
        end
        else if ( writeEnable)
            register[writeAddress] <= writeData;

    assign readData1 = register[readAddress1];
    assign readData2 = register[readAddress2];
endmodule
