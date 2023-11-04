module top(dat_w, dat_r, sel, we, cyc, stb, ack, clk, rst, adr);
  reg \$auto$verilog_backend.cc:2097:dump_module$1  = 0;
  (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/Final+Acks/final+acks.py:27" *)
  wire [31:0] \$1 ;
  (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/Final+Acks/final+acks.py:28" *)
  wire [128:0] \$10 ;
  (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/Final+Acks/final+acks.py:31" *)
  wire \$12 ;
  (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/Final+Acks/final+acks.py:31" *)
  wire \$14 ;
  (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/Final+Acks/final+acks.py:31" *)
  wire \$16 ;
  (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/Final+Acks/final+acks.py:31" *)
  wire \$18 ;
  (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/Final+Acks/final+acks.py:31" *)
  wire \$20 ;
  (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/Final+Acks/final+acks.py:27" *)
  wire [31:0] \$3 ;
  (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/Final+Acks/final+acks.py:28" *)
  wire [128:0] \$5 ;
  (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/Final+Acks/final+acks.py:28" *)
  wire [127:0] \$6 ;
  (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/Final+Acks/final+acks.py:28" *)
  wire [128:0] \$8 ;
  (* src = "/home/james/.local/lib/python3.10/site-packages/amaranth/lib/wiring.py:227" *)
  output ack;
  reg ack = 1'h0;
  (* src = "/home/james/.local/lib/python3.10/site-packages/amaranth/lib/wiring.py:227" *)
  reg \ack$next ;
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
  (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/Final+Acks/final+acks.py:10" *)
  reg [63:0] increment = 64'h14057b7ef767814f;
  (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/Final+Acks/final+acks.py:10" *)
  reg [63:0] \increment$next ;
  (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/Final+Acks/final+acks.py:9" *)
  reg [63:0] multiplier = 64'h5851f42d4c957f2d;
  (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/Final+Acks/final+acks.py:9" *)
  reg [63:0] \multiplier$next ;
  (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/Final+Acks/final+acks.py:13" *)
  wire [31:0] \output ;
  (* src = "/home/james/.local/lib/python3.10/site-packages/amaranth/hdl/ir.py:508" *)
  input rst;
  wire rst;
  (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/Final+Acks/final+acks.py:11" *)
  reg [63:0] seed = 64'h123456789abcdef0;
  (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/Final+Acks/final+acks.py:11" *)
  reg [63:0] \seed$next ;
  (* src = "/home/james/.local/lib/python3.10/site-packages/amaranth/lib/wiring.py:227" *)
  input sel;
  wire sel;
  (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/Final+Acks/final+acks.py:12" *)
  reg [63:0] state = 64'h0000000000000000;
  (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/Final+Acks/final+acks.py:12" *)
  reg [63:0] \state$next ;
  (* src = "/home/james/.local/lib/python3.10/site-packages/amaranth/lib/wiring.py:227" *)
  input stb;
  wire stb;
  (* src = "/home/james/.local/lib/python3.10/site-packages/amaranth/lib/wiring.py:227" *)
  input we;
  wire we;
  assign \$12  = cyc & (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/Final+Acks/final+acks.py:31" *) stb;
  assign \$14  = cyc & (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/Final+Acks/final+acks.py:31" *) stb;
  assign \$16  = cyc & (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/Final+Acks/final+acks.py:31" *) stb;
  assign \$18  = cyc & (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/Final+Acks/final+acks.py:31" *) stb;
  assign \$20  = cyc & (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/Final+Acks/final+acks.py:31" *) stb;
  always @(posedge clk)
    state <= \state$next ;
  always @(posedge clk)
    ack <= \ack$next ;
  always @(posedge clk)
    seed <= \seed$next ;
  always @(posedge clk)
    multiplier <= \multiplier$next ;
  always @(posedge clk)
    increment <= \increment$next ;
  assign \$3  = state[31:0] ^ (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/Final+Acks/final+acks.py:27" *) \$1 ;
  assign \$6  = state * (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/Final+Acks/final+acks.py:28" *) multiplier;
  assign \$8  = \$6  + (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/Final+Acks/final+acks.py:28" *) increment;
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
    (* full_case = 32'd1 *)
    (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/Final+Acks/final+acks.py:31" *)
    casez (\$12 )
      /* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/Final+Acks/final+acks.py:31" */
      1'h1:
          \ack$next  = 1'h1;
      /* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/Final+Acks/final+acks.py:48" */
      default:
          \ack$next  = 1'h0;
    endcase
    (* src = "/home/james/.local/lib/python3.10/site-packages/amaranth/hdl/xfrm.py:503" *)
    casez (rst)
      1'h1:
          \ack$next  = 1'h0;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2097:dump_module$1 ) begin end
    dat_r = 32'd0;
    (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/Final+Acks/final+acks.py:31" *)
    casez (\$14 )
      /* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/Final+Acks/final+acks.py:31" */
      1'h1:
          (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/Final+Acks/final+acks.py:33" *)
          casez (adr)
            /* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/Final+Acks/final+acks.py:34" */
            32'd0:
                dat_r = \output ;
          endcase
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2097:dump_module$1 ) begin end
    \seed$next  = seed;
    (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/Final+Acks/final+acks.py:31" *)
    casez (\$16 )
      /* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/Final+Acks/final+acks.py:31" */
      1'h1:
          (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/Final+Acks/final+acks.py:33" *)
          casez (adr)
            /* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/Final+Acks/final+acks.py:34" */
            32'd0:
                /* empty */;
            /* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/Final+Acks/final+acks.py:36" */
            32'd1:
                \seed$next [63:32] = dat_w;
            /* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/Final+Acks/final+acks.py:38" */
            32'd2:
                \seed$next [31:0] = dat_w;
          endcase
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
    (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/Final+Acks/final+acks.py:31" *)
    casez (\$18 )
      /* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/Final+Acks/final+acks.py:31" */
      1'h1:
          (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/Final+Acks/final+acks.py:33" *)
          casez (adr)
            /* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/Final+Acks/final+acks.py:34" */
            32'd0:
                /* empty */;
            /* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/Final+Acks/final+acks.py:36" */
            32'd1:
                /* empty */;
            /* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/Final+Acks/final+acks.py:38" */
            32'd2:
                /* empty */;
            /* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/Final+Acks/final+acks.py:40" */
            32'd3:
                \multiplier$next [63:32] = dat_w;
            /* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/Final+Acks/final+acks.py:42" */
            32'd4:
                \multiplier$next [31:0] = dat_w;
          endcase
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
    (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/Final+Acks/final+acks.py:31" *)
    casez (\$20 )
      /* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/Final+Acks/final+acks.py:31" */
      1'h1:
          (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/Final+Acks/final+acks.py:33" *)
          casez (adr)
            /* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/Final+Acks/final+acks.py:34" */
            32'd0:
                /* empty */;
            /* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/Final+Acks/final+acks.py:36" */
            32'd1:
                /* empty */;
            /* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/Final+Acks/final+acks.py:38" */
            32'd2:
                /* empty */;
            /* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/Final+Acks/final+acks.py:40" */
            32'd3:
                /* empty */;
            /* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/Final+Acks/final+acks.py:42" */
            32'd4:
                /* empty */;
            /* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/Final+Acks/final+acks.py:44" */
            32'd5:
                \increment$next [63:32] = dat_w;
            /* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/Final+Acks/final+acks.py:46" */
            32'd6:
                \increment$next [31:0] = dat_w;
          endcase
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

