`timescale 1ns / 1ps

`include "defines.vh"
`include "id_defines.vh"

module instr_decode(

	input  logic        id_stall_i,
	input  logic [31:0] id_instr_i,

	output logic       branch_flag_o,
	output logic       jump_flag_o,

	output logic       jal_flag_o,
	output logic       jr_flag_o,
	output logic       bal_flag_o,
	output logic       jalr_flag_o,

	output logic [5:0]  alucontrol_o,
	output logic [1:0]  whilo_o,
	output logic        invalid_o,

	output logic       use_imm_o,
	output logic       regdst_o,
	output logic       wreg_o,
	output logic       wcp0_o,

	output logic       rmem_o,
	output logic       wmem_o,
	output logic       memen_o,
	output logic [3:0] tlbop_o,
	output logic [2:0]  cp0_sel_o
    );

    logic  [3:0] aluop;

	logic  [4:0]  rt,rs,rd;
	logic  [5:0]  op,func;
	logic  [19:0] controls;

	assign op   =   id_instr_i[31:26];
	assign rs   =   id_instr_i[25:21];
	assign rt   =   id_instr_i[20:16];
	assign rd   =   id_instr_i[15:11];
	assign func =   id_instr_i[5:0];
	assign cp0_sel_o = id_instr_i[2:0];

	assign wcp0_o=((op==`SPECIAL3_INST)&(rs==`MTC0))?1:0;

	assign {wreg_o,regdst_o,use_imm_o,branch_flag_o,wmem_o,rmem_o,jump_flag_o,jal_flag_o,jr_flag_o,bal_flag_o,jalr_flag_o,alucontrol_o,memen_o,whilo_o} = controls;

	always_comb begin
		invalid_o = 0;
		controls <= {11'b0_0_0_0_0_0_0_0_0_0_0,6'b00_0000, 3'b000};
		tlbop_o <= 4'd0;
		if (~id_stall_i) begin
			case (op)
			`R_TYPE:case (func)

				//JR and JALR instrs
				`JR:  controls<=    `JR_DECODE;
				`JALR:controls<=    `JALR_DECODE;

				// data_move instrs
				`MFHI:controls <=   `MFHI_DECODE;
				`MFLO:controls <=   `MFLO_DECODE;
				`MTHI:controls <=   `MTHI_DECODE;
				`MTLO:controls <=   `MTLO_DECODE;	

				// mul and div instrs
				`MULTU:controls <=  `MULTU_DECODE;
				`MULT:controls <=   `MULT_DECODE;
				`DIVU:controls <=   `DIVU_DECODE;
				`DIV:controls <=    `DIV_DECODE;

				// R_TYPE Logic operation instrs
				`AND: controls <= `AND_DECODE;
                		`OR: controls <=  `OR_DECODE;
                		`XOR: controls <= `XOR_DECODE;
                		`NOR: controls <= `NOR_DECODE;
                		`ADD: controls <= `ADD_DECODE;
                		`ADDU: controls <=`ADDU_DECODE;
                		`SUB: controls <= `SUB_DECODE;
                		`SUBU: controls <=`SUBU_DECODE;
                		`SLT: controls <= `SLT_DECODE;
                		`SLTU: controls <=`SLTU_DECODE;
                		`SLL: controls <= `SLL_DECODE;
				`SRL: controls <= `SRL_DECODE;
                		`SRA: controls <= `SRA_DECODE;
                		`SLLV: controls <=`SLLV_DECODE;
                		`SRLV: controls <=`SRLV_DECODE;
                		`SRAV: controls <=`SRAV_DECODE;

				// Privileged instrs
				`BREAK:controls <=`BREAK_DECODE;
				`SYSCALL:controls <=`SYSCALL_DECODE;
				`SYNC:	controls <= `NOP_DECODE; // SYNC as NOP
				default:invalid_o = 1;
			endcase

			`J:controls <= `J_DECODE;
			`JAL:controls<=`JAL_DECODE;

			`BEQ:controls<= `BEQ_DECODE;
			`BNE:controls<= `BNE_DECODE;
			`BGTZ:controls<=`BGTZ_DECODE;
			`BLEZ:controls<=`BLEZ_DECODE;			
			`REGIMM_INST:case(rt)
				`BLTZ:controls<=  `BLTZ_DECODE;
				`BLTZAL:controls<=`BLTZAL_DECODE;
				`BGEZ:controls<=  `BGEZ_DECODE;
				`BGEZAL:controls<=`BGEZAL_DECODE;
				default:invalid_o = 1;//illegal op
				endcase

			`ANDI: controls <= `ANDI_DECODE;
			`XORI: controls <= `XORI_DECODE;
			`LUI:  controls <= `LUI_DECODE;
			`ORI:  controls <= `ORI_DECODE;
			`ADDI: controls <= `ADDI_DECODE;
			`ADDIU:controls <= `ADDIU_DECODE;
			`SLTI: controls <= `SLTI_DECODE;
			`SLTIU:controls <= `SLTIU_DECODE;

			`LW: controls <=`LW_DECODE;
			`SW: controls <=`SW_DECODE;
			`LB:controls <= `LB_DECODE;
			`LBU:controls <=`LBU_DECODE;
			`LH:controls <= `LH_DECODE;
			`LHU:controls <=`LHU_DECODE;
			`SH:controls <= `SH_DECODE;
			`SB:controls <= `SB_DECODE;
			// 添加指令[非对其访存指令]
			`LWL: controls <= `LWL_DECODE;
			`LWR: controls <= `LWR_DECODE;
			`SWL: controls <= `SWL_DECODE;
			`SWR: controls <= `SWR_DECODE;
			// Cache指令
			`CACHE: controls <= `NOP_DECODE; // Cache as NOP temporarily
			// 添加指令[整形运算指令]
			`SPECIAL2_INST: case(func)
				`CLO:controls <= `CLO_DECODE;
				`CLZ:controls <= `CLZ_DECODE;
				`MUL:controls <= `MUL_DECODE;
				`MADD:controls <= `MADD_DECODE;
				`MADDU:controls <= `MADDU_DECODE;
				`MSUB:controls <= `MSUB_DECODE;
				`MSUBU:controls <= `MSUB_DECODE;
				default:invalid_o = 1;
				endcase

			//mfc0 and mtc0
			`SPECIAL3_INST:case(rs)
				`MTC0:controls <= `MTC0_DECODE;
				`MFC0:controls <= `MFC0_DECODE;
				`ERET_AND_TLB: case(func)
					`ERET:controls <= `ERET_DECODE;
                    `TLBP:  tlbop_o <= 4'b1000;
                    `TLBR:  tlbop_o <= 4'b0100;
                    `TLBWI: tlbop_o <= 4'b0010;
                    `TLBWR: tlbop_o <= 4'b0001;
					default: invalid_o = 1; // TODO: should be co-processor unuseable?
				endcase
				default: invalid_o=1;//illegal instrs
				endcase
			default: invalid_o=1;
			endcase
		end
		
	end

endmodule