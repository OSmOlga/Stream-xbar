`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.02.2024 17:57:59
// Design Name: 
// Module Name: Arbiter
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


module Arbiter#(
parameter T_DATA_WIDTH = 8,
S_DATA_COUNT = 2,
M_DATA_COUNT = 3,
localparam T_ID___WIDTH = $clog2(S_DATA_COUNT),
T_DEST_WIDTH = $clog2(M_DATA_COUNT)
)(
input logic clk,
input logic rst_n,
input logic [T_ID___WIDTH-1:0] m_id_o [M_DATA_COUNT-1:0],
input logic [T_DATA_WIDTH-1:0] s_data_i [S_DATA_COUNT-1:0],
input logic [S_DATA_COUNT-1:0] s_last_i,
output logic [T_DATA_WIDTH-1:0] m_data_o [M_DATA_COUNT-1:0],
output logic [M_DATA_COUNT-1:0] m_last_o
 );
endmodule
