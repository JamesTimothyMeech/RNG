/* Generated by Yosys 0.30+38 (git sha1 eb397592f, clang 14.0.0-1ubuntu1 -fPIC -Os) */

(* top =  1  *)
(* generator = "Amaranth" *)
module top(clk, rst, \output );
  reg \$auto$verilog_backend.cc:2097:dump_module$1  = 0;
  (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/initial.py:22" *)
  wire [127:0] \$11 ;
  (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/initial.py:21" *)
  wire [31:0] \$2 ;
  (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/initial.py:21" *)
  wire [31:0] \$4 ;
  (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/initial.py:22" *)
  wire [127:0] \$6 ;
  (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/initial.py:22" *)
  wire [126:0] \$7 ;
  (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/initial.py:22" *)
  wire [127:0] \$9 ;
  (* src = "/home/james/.local/lib/python3.10/site-packages/amaranth/hdl/ir.py:508" *)
  input clk;
  wire clk;
  (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/initial.py:8" *)
  input [31:0] \output ;
  wire [31:0] \output ;
  (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/initial.py:8" *)
  wire [31:0] \output$1 ;
  (* src = "/home/james/.local/lib/python3.10/site-packages/amaranth/hdl/ir.py:508" *)
  input rst;
  wire rst;
  (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/initial.py:7" *)
  reg [63:0] state = 64'h123456789abcdef0;
  (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/initial.py:7" *)
  reg [63:0] \state$next ;
  assign \$9  = \$7  + (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/initial.py:22" *) 61'h14057b7ef767814f;
  always @(posedge clk)
    state <= \state$next ;
  assign \$4  = state[31:0] ^ (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/initial.py:21" *) \$2 ;
  assign \$7  = state * (* src = "/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/initial.py:22" *) 63'h5851f42d4c957f2d;
  always @* begin
    if (\$auto$verilog_backend.cc:2097:dump_module$1 ) begin end
    \state$next  = \$11 [63:0];
    (* src = "/home/james/.local/lib/python3.10/site-packages/amaranth/hdl/xfrm.py:503" *)
    casez (rst)
      1'h1:
          \state$next  = 64'h123456789abcdef0;
    endcase
  end
  assign \$6  = \$11 ;
  assign \output$1  = \$4 ;
  assign \$2  = { 18'h00000, state[63:50] };
  assign \$11 [127:64] = 64'h0000000000000000;
  assign \$11 [63:0] = \$9 [63:0];
endmodule

/home/james/Desktop/Efabless/Project/RNG/Amaranth-Python-Scripts/initial.py:40: UnusedElaboratable: <__main__.PCG32 object at 0x7ff8e8c6aec0> created but never used
  print(verilog.convert(PCG32(0x123456789abcdef0), ports=[PCG32(0x123456789abcdef0).output]))
UnusedElaboratable: Enable tracemalloc to get the object allocation traceback

