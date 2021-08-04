`timescale 1ns / 1ps
`include "defines.vh"
`include "alu_defines.vh"

module divider_32clock(
    input  logic         clk,
    input  logic         rst,

    input  logic [5:0]   op,

    input  logic [31:0]  opdata1_i,
    input  logic [31:0]  opdata2_i,

    input  logic         annul_i, // zero

    output logic [63:0]  result_o,
    output logic         ready_o,

    input  logic         start_i
);
    logic                signed_div_op;
    logic [32:0]         div_temp;
    logic [5:0]          count;
    logic [64:0]         dividend;
    logic [31:0]         divisor;
    
    logic [31:0]         op1_temp;
    logic [31:0]         op2_temp;

    logic [1:0]          STATE;

    localparam DivFree   = 2'b00;
    localparam DivByZero = 2'b01;
    localparam DivOn     = 2'b10;
    localparam DivEnd    = 2'b11;

    localparam DivResultReady    = 1'b1;
    localparam DivResultNotReady = 1'b0;
    localparam DivStart          = 1'b1;
    localparam DivStop           = 1'b0;

    assign signed_div_op = (op == `DIV_CONTROL) ?1'b1:
                          (op == `DIVU_CONTROL)?1'b0:1'bx;

    assign div_temp = {1'b0,dividend[63:32]} - {1'b0,divisor};

    always @ (posedge clk) 
    begin
        if (rst == 1'b1) 
        begin
            STATE    <= DivFree;
            ready_o  <= DivResultNotReady;
            result_o <= 64'b0;
        end else 
        begin
            case (STATE)
                DivFree:
                begin
                    if(start_i == DivStart && annul_i == 1'b0) 
                    begin
                        if(opdata2_i == 32'b0) 
                        begin
                            STATE <= DivByZero;
                        end else 
                        begin
                            STATE <= DivOn;
                            count <= 6'b000000;
                            if(signed_div_op == 1'b1 && opdata1_i[31] == 1'b1 ) 
                            begin
                                op1_temp = ~opdata1_i + 1;
                            end else 
                            begin
                                op1_temp = opdata1_i;
                            end
                            if(signed_div_op == 1'b1 && opdata2_i[31] == 1'b1 ) 
                            begin
                                op2_temp = ~opdata2_i + 1;
                            end else 
                            begin
                                op2_temp = opdata2_i;
                            end
                            dividend <= {`ZeroWord,`ZeroWord};
                            dividend[32:1] <= op1_temp;
                            divisor <= op2_temp;
                            opdata1 <= opdata1_i;
                            opdata2 <= opdata2_i;
                        end
                    end else 
                    begin
                        ready_o  <= DivResultNotReady;
                        result_o <= {`ZeroWord,`ZeroWord};
                    end
                end

                `DivByZero:
                begin
                    dividend <= {`ZeroWord,`ZeroWord};
                    STATE <= DivEnd;
                end

                `DivOn:
                begin
                    if(annul_i == 1'b0) 
                    begin
                        if(count != 6'b100000) 
                        begin
                            if(div_temp[32] == 1'b1) 
                            begin
                                dividend <= {dividend[63:0] , 1'b0};
                            end else 
                            begin
                                dividend <= {div_temp[31:0] , dividend[31:0] , 1'b1};
                            end
                            count <= count + 1;
                        end else 
                        begin
                            if((signed_div_op == 1'b1) && ((opdata1[31] ^ opdata2[31]) == 1'b1)) 
                            begin
                                dividend[31:0] <= (~dividend[31:0] + 1);
                            end
                            if((signed_div_op == 1'b1) && ((opdata1[31] ^ dividend[64]) == 1'b1)) 
                            begin
                                dividend[64:33] <= (~dividend[64:33] + 1);
                            end
                            STATE <= DivEnd;
                            count <= 6'b000000;
                        end
                    end else 
                    begin
                        STATE <= DivFree;
                    end
                end

                DivEnd:
                begin     
                    result_o <= {dividend[64:33], dividend[31:0]};
                    ready_o <= `DivResultReady;
                    if(start_i == `DivStop) 
                    begin
                        STATE <= DivFree;
                        ready_o <= DivResultNotReady;
                        result_o <= {`ZeroWord,`ZeroWord};
                    end
                end
            endcase
        end
    end
endmodule
