`timescale 1ns/1ps
// 4 way burst cache, without optimize module
module cache4way #(
    parameter BLKIDX_BIT = 6,
    parameter WRDIDX_BIT = 4, 
    parameter TAG_BIT = 32-2-WRDIDX_BIT-BLKIDX_BIT
) 
(
    input rst, clk, 
    // sram like interface
    input  sraml_en,
    input  [31:0] sraml_paddr,
    input  [BLKIDX_BIT-1:0] sraml_v_blkidx, 
    input  [ 3:0] sraml_wen,
    input sraml_cached, 
    output [31:0] sraml_rdata, 
    input  [31:0] sraml_wdata, 
    output sraml_stall, 
    input sraml_longest_stall, 
    // axi interface
    // axi master interface
    // read address channel
    output [3 :0] arid   ,
    output [31:0] araddr ,
    output [7 :0] arlen  ,
    output [2 :0] arsize ,
    output [1 :0] arburst,
    output [1 :0] arlock ,
    output [3 :0] arcache,
    output [2 :0] arprot ,
    output        arvalid,
    input         arready,
    // read data channel
    input  [3 :0] rid    ,
    input  [31:0] rdata  ,
    input  [1 :0] rresp  ,
    input         rlast  ,
    input         rvalid ,
    output        rready ,
    // write address channel
    output [3 :0] awid   ,
    output [31:0] awaddr ,
    output [7 :0] awlen  ,
    output [2 :0] awsize ,
    output [1 :0] awburst,
    output [1 :0] awlock ,
    output [3 :0] awcache,
    output [2 :0] awprot ,
    output        awvalid,
    input         awready,
    // write data channel
    output [3 :0] wid    ,
    output [31:0] wdata  ,
    output [3 :0] wstrb  ,
    output        wlast  ,
    output        wvalid ,
    input         wready ,
    // write response channel
    input  [3 :0] bid    ,
    input  [1 :0] bresp  ,
    input         bvalid ,
    output        bready
);
// signal between sraml interface and misshandler
wire                  handler_req   ;
wire                  handler_cached;
wire                  handler_w     ;
wire [31          :0] handler_paddr ;
wire [BLKIDX_BIT-1:0] handler_blkidx;
wire [31          :0] handler_wdata ;
wire [ 4          :0] handler_wen   ;
wire                  handler_fin   ;
wire [31          :0] handler_rdata ;
// mux control 
wire mux_control; // 0 for sraml interface and 1 for miss handler
// data bus from sram inferface to mux
wire                   sraml_cache_req        ; //->
wire                   sraml_cache_grant      ; //<-
wire [BLKIDX_BIT-1 :0] sraml_cache_blkidx     ; //->
wire [WRDIDX_BIT-1 :0] sraml_cache_wrdidx     ; //->
wire [32*4-1       :0] sraml_cache_wdata      ; //->
wire [ 4*4-1       :0] sraml_cache_wen        ; //->
wire [32*4-1       :0] sraml_cache_rdata      ; //<-
wire [3            :0] sraml_wen_cache_tag    ; //->
wire [(TAG_BIT)*4-1:0] sraml_cache_tag_r      ; //<-
wire [(TAG_BIT)*4-1:0] sraml_cache_tag_w      ; //->
wire [3            :0] sraml_wen_cache_valid  ; //->
wire [3            :0] sraml_cache_valid_r    ; //<-
wire [3            :0] sraml_cache_valid_w    ; //->
wire [3            :0] sraml_wen_cache_dirty  ; //->
wire [3            :0] sraml_cache_dirty_r    ; //<-
wire [3            :0] sraml_cache_dirty_w    ; //->
wire                   sraml_cache_wen_history; //->
wire [2            :0] sraml_cache_history_r  ; //<-
wire [2            :0] sraml_cache_history_w  ; //->

// out signal
// sraml_cache_req        
// sraml_cache_blkidx     
// sraml_cache_wrdidx     
// sraml_cache_wdata      
// sraml_cache_wen        
// sraml_wen_cache_tag    
// sraml_cache_tag_w      
// sraml_wen_cache_valid  
// sraml_cache_valid_w    
// sraml_wen_cache_dirty  
// sraml_cache_dirty_w    
// sraml_cache_wen_history
// sraml_cache_history_w  
// in signal
// sraml_cache_grant    
// sraml_cache_rdata    
// sraml_cache_tag_r    
// sraml_cache_valid_r  
// sraml_cache_dirty_r  
// sraml_cache_history_r


cache4way_sramlike_interface#(
    .BLKIDX_BIT                   ( BLKIDX_BIT                   ),
    .WRDIDX_BIT                   ( WRDIDX_BIT                   ),
    .TAG_BIT                      ( 32-2-WRDIDX_BIT-BLKIDX_BIT   )
)u_sramlike_interface(
    .rst                          ( rst                          ),
    .clk                          ( clk                          ), 
    .en                           ( sraml_en                     ),
    .paddr                        ( sraml_paddr                  ),
    .v_blkidx                     ( sraml_v_blkidx               ),
    .wen                          ( sraml_wen                    ),
    .cached                       ( sraml_cached                 ),
    .rdata                        ( sraml_rdata                  ),
    .wdata                        ( sraml_wdata                  ),
    .stall                        ( sraml_stall                  ),
    .longest_stall                ( sraml_longest_stall          ),
    .handler_req                  ( handler_req                  ),
    .handler_cached               ( handler_cached               ),
    .handler_w                    ( handler_w                    ),
    .handler_paddr                ( handler_paddr                ),
    .handler_blkidx               ( handler_blkidx               ),
    .handler_wdata                ( handler_wdata                ),
    .handler_wen                  ( handler_wen                  ),
    .handler_fin                  ( handler_fin                  ),
    .handler_rdata                ( handler_rdata                ),
    .cache_mux_control            ( mux_control                  ),
    .cache_req                    ( sraml_cache_req              ),
    .cache_grant                  ( sraml_cache_grant            ),
    .cache_blkidx                 ( sraml_cache_blkidx           ),
    .cache_wrdidx                 ( sraml_cache_wrdidx           ),
    .cache_wdata                  ( sraml_cache_wdata            ),
    .cache_wen                    ( sraml_cache_wen              ),
    .cache_rdata                  ( sraml_cache_rdata            ),
    .wen_cache_tag                ( sraml_wen_cache_tag          ),
    .cache_tag_r                  ( sraml_cache_tag_r            ),
    .cache_tag_w                  ( sraml_cache_tag_w            ),
    .wen_cache_valid              ( sraml_wen_cache_valid        ),
    .cache_valid_r                ( sraml_cache_valid_r          ),
    .cache_valid_w                ( sraml_cache_valid_w          ),
    .wen_cache_dirty              ( sraml_wen_cache_dirty        ),
    .cache_dirty_r                ( sraml_cache_dirty_r          ),
    .cache_dirty_w                ( sraml_cache_dirty_w          ),
    .cache_wen_history            ( sraml_cache_wen_history      ),
    .cache_history_r              ( sraml_cache_history_r        ),
    .cache_history_w              ( sraml_cache_history_w        )
);

// data bus from miss handler to mux
wire                   miss_cache_req        ; //->
wire                   miss_cache_grant      ; //<-
wire [BLKIDX_BIT-1 :0] miss_cache_blkidx     ; //->
wire [WRDIDX_BIT-1 :0] miss_cache_wrdidx     ; //->
wire [32*4-1       :0] miss_cache_wdata      ; //->
wire [ 4*4-1       :0] miss_cache_wen        ; //->
wire [32*4-1       :0] miss_cache_rdata      ; //<-
wire [3            :0] miss_wen_cache_tag    ; //->
wire [(TAG_BIT)*4-1:0] miss_cache_tag_r      ; //<-
wire [(TAG_BIT)*4-1:0] miss_cache_tag_w      ; //->
wire [3            :0] miss_wen_cache_valid  ; //->
wire [3            :0] miss_cache_valid_r    ; //<-
wire [3            :0] miss_cache_valid_w    ; //->
wire [3            :0] miss_wen_cache_dirty  ; //->
wire [3            :0] miss_cache_dirty_r    ; //<-
wire [3            :0] miss_cache_dirty_w    ; //->
wire                   miss_cache_wen_history; //->
wire [2            :0] miss_cache_history_r  ; //<-
wire [2            :0] miss_cache_history_w  ; //->

// out signal
// miss_cache_req        
// miss_cache_blkidx     
// miss_cache_wrdidx     
// miss_cache_wdata      
// miss_cache_wen        
// miss_wen_cache_tag    
// miss_cache_tag_w      
// miss_wen_cache_valid  
// miss_cache_valid_w    
// miss_wen_cache_dirty  
// miss_cache_dirty_w    
// miss_cache_wen_history
// miss_cache_history_w  
// in signal
// miss_cache_grant    
// miss_cache_rdata    
// miss_cache_tag_r    
// miss_cache_valid_r  
// miss_cache_dirty_r  
// miss_cache_history_r


cache4way_miss_handler#(
    .BLKIDX_BIT                   ( BLKIDX_BIT                   ),
    .WRDIDX_BIT                   ( WRDIDX_BIT                   ),
    .TAG_BIT                      ( 32-2-WRDIDX_BIT-BLKIDX_BIT   )
)u_miss_handler
(
    .rst                          ( rst                          ),
    .clk                          ( clk                          ), 
    .req                          ( handler_req                  ),
    .cached                       ( handler_cached               ),
    .req_w                        ( handler_w                    ),
    .req_paddr                    ( handler_paddr                ),
    .req_blkidx                   ( handler_blkidx               ),
    .req_wdata                    ( handler_wdata                ),
    .req_wen                      ( handler_wen                  ),
    .fin                          ( handler_fin                  ),
    .req_rdata                    ( handler_rdata                ),
    .cache_req                    ( miss_cache_req               ),
    .cache_grant                  ( miss_cache_grant             ),
    .cache_blkidx                 ( miss_cache_blkidx            ),
    .cache_wrdidx                 ( miss_cache_wrdidx            ),
    .cache_wdata                  ( miss_cache_wdata             ),
    .cache_wen                    ( miss_cache_wen               ),
    .cache_rdata                  ( miss_cache_rdata             ),
    .wen_cache_tag                ( miss_wen_cache_tag           ),
    .cache_tag_r                  ( miss_cache_tag_r             ), 
    .cache_tag_w                  ( miss_cache_tag_w             ),
    .wen_cache_valid              ( miss_wen_cache_valid         ),
    .cache_valid_r                ( miss_cache_valid_r           ),
    .cache_valid_w                ( miss_cache_valid_w           ),
    .wen_cache_dirty              ( miss_wen_cache_dirty         ),
    .cache_dirty_r                ( miss_cache_dirty_r           ),
    .cache_dirty_w                ( miss_cache_dirty_w           ),
    .cache_wen_history            ( miss_cache_wen_history       ),
    .cache_history_r              ( miss_cache_history_r         ),
    .cache_history_w              ( miss_cache_history_w         ),
    .arid                         ( arid                         ),
    .araddr                       ( araddr                       ),
    .arlen                        ( arlen                        ),
    .arsize                       ( arsize                       ),
    .arburst                      ( arburst                      ),
    .arlock                       ( arlock                       ),
    .arcache                      ( arcache                      ),
    .arprot                       ( arprot                       ),
    .arvalid                      ( arvalid                      ),
    .arready                      ( arready                      ),
    .rid                          ( rid                          ),
    .rdata                        ( rdata                        ),
    .rresp                        ( rresp                        ),
    .rlast                        ( rlast                        ),
    .rvalid                       ( rvalid                       ),
    .rready                       ( rready                       ),
    .awid                         ( awid                         ),
    .awaddr                       ( awaddr                       ),
    .awlen                        ( awlen                        ),
    .awsize                       ( awsize                       ),
    .awburst                      ( awburst                      ),
    .awlock                       ( awlock                       ),
    .awcache                      ( awcache                      ),
    .awprot                       ( awprot                       ),
    .awvalid                      ( awvalid                      ),
    .awready                      ( awready                      ),
    .wid                          ( wid                          ),
    .wdata                        ( wdata                        ),
    .wstrb                        ( wstrb                        ),
    .wlast                        ( wlast                        ),
    .wvalid                       ( wvalid                       ),
    .wready                       ( wready                       ),
    .bid                          ( bid                          ),
    .bresp                        ( bresp                        ),
    .bvalid                       ( bvalid                       ),
    .bready                       ( bready                       )
);

// data bus from mux to cache
wire                   mux_cache_req        ; //->
wire                   mux_cache_grant      ; //<-
wire [BLKIDX_BIT-1 :0] mux_cache_blkidx     ; //->
wire [WRDIDX_BIT-1 :0] mux_cache_wrdidx     ; //->
wire [32*4-1       :0] mux_cache_wdata      ; //->
wire [ 4*4-1       :0] mux_cache_wen        ; //->
wire [32*4-1       :0] mux_cache_rdata      ; //<-
wire [3            :0] mux_wen_cache_tag    ; //->
wire [(TAG_BIT)*4-1:0] mux_cache_tag_r      ; //<-
wire [(TAG_BIT)*4-1:0] mux_cache_tag_w      ; //->
wire [3            :0] mux_wen_cache_valid  ; //->
wire [3            :0] mux_cache_valid_r    ; //<-
wire [3            :0] mux_cache_valid_w    ; //->
wire [3            :0] mux_wen_cache_dirty  ; //->
wire [3            :0] mux_cache_dirty_r    ; //<-
wire [3            :0] mux_cache_dirty_w    ; //->
wire                   mux_cache_wen_history; //->
wire [2            :0] mux_cache_history_r  ; //<-
wire [2            :0] mux_cache_history_w  ; //->

// out signal
// mux_cache_req        
// mux_cache_blkidx     
// mux_cache_wrdidx     
// mux_cache_wdata      
// mux_cache_wen        
// mux_wen_cache_tag    
// mux_cache_tag_w      
// mux_wen_cache_valid  
// mux_cache_valid_w    
// mux_wen_cache_dirty  
// mux_cache_dirty_w    
// mux_cache_wen_history
// mux_cache_history_w  
// in signal
// mux_cache_grant    
// mux_cache_rdata    
// mux_cache_tag_r    
// mux_cache_valid_r  
// mux_cache_dirty_r  
// mux_cache_history_r

mux_comb_2way #(
    .DRIWIDTH      (1 + BLKIDX_BIT + WRDIDX_BIT +32*4 + 4*4 + 4 + TAG_BIT*4 + 4 + 4 + 4 + 4 + 1 + 3), 
    .RSPWIDTH      (1 + 32*4 + TAG_BIT*4 + 4 + 4 + 3)
)
u_mux(
    .sel           (mux_control), 
    .driveChan1    ({sraml_cache_req        ,
                     sraml_cache_blkidx     ,
                     sraml_cache_wrdidx     ,
                     sraml_cache_wdata      ,
                     sraml_cache_wen        ,
                     sraml_wen_cache_tag    ,
                     sraml_cache_tag_w      ,
                     sraml_wen_cache_valid  ,
                     sraml_cache_valid_w    ,
                     sraml_wen_cache_dirty  ,
                     sraml_cache_dirty_w    ,
                     sraml_cache_wen_history,
                     sraml_cache_history_w  }  
                    ), 
    .driveChan2    ({miss_cache_req        ,
                     miss_cache_blkidx     ,
                     miss_cache_wrdidx     ,
                     miss_cache_wdata      ,
                     miss_cache_wen        ,
                     miss_wen_cache_tag    ,
                     miss_cache_tag_w      ,
                     miss_wen_cache_valid  ,
                     miss_cache_valid_w    ,
                     miss_wen_cache_dirty  ,
                     miss_cache_dirty_w    ,
                     miss_cache_wen_history,
                     miss_cache_history_w  }
                    ), 
    .driveChanSlave({mux_cache_req        , // hang
                     mux_cache_blkidx     ,
                     mux_cache_wrdidx     ,
                     mux_cache_wdata      ,
                     mux_cache_wen        ,
                     mux_wen_cache_tag    ,
                     mux_cache_tag_w      ,
                     mux_wen_cache_valid  ,
                     mux_cache_valid_w    ,
                     mux_wen_cache_dirty  ,
                     mux_cache_dirty_w    ,
                     mux_cache_wen_history,
                     mux_cache_history_w  }  
                    ), 
    .respChan1     ({sraml_cache_grant    ,
                     sraml_cache_rdata    ,
                     sraml_cache_tag_r    ,
                     sraml_cache_valid_r  ,
                     sraml_cache_dirty_r  ,
                     sraml_cache_history_r}
                    ), 
    .respChan2     ({miss_cache_grant    ,
                     miss_cache_rdata    ,
                     miss_cache_tag_r    ,
                     miss_cache_valid_r  ,
                     miss_cache_dirty_r  ,
                     miss_cache_history_r}
                    ), 
    .respChanSlave ({mux_cache_grant    ,
                     mux_cache_rdata    ,
                     mux_cache_tag_r    ,
                     mux_cache_valid_r  ,
                     mux_cache_dirty_r  ,
                     mux_cache_history_r}
                    )
);

assign mux_cache_grant = 1'b1; // since we haven't include judge and optimizer
// cache data storage
// cache_data #(
//     .BLKIDX_BIT(BLKIDX_BIT), 
//     .WRDIDX_BIT(WRDIDX_BIT)
// ) u_cache_data_0(
//     .clk       (clk), 
//     .rst       (rst), 
//     .blkidx    (mux_cache_blkidx), 
//     .wrdidx    (mux_cache_wrdidx), 
//     .wdata     (mux_cache_wdata[31:0]), 
//     .wen       (mux_cache_wen  [ 3:0]), 
//     .rdata     (mux_cache_rdata[31:0])
// );

// cache_data #(
//     .BLKIDX_BIT(BLKIDX_BIT), 
//     .WRDIDX_BIT(WRDIDX_BIT) 
// ) u_cache_data_1(
//     .clk       (clk), 
//     .rst       (rst), 
//     .blkidx    (mux_cache_blkidx), 
//     .wrdidx    (mux_cache_wrdidx), 
//     .wdata     (mux_cache_wdata[63:32]), 
//     .wen       (mux_cache_wen  [ 7: 4]), 
//     .rdata     (mux_cache_rdata[63:32])
// );

// cache_data #(
//     .BLKIDX_BIT(BLKIDX_BIT), 
//     .WRDIDX_BIT(WRDIDX_BIT) 
// ) u_cache_data_2(
//     .clk       (clk), 
//     .rst       (rst), 
//     .blkidx    (mux_cache_blkidx), 
//     .wrdidx    (mux_cache_wrdidx), 
//     .wdata     (mux_cache_wdata[95:64]), 
//     .wen       (mux_cache_wen  [11: 8]), 
//     .rdata     (mux_cache_rdata[95:64])
// );

// cache_data #(
//     .BLKIDX_BIT(BLKIDX_BIT), 
//     .WRDIDX_BIT(WRDIDX_BIT) 
// ) u_cache_data_3(
//     .clk       (clk), 
//     .rst       (rst), 
//     .blkidx    (mux_cache_blkidx), 
//     .wrdidx    (mux_cache_wrdidx), 
//     .wdata     (mux_cache_wdata[127:96]), 
//     .wen       (mux_cache_wen  [15 :12]), 
//     .rdata     (mux_cache_rdata[127:96])
// );

bram_cache_data_4KB bram_cache_data0(
    .clka (clk), 
    .wea  (mux_cache_wen[3:0]), 
    .addra({mux_cache_blkidx, mux_cache_wrdidx}), 
    .dina (mux_cache_wdata[31:0]), 
    .clkb(~clk),
    .addrb({mux_cache_blkidx, mux_cache_wrdidx}),
    .doutb(mux_cache_rdata[31:0])
);

bram_cache_data_4KB bram_cache_data1(
    .clka (clk), 
    .wea  (mux_cache_wen[7:4]), 
    .addra({mux_cache_blkidx, mux_cache_wrdidx}), 
    .dina (mux_cache_wdata[63:32]), 
    .clkb(~clk), 
    .addrb({mux_cache_blkidx, mux_cache_wrdidx}), 
    .doutb(mux_cache_rdata[63:32])
);

bram_cache_data_4KB bram_cache_data2(
    .clka (clk), 
    .wea  (mux_cache_wen[11:8]), 
    .addra({mux_cache_blkidx, mux_cache_wrdidx}), 
    .dina (mux_cache_wdata[95:64]), 
    .clkb (~clk),
    .addrb({mux_cache_blkidx, mux_cache_wrdidx}), 
    .doutb(mux_cache_rdata[95:64])
);

bram_cache_data_4KB bram_cache_data3(
    .clka (clk), 
    .wea  (mux_cache_wen[15:12]), 
    .addra({mux_cache_blkidx, mux_cache_wrdidx}), 
    .dina (mux_cache_wdata[127:96]), 
    .clkb(~clk), 
    .addrb({mux_cache_blkidx, mux_cache_wrdidx}), 
    .doutb(mux_cache_rdata[127:96])
);

//cache meta storage
// tag field
// cache_meta #(
//     .WIDTH     (32-2-WRDIDX_BIT-BLKIDX_BIT), 
//     .BLKIDX_BIT(BLKIDX_BIT                ), 
// )u_cache_tag_0(
//     .clk       (clk), 
//     .rst       (rst), 
//     .wen       (mux_wen_cache_tag[0]), 
//     .blkidx    (mux_cache_blkidx), 
//     .wdata     (mux_cache_tag_w[TAG_BIT-1 :0]), 
//     .rdata     (mux_cache_tag_r[TAG_BIT-1 :0])
// );

// cache_meta #(
//     .WIDTH     (32-2-WRDIDX_BIT-BLKIDX_BIT), 
//     .BLKIDX_BIT(BLKIDX_BIT                ), 
// )u_cache_tag_1(
//     .clk       (clk), 
//     .rst       (rst), 
//     .wen       (mux_wen_cache_tag[1]), 
//     .blkidx    (mux_cache_blkidx), 
//     .wdata     (mux_cache_tag_w[TAG_BIT*2-1 :TAG_BIT]), 
//     .rdata     (mux_cache_tag_r[TAG_BIT*2-1 :TAG_BIT])
// );

// cache_meta #(
//     .WIDTH     (32-2-WRDIDX_BIT-BLKIDX_BIT), 
//     .BLKIDX_BIT(BLKIDX_BIT                ), 
// )u_cache_tag_2(
//     .clk       (clk), 
//     .rst       (rst), 
//     .wen       (mux_wen_cache_tag[2]), 
//     .blkidx    (mux_cache_blkidx), 
//     .wdata     (mux_cache_tag_w[TAG_BIT*3-1 :TAG_BIT*2]), 
//     .rdata     (mux_cache_tag_r[TAG_BIT*3-1 :TAG_BIT*2])
// );

// cache_meta #(
//     .WIDTH     (32-2-WRDIDX_BIT-BLKIDX_BIT), 
//     .BLKIDX_BIT(BLKIDX_BIT                ), 
// )u_cache_tag_3(
//     .clk       (clk), 
//     .rst       (rst), 
//     .wen       (mux_wen_cache_tag[3]), 
//     .blkidx    (mux_cache_blkidx), 
//     .wdata     (mux_cache_tag_w[TAG_BIT*4-1 :TAG_BIT*3]), 
//     .rdata     (mux_cache_tag_r[TAG_BIT*4-1 :TAG_BIT*3])
// );


bram_cache_tag_20bit_64line bram_cache_tag0(
    .clka (clk), 
    .wea  (mux_wen_cache_tag[0]), 
    .addra(mux_cache_blkidx), 
    .dina (mux_cache_tag_w[TAG_BIT-1:0]), 
    .clkb(~clk), 
    .addrb(mux_cache_blkidx), 
    .doutb(mux_cache_tag_r[TAG_BIT-1:0])
);

bram_cache_tag_20bit_64line bram_cache_tag1(
    .clka (clk), 
    .wea  (mux_wen_cache_tag[1]), 
    .addra(mux_cache_blkidx), 
    .dina (mux_cache_tag_w[TAG_BIT*2-1:TAG_BIT]), 
    .clkb(~clk), 
    .addrb(mux_cache_blkidx), 
    .doutb(mux_cache_tag_r[TAG_BIT*2-1:TAG_BIT])
);

bram_cache_tag_20bit_64line bram_cache_tag2(
    .clka (clk), 
    .wea  (mux_wen_cache_tag[2]), 
    .addra(mux_cache_blkidx), 
    .dina (mux_cache_tag_w[TAG_BIT*3-1:TAG_BIT*2]), 
    .clkb(~clk), 
    .addrb(mux_cache_blkidx), 
    .doutb(mux_cache_tag_r[TAG_BIT*3-1:TAG_BIT*2])
);

bram_cache_tag_20bit_64line bram_cache_tag3(
    .clka (clk), 
    .wea  (mux_wen_cache_tag[3]), 
    .addra(mux_cache_blkidx), 
    .dina (mux_cache_tag_w[TAG_BIT*4-1:TAG_BIT*3]), 
    .clkb(~clk), 
    .addrb(mux_cache_blkidx), 
    .doutb(mux_cache_tag_r[TAG_BIT*4-1:TAG_BIT*3])
);

// valid bit
cache_meta_1bit #(
    .BLKIDX_BIT(BLKIDX_BIT)
)u_cache_valid_0(
    .clk       (clk), 
    .rst       (rst), 
    .wen       (mux_wen_cache_valid[0]), 
    .blkidx    (mux_cache_blkidx), 
    .wdata     (mux_cache_valid_w[0]), 
    .rdata     (mux_cache_valid_r[0])
);

cache_meta_1bit #(
    .BLKIDX_BIT(BLKIDX_BIT)
)u_cache_valid_1(
    .clk       (clk), 
    .rst       (rst), 
    .wen       (mux_wen_cache_valid[1]), 
    .blkidx    (mux_cache_blkidx), 
    .wdata     (mux_cache_valid_w[1]), 
    .rdata     (mux_cache_valid_r[1])
);

cache_meta_1bit #(
    .BLKIDX_BIT(BLKIDX_BIT)
)u_cache_valid_2(
    .clk       (clk), 
    .rst       (rst), 
    .wen       (mux_wen_cache_valid[2]), 
    .blkidx    (mux_cache_blkidx), 
    .wdata     (mux_cache_valid_w[2]), 
    .rdata     (mux_cache_valid_r[2])
);

cache_meta_1bit #(
    .BLKIDX_BIT(BLKIDX_BIT)
)u_cache_valid_3(
    .clk       (clk), 
    .rst       (rst), 
    .wen       (mux_wen_cache_valid[3]), 
    .blkidx    (mux_cache_blkidx), 
    .wdata     (mux_cache_valid_w[3]), 
    .rdata     (mux_cache_valid_r[3])
);

//dirty bit
cache_meta_1bit #(
    .BLKIDX_BIT(BLKIDX_BIT)
)u_cache_dirty_0(
    .clk       (clk), 
    .rst       (rst), 
    .wen       (mux_wen_cache_dirty[0]), 
    .blkidx    (mux_cache_blkidx), 
    .wdata     (mux_cache_dirty_w[0]), 
    .rdata     (mux_cache_dirty_r[0])
);

cache_meta_1bit #(
    .BLKIDX_BIT(BLKIDX_BIT)
)u_cache_dirty_1(
    .clk       (clk), 
    .rst       (rst), 
    .wen       (mux_wen_cache_dirty[1]), 
    .blkidx    (mux_cache_blkidx), 
    .wdata     (mux_cache_dirty_w[1]), 
    .rdata     (mux_cache_dirty_r[1])
);

cache_meta_1bit #(
    .BLKIDX_BIT(BLKIDX_BIT)
)u_cache_dirty_2(
    .clk       (clk), 
    .rst       (rst), 
    .wen       (mux_wen_cache_dirty[2]), 
    .blkidx    (mux_cache_blkidx), 
    .wdata     (mux_cache_dirty_w[2]), 
    .rdata     (mux_cache_dirty_r[2])
);

cache_meta_1bit #(
    .BLKIDX_BIT(BLKIDX_BIT)
)u_cache_dirty_3(
    .clk       (clk), 
    .rst       (rst), 
    .wen       (mux_wen_cache_dirty[3]), 
    .blkidx    (mux_cache_blkidx), 
    .wdata     (mux_cache_dirty_w[3]), 
    .rdata     (mux_cache_dirty_r[3])
);

// // history info
// cache_meta #(
//     .WIDTH     (3         ), 
//     .BLKIDX_BIT(BLKIDX_BIT)
// )u_cache_history(
//     .clk       (clk), 
//     .rst       (rst), 
//     .wen       (mux_cache_wen_history), 
//     .blkidx    (mux_cache_blkidx), 
//     .wdata     (mux_cache_history_w), 
//     .rdata     (mux_cache_history_r)
// );
bram_cache_history_3bit_64line bram_cache_history(
    .clka (clk), 
    .wea  (mux_cache_wen_history), 
    .addra(mux_cache_blkidx), 
    .dina (mux_cache_history_w), 
    .clkb (~clk), 
    .addrb(mux_cache_blkidx),
    .doutb(mux_cache_history_r)
);


    
endmodule