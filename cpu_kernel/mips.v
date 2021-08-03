`timescale 1ns / 1ps
`include "defines.vh"

module mycpu_top(
	input 	wire	[5:0] 	ext_int,
	input 	wire 		aclk,
	input 	wire 		aresetn,
	
	//axi port
   	//ar
    	output 	wire	[3:0] 	arid,      	//read request id, fixed 4'b0
    	output 	wire	[31:0] 	araddr,   	//read request address
    	output 	wire	[7:0] 	arlen,     	//read request transfer length(beats), fixed 4'b0
    	output 	wire	[2:0] 	arsize,    	//read request transfer size(bytes per beats)
    	output 	wire	[1:0] 	arburst,   	//transfer type, fixed 2'b01
    	output 	wire	[1:0] 	arlock,    	//atomic lock, fixed 2'b0
    	output 	wire	[3:0] 	arcache,   	//cache property, fixed 4'b0
    	output 	wire	[2:0] 	arprot,    	//protect property, fixed 3'b0
    	output 	wire	 	arvalid,    //read request address valid
    	input 	wire	 	arready,    //slave end ready to receive address transfer
        //r              
        input 	wire	[3:0] 	rid,        //equal to arid, can be ignored
        input 	wire	[31:0] 	rdata,     	//read data
        input 	wire	[1:0] 	rresp,     	//this read request finished successfully, can be ignored
        input 	wire	 	rlast,      //the last beat data for this request, can be ignored
        input 	wire	 	rvalid,     //read data valid
        output 	wire	 	rready,     //master end ready to receive data transfer
    	//aw           
    	output 	wire	[3:0] 	awid,      	//write request id, fixed 4'b0
    	output 	wire	[31:0] 	awaddr,   	//write request address
    	output 	wire	[3:0] 	awlen,     	//write request transfer length(beats), fixed 4'b0
    	output 	wire	[2:0] 	awsize,    	//write request transfer size(bytes per beats)
    	output 	wire	[1:0] 	awburst,   	//transfer type, fixed 2'b01
    	output 	wire	[1:0] 	awlock,    	//atomic lock, fixed 2'b01
    	output 	wire	[3:0] 	awcache,   	//cache property, fixed 4'b01
    	output 	wire	[2:0] 	awprot,    	//protect property, fixed 3'b01
    	output 	wire	 	awvalid,    //write request address valid
    	input 	wire	 	awready,    //slave end ready to receive address transfer
        //w          
        output 	wire	[3:0] 	wid,       	//equal to awid, fixed 4'b0
        output 	wire	[31:0] 	wdata,    	//write data
        output 	wire	[3:0] 	wstrb,     	//write data strobe select bit
        output 	wire	 	wlast,      //the last beat data signal, fixed 1'b1
        output 	wire	 	wvalid,     //write data valid
        input 	wire	 	wready,     //slave end ready to receive data transfer
    	//b              
    	input  	wire	[3:0]	bid,       	//equal to wid,awid, can be ignored
    	input  	wire	[1:0] 	bresp,     	//this write request finished successfully, can be ignored
    	input 	wire	 	bvalid,     //write data valid
    	output 	wire	 	bready,     //master end ready to receive write response

	//debug signals
	output 	wire	 [31:0] debug_wb_pc,
	output 	wire	 [3 :0] debug_wb_rf_wen,
	output 	wire	 [4 :0] debug_wb_rf_wnum,
	output 	wire	 [31:0] debug_wb_rf_wdata
    );

	//sram signal
	//cpu inst sram
	wire 	       		inst_sram_en;
	wire 	[3 :0] 		inst_sram_wen;
	wire 	[31:0] 		inst_sram_addr;
	wire 	[31:0] 		inst_sram_wdata;
	wire 	[31:0] 		inst_sram_rdata;
	//cpu data sram
	wire 	       		data_sram_en,data_sram_write;
	wire 	[1 :0] 		data_sram_size;
	wire 	[3 :0] 		data_sram_wen;
	wire 	[31:0] 		data_sram_addr;
	wire 	[31:0] 		data_sram_wdata;
	wire 	[31:0] 		data_sram_rdata;

	// the follow definitions are between controller and datapath.
	// also use some of them  link the IPcores
	wire 			rst;
	wire 			clk;
	// fetch stage
	wire	[31:0] 		pcF;
	wire	[31:0] 		instrF;

	wire 			if_stall;
	// decode stage
	wire 	[31:0] 		instrD;
	wire 			pcsrcD;
	wire 			jumpD;
	wire 			jalD;
	wire 			jrD;
	wire 			balD;
	wire 			jalrD;
	wire 			branchD;
	wire 			equalD;
	wire 			invalidD;
	wire 	[1:0] 		hilo_weD;
	wire 	[5:0] 		alucontrolD;
	wire            	stallD;

	// execute stage
	wire 			regdstE;
	wire 			alusrcE;
	wire 			memtoregE;
	wire 			regwriteE;
	wire 			flushE;
	wire 			stallE;

	// mem stage
	wire 			memwriteM;
	wire 			memenM;
	wire	[31:0] 		aluoutM;
	wire 	[31:0]		writedata2M;
	wire 	[31:0]		excepttypeM;
	wire 			cp0weM;
	wire	[31:0] 		readdataM;
	wire 	[3:0] 		sel;
	wire 			memtoregM;
	wire			regwriteM;
	wire 			stallM;
	wire			flushM;

	// writeback stage
	wire 			memtoregW;
	wire 			regwriteW;
	wire 	[31:0] 		pcW;
	wire 	[4:0] 		writeregW;
	wire 	[31:0] 		resultW;
	wire 			flushW;


	//cache mux signal
	wire 			cache_miss;
	wire 			sel_i;
	wire	[31:0] 		i_addr;
	wire 	[31:0]		d_addr;
	wire 	[31:0]		m_addr;
	wire 			m_fetch;
	wire 			m_ld_st;
	wire 			mem_access;
	wire 			mem_write;
	wire 			m_st;
	wire 			mem_ready;
	wire 			m_i_ready;
	wire 			m_d_ready;
	wire 			i_ready;
	wire 			d_ready;
	wire	[31:0] 		mem_st_data;
	wire 	[31:0]		mem_data;
	wire	[1:0] 		mem_size;
	wire 	[1:0] 		d_size;// size not use
	wire	[3:0] 		m_sel,d_wen;
	wire 			stallreq_from_if;
	wire 			stallreq_from_mem;

	wire 			d_stall;

	wire 	[31:0]		data_paddr;
	wire 	[31:0]		inst_paddr;
	wire 			no_dcache;

	wire 			i_stall;

	wire 	[31:0]		d_araddr;		
	wire 	[7:0]		d_arlen;		
	wire 	[2:0]		d_arsize;		
	wire 	[1:0] 		d_arburst;	
	wire 	[1:0] 		d_arlock;		
	wire 	[3:0] 		d_arcache;	
	wire 	[2:0]		d_arprot;		
	wire 			d_arvalid;	
	wire 			d_arready;

	wire 	[3:0] 		d_rid;		
	wire 	[31:0] 		d_rdata;		
	wire 	[1:0] 		d_rresp;		
	wire 	 		d_rlast;		
	wire 	 		d_rvalid;		
	wire 	 		d_rready;

	wire 	[3:0] 		d_awid;		
	wire 	[31:0] 		d_awaddr;		
	wire 	[3:0] 		d_awlen;		
	wire 	[2:0] 		d_awsize;		
	wire 	[1:0] 		d_awburst;	
	wire 	[1:0] 		d_awlock;		
	wire 	[3:0] 		d_awcache;	
	wire 	[2:0] 		d_awprot;		
	wire 	 		d_awvalid;	
	wire 	 		d_awready;	

	wire 	[3:0] 		d_wid;		
	wire 	[31:0]	 	d_wdata;		
	wire 	[3:0] 		d_wstrb;		
	wire 	 		d_wlast;		
	wire 	 		d_wvalid;		
	wire 	 		d_wready;	

	wire 	[3:0]		d_bid;		
	wire 	[1:0] 		d_bresp;		
	wire 	 		d_bvalid;		
	wire 	 		d_bready;	

	wire 	[31:0]		i_araddr;		
	wire 	[7:0]		i_arlen;		
	wire 	[2:0]		i_arsize;		
	wire 	[1:0] 		i_arburst;	
	wire 	[1:0] 		i_arlock;		
	wire 	[3:0] 		i_arcache;	
	wire 	[2:0]		i_arprot;		
	wire 			i_arvalid;	
	wire 			i_arready;	
	wire 	[3:0] 		i_rid;		
	wire 	[31:0] 		i_rdata;		
	wire 	[1:0] 		i_rresp;		
	wire 	 		i_rlast;		
	wire 	 		i_rvalid;		
	wire 	 		i_rready;		
	wire 	[3:0] 		i_awid;		
	wire 	[31:0] 		i_awaddr;		
	wire 	[3:0] 		i_awlen;		
	wire 	[2:0] 		i_awsize;		
	wire 	[1:0] 		i_awburst;	
	wire 	[1:0] 		i_awlock;		
	wire 	[3:0] 		i_awcache;	
	wire 	[2:0] 		i_awprot;		
	wire 	 		i_awvalid;	
	wire 	 		i_awready;	
	wire 	[3:0] 		i_wid;		
	wire 	[31:0]	 	i_wdata;		
	wire 	[3:0] 		i_wstrb;		
	wire 	 		i_wlast;		
	wire 	 		i_wvalid;		
	wire 	 		i_wready;		
	wire 	[3:0]		i_bid;		
	wire 	[1:0] 		i_bresp;		
	wire 	 		i_bvalid;		
	wire 	 		i_bready;	

	assign  arid 			= 4'b0;

	// inst_sram_parameters
	assign 	rst 			= aresetn;
	assign 	clk 			= aclk;
	assign 	inst_sram_en 		= 1'b1;
	assign 	inst_sram_wen 		= 4'b0;
	assign 	inst_sram_addr 		= pcF;
	assign 	inst_sram_wdata 	= 32'b0;
	assign 	instrF 			= inst_sram_rdata;

	//data_sram_parameters
	assign 	data_sram_en		= memenM & ~(|excepttypeM);
	assign 	data_sram_write 	= memwriteM;
	assign 	data_sram_wen 		= sel;
	assign 	data_sram_addr 		= aluoutM;
	assign 	data_sram_wdata 	= writedata2M;
	assign 	readdataM 		= data_sram_rdata;

	//trace parameters
	assign 	debug_wb_pc 		= pcW;
	assign 	debug_wb_rf_wen 	= {4{regwriteW}};// the soft interrupt need to be solved 
	assign 	debug_wb_rf_wnum 	= writeregW;
	assign 	debug_wb_rf_wdata 	= resultW;


	assign sel_i 			= cache_miss;
	assign m_addr 			= sel_i ? i_addr : d_addr;
	assign mem_access 		= sel_i ? m_fetch : m_ld_st;
	assign mem_size 		= sel_i ? 2'b10 : d_size;
	assign m_sel 			= sel_i ? 4'b1111 : d_wen;
	assign mem_write 		= sel_i ? 1'b0 : m_st;

	//demux
	assign m_i_ready 		= mem_ready & sel_i;
	assign m_d_ready 		= mem_ready & ~sel_i;
	
	assign stallreq_from_if 	= ~i_ready;
	assign stallreq_from_mem	= data_sram_en & ~d_ready;

	assign i_ready 			= inst_sram_en & ~i_stall;

	assign d_ready 			= data_sram_en & ~d_stall;

	datapath dp(
		.clk				(clk),
		.rst				(~rst),
		.if_pc				(pcF),
		.if_instr				(instrF),
		.if_stall			(if_stall),
		.id_equal				(equalD),
		.id_stall				(stallD),
		.id_instr				(instrD),
		.ex_flush				(flushE),
		.ex_stall				(stallE),
		.mem_wdata			(aluoutM),
		.mem_wdata_last		(writedata2M),
		.mem_size				(data_sram_size),
		.mem_rdata			(readdataM),
		.sel				(sel),
		.mem_stall				(stallM),
		.mem_flush				(flushM),
		.mem_excepttype		(excepttypeM),
		.wb_pc				(pcW),
		.wb_regdst			(writeregW),
		.wb_wdata			(resultW),
		.wb_flush				(flushW),
		.stallreq_from_if	(stallreq_from_if),
		.stallreq_from_mem	(stallreq_from_mem),
		
		.mem_we			(memwriteM),// mipsʹ��
		.mem_en				(memenM),// mipsʹ��
		.wb_wreg(regwriteW)
	);

	mmu mmu (
		.inst_vaddr(inst_sram_addr),
		.inst_paddr(inst_paddr),

		.data_vaddr(data_sram_addr),
		.data_paddr(data_paddr),

		.no_dcache(no_dcache)
	);

	cache4way data_cache4way(
		.rst			(~rst), 
		.clk			(clk), 

		.sraml_en		(data_sram_en),
		.sraml_paddr		(data_paddr),
		.sraml_v_blkidx		(data_sram_addr[11:6]), 
		.sraml_wen		(data_sram_wen),
		.sraml_cached		(~no_dcache), 
		.sraml_rdata		(data_sram_rdata), 
		.sraml_wdata		(data_sram_wdata), 
		.sraml_stall		(d_stall), 
		.sraml_longest_stall	(stallM), 

		.arid			()   ,
		.araddr			(d_araddr		) ,
		.arlen			(d_arlen		)  ,
		.arsize			(d_arsize		) ,
		.arburst		(d_arburst	),
		.arlock			(d_arlock		) ,
		.arcache		(d_arcache	),
		.arprot			(d_arprot		) ,
		.arvalid		(d_arvalid	),
		.arready		(d_arready	),
		.rid			(d_rid		)    ,
		.rdata			(d_rdata		)  ,
		.rresp			(d_rresp		)  ,
		.rlast			(d_rlast		)  ,
		.rvalid			(d_rvalid		) ,
		.rready			(d_rready		) ,
		.awid			(d_awid		)   ,
		.awaddr			(d_awaddr		) ,
		.awlen			(d_awlen		)  ,
		.awsize			(d_awsize		) ,
		.awburst		(d_awburst	),
		.awlock			(d_awlock		) ,
		.awcache		(d_awcache	),
		.awprot			(d_awprot		) ,
		.awvalid		(d_awvalid	),
		.awready		(d_awready	),
		.wid			(d_wid		)    ,
		.wdata			(d_wdata		)  ,
		.wstrb			(d_wstrb		)  ,
		.wlast			(d_wlast		)  ,
		.wvalid			(d_wvalid		) ,
		.wready			(d_wready		) ,
		.bid			(d_bid		)    ,
		.bresp			(d_bresp		)  ,
		.bvalid			(d_bvalid		) ,
		.bready			(d_bready		)
	);

	cache4way instr_cache4way(
		.rst			(~rst), 
		.clk			(clk), 

		.sraml_en		(inst_sram_en),
		.sraml_paddr		(inst_paddr),
		.sraml_v_blkidx		(inst_sram_addr[11:6]), 
		.sraml_wen		(4'b0),
		.sraml_cached		(1'b1), 
		.sraml_rdata		(inst_sram_rdata), 
		.sraml_wdata		(32'b0), 
		.sraml_stall		(i_stall), 
		.sraml_longest_stall	(if_stall), 

		.arid			()   ,
		.araddr			(i_araddr		) ,
		.arlen			(i_arlen		)  ,
		.arsize			(i_arsize		) ,
		.arburst		(i_arburst	),
		.arlock			(i_arlock		) ,
		.arcache		(i_arcache	),
		.arprot			(i_arprot		) ,
		.arvalid		(i_arvalid	),
		.arready		(i_arready	),
		.rid			(i_rid		)    ,
		.rdata			(i_rdata		)  ,
		.rresp			(i_rresp		)  ,
		.rlast			(i_rlast		)  ,
		.rvalid			(i_rvalid		) ,
		.rready			(i_rready		) ,
		.awid			(i_awid		)   ,
		.awaddr			(i_awaddr		) ,
		.awlen			(i_awlen		)  ,
		.awsize			(i_awsize		) ,
		.awburst		(i_awburst	),
		.awlock			(i_awlock		) ,
		.awcache		(i_awcache	),
		.awprot			(i_awprot		) ,
		.awvalid		(i_awvalid	),
		.awready		(i_awready	),
		.wid			(i_wid		)    ,
		.wdata			(i_wdata		)  ,
		.wstrb			(i_wstrb		)  ,
		.wlast			(i_wlast		)  ,
		.wvalid			(i_wvalid		) ,
		.wready			(i_wready		) ,
		.bid			(i_bid		)    ,
		.bresp			(i_bresp		)  ,
		.bvalid			(i_bvalid		) ,
		.bready			(i_bready		)
	);

	axi_crossbar_2x1 axi_crossbar_2x1_wrapper(
		.M00_AXI_0_araddr	(araddr),
		.M00_AXI_0_arburst	(arburst),
		.M00_AXI_0_arcache	(arcache),
		.M00_AXI_0_arlen	(arlen),
		.M00_AXI_0_arlock	(arlock),
		.M00_AXI_0_arprot	(arprot),
		.M00_AXI_0_arqos	(),
		.M00_AXI_0_arready	(arready),
		.M00_AXI_0_arsize	(arsize),
		.M00_AXI_0_arvalid	(arvalid),
		.M00_AXI_0_awaddr	(awaddr),
		.M00_AXI_0_awburst	(awburst),
		.M00_AXI_0_awcache	(arcache),
		.M00_AXI_0_awlen	(awlen),
		.M00_AXI_0_awlock	(awlock),
		.M00_AXI_0_awprot	(awprot),
		.M00_AXI_0_awqos	(),
		.M00_AXI_0_awready	(awready),
		.M00_AXI_0_awsize	(awsize),
		.M00_AXI_0_awvalid	(awvalid),

		.M00_AXI_0_bready	(bready),
		.M00_AXI_0_bresp	(bresp),
		.M00_AXI_0_bvalid	(bvalid),

		.M00_AXI_0_rdata	(rdata),
		.M00_AXI_0_rlast	(rlast),
		.M00_AXI_0_rready	(rready),
		.M00_AXI_0_rresp	(rresp),
		.M00_AXI_0_rvalid	(rvalid),

		.M00_AXI_0_wdata	(wdata),
		.M00_AXI_0_wlast	(wlast),
		.M00_AXI_0_wready	(wready),
		.M00_AXI_0_wstrb	(wstrb),
		.M00_AXI_0_wvalid	(wvalid),//
		
		// dcache
		.S00_AXI_0_araddr	(d_araddr),
		.S00_AXI_0_arburst	(d_arburst),
		.S00_AXI_0_arcache	(d_arcache),
		.S00_AXI_0_arlen	(d_arlen),
		.S00_AXI_0_arlock	(d_arlock),
		.S00_AXI_0_arprot	(d_arprot),
		.S00_AXI_0_arqos	(),
		.S00_AXI_0_arready	(d_arready),
		.S00_AXI_0_arsize	(d_arsize),
		.S00_AXI_0_arvalid	(d_arvalid),
		.S00_AXI_0_awaddr	(d_awaddr),
		.S00_AXI_0_awburst	(d_awburst),
		.S00_AXI_0_awcache	(d_awcache),
		.S00_AXI_0_awlen	(d_awlen),
		.S00_AXI_0_awlock	(d_awlock),
		.S00_AXI_0_awprot	(d_awprot),
		.S00_AXI_0_awqos	(),
		.S00_AXI_0_awready	(d_awready),
		.S00_AXI_0_awsize	(d_awsize),
		.S00_AXI_0_awvalid	(d_awvalid),
		.S00_AXI_0_bready	(d_bready),
		.S00_AXI_0_bresp	(d_bresp),
		.S00_AXI_0_bvalid	(d_bvalid),
		.S00_AXI_0_rdata	(d_rdata),
		.S00_AXI_0_rlast	(d_rlast),
		.S00_AXI_0_rready	(d_rready),
		.S00_AXI_0_rresp	(d_rresp),
		.S00_AXI_0_rvalid	(d_rvalid),
		.S00_AXI_0_wdata	(d_wdata),
		.S00_AXI_0_wlast	(d_wlast),
		.S00_AXI_0_wready	(d_wready),
		.S00_AXI_0_wstrb	(d_wstrb),
		.S00_AXI_0_wvalid	(d_wvalid),//

		//icache
		.S01_AXI_0_araddr	(i_araddr),
		.S01_AXI_0_arburst	(i_arburst),
		.S01_AXI_0_arcache	(i_arcache),
		.S01_AXI_0_arlen	(i_arlen),
		.S01_AXI_0_arlock	(i_arlock),
		.S01_AXI_0_arprot	(i_arprot),
		.S01_AXI_0_arqos	(),
		.S01_AXI_0_arready	(i_arready),
		.S01_AXI_0_arsize	(i_arsize),
		.S01_AXI_0_arvalid	(i_arvalid),
		.S01_AXI_0_awaddr	(i_awaddr),
		.S01_AXI_0_awburst	(i_awburst),
		.S01_AXI_0_awcache	(i_awcache),
		.S01_AXI_0_awlen	(i_awlen),
		.S01_AXI_0_awlock	(i_awlock),
		.S01_AXI_0_awprot	(i_awprot),
		.S01_AXI_0_awqos	(),
		.S01_AXI_0_awready	(i_awready),
		.S01_AXI_0_awsize	(i_awsize),
		.S01_AXI_0_awvalid	(i_awvalid),
		.S01_AXI_0_bready	(i_bready),
		.S01_AXI_0_bresp	(i_bresp),
		.S01_AXI_0_bvalid	(i_bvalid),
		.S01_AXI_0_rdata	(i_rdata),
		.S01_AXI_0_rlast	(i_rlast),
		.S01_AXI_0_rready	(i_rready),
		.S01_AXI_0_rresp	(i_rresp),
		.S01_AXI_0_rvalid	(i_rvalid),
		.S01_AXI_0_wdata	(i_wdata),
		.S01_AXI_0_wlast	(i_wlast),
		.S01_AXI_0_wready	(i_wready),
		.S01_AXI_0_wstrb	(i_wstrb),
		.S01_AXI_0_wvalid	(i_wvalid),//

		.aclk_0			(clk),
		.aresetn_0		(rst)
    	);

endmodule
