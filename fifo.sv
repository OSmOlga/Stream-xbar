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
input logic s_valid,
input logic m_ready,

output logic [T_DATA_WIDTH - 1:0] data_out,
output logic m_valid,
output logic s_ready
    );

logic [T_DATA_WIDTH - 1:0] data_fifo [NUM_CELLS - 1:0];
logic [ADDR_WIDTH - 1:0] wr_pointer;
logic [ADDR_WIDTH - 1:0] rd_pointer;

//Initialization of signal wr_pointer
always_ff @(posedge clk)
if (~rst_n)
    begin
        wr_pointer <= 0;
    end
else if (s_valid && s_ready)
    begin
        wr_pointer <= wr_pointer + 1;
        data_fifo [wr_pointer] <= data_in;
    end

//Initialization of signal rd_pointer
               
always_ff @(posedge clk)
if (~rst_n)
    begin
        rd_pointer <= 0;
    end
else if (m_valid && m_ready)
    begin
        rd_pointer <= rd_pointer + 1;
        data_out <= data_fifo [rd_pointer];
    end
    
//initialization of signals s_ready and m_valid
logic [NUM_CELLS - 1:0] cnt;

always_ff @(posedge clk)
    begin
if (~rst_n)
    cnt <= '0; 
else if (s_valid && ~m_ready && cnt != NUM_CELLS - 1)
    cnt <= cnt + 1'd1;
else if (~s_valid && m_ready && cnt != 0)
    cnt <= cnt - 1'd1;
end

assign s_ready = ~(cnt == NUM_CELLS - 1);
assign m_valid = ~(cnt == 0);


endmodule
