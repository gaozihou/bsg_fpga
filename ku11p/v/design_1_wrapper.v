//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
//Date        : Sat Mar 21 23:31:31 2020
//Host        : dhcp196-212.ece.uw.edu running 64-bit CentOS Linux release 7.7.1908 (Core)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper

 import bp_common_pkg::*;
 import bp_common_aviary_pkg::*;
 import bp_be_pkg::*;
 import bp_common_rv64_pkg::*;
 import bp_cce_pkg::*;
 import bp_me_pkg::*;
 import bp_common_cfg_link_pkg::*;
 import bsg_noc_pkg::*;
 import bsg_wormhole_router_pkg::*;
 import bsg_cache_pkg::*;
 import bsg_dmc_pkg::*;
  
 #(parameter bp_params_e bp_params_p = e_bp_single_core_cfg
   `declare_bp_proc_params(bp_params_p)
   `declare_bp_me_if_widths(paddr_width_p, cce_block_width_p, lce_id_width_p, lce_assoc_p)
   
  ,localparam cache_addr_width_p = 30 - `BSG_SAFE_CLOG2(1) // one cache_dma
  ,localparam axi_id_width_p     = 1
  ,localparam axi_addr_width_p   = 30
  ,localparam axi_data_width_p   = 256
  ,localparam axi_burst_len_p    = 2
  
  ,localparam cce_instr_ram_addr_width_lp = `BSG_SAFE_CLOG2(num_cce_instr_ram_els_p)
  ,localparam cce_ucode_filename_lp = "mesi.mem"
  )

   (ddr4_sdram_act_n,
    ddr4_sdram_adr,
    ddr4_sdram_ba,
    ddr4_sdram_bg,
    ddr4_sdram_ck_c,
    ddr4_sdram_ck_t,
    ddr4_sdram_cke,
    ddr4_sdram_cs_n,
    ddr4_sdram_dm_n,
    ddr4_sdram_dq,
    ddr4_sdram_dqs_c,
    ddr4_sdram_dqs_t,
    ddr4_sdram_odt,
    ddr4_sdram_reset_n,
    pci_express_x4_rxn,
    pci_express_x4_rxp,
    pci_express_x4_txn,
    pci_express_x4_txp,
    pcie_perstn,
    pcie_refclk_clk_n,
    pcie_refclk_clk_p,
    reset,
    reset_gpio,
    sysclk_300_clk_n,
    sysclk_300_clk_p,
    led);
  output ddr4_sdram_act_n;
  output [16:0]ddr4_sdram_adr;
  output [1:0]ddr4_sdram_ba;
  output [1:0]ddr4_sdram_bg;
  output [0:0]ddr4_sdram_ck_c;
  output [0:0]ddr4_sdram_ck_t;
  output [0:0]ddr4_sdram_cke;
  output [0:0]ddr4_sdram_cs_n;
  inout [3:0]ddr4_sdram_dm_n;
  inout [31:0]ddr4_sdram_dq;
  inout [3:0]ddr4_sdram_dqs_c;
  inout [3:0]ddr4_sdram_dqs_t;
  output [0:0]ddr4_sdram_odt;
  output ddr4_sdram_reset_n;

  input [3:0]pci_express_x4_rxn;
  input [3:0]pci_express_x4_rxp;
  output [3:0]pci_express_x4_txn;
  output [3:0]pci_express_x4_txp;

  input pcie_perstn;
  input pcie_refclk_clk_n;
  input pcie_refclk_clk_p;
  input reset;
  input reset_gpio;
  input sysclk_300_clk_n;
  input sysclk_300_clk_p;
  output [3:0] led;

  wire ddr4_sdram_act_n;
  wire [16:0]ddr4_sdram_adr;
  wire [1:0]ddr4_sdram_ba;
  wire [1:0]ddr4_sdram_bg;
  wire [0:0]ddr4_sdram_ck_c;
  wire [0:0]ddr4_sdram_ck_t;
  wire [0:0]ddr4_sdram_cke;
  wire [0:0]ddr4_sdram_cs_n;
  wire [3:0]ddr4_sdram_dm_n;
  wire [31:0]ddr4_sdram_dq;
  wire [3:0]ddr4_sdram_dqs_c;
  wire [3:0]ddr4_sdram_dqs_t;
  wire [0:0]ddr4_sdram_odt;
  wire ddr4_sdram_reset_n;

  wire sysclk_300_clk_n;
  wire sysclk_300_clk_p;

  wire [31:0]m_axi_lite_araddr;
  wire [2:0]m_axi_lite_arprot;
  wire m_axi_lite_arready;
  wire m_axi_lite_arvalid;
  wire [31:0]m_axi_lite_awaddr;
  wire [2:0]m_axi_lite_awprot;
  wire m_axi_lite_awready;
  wire m_axi_lite_awvalid;
  wire m_axi_lite_bready;
  wire [1:0]m_axi_lite_bresp;
  wire m_axi_lite_bvalid;
  wire [31:0]m_axi_lite_rdata;
  wire m_axi_lite_rready;
  wire [1:0]m_axi_lite_rresp;
  wire m_axi_lite_rvalid;
  wire [31:0]m_axi_lite_wdata;
  wire m_axi_lite_wready;
  wire [3:0]m_axi_lite_wstrb;
  wire m_axi_lite_wvalid;

  wire mig_calib_done;
  wire mig_clk, mig_clk_raw;
  wire [0:0]mig_rstn;
  wire ddr4_clk, ddr4_reset;
  wire lpddr_clk, lpddr_clk_raw;

  wire [3:0]pci_express_x4_rxn;
  wire [3:0]pci_express_x4_rxp;
  wire [3:0]pci_express_x4_txn;
  wire [3:0]pci_express_x4_txp;

  wire pcie_clk;
  wire pcie_lnk_up;
  wire pcie_perstn;

  wire pcie_refclk_clk_n;
  wire pcie_refclk_clk_p;

  wire [0:0]pcie_rstn;
  wire reset;
  wire reset_gpio;
  wire [3:0] led;
  
  wire clk_gate_lo;
  
  BUFGCE BUFGCE_mig 
  (.O (mig_clk)
  ,.CE(~clk_gate_lo)
  ,.I (mig_clk_raw)
  );
  
  BUFGCE BUFGCE_lpddr
  (.O (lpddr_clk)
  ,.CE(~clk_gate_lo)
  ,.I (lpddr_clk_raw)
  );

  wire [29:0]s_axi_araddr;
  wire [1:0]s_axi_arburst;
  wire [3:0]s_axi_arcache;
  wire [0:0]s_axi_arid;
  wire [7:0]s_axi_arlen;
  wire [0:0]s_axi_arlock;
  wire [2:0]s_axi_arprot;
  wire [3:0]s_axi_arqos;
  wire s_axi_arready;
  wire [3:0]s_axi_arregion;
  wire [2:0]s_axi_arsize;
  wire s_axi_arvalid;

  wire [29:0]s_axi_awaddr;
  wire [1:0]s_axi_awburst;
  wire [3:0]s_axi_awcache;
  wire [0:0]s_axi_awid;
  wire [7:0]s_axi_awlen;
  wire [0:0]s_axi_awlock;
  wire [2:0]s_axi_awprot;
  wire [3:0]s_axi_awqos;
  wire s_axi_awready;
  wire [3:0]s_axi_awregion;
  wire [2:0]s_axi_awsize;
  wire s_axi_awvalid;

  wire [0:0]s_axi_bid;
  wire s_axi_bready;
  wire [1:0]s_axi_bresp;
  wire s_axi_bvalid;

  wire [255:0]s_axi_rdata;
  wire [0:0]s_axi_rid;
  wire s_axi_rlast;
  wire s_axi_rready;
  wire [1:0]s_axi_rresp;
  wire s_axi_rvalid;

  wire [255:0]s_axi_wdata;
  wire s_axi_wlast;
  wire s_axi_wready;
  wire [31:0]s_axi_wstrb;
  wire s_axi_wvalid;

  
  logic clk_gate_lo_r;
  bsg_dff #(.width_p(1)) clk_gate_lo_r_dff
  (.clk_i (ddr4_clk)
  ,.data_i(clk_gate_lo)
  ,.data_o(clk_gate_lo_r)
  );
  
  logic [31:0] clk_gate_count_r;
  logic clk_gate_count_clear_li;
  bsg_counter_clear_up 
 #(.max_val_p (64'(1<<32-1))
  ,.init_val_p(0)
  ) clk_gate_count
  (.clk_i     (ddr4_clk)
  ,.reset_i   (ddr4_reset)
  ,.clear_i   (clk_gate_count_clear_li)
  ,.up_i      (~clk_gate_lo_r & clk_gate_lo)
  ,.count_o   (clk_gate_count_r)
  );
  
  logic [31:0] clk_gate_cycle_r;
  bsg_counter_clear_up 
 #(.max_val_p (64'(1<<32-1))
  ,.init_val_p(0)
  ) clk_gate_cycle
  (.clk_i     (ddr4_clk)
  ,.reset_i   (ddr4_reset)
  ,.clear_i   (clk_gate_count_clear_li)
  ,.up_i      (clk_gate_lo)
  ,.count_o   (clk_gate_cycle_r)
  );
  
  logic [31:0] clk_gate_total_r;
  bsg_counter_clear_up 
 #(.max_val_p (64'(1<<32-1))
  ,.init_val_p(0)
  ) clk_gate_total
  (.clk_i     (ddr4_clk)
  ,.reset_i   (ddr4_reset)
  ,.clear_i   (clk_gate_count_clear_li)
  ,.up_i      (1'b1)
  ,.count_o   (clk_gate_total_r)
  );
  
  design_2 design_2_i
  (.clk    (ddr4_clk)
  ,.en     (~clk_gate_lo)
  ,.arvalid(s_axi_arvalid)
  ,.arready(s_axi_arready)
  ,.rvalid (s_axi_rvalid)
  ,.rready (s_axi_rready)
  ,.count  (clk_gate_count_r)
  ,.cycle  (clk_gate_cycle_r)
  ,.total  (clk_gate_total_r)
  );
  
  
  wire m_axi_lite_v_lo, m_axi_lite_yumi_li;
  wire [31:0] m_axi_lite_addr_lo, m_axi_lite_data_lo;
  wire m_axi_lite_v_li, m_axi_lite_ready_lo;
  wire [31:0] m_axi_lite_data_li;
  
  // LEDs
  assign led[0] = pcie_lnk_up;
  assign led[1] = mig_calib_done;
  
  // mig_reset
  logic mig_reset;
  bsg_dff #(.width_p(1)) mig_dff
  (.clk_i (mig_clk)
  ,.data_i(~mig_rstn | ~mig_calib_done)
  ,.data_o(mig_reset)
  );
  
  // m_axi_lite adapter
  bsg_m_axi_lite_to_fifo
 #(.addr_width_p(32)
  ,.data_width_p(32)
  ,.buffer_size_p(16)
  ) m_axi_lite_adapter
  (.pcie_clk_i  (pcie_clk)
  ,.pcie_reset_i(~pcie_rstn)
  
  // read address
  ,.araddr_i (m_axi_lite_araddr)
  ,.arprot_i (m_axi_lite_arprot)
  ,.arready_o(m_axi_lite_arready)
  ,.arvalid_i(m_axi_lite_arvalid)
  // read data
  ,.rdata_o  (m_axi_lite_rdata)
  ,.rready_i (m_axi_lite_rready)
  ,.rresp_o  (m_axi_lite_rresp)
  ,.rvalid_o (m_axi_lite_rvalid)
  // write address
  ,.awaddr_i (m_axi_lite_awaddr)
  ,.awprot_i (m_axi_lite_awprot)
  ,.awready_o(m_axi_lite_awready)
  ,.awvalid_i(m_axi_lite_awvalid)
  // write data
  ,.wdata_i  (m_axi_lite_wdata)
  ,.wready_o (m_axi_lite_wready)
  ,.wstrb_i  (m_axi_lite_wstrb)
  ,.wvalid_i (m_axi_lite_wvalid)
  // write response
  ,.bready_i (m_axi_lite_bready)
  ,.bresp_o  (m_axi_lite_bresp)
  ,.bvalid_o (m_axi_lite_bvalid)
  
  ,.clk_i    (mig_clk)
  ,.reset_i  (mig_reset)
  // fifo output
  ,.v_o      (m_axi_lite_v_lo)
  ,.addr_o   (m_axi_lite_addr_lo)
  ,.data_o   (m_axi_lite_data_lo)
  ,.yumi_i   (m_axi_lite_yumi_li)
  // fifo input
  ,.v_i      (m_axi_lite_v_li)
  ,.data_i   (m_axi_lite_data_li)
  ,.ready_o  (m_axi_lite_ready_lo)
  );
  
