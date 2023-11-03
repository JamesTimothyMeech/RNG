(* top =  1  *)
(* generator = "Amaranth" *)
module top(increment, seed, \output , clk, rst, multiplier);
  reg \$auto$verilog_backend.cc:2097:dump_module$1  = 0;
  (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/test.py:23" *)
  wire [128:0] \$11 ;
  (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/test.py:23" *)
  wire [128:0] \$13 ;
  (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/test.py:22" *)
  wire [31:0] \$2 ;
  (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/test.py:22" *)
  wire [31:0] \$4 ;
  (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/test.py:23" *)
  wire [128:0] \$6 ;
  (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/test.py:23" *)
  wire [127:0] \$8 ;
  (* src = "/home/james/.local/lib/python3.10/site-packages/amaranth/hdl/ir.py:508" *)
  input clk;
  wire clk;
  (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/test.py:8" *)
  input [63:0] increment;
  wire [63:0] increment;
  (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/test.py:8" *)
  wire [63:0] \increment$10 ;
  (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/test.py:7" *)
  input [63:0] multiplier;
  wire [63:0] multiplier;
  (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/test.py:7" *)
  wire [63:0] \multiplier$7 ;
  (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/test.py:11" *)
  input [31:0] \output ;
  wire [31:0] \output ;
  (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/test.py:11" *)
  wire [31:0] \output$1 ;
  (* src = "/home/james/.local/lib/python3.10/site-packages/amaranth/hdl/ir.py:508" *)
  input rst;
  wire rst;
  (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/test.py:9" *)
  input [63:0] seed;
  wire [63:0] seed;
  (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/test.py:10" *)
  reg [63:0] state = 64'h0000000000000000;
  (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/test.py:10" *)
  reg [63:0] \state$next ;
  assign \$11  = \$8  + (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/test.py:23" *) 64'h14057b7ef767814f;
  always @(posedge clk)
    state <= \state$next ;
  assign \$4  = state[31:0] ^ (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/test.py:22" *) \$2 ;
  assign \$8  = state * (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/test.py:23" *) 64'h5851f42d4c957f2d;
  always @* begin
    if (\$auto$verilog_backend.cc:2097:dump_module$1 ) begin end
    \state$next  = \$13 [63:0];
    (* src = "/home/james/.local/lib/python3.10/site-packages/amaranth/hdl/xfrm.py:503" *)
    casez (rst)
      1'h1:
          \state$next  = 64'h0000000000000000;
    endcase
  end
  assign \$6  = \$13 ;
  assign \multiplier$7  = 64'h5851f42d4c957f2d;
  assign \increment$10  = 64'h14057b7ef767814f;
  assign \output$1  = \$4 ;
  assign \$2  = { 18'h00000, state[63:50] };
  assign \$13 [128:64] = 65'h00000000000000000;
  assign \$13 [63:0] = \$11 [63:0];
endmodule

