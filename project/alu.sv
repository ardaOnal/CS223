`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.12.2020 17:10:27
// Design Name: 
// Module Name: alu
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


module alu(input logic [1:0] aluOP, input logic [7:0] data1, data2, output logic [7:0] sum, output logic equals);      
    always_comb
        case ( aluOP)
            2'b10: // branch if data1 and data2 are equal
                begin 
                    if ( data1 == data2) 
                        equals = 1; 
                    sum = 8'b0; 
                end 
            2'b11: // add
                begin 
                    equals = 0; 
                    sum = data1 + data2; 
                end 
            default: begin equals = 0;  sum = 8'b0; end
        endcase
endmodule