`declare_bsg_ready_and_link_sif_s(io_noc_flit_width_p, bp_io_noc_ral_link_s);
`declare_bsg_ready_and_link_sif_s(mem_noc_flit_width_p, bp_mem_noc_ral_link_s);
`declare_bp_me_if(paddr_width_p, cce_block_width_p, lce_id_width_p, lce_assoc_p)

bp_io_noc_ral_link_s [E:P] cmd_link_li, cmd_link_lo;
bp_io_noc_ral_link_s [E:P] resp_link_li, resp_link_lo;

bp_cce_mem_msg_s dram_cmd_li;
logic            dram_cmd_v_li, dram_cmd_yumi_lo;
bp_cce_mem_msg_s dram_resp_lo;
logic            dram_resp_v_lo, dram_resp_ready_li;

bp_cce_mem_msg_s nbf_dram_cmd_li;
logic            nbf_dram_cmd_v_li, nbf_dram_cmd_yumi_lo;
bp_cce_mem_msg_s nbf_dram_resp_lo;
logic            nbf_dram_resp_v_lo, nbf_dram_resp_ready_li;

bp_cce_mem_msg_s a_dram_cmd_li;
logic            a_dram_cmd_v_li, a_dram_cmd_yumi_lo;
bp_cce_mem_msg_s a_dram_resp_lo;
logic            a_dram_resp_v_lo, a_dram_resp_ready_li;

bp_cce_mem_msg_s b_dram_cmd_li;
logic            b_dram_cmd_v_li, b_dram_cmd_yumi_lo;
bp_cce_mem_msg_s b_dram_resp_lo;
logic            b_dram_resp_v_lo, b_dram_resp_ready_li;

bp_io_noc_ral_link_s proc_cmd_link_li, proc_cmd_link_lo;
bp_io_noc_ral_link_s proc_resp_link_li, proc_resp_link_lo;

bp_mem_noc_ral_link_s dram_cmd_link_lo, dram_resp_link_li;

bp_cce_mem_msg_s       host_cmd_li;
logic                  host_cmd_v_li, host_cmd_yumi_lo;
bp_cce_mem_msg_s       host_resp_lo;
logic                  host_resp_v_lo, host_resp_ready_li;

bp_cce_mem_msg_s       load_cmd_lo;
logic                  load_cmd_v_lo, load_cmd_ready_li;
bp_cce_mem_msg_s       load_resp_li;
logic                  load_resp_v_li, load_resp_yumi_lo;

bp_cce_mem_msg_s       cfg_cmd_lo;
logic                  cfg_cmd_v_lo, cfg_cmd_ready_li;
bp_cce_mem_msg_s       cfg_resp_li;
logic                  cfg_resp_v_li, cfg_resp_ready_lo;

bp_cce_mem_msg_s       nbf_cmd_lo;
logic                  nbf_cmd_v_lo, nbf_cmd_ready_li;
bp_cce_mem_msg_s       nbf_resp_li;
logic                  nbf_resp_v_li, nbf_resp_ready_lo;

wire [io_noc_did_width_p-1:0] dram_did_li = '1;
wire [io_noc_did_width_p-1:0] proc_did_li = 1;

bp_io_noc_ral_link_s stub_cmd_link_li, stub_resp_link_li;
bp_io_noc_ral_link_s stub_cmd_link_lo, stub_resp_link_lo;
assign stub_cmd_link_li  = '0;
assign stub_resp_link_li = '0;

// Chip
bp_processor
 #(.bp_params_p(bp_params_p))
 proc
  (.core_clk_i(mig_clk)
   ,.core_reset_i(mig_reset)
   
   ,.coh_clk_i(mig_clk)
   ,.coh_reset_i(mig_reset)

   ,.io_clk_i(mig_clk)
   ,.io_reset_i(mig_reset)

   ,.mem_clk_i(mig_clk)
   ,.mem_reset_i(mig_reset)

   ,.my_did_i(proc_did_li)
   ,.host_did_i(dram_did_li)

   ,.io_cmd_link_i({proc_cmd_link_li, stub_cmd_link_li})
   ,.io_cmd_link_o({proc_cmd_link_lo, stub_cmd_link_lo})

   ,.io_resp_link_i({proc_resp_link_li, stub_resp_link_li})
   ,.io_resp_link_o({proc_resp_link_lo, stub_resp_link_lo})

   ,.dram_cmd_link_o(dram_cmd_link_lo)
   ,.dram_resp_link_i(dram_resp_link_li)
   );

wire [io_noc_cord_width_p-1:0] dst_cord_lo = 1;

bp_me_cce_to_mem_link_bidir
 #(.bp_params_p(bp_params_p)
   ,.num_outstanding_req_p(io_noc_max_credits_p)
   ,.flit_width_p(io_noc_flit_width_p)
   ,.cord_width_p(io_noc_cord_width_p)
   ,.cid_width_p(io_noc_cid_width_p)
   ,.len_width_p(io_noc_len_width_p)
   )
 host_link
  (.clk_i(mig_clk)
   ,.reset_i(mig_reset)

   ,.mem_cmd_i(load_cmd_lo)
   ,.mem_cmd_v_i(load_cmd_v_lo)
   ,.mem_cmd_ready_o(load_cmd_ready_li)

   ,.mem_resp_o(load_resp_li)
   ,.mem_resp_v_o(load_resp_v_li)
   ,.mem_resp_yumi_i(load_resp_yumi_lo)

   ,.my_cord_i(io_noc_cord_width_p'(dram_did_li))
   ,.my_cid_i('0)
   ,.dst_cord_i(dst_cord_lo)
   ,.dst_cid_i('0)

   ,.mem_cmd_o(host_cmd_li)
   ,.mem_cmd_v_o(host_cmd_v_li)
   ,.mem_cmd_yumi_i(host_cmd_yumi_lo)

   ,.mem_resp_i(host_resp_lo)
   ,.mem_resp_v_i(host_resp_v_lo)
   ,.mem_resp_ready_o(host_resp_ready_li)

   ,.cmd_link_i(proc_cmd_link_lo)
   ,.cmd_link_o(proc_cmd_link_li)
   ,.resp_link_i(proc_resp_link_lo)
   ,.resp_link_o(proc_resp_link_li)
   );

bp_me_cce_to_mem_link_client
 #(.bp_params_p(bp_params_p)
   ,.num_outstanding_req_p(mem_noc_max_credits_p)
   ,.flit_width_p(mem_noc_flit_width_p)
   ,.cord_width_p(mem_noc_cord_width_p)
   ,.cid_width_p(mem_noc_cid_width_p)
   ,.len_width_p(mem_noc_len_width_p)
   )
 dram_link
  (.clk_i(mig_clk)
   ,.reset_i(mig_reset)

   ,.mem_cmd_o(b_dram_cmd_li)
   ,.mem_cmd_v_o(b_dram_cmd_v_li)
   ,.mem_cmd_yumi_i(b_dram_cmd_yumi_lo)

   ,.mem_resp_i(b_dram_resp_lo)
   ,.mem_resp_v_i(b_dram_resp_v_lo)
   ,.mem_resp_ready_o(b_dram_resp_ready_li)

   ,.cmd_link_i(dram_cmd_link_lo)
   ,.resp_link_o(dram_resp_link_li)
   );


logic nbf_done_lo, cfg_done_lo, dram_sel_lo;
    
    assign nbf_cmd_lo = '0;
    assign nbf_cmd_v_lo = '0;
    assign nbf_resp_ready_lo = '0;
    
    logic [7:0] counter_r, counter_n;
    logic nbf_done_r;
    always_ff @(posedge mig_clk)
      begin
        if (mig_reset)
          begin
            counter_r <= 1;
            nbf_done_r <= 0;
          end
        else if (nbf_done_lo)
          begin
            if (counter_r == 0)
              begin
                nbf_done_r <= 1;
              end
            else
              begin
                counter_r <= counter_r + 1;
              end
          end
      end
    assign dram_sel_lo = nbf_done_r;
       
    bp_nbf_to_cce_mem
   #(.bp_params_p(bp_params_p)
    ) nbf_adapter
    (.clk_i(mig_clk)
    ,.reset_i(mig_reset)

    ,.io_cmd_i(nbf_dram_cmd_li)
    ,.io_cmd_v_i(nbf_dram_cmd_v_li)
    ,.io_cmd_yumi_o(nbf_dram_cmd_yumi_lo)

    ,.io_resp_o(nbf_dram_resp_lo)
    ,.io_resp_v_o(nbf_dram_resp_v_lo)
    ,.io_resp_ready_i(nbf_dram_resp_ready_li)

    ,.mem_cmd_o(a_dram_cmd_li)
    ,.mem_cmd_v_o(a_dram_cmd_v_li)
    ,.mem_cmd_yumi_i(a_dram_cmd_yumi_lo)

    ,.mem_resp_i(a_dram_resp_lo)
    ,.mem_resp_v_i(a_dram_resp_v_lo)
    ,.mem_resp_ready_o(a_dram_resp_ready_li)
    );
    

always_comb
  begin
    if (dram_sel_lo)
      begin
        dram_cmd_li = b_dram_cmd_li;
        dram_cmd_v_li = b_dram_cmd_v_li;
        b_dram_cmd_yumi_lo = dram_cmd_yumi_lo;
        
        b_dram_resp_lo = dram_resp_lo;
        b_dram_resp_v_lo = dram_resp_v_lo;
        dram_resp_ready_li = b_dram_resp_ready_li;
        
        a_dram_cmd_yumi_lo = a_dram_cmd_v_li;
        a_dram_resp_lo = '0;
        a_dram_resp_v_lo = 1'b0;
      end
    else
      begin
        dram_cmd_li = a_dram_cmd_li;
        dram_cmd_v_li = a_dram_cmd_v_li;
        a_dram_cmd_yumi_lo = dram_cmd_yumi_lo;
        
        a_dram_resp_lo = dram_resp_lo;
        a_dram_resp_v_lo = dram_resp_v_lo;
        dram_resp_ready_li = a_dram_resp_ready_li;
        
        b_dram_cmd_yumi_lo = b_dram_cmd_v_li;
        b_dram_resp_lo = '0;
        b_dram_resp_v_lo = 1'b0;
      end
  end


bp_cce_mmio_cfg_loader
  #(.bp_params_p(bp_params_p)
    ,.inst_width_p($bits(bp_cce_inst_s))
    ,.inst_ram_addr_width_p(cce_instr_ram_addr_width_lp)
    ,.inst_ram_els_p(num_cce_instr_ram_els_p)
    ,.cce_ucode_filename_p(cce_ucode_filename_lp)
    ,.skip_ram_init_p(0)
    ,.clear_freeze_p(1)
    )
  cfg_loader
  (.clk_i(mig_clk)
   ,.reset_i(mig_reset | ~dram_sel_lo)
   ,.lce_id_i('0)
   
   ,.io_cmd_o(cfg_cmd_lo)
   ,.io_cmd_v_o(cfg_cmd_v_lo)
   ,.io_cmd_yumi_i(cfg_cmd_ready_li & cfg_cmd_v_lo)
   
   ,.io_resp_i(cfg_resp_li)
   ,.io_resp_v_i(cfg_resp_v_li)
   ,.io_resp_ready_o(cfg_resp_ready_lo)
   
   ,.done_o(cfg_done_lo)
  );

// CFG and NBF are mutex, so we can just use fixed arbitration here
always_comb
  if (~cfg_done_lo)
    begin
      load_cmd_lo = cfg_cmd_lo;
      load_cmd_v_lo = load_cmd_ready_li & cfg_cmd_v_lo;

      nbf_cmd_ready_li = 1'b0;
      cfg_cmd_ready_li = load_cmd_ready_li;

      nbf_resp_li = '0;
      nbf_resp_v_li = 1'b0;

      cfg_resp_li = load_resp_li;
      cfg_resp_v_li = cfg_resp_ready_lo & load_resp_v_li;

      load_resp_yumi_lo = cfg_resp_v_li;
    end
  else
    begin
      load_cmd_lo = nbf_cmd_lo;
      load_cmd_v_lo = load_cmd_ready_li & nbf_cmd_v_lo;

      nbf_cmd_ready_li = load_cmd_ready_li;
      cfg_cmd_ready_li = 1'b0;

      nbf_resp_li = load_resp_li;
      nbf_resp_v_li = nbf_resp_ready_lo & load_resp_v_li;

      cfg_resp_li = '0;
      cfg_resp_v_li = 1'b0;

      load_resp_yumi_lo = nbf_resp_v_li;
    end

  
  // pcie stream host (NBF and MMIO)
  assign led[3] = nbf_done_lo;
  assign clk_gate_count_clear_li = ~nbf_done_lo;
  
  bp_stream_host
 #(.bp_params_p(bp_params_p)
  ,.stream_addr_width_p(32)
  ,.stream_data_width_p(32)
  ) host        
  (.clk_i          (mig_clk)
  ,.reset_i        (mig_reset)
  ,.prog_done_o    (nbf_done_lo)
  
  ,.io_cmd_i       (host_cmd_li)
  ,.io_cmd_v_i     (host_cmd_v_li)
  ,.io_cmd_yumi_o  (host_cmd_yumi_lo)

  ,.io_resp_o      (host_resp_lo)
  ,.io_resp_v_o    (host_resp_v_lo)
  ,.io_resp_ready_i(host_resp_ready_li)

  ,.io_cmd_o       (nbf_dram_cmd_li)
  ,.io_cmd_v_o     (nbf_dram_cmd_v_li)
  ,.io_cmd_yumi_i  (nbf_dram_cmd_yumi_lo)

  ,.io_resp_i      (nbf_dram_resp_lo)
  ,.io_resp_v_i    (nbf_dram_resp_v_lo)
  ,.io_resp_ready_o(nbf_dram_resp_ready_li)

  ,.stream_v_i     (m_axi_lite_v_lo)
  ,.stream_addr_i  (m_axi_lite_addr_lo)
  ,.stream_data_i  (m_axi_lite_data_lo)
  ,.stream_yumi_o  (m_axi_lite_yumi_li)
                   
  ,.stream_v_o     (m_axi_lite_v_li)
  ,.stream_data_o  (m_axi_lite_data_li)
  ,.stream_ready_i (m_axi_lite_ready_lo)
  );
/*  
  // CCE to cache dma
  `declare_bsg_cache_dma_pkt_s(paddr_width_p);
  
  bsg_cache_dma_pkt_s dma_pkt_lo;
  logic dma_pkt_v_lo, dma_pkt_yumi_li;
  
  logic [dword_width_p-1:0] dma_data_li;
  logic dma_data_v_li, dma_data_ready_lo;
  
  logic [dword_width_p-1:0] dma_data_lo;
  logic dma_data_v_lo, dma_data_yumi_li;
  
  logic [cache_addr_width_p+1-1:0] cache_dma_pkt_lo;
    assign cache_dma_pkt_lo = {dma_pkt_lo.write_not_read, dma_pkt_lo[cache_addr_width_p-1:0]};

  bp_me_cce_to_cache_dma
 #(.bp_params_p(bp_params_p)
  ) mem_to_dma
  (.clk_i           (mig_clk)
  ,.reset_i         (mig_reset)
                    
  ,.dma_pkt_o       (dma_pkt_lo)
  ,.dma_pkt_v_o     (dma_pkt_v_lo)
  ,.dma_pkt_yumi_i  (dma_pkt_yumi_li)

  ,.dma_data_i      (dma_data_li)
  ,.dma_data_v_i    (dma_data_v_li)
  ,.dma_data_ready_o(dma_data_ready_lo)

  ,.dma_data_o      (dma_data_lo)
  ,.dma_data_v_o    (dma_data_v_lo)
  ,.dma_data_yumi_i (dma_data_yumi_li)

  ,.mem_cmd_i       (dram_cmd_li)
  ,.mem_cmd_v_i     (dram_cmd_v_li)
  ,.mem_cmd_yumi_o  (dram_cmd_yumi_lo)

  ,.mem_resp_o      (dram_resp_lo)
  ,.mem_resp_v_o    (dram_resp_v_lo)
  ,.mem_resp_ready_i(dram_resp_ready_li)
  );

  // s_axi port
  // not supported
  assign s_axi_arqos    = '0;
  assign s_axi_arregion = '0;
  assign s_axi_awqos    = '0;
  assign s_axi_awregion = '0;
  
  
  // DEBUG
  wire [29:0] s_axi_debug_araddr;
  wire [1:0]  s_axi_debug_arburst;
  wire [3:0]  s_axi_debug_arcache;
  wire [0:0]  s_axi_debug_arid;
  wire [7:0]  s_axi_debug_arlen;
  wire [0:0]  s_axi_debug_arlock;
  wire [2:0]  s_axi_debug_arprot;
  wire        s_axi_debug_arready;
  wire [2:0]  s_axi_debug_arsize;
  wire        s_axi_debug_arvalid;

  wire [29:0] s_axi_debug_awaddr;
  wire [1:0]  s_axi_debug_awburst;
  wire [3:0]  s_axi_debug_awcache;
  wire [0:0]  s_axi_debug_awid;
  wire [7:0]  s_axi_debug_awlen;
  wire [0:0]  s_axi_debug_awlock;
  wire [2:0]  s_axi_debug_awprot;
  wire        s_axi_debug_awready;
  wire [2:0]  s_axi_debug_awsize;
  wire        s_axi_debug_awvalid;

  wire [0:0]  s_axi_debug_bid;
  wire        s_axi_debug_bready;
  wire [1:0]  s_axi_debug_bresp;
  wire        s_axi_debug_bvalid;

  wire [255:0]s_axi_debug_rdata;
  wire [0:0]  s_axi_debug_rid;
  wire        s_axi_debug_rlast;
  wire        s_axi_debug_rready;
  wire [1:0]  s_axi_debug_rresp;
  wire        s_axi_debug_rvalid;

  wire [255:0]s_axi_debug_wdata;
  wire        s_axi_debug_wlast;
  wire        s_axi_debug_wready;
  wire [31:0] s_axi_debug_wstrb;
  wire        s_axi_debug_wvalid;
  
  wire ar_async_fifo_full_lo;
  assign s_axi_debug_arready = ~ar_async_fifo_full_lo;
  bsg_async_fifo
 #(.lg_size_p(3)
  ,.width_p  (52)
  ) ar_async_fifo
  (.w_clk_i  (mig_clk)
  ,.w_reset_i(mig_reset)
  ,.w_enq_i  (s_axi_debug_arvalid & s_axi_debug_arready)
  ,.w_data_i ({s_axi_debug_araddr, s_axi_debug_arburst, s_axi_debug_arcache, s_axi_debug_arid, s_axi_debug_arlen, s_axi_debug_arlock, s_axi_debug_arprot, s_axi_debug_arsize})
  ,.w_full_o (ar_async_fifo_full_lo)

  ,.r_clk_i  (ddr4_clk)
  ,.r_reset_i(ddr4_reset)
  ,.r_deq_i  (s_axi_arvalid & s_axi_arready)
  ,.r_data_o ({s_axi_araddr, s_axi_arburst, s_axi_arcache, s_axi_arid, s_axi_arlen, s_axi_arlock, s_axi_arprot, s_axi_arsize})
  ,.r_valid_o(s_axi_arvalid)
  );

  wire aw_async_fifo_full_lo;
  assign s_axi_debug_awready = ~aw_async_fifo_full_lo;
  bsg_async_fifo
 #(.lg_size_p(3)
  ,.width_p  (52)
  ) aw_async_fifo
  (.w_clk_i  (mig_clk)
  ,.w_reset_i(mig_reset)
  ,.w_enq_i  (s_axi_debug_awvalid & s_axi_debug_awready)
  ,.w_data_i ({s_axi_debug_awaddr, s_axi_debug_awburst, s_axi_debug_awcache, s_axi_debug_awid, s_axi_debug_awlen, s_axi_debug_awlock, s_axi_debug_awprot, s_axi_debug_awsize})
  ,.w_full_o (aw_async_fifo_full_lo)

  ,.r_clk_i  (ddr4_clk)
  ,.r_reset_i(ddr4_reset)
  ,.r_deq_i  (s_axi_awvalid & s_axi_awready)
  ,.r_data_o ({s_axi_awaddr, s_axi_awburst, s_axi_awcache, s_axi_awid, s_axi_awlen, s_axi_awlock, s_axi_awprot, s_axi_awsize})
  ,.r_valid_o(s_axi_awvalid)
  );

  wire b_async_fifo_full_lo;
  assign s_axi_bready = ~b_async_fifo_full_lo;
  bsg_async_fifo
 #(.lg_size_p(3)
  ,.width_p  (3)
  ) b_async_fifo
  (.w_clk_i  (ddr4_clk)
  ,.w_reset_i(ddr4_reset)
  ,.w_enq_i  (s_axi_bvalid & s_axi_bready)
  ,.w_data_i ({s_axi_bid, s_axi_bresp})
  ,.w_full_o (b_async_fifo_full_lo)

  ,.r_clk_i  (mig_clk)
  ,.r_reset_i(mig_reset)
  ,.r_deq_i  (s_axi_debug_bvalid & s_axi_debug_bready)
  ,.r_data_o ({s_axi_debug_bid, s_axi_debug_bresp})
  ,.r_valid_o(s_axi_debug_bvalid)
  );

  wire r_async_fifo_full_lo;
  assign s_axi_rready = ~r_async_fifo_full_lo;
  bsg_async_fifo
 #(.lg_size_p(3)
  ,.width_p  (260)
  ) r_async_fifo
  (.w_clk_i  (ddr4_clk)
  ,.w_reset_i(ddr4_reset)
  ,.w_enq_i  (s_axi_rvalid & s_axi_rready)
  ,.w_data_i ({s_axi_rdata, s_axi_rid, s_axi_rlast, s_axi_rresp})
  ,.w_full_o (r_async_fifo_full_lo)

  ,.r_clk_i  (mig_clk)
  ,.r_reset_i(mig_reset)
  ,.r_deq_i  (s_axi_debug_rvalid & s_axi_debug_rready)
  ,.r_data_o ({s_axi_debug_rdata, s_axi_debug_rid, s_axi_debug_rlast, s_axi_debug_rresp})
  ,.r_valid_o(s_axi_debug_rvalid)
  );
  
  wire w_async_fifo_full_lo;
  assign s_axi_debug_wready = ~w_async_fifo_full_lo;
  bsg_async_fifo
 #(.lg_size_p(3)
  ,.width_p  (289)
  ) w_async_fifo
  (.w_clk_i  (mig_clk)
  ,.w_reset_i(mig_reset)
  ,.w_enq_i  (s_axi_debug_wvalid & s_axi_debug_wready)
  ,.w_data_i ({s_axi_debug_wdata, s_axi_debug_wlast, s_axi_debug_wstrb})

  ,.r_clk_i  (ddr4_clk)
  ,.r_reset_i(ddr4_reset)
  ,.r_deq_i  (s_axi_wvalid & s_axi_wready)
  ,.r_data_o ({s_axi_wdata, s_axi_wlast, s_axi_wstrb})
  ,.r_valid_o(s_axi_wvalid)
  );


  bsg_cache_to_axi 
 #(.addr_width_p         (cache_addr_width_p)
  ,.block_size_in_words_p(cce_block_width_p/dword_width_p)
  ,.data_width_p         (dword_width_p)
  ,.num_cache_p          (1)
  ,.tag_fifo_els_p       (1)

  ,.axi_id_width_p       (axi_id_width_p)
  ,.axi_addr_width_p     (axi_addr_width_p)
  ,.axi_data_width_p     (axi_data_width_p)
  ,.axi_burst_len_p      (axi_burst_len_p)
  ) cache_to_axi 
  (.clk_i  (mig_clk)
  ,.reset_i(mig_reset)
  
  ,.dma_pkt_i       (cache_dma_pkt_lo)
  ,.dma_pkt_v_i     (dma_pkt_v_lo)
  ,.dma_pkt_yumi_o  (dma_pkt_yumi_li)
  
  ,.dma_data_o      (dma_data_li)
  ,.dma_data_v_o    (dma_data_v_li)
  ,.dma_data_ready_i(dma_data_ready_lo)
  
  ,.dma_data_i      (dma_data_lo)
  ,.dma_data_v_i    (dma_data_v_lo)
  ,.dma_data_yumi_o (dma_data_yumi_li)

  ,.axi_awid_o      (s_axi_debug_awid)
  ,.axi_awaddr_o    (s_axi_debug_awaddr)
  ,.axi_awlen_o     (s_axi_debug_awlen)
  ,.axi_awsize_o    (s_axi_debug_awsize)
  ,.axi_awburst_o   (s_axi_debug_awburst)
  ,.axi_awcache_o   (s_axi_debug_awcache)
  ,.axi_awprot_o    (s_axi_debug_awprot)
  ,.axi_awlock_o    (s_axi_debug_awlock)
  ,.axi_awvalid_o   (s_axi_debug_awvalid)
  ,.axi_awready_i   (s_axi_debug_awready)

  ,.axi_wdata_o     (s_axi_debug_wdata)
  ,.axi_wstrb_o     (s_axi_debug_wstrb)
  ,.axi_wlast_o     (s_axi_debug_wlast)
  ,.axi_wvalid_o    (s_axi_debug_wvalid)
  ,.axi_wready_i    (s_axi_debug_wready)

  ,.axi_bid_i       (s_axi_debug_bid)
  ,.axi_bresp_i     (s_axi_debug_bresp)
  ,.axi_bvalid_i    (s_axi_debug_bvalid)
  ,.axi_bready_o    (s_axi_debug_bready)

  ,.axi_arid_o      (s_axi_debug_arid)
  ,.axi_araddr_o    (s_axi_debug_araddr)
  ,.axi_arlen_o     (s_axi_debug_arlen)
  ,.axi_arsize_o    (s_axi_debug_arsize)
  ,.axi_arburst_o   (s_axi_debug_arburst)
  ,.axi_arcache_o   (s_axi_debug_arcache)
  ,.axi_arprot_o    (s_axi_debug_arprot)
  ,.axi_arlock_o    (s_axi_debug_arlock)
  ,.axi_arvalid_o   (s_axi_debug_arvalid)
  ,.axi_arready_i   (s_axi_debug_arready)

  ,.axi_rid_i       (s_axi_debug_rid)
  ,.axi_rdata_i     (s_axi_debug_rdata)
  ,.axi_rresp_i     (s_axi_debug_rresp)
  ,.axi_rlast_i     (s_axi_debug_rlast)
  ,.axi_rvalid_i    (s_axi_debug_rvalid)
  ,.axi_rready_o    (s_axi_debug_rready)
  );
