(* top =  1  *)
(* generator = "Amaranth" *)
module top(increment, seed, \output , clk, rst, multiplier);
  reg \$auto$verilog_backend.cc:2097:dump_module$1  = 0;
  (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/wishbone-test-output.py:28" *)
  wire [128:0] \$11 ;
  (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/wishbone-test-output.py:28" *)
  wire [128:0] \$13 ;
  (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/wishbone-test-output.py:27" *)
  wire [31:0] \$2 ;
  (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/wishbone-test-output.py:27" *)
  wire [31:0] \$4 ;
  (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/wishbone-test-output.py:28" *)
  wire [128:0] \$6 ;
  (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/wishbone-test-output.py:28" *)
  wire [127:0] \$8 ;
  (* src = "/home/james/.local/lib/python3.10/site-packages/amaranth/lib/wiring.py:227" *)
  wire [31:0] adr;
  (* src = "/home/james/.local/lib/python3.10/site-packages/amaranth/hdl/ir.py:508" *)
  input clk;
  wire clk;
  (* src = "/home/james/.local/lib/python3.10/site-packages/amaranth/lib/wiring.py:227" *)
  reg [31:0] dat_r;
  (* src = "/home/james/.local/lib/python3.10/site-packages/amaranth/lib/wiring.py:227" *)
  wire [31:0] dat_w;
  (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/wishbone-test-output.py:10" *)
  input [63:0] increment;
  wire [63:0] increment;
  (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/wishbone-test-output.py:10" *)
  reg [63:0] \increment$10  = 64'h14057b7ef767814f;
  (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/wishbone-test-output.py:10" *)
  reg [63:0] \increment$10$next ;
  (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/wishbone-test-output.py:9" *)
  input [63:0] multiplier;
  wire [63:0] multiplier;
  (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/wishbone-test-output.py:9" *)
  reg [63:0] \multiplier$7  = 64'h5851f42d4c957f2d;
  (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/wishbone-test-output.py:9" *)
  reg [63:0] \multiplier$7$next ;
  (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/wishbone-test-output.py:13" *)
  input [31:0] \output ;
  wire [31:0] \output ;
  (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/wishbone-test-output.py:13" *)
  wire [31:0] \output$1 ;
  (* src = "/home/james/.local/lib/python3.10/site-packages/amaranth/hdl/ir.py:508" *)
  input rst;
  wire rst;
  (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/wishbone-test-output.py:11" *)
  input [63:0] seed;
  wire [63:0] seed;
  (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/wishbone-test-output.py:11" *)
  reg [63:0] \seed$15  = 64'h123456789abcdef0;
  (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/wishbone-test-output.py:11" *)
  reg [63:0] \seed$15$next ;
  (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/wishbone-test-output.py:12" *)
  reg [63:0] state = 64'h0000000000000000;
  (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/wishbone-test-output.py:12" *)
  reg [63:0] \state$next ;
  assign \$11  = \$8  + (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/wishbone-test-output.py:28" *) \increment$10 ;
  always @(posedge clk)
    state <= \state$next ;
  always @(posedge clk)
    \seed$15  <= \seed$15$next ;
  always @(posedge clk)
    \multiplier$7  <= \multiplier$7$next ;
  always @(posedge clk)
    \increment$10  <= \increment$10$next ;
  assign \$4  = state[31:0] ^ (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/wishbone-test-output.py:27" *) \$2 ;
  assign \$8  = state * (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/wishbone-test-output.py:28" *) \multiplier$7 ;
  always @* begin
    if (\$auto$verilog_backend.cc:2097:dump_module$1 ) begin end
    \state$next  = \$13 [63:0];
    (* src = "/home/james/.local/lib/python3.10/site-packages/amaranth/hdl/xfrm.py:503" *)
    casez (rst)
      1'h1:
          \state$next  = 64'h0000000000000000;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2097:dump_module$1 ) begin end
    dat_r = 32'd0;
    (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/wishbone-test-output.py:31" *)
    casez (adr)
      /* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/wishbone-test-output.py:32" */
      32'd0:
          dat_r = \output$1 ;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2097:dump_module$1 ) begin end
    \seed$15$next  = \seed$15 ;
    (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/wishbone-test-output.py:31" *)
    casez (adr)
      /* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/wishbone-test-output.py:32" */
      32'd0:
          /* empty */;
      /* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/wishbone-test-output.py:34" */
      32'd1:
          \seed$15$next [63:32] = 32'd0;
      /* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/wishbone-test-output.py:36" */
      32'd2:
          \seed$15$next [31:0] = 32'd0;
    endcase
    (* src = "/home/james/.local/lib/python3.10/site-packages/amaranth/hdl/xfrm.py:503" *)
    casez (rst)
      1'h1:
          \seed$15$next  = 64'h123456789abcdef0;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2097:dump_module$1 ) begin end
    \multiplier$7$next  = \multiplier$7 ;
    (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/wishbone-test-output.py:31" *)
    casez (adr)
      /* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/wishbone-test-output.py:32" */
      32'd0:
          /* empty */;
      /* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/wishbone-test-output.py:34" */
      32'd1:
          /* empty */;
      /* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/wishbone-test-output.py:36" */
      32'd2:
          /* empty */;
      /* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/wishbone-test-output.py:38" */
      32'd3:
          \multiplier$7$next [63:32] = 32'd0;
      /* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/wishbone-test-output.py:40" */
      32'd4:
          \multiplier$7$next [31:0] = 32'd0;
    endcase
    (* src = "/home/james/.local/lib/python3.10/site-packages/amaranth/hdl/xfrm.py:503" *)
    casez (rst)
      1'h1:
          \multiplier$7$next  = 64'h5851f42d4c957f2d;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2097:dump_module$1 ) begin end
    \increment$10$next  = \increment$10 ;
    (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/wishbone-test-output.py:31" *)
    casez (adr)
      /* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/wishbone-test-output.py:32" */
      32'd0:
          /* empty */;
      /* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/wishbone-test-output.py:34" */
      32'd1:
          /* empty */;
      /* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/wishbone-test-output.py:36" */
      32'd2:
          /* empty */;
      /* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/wishbone-test-output.py:38" */
      32'd3:
          /* empty */;
      /* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/wishbone-test-output.py:40" */
      32'd4:
          /* empty */;
      /* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/wishbone-test-output.py:42" */
      32'd5:
          \increment$10$next [63:32] = 32'd0;
      /* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/wishbone-test-output.py:44" */
      32'd6:
          \increment$10$next [31:0] = 32'd0;
    endcase
    (* src = "/home/james/.local/lib/python3.10/site-packages/amaranth/hdl/xfrm.py:503" *)
    casez (rst)
      1'h1:
          \increment$10$next  = 64'h14057b7ef767814f;
    endcase
  end
  assign \$6  = \$13 ;
  assign adr = 32'd0;
  assign dat_w = 32'd0;
  assign \output$1  = \$4 ;
  assign \$2  = { 18'h00000, state[63:50] };
  assign \$13 [128:64] = 65'h00000000000000000;
  assign \$13 [63:0] = \$11 [63:0];
endmodule
