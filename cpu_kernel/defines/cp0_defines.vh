`define EXC_INT     32'h00000001
`define EXC_ADEL    32'h00000004
`define EXC_ADES    32'h00000005
`define EXC_SYSCALL 32'h00000008
`define EXC_BREAK   32'h00000009
`define EXC_RI      32'h0000000a
`define EXC_OVF     32'h0000000c
`define EXC_TRAP    32'h0000000d
`define EXC_ERET    32'h0000000e

`define CP0_STATUS_EXL  1
`define CP0_STATUS_IE   0

`define CP0_CAUSE_BD        31
`define CP0_CAUSE_DC        27
`define CP0_CAUSE_IV        23
`define CP0_CAUSE_EXCCODE   6:2
`define CP0_CAUSE_SOFTIRQ   9:8
`define CP0_CAUSE_IPS       15:8

//CP0

`define CP0_REG_BADVADDR    5'b01000
`define CP0_REG_COUNT       5'b01001
`define CP0_REG_COMPARE     5'b01011
`define CP0_REG_STATUS      5'b01100
`define CP0_REG_CAUSE       5'b01101
`define CP0_REG_EPC         5'b01110
`define CP0_REG_CONFIG      5'b10000

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