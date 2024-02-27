`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.02.2024 16:00:40
// Design Name: 
// Module Name: fifo
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


module fifo #(
parameter T_DATA_WIDTH = 8,
ADDR_WIDTH = 4,
NUM_CELLS = 2**(ADDR_WIDTH)
)(
input logic clk,
input logic rst_n,
input logic [T_DATA_WIDTH - 1:0] data_in,
input logic wr_en,
input logic rd_en,
output logic [T_DATA_WIDTH - 1:0] data_out,
output logic empty,
output logic [NUM_CELLS:0] full
    );


endmodule
