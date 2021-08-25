`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.10.2020 17:10:08
// Design Name: 
// Module Name: two_to_four_decoder
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


module two_to_four_decoder( input logic a0, a1, output logic y0, y1, y2, y3);

    assign y0 = ~a0 & ~a1;
    assign y1 = a0  & ~a1;
    assign y2 = ~a0 & a1;
    assign y3 = a0 & a1;
    
endmodule
