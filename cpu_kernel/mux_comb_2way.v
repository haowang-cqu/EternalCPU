`timescale 1ns/1ps

//combinational mux
module mux_comb_2way #(
    parameter DRIWIDTH = 4, // width of the channel from master to slave
    parameter RSPWIDTH = 4  // width of the channel from slave to master
) 
(
    input sel, //way select signal 0 for chan1 and 1 for chan2
    input [DRIWIDTH-1:0] driveChan1, // driving channel from master1
    input [DRIWIDTH-1:0] driveChan2, // driving channel from master2
    output [DRIWIDTH-1:0] driveChanSlave, // driving channel to slave
    output [RSPWIDTH-1:0] respChan1, // response channel to master1
    output [RSPWIDTH-1:0] respChan2, // response channel to master2
    input [RSPWIDTH-1:0] respChanSlave // response channel from slave
);
    assign driveChanSlave = sel ? driveChan2 : driveChan1;
    assign respChan1 = {RSPWIDTH{~sel}}&respChanSlave;
    assign respChan2 = {RSPWIDTH{sel}}&respChanSlave;
endmodule