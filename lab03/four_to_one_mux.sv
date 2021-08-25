`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.10.2020 17:35:13
// Design Name: 
// Module Name: four_to_one_mux
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


module four_to_one_mux(input logic [3:0]d,[1:0]s, output logic y);

assign y = s[1] ? (s[0] ? d[3] : d[2]) : ( s[0] ? d[1] : d[0]); 

endmodule