*/


  // DMC
  //localparam ui_addr_width_p = paddr_width_p; // word address (1 TB)
  //localparam ui_data_width_p = dword_width_p;
  //localparam burst_data_width_p = cce_block_width_p;
  localparam dq_data_width_p = 32;
  //localparam dq_group_lp = dq_data_width_p >> 3;
  localparam dmc_addr_width_gp = 28;
  localparam dmc_data_width_gp = 32;

  wire                              app_en_lo;
  wire                              app_rdy_li;
  wire                        [2:0] app_cmd_lo;
  wire          [paddr_width_p-1:0] app_addr_lo;
  wire      [dmc_addr_width_gp-1:0] app_addr_li = app_addr_lo[2+:dmc_addr_width_gp];

  wire                              app_wdf_wren_lo;
  wire                              app_wdf_rdy_li;
  wire      [cce_block_width_p-1:0] app_wdf_data_lo;
  wire [(cce_block_width_p>>3)-1:0] app_wdf_mask_lo;
  wire                              app_wdf_end_lo;

  wire                              app_rd_data_valid_li;
  wire      [cce_block_width_p-1:0] app_rd_data_li;
  wire                              app_rd_data_end_li;

  wire                        [2:0] ddr_ba_lo;
  wire                       [15:0] ddr_addr_lo;

  wire   [(dq_data_width_p>>3)-1:0] ddr_dm_lo;
  wire   [(dq_data_width_p>>3)-1:0] ddr_dm_oen_lo;

  wire   [(dq_data_width_p>>3)-1:0] ddr_dqs_p_oen_lo;
  wire   [(dq_data_width_p>>3)-1:0] ddr_dqs_p_ien_lo;
  wire   [(dq_data_width_p>>3)-1:0] ddr_dqs_p_lo;
  wire   [(dq_data_width_p>>3)-1:0] ddr_dqs_p_li;

  wire   [(dq_data_width_p>>3)-1:0] ddr_dqs_n_oen_lo;
  wire   [(dq_data_width_p>>3)-1:0] ddr_dqs_n_ien_lo;
  wire   [(dq_data_width_p>>3)-1:0] ddr_dqs_n_lo;
  wire   [(dq_data_width_p>>3)-1:0] ddr_dqs_n_li;

  wire        [dq_data_width_p-1:0] ddr_dq_li;
  wire        [dq_data_width_p-1:0] ddr_dq_lo;
  wire        [dq_data_width_p-1:0] ddr_dq_oen_lo;
  
  logic dram_cmd_ready_lo;
  assign dram_cmd_yumi_lo = dram_cmd_v_li & dram_cmd_ready_lo;

  bp_me_cce_to_xui
   #(.bp_params_p(bp_params_p)
     ,.flit_width_p(mem_noc_flit_width_p)
     ,.cord_width_p(mem_noc_cord_width_p)
     ,.cid_width_p(mem_noc_cid_width_p)
     ,.len_width_p(mem_noc_len_width_p)
     )
   dmc_link
    (.clk_i(mig_clk)
     ,.reset_i(mig_reset)

     ,.mem_cmd_i(dram_cmd_li)
     ,.mem_cmd_v_i(dram_cmd_v_li)
     ,.mem_cmd_ready_o(dram_cmd_ready_lo)

     ,.mem_resp_o(dram_resp_lo)
     ,.mem_resp_v_o(dram_resp_v_lo)
     ,.mem_resp_yumi_i(dram_resp_ready_li & dram_resp_v_lo)

     ,.app_addr_o(app_addr_lo)
     ,.app_cmd_o(app_cmd_lo)
     ,.app_en_o(app_en_lo)
     ,.app_rdy_i(app_rdy_li)
     ,.app_wdf_wren_o(app_wdf_wren_lo)
     ,.app_wdf_data_o(app_wdf_data_lo)
     ,.app_wdf_mask_o(app_wdf_mask_lo)
     ,.app_wdf_end_o(app_wdf_end_lo)
     ,.app_wdf_rdy_i(app_wdf_rdy_li)
     ,.app_rd_data_valid_i(app_rd_data_valid_li)
     ,.app_rd_data_i(app_rd_data_li)
     ,.app_rd_data_end_i(app_rd_data_end_li)
     );
     
  bsg_dmc_s dmc_p;

  assign dmc_p.trefi        = 16'h03ff;
  assign dmc_p.tmrd         = 4'h1;
  assign dmc_p.trfc         = 4'hf;
  assign dmc_p.trc          = 4'ha;
  assign dmc_p.trp          = 4'h3;
  assign dmc_p.tras         = 4'h7;
  assign dmc_p.trrd         = 4'h1;
  assign dmc_p.trcd         = 4'h2;
  assign dmc_p.twr          = 4'hb;
  assign dmc_p.twtr         = 4'h7;
  assign dmc_p.trtp         = 4'h8;
  assign dmc_p.tcas         = 4'h3;
  assign dmc_p.col_width    = 4'hb;
  assign dmc_p.row_width    = 4'he;
  assign dmc_p.bank_width   = 2'h2;
  assign dmc_p.dqs_sel_cal  = 2'h0;
  assign dmc_p.init_cmd_cnt = 4'h5;
  assign dmc_p.bank_pos     = 6'h19;

  wire   dmc_sys_reset_li   = mig_reset;

  localparam ui_mask_width_lp   = cce_block_width_p >> 3      ;
  localparam dfi_data_width_lp  = dmc_data_width_gp << 1      ;
  localparam dfi_mask_width_lp  = (dq_data_width_p >> 3) << 1 ;
  localparam axi_strb_width_lp  = axi_data_width_p>>3         ;
  localparam dq_group_lp        = dq_data_width_p >> 3        ;

  wire                         [2:0] dfi_bank;
  wire                        [15:0] dfi_address;
  wire                               dfi_cke;
  wire                               dfi_cs_n;
  wire                               dfi_ras_n;
  wire                               dfi_cas_n;
  wire                               dfi_we_n;
  wire                               dfi_reset_n;
  wire                               dfi_odt;
  wire                               dfi_wrdata_en;
  wire       [dfi_data_width_lp-1:0] dfi_wrdata;
  wire       [dfi_mask_width_lp-1:0] dfi_wrdata_mask;
  wire                               dfi_rddata_en;
  wire       [dfi_data_width_lp-1:0] dfi_rddata;
  wire                               dfi_rddata_valid;

  wire             [dq_group_lp-1:0] dqs_p_li;

  wire                                       fifo_error;
  assign clk_gate_lo = fifo_error;
  
  wire                                       fifo_wr_v;
  wire [2*dq_data_width_p+2*dq_group_lp-1:0] fifo_wr_data;
  wire                                       fifo_wr_ready;
  wire                                       fifo_cmd_v;
  wire                          [3+16+7-1:0] fifo_cmd_data;
  wire                                       fifo_cmd_ready;
  wire                                       fifo_rd_yumi;
  wire                                       fifo_rd_v;
  wire               [2*dq_data_width_p-1:0] fifo_rd_data;

  logic lpddr_reset;
  bsg_sync_sync #(.width_p(1)) lpddr_bss
    (.oclk_i      ( lpddr_clk   )
    ,.iclk_data_i ( mig_reset     )
    ,.oclk_data_o ( lpddr_reset       ));

  bsg_dmc_controller #
    (.ui_addr_width_p       ( dmc_addr_width_gp       )
    ,.ui_data_width_p       ( cce_block_width_p       )
    ,.burst_data_width_p    ( cce_block_width_p    )
    ,.dfi_data_width_p      ( dfi_data_width_lp     ))
  dmc_controller
    // User interface clock and reset
    (.ui_clk_i              ( mig_clk              )
    ,.ui_clk_sync_rst_i     ( mig_reset              )
    // User interface signals
    ,.app_addr_i            ( app_addr_li            )
    ,.app_cmd_i             ( app_cmd_lo             )
    ,.app_en_i              ( app_en_lo              )
    ,.app_rdy_o             ( app_rdy_li             )
    ,.app_wdf_wren_i        ( app_wdf_wren_lo        )
    ,.app_wdf_data_i        ( app_wdf_data_lo        )
    ,.app_wdf_mask_i        ( app_wdf_mask_lo        )
    ,.app_wdf_end_i         ( app_wdf_end_lo         )
    ,.app_wdf_rdy_o         ( app_wdf_rdy_li         )
    ,.app_rd_data_valid_o   ( app_rd_data_valid_li   )
    ,.app_rd_data_o         ( app_rd_data_li         )
    ,.app_rd_data_end_o     ( app_rd_data_end_li     )
    ,.app_ref_req_i         ( 1'b0 )
    ,.app_ref_ack_o         ()
    ,.app_zq_req_i          ( 1'b0 )
    ,.app_zq_ack_o          ()
    ,.app_sr_req_i          ( 1'b0 )
    ,.app_sr_active_o       ()
    // DDR PHY interface clock and reset
    ,.dfi_clk_i             ( lpddr_clk         )
    ,.dfi_clk_sync_rst_i    ( lpddr_reset             )
    // DDR PHY interface signals
    ,.dfi_bank_o            ( dfi_bank              )
    ,.dfi_address_o         ( dfi_address           )
    ,.dfi_cke_o             ( dfi_cke               )
    ,.dfi_cs_n_o            ( dfi_cs_n              )
    ,.dfi_ras_n_o           ( dfi_ras_n             )
    ,.dfi_cas_n_o           ( dfi_cas_n             )
    ,.dfi_we_n_o            ( dfi_we_n              )
    ,.dfi_reset_n_o         ( dfi_reset_n           )
    ,.dfi_odt_o             ( dfi_odt               )
    ,.dfi_wrdata_en_o       ( dfi_wrdata_en         )
    ,.dfi_wrdata_o          ( dfi_wrdata            )
    ,.dfi_wrdata_mask_o     ( dfi_wrdata_mask       )
    ,.dfi_rddata_en_o       ( dfi_rddata_en         )
    ,.dfi_rddata_i          ( dfi_rddata            )
    ,.dfi_rddata_valid_i    ( dfi_rddata_valid      )
    // Control and Status Registers
    ,.dmc_p_i               ( dmc_p               )
    //
    ,.init_calib_complete_o (  ));
    
  bsg_dfi_to_fifo 
 #(.dq_data_width_p(dq_data_width_p)
  ) dfi_to_fifo
  // DDR PHY interface clock and reset
  (.dfi_clk_1x_i        ( lpddr_clk       )
  ,.dfi_clk_2x_i        (         )
  ,.dfi_rst_i           ( lpddr_reset           )
  // DFI interface signals
  ,.dfi_bank_i          ( dfi_bank            )
  ,.dfi_address_i       ( dfi_address         )
  ,.dfi_cke_i           ( dfi_cke             )
  ,.dfi_cs_n_i          ( dfi_cs_n            )
  ,.dfi_ras_n_i         ( dfi_ras_n           )
  ,.dfi_cas_n_i         ( dfi_cas_n           )
  ,.dfi_we_n_i          ( dfi_we_n            )
  ,.dfi_reset_n_i       ( dfi_reset_n         )
  ,.dfi_odt_i           ( dfi_odt             )
  ,.dfi_wrdata_en_i     ( dfi_wrdata_en       )
  ,.dfi_wrdata_i        ( dfi_wrdata          )
  ,.dfi_wrdata_mask_i   ( dfi_wrdata_mask     )
  ,.dfi_rddata_en_i     ( dfi_rddata_en       )
  ,.dfi_rddata_o        ( dfi_rddata          )
  ,.dfi_rddata_valid_o  ( dfi_rddata_valid    )
  // fifo signals
  ,.fifo_clk_i      (ddr4_clk)
  ,.fifo_reset_i    (ddr4_reset)
  ,.fifo_error_o    (fifo_error)

  ,.fifo_wr_v_o     (fifo_wr_v)
  ,.fifo_wr_data_o  (fifo_wr_data)
  ,.fifo_wr_ready_i (fifo_wr_ready)

  ,.fifo_cmd_v_o    (fifo_cmd_v)
  ,.fifo_cmd_data_o (fifo_cmd_data)
  ,.fifo_cmd_ready_i(fifo_cmd_ready)

  ,.fifo_rd_v_i     (fifo_rd_v)
  ,.fifo_rd_data_i  (fifo_rd_data)
  ,.fifo_rd_yumi_o  (fifo_rd_yumi)
  );

  bsg_fifo_to_axi
 #( .dq_data_width_p (dq_data_width_p)
   ,.axi_id_width_p  (axi_id_width_p)
   ,.axi_addr_width_p(axi_addr_width_p)
   ,.axi_data_width_p(axi_data_width_p)
   ,.axi_burst_len_p (axi_burst_len_p)
  ) fifo_to_axi
  (.clk_i           (ddr4_clk)
  ,.reset_i         (ddr4_reset)
  ,.fifo_error_i    (fifo_error)
  ,.fifo_wr_v_i     (fifo_wr_v)
  ,.fifo_wr_data_i  (fifo_wr_data)
  ,.fifo_wr_ready_o (fifo_wr_ready)
  ,.fifo_cmd_v_i    (fifo_cmd_v)
  ,.fifo_cmd_data_i (fifo_cmd_data)
  ,.fifo_cmd_ready_o(fifo_cmd_ready)
  ,.fifo_rd_yumi_i  (fifo_rd_yumi)
  ,.fifo_rd_v_o     (fifo_rd_v)
  ,.fifo_rd_data_o  (fifo_rd_data)
  ,.axi_awready_i   (s_axi_awready)
  ,.axi_awid_o      (s_axi_awid)
  ,.axi_awaddr_o    (s_axi_awaddr)
  ,.axi_awvalid_o   (s_axi_awvalid)
  ,.axi_awlen_o     (s_axi_awlen)
  ,.axi_awsize_o    (s_axi_awsize)
  ,.axi_awburst_o   (s_axi_awburst)
  ,.axi_awcache_o   (s_axi_awcache)
  ,.axi_awprot_o    (s_axi_awprot)
  ,.axi_awlock_o    (s_axi_awlock)
  ,.axi_wready_i    (s_axi_wready)
  ,.axi_wdata_o     (s_axi_wdata)
  ,.axi_wstrb_o     (s_axi_wstrb)
  ,.axi_wlast_o     (s_axi_wlast)
  ,.axi_wvalid_o    (s_axi_wvalid)
  ,.axi_bid_i       (s_axi_bid)
  ,.axi_bresp_i     (s_axi_bresp)
  ,.axi_bvalid_i    (s_axi_bvalid)
  ,.axi_bready_o    (s_axi_bready)
  ,.axi_arready_i   (s_axi_arready)
  ,.axi_arid_o      (s_axi_arid)
  ,.axi_araddr_o    (s_axi_araddr)
  ,.axi_arvalid_o   (s_axi_arvalid)
  ,.axi_arlen_o     (s_axi_arlen)
  ,.axi_arsize_o    (s_axi_arsize)
  ,.axi_arburst_o   (s_axi_arburst)
  ,.axi_arcache_o   (s_axi_arcache)
  ,.axi_arprot_o    (s_axi_arprot)
  ,.axi_arlock_o    (s_axi_arlock)
  ,.axi_rid_i       (s_axi_rid)
  ,.axi_rdata_i     (s_axi_rdata)
  ,.axi_rresp_i     (s_axi_rresp)
  ,.axi_rlast_i     (s_axi_rlast)
  ,.axi_rvalid_i    (s_axi_rvalid)
  ,.axi_rready_o    (s_axi_rready)
  );
  
  // s_axi port
  // not supported
  assign s_axi_arqos    = '0;
  assign s_axi_arregion = '0;
  assign s_axi_awqos    = '0;
  assign s_axi_awregion = '0;

  
  // LED breathing
  logic led_breath;
  logic [31:0] led_counter_r;
  assign led[2] = led_breath;
  always_ff @(posedge mig_clk)
    if (mig_reset)
      begin
        led_counter_r <= '0;
        led_breath <= 1'b0;
      end
    else
      begin
        led_counter_r <= (led_counter_r == 32'd50000000)? '0 : led_counter_r + 1;
        led_breath <= (led_counter_r == 32'd50000000)? ~led_breath : led_breath;
      end


  design_1 design_1_i
       (.ddr4_sdram_act_n(ddr4_sdram_act_n),
        .ddr4_sdram_adr(ddr4_sdram_adr),
        .ddr4_sdram_ba(ddr4_sdram_ba),
        .ddr4_sdram_bg(ddr4_sdram_bg),
        .ddr4_sdram_ck_c(ddr4_sdram_ck_c),
        .ddr4_sdram_ck_t(ddr4_sdram_ck_t),
        .ddr4_sdram_cke(ddr4_sdram_cke),
        .ddr4_sdram_cs_n(ddr4_sdram_cs_n),
        .ddr4_sdram_dm_n(ddr4_sdram_dm_n),
        .ddr4_sdram_dq(ddr4_sdram_dq),
        .ddr4_sdram_dqs_c(ddr4_sdram_dqs_c),
        .ddr4_sdram_dqs_t(ddr4_sdram_dqs_t),
        .ddr4_sdram_odt(ddr4_sdram_odt),
        .ddr4_sdram_reset_n(ddr4_sdram_reset_n),
        .sysclk_300_clk_n(sysclk_300_clk_n),
        .sysclk_300_clk_p(sysclk_300_clk_p),
        .m_axi_lite_araddr(m_axi_lite_araddr),
        .m_axi_lite_arprot(m_axi_lite_arprot),
        .m_axi_lite_arready(m_axi_lite_arready),
        .m_axi_lite_arvalid(m_axi_lite_arvalid),
        .m_axi_lite_awaddr(m_axi_lite_awaddr),
        .m_axi_lite_awprot(m_axi_lite_awprot),
        .m_axi_lite_awready(m_axi_lite_awready),
        .m_axi_lite_awvalid(m_axi_lite_awvalid),
        .m_axi_lite_bready(m_axi_lite_bready),
        .m_axi_lite_bresp(m_axi_lite_bresp),
        .m_axi_lite_bvalid(m_axi_lite_bvalid),
        .m_axi_lite_rdata(m_axi_lite_rdata),
        .m_axi_lite_rready(m_axi_lite_rready),
        .m_axi_lite_rresp(m_axi_lite_rresp),
        .m_axi_lite_rvalid(m_axi_lite_rvalid),
        .m_axi_lite_wdata(m_axi_lite_wdata),
        .m_axi_lite_wready(m_axi_lite_wready),
        .m_axi_lite_wstrb(m_axi_lite_wstrb),
        .m_axi_lite_wvalid(m_axi_lite_wvalid),
        .mig_calib_done(mig_calib_done),
        .mig_clk(mig_clk_raw),
        .mig_rstn(mig_rstn),
        .ddr4_clk(ddr4_clk),
        .ddr4_reset(ddr4_reset),
        .lpddr_clk(lpddr_clk_raw),
        .pci_express_x4_rxn(pci_express_x4_rxn),
        .pci_express_x4_rxp(pci_express_x4_rxp),
        .pci_express_x4_txn(pci_express_x4_txn),
        .pci_express_x4_txp(pci_express_x4_txp),
        .pcie_clk(pcie_clk),
        .pcie_lnk_up(pcie_lnk_up),
        .pcie_perstn(pcie_perstn),
        .pcie_refclk_clk_n(pcie_refclk_clk_n),
        .pcie_refclk_clk_p(pcie_refclk_clk_p),
        .pcie_rstn(pcie_rstn),
        .reset(reset_gpio),
        .s_axi_araddr(s_axi_araddr),
        .s_axi_arburst(s_axi_arburst),
        .s_axi_arcache(s_axi_arcache),
        .s_axi_arid(s_axi_arid),
        .s_axi_arlen(s_axi_arlen),
        .s_axi_arlock(s_axi_arlock),
        .s_axi_arprot(s_axi_arprot),
        .s_axi_arqos(s_axi_arqos),
        .s_axi_arready(s_axi_arready),
        .s_axi_arsize(s_axi_arsize),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awburst(s_axi_awburst),
        .s_axi_awcache(s_axi_awcache),
        .s_axi_awid(s_axi_awid),
        .s_axi_awlen(s_axi_awlen),
        .s_axi_awlock(s_axi_awlock),
        .s_axi_awprot(s_axi_awprot),
        .s_axi_awqos(s_axi_awqos),
        .s_axi_awready(s_axi_awready),
        .s_axi_awsize(s_axi_awsize),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bid(s_axi_bid),
        .s_axi_bready(s_axi_bready),
        .s_axi_bresp(s_axi_bresp),
        .s_axi_bvalid(s_axi_bvalid),
        .s_axi_rdata(s_axi_rdata),
        .s_axi_rid(s_axi_rid),
        .s_axi_rlast(s_axi_rlast),
        .s_axi_rready(s_axi_rready),
        .s_axi_rresp(s_axi_rresp),
        .s_axi_rvalid(s_axi_rvalid),
        .s_axi_wdata(s_axi_wdata),
        .s_axi_wlast(s_axi_wlast),
        .s_axi_wready(s_axi_wready),
        .s_axi_wstrb(s_axi_wstrb),
        .s_axi_wvalid(s_axi_wvalid));
endmodule
