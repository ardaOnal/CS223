`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.10.2020 21:56:32
// Design Name: 
// Module Name: functionF
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


module functionF(input logic a,b,c,d, output logic y);
    
    logic dnot;
    not inverter(dnot,d);
    eight_to_one_mux mux8({d, 1'b0, 1'b1, dnot, d, dnot, d, 1'b1}, {a, b, c}, y);
    
endmodule
