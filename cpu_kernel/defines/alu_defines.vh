// alu control defines
// 初赛指令
`define AND_CONTROL     6'b00_0111
`define OR_CONTROL      6'b00_0001
`define XOR_CONTROL     6'b00_0010
`define NOR_CONTROL     6'b00_0011
`define LUI_CONTROL     6'b00_0100

`define SLL_CONTROL     6'b00_1000
`define SRL_CONTROL     6'b00_1001
`define SRA_CONTROL     6'b00_1010
`define SLLV_CONTROL    6'b00_1011
`define SRLV_CONTROL    6'b00_1100
`define SRAV_CONTROL    6'b00_1101

`define ADD_CONTROL     6'b01_0000
`define ADDU_CONTROL    6'b01_0001
`define SUB_CONTROL     6'b01_0010
`define SUBU_CONTROL    6'b01_0011
`define SLT_CONTROL     6'b01_0100
`define SLTU_CONTROL    6'b01_0101

`define MULT_CONTROL    6'b01_1000
`define MULTU_CONTROL   6'b01_1001
`define DIV_CONTROL     6'b01_1010
`define DIVU_CONTROL    6'b01_1011

`define MFHI_CONTROL  	6'b01_1100
`define MTHI_CONTROL  	6'b01_1101
`define MFLO_CONTROL  	6'b01_1110
`define MTLO_CONTROL  	6'b01_1111

`define MFC0_CONTROL 	6'b00_0101
`define MTC0_CONTROL 	6'b00_0110

`define ZERO_CONTROL 	6'b00_0000

// 添加指令
`define CLO_CONTROL     6'b10_0000
`define CLZ_CONTROL     6'b10_0001
`define MUL_CONTROL     6'b10_1101
`define MADD_CONTROL    6'b10_0010
`define MADDU_CONTROL   6'b10_0011
`define MSUB_CONTROL    6'b10_0100
`define MSUBU_CONTROL   6'b10_0101
`define SC_CONTROL      6'b10_0110

// trap instructions
`define TEQ_CONTROL     6'b10_0111
`define TGE_CONTROL     6'b10_1000
`define TGEU_CONTROL    6'b10_1001
`define TLT_CONTROL     6'b10_1010
`define TLTU_CONTROL    6'b10_1011
`define TNE_CONTROL     6'b10_1100