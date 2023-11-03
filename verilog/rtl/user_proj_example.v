// SPDX-FileCopyrightText: 2020 Efabless Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

`default_nettype none
/*
 *-------------------------------------------------------------
 *
 * user_proj_example
 *
 * This is an example of a (trivially simple) user project,
 * showing how the user project can connect to the logic
 * analyzer, the wishbone bus, and the I/O pads.
 *
 * This project generates an integer count, which is output
 * on the user area GPIO pads (digital output only).  The
 * wishbone connection allows the project to be controlled
 * (start and stop) from the management SoC program.
 *
 * See the testbenches in directory "mprj_counter" for the
 * example programs that drive this user project.  The three
 * testbenches are "io_ports", "la_test1", and "la_test2".
 *
 *-------------------------------------------------------------
 */

module user_proj_example #(
    parameter BITS = 16
)(
`ifdef USE_POWER_PINS
    inout vccd1,	// User area 1 1.8V supply
    inout vssd1,	// User area 1 digital ground
`endif

    // Wishbone Slave ports (WB MI A)
    input wb_clk_i,
    input wb_rst_i,
    input wbs_stb_i,
    input wbs_cyc_i,
    input wbs_we_i,
    input [3:0] wbs_sel_i,
    input [31:0] wbs_dat_i,
    input [31:0] wbs_adr_i,
    output [31:0] wbs_dat_o
);
    wire [31:0] dat_w;
    wire [31:0] dat_r;
    wire sel;
    wire we;
    wire cyc;
    wire stb;
    wire clk;
    wire rst;
    wire [31:0] adr;
    
    assign dat_w = wbs_dat_i;
    assign wbs_dat_o = dat_r;
    assign sel = wbs_sel_i[0];
    assign we = wbs_we_i;
    assign cyc = wbs_cyc_i;
    assign stb = wbs_stb_i;
    assign clk = wb_clk_i;
    assign rst = wb_rst_i;
    assign adr = wbs_adr_i;
    
    RNG RNG(
        .dat_w(dat_w),
        .dat_r(dat_r),
        .sel(sel),
        .we(we),
        .cyc(cyc),
        .stb(stb),
        .clk(clk),
        .rst(rst),
        .adr(adr)
    );

endmodule

module RNG(dat_w, dat_r, sel, we, cyc, stb, clk, rst, adr);
  reg \$auto$verilog_backend.cc:2097:dump_module$1  = 0;
  (* src = "/home/james/Desktop/check.py:27" *)
  wire [31:0] \$1 ;
  (* src = "/home/james/Desktop/check.py:28" *)
  wire [128:0] \$10 ;
  (* src = "/home/james/Desktop/check.py:27" *)
  wire [31:0] \$3 ;
  (* src = "/home/james/Desktop/check.py:28" *)
  wire [128:0] \$5 ;
  (* src = "/home/james/Desktop/check.py:28" *)
  wire [127:0] \$6 ;
  (* src = "/home/james/Desktop/check.py:28" *)
  wire [128:0] \$8 ;
  (* src = "/home/james/.local/lib/python3.10/site-packages/amaranth/lib/wiring.py:227" *)
  input [31:0] adr;
  wire [31:0] adr;
  (* src = "/home/james/.local/lib/python3.10/site-packages/amaranth/hdl/ir.py:508" *)
  input clk;
  wire clk;
  (* src = "/home/james/.local/lib/python3.10/site-packages/amaranth/lib/wiring.py:227" *)
  input cyc;
  wire cyc;
  (* src = "/home/james/.local/lib/python3.10/site-packages/amaranth/lib/wiring.py:227" *)
  output [31:0] dat_r;
  reg [31:0] dat_r;
  (* src = "/home/james/.local/lib/python3.10/site-packages/amaranth/lib/wiring.py:227" *)
  input [31:0] dat_w;
  wire [31:0] dat_w;
  (* src = "/home/james/Desktop/check.py:10" *)
  reg [63:0] increment = 64'h14057b7ef767814f;
  (* src = "/home/james/Desktop/check.py:10" *)
  reg [63:0] \increment$next ;
  (* src = "/home/james/Desktop/check.py:9" *)
  reg [63:0] multiplier = 64'h5851f42d4c957f2d;
  (* src = "/home/james/Desktop/check.py:9" *)
  reg [63:0] \multiplier$next ;
  (* src = "/home/james/Desktop/check.py:13" *)
  wire [31:0] \output ;
  (* src = "/home/james/.local/lib/python3.10/site-packages/amaranth/hdl/ir.py:508" *)
  input rst;
  wire rst;
  (* src = "/home/james/Desktop/check.py:11" *)
  reg [63:0] seed = 64'h123456789abcdef0;
  (* src = "/home/james/Desktop/check.py:11" *)
  reg [63:0] \seed$next ;
  (* src = "/home/james/.local/lib/python3.10/site-packages/amaranth/lib/wiring.py:227" *)
  input sel;
  wire sel;
  (* src = "/home/james/Desktop/check.py:12" *)
  reg [63:0] state = 64'h0000000000000000;
  (* src = "/home/james/Desktop/check.py:12" *)
  reg [63:0] \state$next ;
  (* src = "/home/james/.local/lib/python3.10/site-packages/amaranth/lib/wiring.py:227" *)
  input stb;
  wire stb;
  (* src = "/home/james/.local/lib/python3.10/site-packages/amaranth/lib/wiring.py:227" *)
  input we;
  wire we;
  always @(posedge clk)
    state <= \state$next ;
  always @(posedge clk)
    seed <= \seed$next ;
  always @(posedge clk)
    multiplier <= \multiplier$next ;
  always @(posedge clk)
    increment <= \increment$next ;
  assign \$3  = state[31:0] ^ (* src = "/home/james/Desktop/check.py:27" *) \$1 ;
  assign \$6  = state * (* src = "/home/james/Desktop/check.py:28" *) multiplier;
  assign \$8  = \$6  + (* src = "/home/james/Desktop/check.py:28" *) increment;
  always @* begin
    if (\$auto$verilog_backend.cc:2097:dump_module$1 ) begin end
    \state$next  = \$10 [63:0];
    (* src = "/home/james/.local/lib/python3.10/site-packages/amaranth/hdl/xfrm.py:503" *)
    casez (rst)
      1'h1:
          \state$next  = 64'h0000000000000000;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2097:dump_module$1 ) begin end
    dat_r = 32'd0;
    (* src = "/home/james/Desktop/check.py:31" *)
    casez (adr)
      /* src = "/home/james/Desktop/check.py:32" */
      32'd0:
          dat_r = \output ;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2097:dump_module$1 ) begin end
    \seed$next  = seed;
    (* src = "/home/james/Desktop/check.py:31" *)
    casez (adr)
      /* src = "/home/james/Desktop/check.py:32" */
      32'd0:
          /* empty */;
      /* src = "/home/james/Desktop/check.py:34" */
      32'd1:
          \seed$next [63:32] = dat_w;
      /* src = "/home/james/Desktop/check.py:36" */
      32'd2:
          \seed$next [31:0] = dat_w;
    endcase
    (* src = "/home/james/.local/lib/python3.10/site-packages/amaranth/hdl/xfrm.py:503" *)
    casez (rst)
      1'h1:
          \seed$next  = 64'h123456789abcdef0;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2097:dump_module$1 ) begin end
    \multiplier$next  = multiplier;
    (* src = "/home/james/Desktop/check.py:31" *)
    casez (adr)
      /* src = "/home/james/Desktop/check.py:32" */
      32'd0:
          /* empty */;
      /* src = "/home/james/Desktop/check.py:34" */
      32'd1:
          /* empty */;
      /* src = "/home/james/Desktop/check.py:36" */
      32'd2:
          /* empty */;
      /* src = "/home/james/Desktop/check.py:38" */
      32'd3:
          \multiplier$next [63:32] = dat_w;
      /* src = "/home/james/Desktop/check.py:40" */
      32'd4:
          \multiplier$next [31:0] = dat_w;
    endcase
    (* src = "/home/james/.local/lib/python3.10/site-packages/amaranth/hdl/xfrm.py:503" *)
    casez (rst)
      1'h1:
          \multiplier$next  = 64'h5851f42d4c957f2d;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2097:dump_module$1 ) begin end
    \increment$next  = increment;
    (* src = "/home/james/Desktop/check.py:31" *)
    casez (adr)
      /* src = "/home/james/Desktop/check.py:32" */
      32'd0:
          /* empty */;
      /* src = "/home/james/Desktop/check.py:34" */
      32'd1:
          /* empty */;
      /* src = "/home/james/Desktop/check.py:36" */
      32'd2:
          /* empty */;
      /* src = "/home/james/Desktop/check.py:38" */
      32'd3:
          /* empty */;
      /* src = "/home/james/Desktop/check.py:40" */
      32'd4:
          /* empty */;
      /* src = "/home/james/Desktop/check.py:42" */
      32'd5:
          \increment$next [63:32] = dat_w;
      /* src = "/home/james/Desktop/check.py:44" */
      32'd6:
          \increment$next [31:0] = dat_w;
    endcase
    (* src = "/home/james/.local/lib/python3.10/site-packages/amaranth/hdl/xfrm.py:503" *)
    casez (rst)
      1'h1:
          \increment$next  = 64'h14057b7ef767814f;
    endcase
  end
  assign \$5  = \$10 ;
  assign \output  = \$3 ;
  assign \$1  = { 18'h00000, state[63:50] };
  assign \$10 [128:64] = 65'h00000000000000000;
  assign \$10 [63:0] = \$8 [63:0];
  
endmodule

`default_nettype wire
