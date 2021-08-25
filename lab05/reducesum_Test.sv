`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.12.2020 14:48:50
// Design Name: 
// Module Name: reducesum_Test
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


`timescale 1ns / 1ps

module reducesum_Test(input logic clk, enable, input logic [7:0] number, output logic [11:0] sum, output logic [3:0] readAddress );
        logic [4:0] count = 5'b0;
        localparam constant = 5'b10000;
        logic [11:0] Sum = 12'b0;
        typedef enum logic [1:0] {S0, S1, S2, S3} statetype; 
        statetype [1:0] state, nextState;


        // register 
        always_ff @(posedge clk)
        begin 
             state <= nextState; 
        end 

        // state transition
        always_ff @ (posedge clk)
        case(state) 
            S0: 
            begin 
                if (enable)
                    nextState <= S1;
                else
                    nextState <= S0; 
            end 

            S1: 
            begin 
                count <=  4'b0;
                Sum <= 12'b0;
                nextState <= S2;
            end 

            S2:
            begin
                if (count != constant) begin
                    Sum = Sum + number;
                    count = count + 1;
                    nextState <= S2;
                    end
                else 
                    nextState <= S3;
            end 

            S3: 
            begin 
                //Sum = Sum + number; 
                sum = Sum;
                nextState <= S0;
            end 
            default:
                nextState <= S0;
         endcase
         assign readAddress = count;
endmodule