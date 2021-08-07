`timescale 1ns / 1ps

`include "cp0_defines.vh"

module exception(
    input  logic         rst,
    input  logic [7:0]   except,
    input  logic         adel,
    input  logic         ades,
    input  logic [31:0]  CP0_status,
    input  logic [31:0]  CP0_cause,
    output logic [31:0]  exception_type
);
    assign exception_type = 
        ( (CP0_cause[`CP0_CAUSE_IPS] & CP0_status[`CP0_CAUSE_IPS]) && CP0_status[`CP0_STATUS_EXL] == 1'b0 && CP0_status[`CP0_STATUS_IE] == 1'b1) ? `EXC_INT : 
        (except[7] || adel) ? `EXC_ADEL : 
        (ades)              ? `EXC_ADES :
        (except[6])         ? `EXC_SYSCALL : 
        (except[5])         ? `EXC_BREAK :
        (except[4])         ? `EXC_ERET : 
        (except[3])         ? `EXC_RI : 
        (except[2])         ? `EXC_OVF : 32'd0;
endmodule