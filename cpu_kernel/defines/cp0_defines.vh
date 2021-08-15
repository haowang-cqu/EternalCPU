`define EXC_NONE            32'd0
`define EXC_NMI             32'd1
`define EXC_INST_ADD_ERR    32'd2
`define EXC_INST_REFILL     32'd3
`define EXC_INST_INVALID    32'd4
`define EXC_INST_BUS_ERR    32'd5
`define EXC_OVF             32'd6
`define EXC_TRAP            32'd7
`define EXC_SYSCALL         32'd8
`define EXC_BREAK           32'd9
`define EXC_ERET            32'd10
`define EXC_RI              32'd11
`define EXC_COP_UNUSABLE    32'd12
`define EXC_FLOAT_EXC       32'd13
`define EXC_DATA_ADD_ERR_L  32'd14
`define EXC_DATA_ADD_ERR_S  32'd15
`define EXC_DATA_REFILL     32'd16
`define EXC_DATA_INVALID    32'd17
`define EXC_DATA_MODIFY     32'd18
`define EXC_DATA_BUS_ERR    32'd19
`define EXC_INT             32'd20



`define CP0_STATUS_RE   25
`define CP0_STATUS_BEV  22
`define CP0_STATUS_IM   15:8
`define CP0_STATUS_KSU  4:3
`define CP0_STATUS_ERL  2
`define CP0_STATUS_EXL  1
`define CP0_STATUS_IE   0


`define CP0_CAUSE_BD        31
`define CP0_CAUSE_DC        27
`define CP0_CAUSE_IV        23
`define CP0_CAUSE_EXCCODE   6:2
`define CP0_CAUSE_SOFTIRQ   9:8
`define CP0_CAUSE_IPS       15:8

//CP0

`define CP0_INDEX           5'd0
`define CP0_RANDOM          5'd1
`define CP0_ENTRY_LO0       5'd2
`define CP0_ENTRY_LO1       5'd3
`define CP0_CONTEXT         5'd4
`define CP0_PAGEMASK        5'd5
`define CP0_WIRED           5'd6
`define CP0_BADVADDR        5'd8
`define CP0_COUNT           5'd9
`define CP0_ENTRY_HI        5'd10
`define CP0_COMPARE         5'd11
`define CP0_STATUS          5'b01100
    `define CP0_SEL_STATUS  3'd0
`define CP0_CAUSE           5'd13
`define CP0_EPC             5'd14
`define CP0_PRID_AND_EBASE  5'd15
    `define CP0_SEL_PRID    3'd0
    `define CP0_SEL_EBASE   3'd1
`define CP0_CONFIG      5'd16
    `define CP0_SEL_CONFIG0 3'd0



`define EXCCODE_IRQ          5'd0       /* Interrupt */
`define EXCCODE_MOD          5'd1       /* TLB Modify (write to read-only page) */
`define EXCCODE_TLBL         5'd2       /* TLB miss on load */
`define EXCCODE_TLBS         5'd3       /* TLB miss on store */
`define EXCCODE_ADEL         5'd4       /* Address error on load */
`define EXCCODE_ADES         5'd5       /* Address error on store */
`define EXCCODE_IBE          5'd6       /* Bus error on instruction fetch */
`define EXCCODE_DBE          5'd7       /* Bus error on data load *or* store */
`define EXCCODE_SYS          5'd8       /* Syscall */
`define EXCCODE_BP           5'd9       /* Breakpoint */
`define EXCCODE_RI           5'd10      /* Reserved (illegal) instruction */
`define EXCCODE_CPU          5'd11      /* Coprocessor unusable */
`define EXCCODE_OVF          5'd12      /* Arithmetic overflow */
`define EXCCODE_TR           5'd13