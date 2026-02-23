module ChiselTop(
  input         clock,
  input         reset,
  input  [15:0] io_sw, // @[C:\\Users\\maxim\\My Drive\\Uni\\2 Sem\\Digi2\\TT-Chip\\src\\main\\scala\\ChiselTop.scala 5:14]
  output [6:0]  io_seg, // @[C:\\Users\\maxim\\My Drive\\Uni\\2 Sem\\Digi2\\TT-Chip\\src\\main\\scala\\ChiselTop.scala 5:14]
  output [3:0]  io_an, // @[C:\\Users\\maxim\\My Drive\\Uni\\2 Sem\\Digi2\\TT-Chip\\src\\main\\scala\\ChiselTop.scala 5:14]
  output        io_dp // @[C:\\Users\\maxim\\My Drive\\Uni\\2 Sem\\Digi2\\TT-Chip\\src\\main\\scala\\ChiselTop.scala 5:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire [3:0] a = io_sw[3:0]; // @[C:\\Users\\maxim\\My Drive\\Uni\\2 Sem\\Digi2\\TT-Chip\\src\\main\\scala\\ChiselTop.scala 13:16]
  wire [3:0] b = io_sw[7:4]; // @[C:\\Users\\maxim\\My Drive\\Uni\\2 Sem\\Digi2\\TT-Chip\\src\\main\\scala\\ChiselTop.scala 14:16]
  wire [4:0] sum = a + b; // @[C:\\Users\\maxim\\My Drive\\Uni\\2 Sem\\Digi2\\TT-Chip\\src\\main\\scala\\ChiselTop.scala 15:15]
  reg [16:0] refreshCounter; // @[C:\\Users\\maxim\\My Drive\\Uni\\2 Sem\\Digi2\\TT-Chip\\src\\main\\scala\\ChiselTop.scala 19:31]
  wire [16:0] _refreshCounter_T_1 = refreshCounter + 17'h1; // @[C:\\Users\\maxim\\My Drive\\Uni\\2 Sem\\Digi2\\TT-Chip\\src\\main\\scala\\ChiselTop.scala 20:36]
  wire [1:0] digitSelect = refreshCounter[16:15]; // @[C:\\Users\\maxim\\My Drive\\Uni\\2 Sem\\Digi2\\TT-Chip\\src\\main\\scala\\ChiselTop.scala 23:35]
  wire [3:0] _digitData_T_2 = {3'h0,sum[4]}; // @[C:\\Users\\maxim\\My Drive\\Uni\\2 Sem\\Digi2\\TT-Chip\\src\\main\\scala\\ChiselTop.scala 39:29]
  wire [3:0] _GEN_0 = 2'h3 == digitSelect ? 4'h7 : 4'hf; // @[C:\\Users\\maxim\\My Drive\\Uni\\2 Sem\\Digi2\\TT-Chip\\src\\main\\scala\\ChiselTop.scala 30:9 C:\\Users\\maxim\\My Drive\\Uni\\2 Sem\\Digi2\\TT-Chip\\src\\main\\scala\\ChiselTop.scala 32:23 C:\\Users\\maxim\\My Drive\\Uni\\2 Sem\\Digi2\\TT-Chip\\src\\main\\scala\\ChiselTop.scala 46:17]
  wire [3:0] _GEN_2 = 2'h2 == digitSelect ? 4'hb : _GEN_0; // @[C:\\Users\\maxim\\My Drive\\Uni\\2 Sem\\Digi2\\TT-Chip\\src\\main\\scala\\ChiselTop.scala 32:23 C:\\Users\\maxim\\My Drive\\Uni\\2 Sem\\Digi2\\TT-Chip\\src\\main\\scala\\ChiselTop.scala 42:17]
  wire [3:0] _GEN_4 = 2'h1 == digitSelect ? 4'hd : _GEN_2; // @[C:\\Users\\maxim\\My Drive\\Uni\\2 Sem\\Digi2\\TT-Chip\\src\\main\\scala\\ChiselTop.scala 32:23 C:\\Users\\maxim\\My Drive\\Uni\\2 Sem\\Digi2\\TT-Chip\\src\\main\\scala\\ChiselTop.scala 38:17]
  wire [3:0] _GEN_5 = 2'h1 == digitSelect ? _digitData_T_2 : 4'h0; // @[C:\\Users\\maxim\\My Drive\\Uni\\2 Sem\\Digi2\\TT-Chip\\src\\main\\scala\\ChiselTop.scala 32:23 C:\\Users\\maxim\\My Drive\\Uni\\2 Sem\\Digi2\\TT-Chip\\src\\main\\scala\\ChiselTop.scala 39:17]
  wire [3:0] digitData = 2'h0 == digitSelect ? sum[3:0] : _GEN_5; // @[C:\\Users\\maxim\\My Drive\\Uni\\2 Sem\\Digi2\\TT-Chip\\src\\main\\scala\\ChiselTop.scala 32:23 C:\\Users\\maxim\\My Drive\\Uni\\2 Sem\\Digi2\\TT-Chip\\src\\main\\scala\\ChiselTop.scala 35:17]
  wire [6:0] _decoder_T_1 = 4'h1 == digitData ? 7'h79 : 7'h40; // @[C:\\Users\\maxim\\My Drive\\Uni\\2 Sem\\Digi2\\TT-Chip\\src\\main\\scala\\ChiselTop.scala 55:48]
  wire [6:0] _decoder_T_3 = 4'h2 == digitData ? 7'h24 : _decoder_T_1; // @[C:\\Users\\maxim\\My Drive\\Uni\\2 Sem\\Digi2\\TT-Chip\\src\\main\\scala\\ChiselTop.scala 55:48]
  wire [6:0] _decoder_T_5 = 4'h3 == digitData ? 7'h30 : _decoder_T_3; // @[C:\\Users\\maxim\\My Drive\\Uni\\2 Sem\\Digi2\\TT-Chip\\src\\main\\scala\\ChiselTop.scala 55:48]
  wire [6:0] _decoder_T_7 = 4'h4 == digitData ? 7'h19 : _decoder_T_5; // @[C:\\Users\\maxim\\My Drive\\Uni\\2 Sem\\Digi2\\TT-Chip\\src\\main\\scala\\ChiselTop.scala 55:48]
  wire [6:0] _decoder_T_9 = 4'h5 == digitData ? 7'h12 : _decoder_T_7; // @[C:\\Users\\maxim\\My Drive\\Uni\\2 Sem\\Digi2\\TT-Chip\\src\\main\\scala\\ChiselTop.scala 55:48]
  wire [6:0] _decoder_T_11 = 4'h6 == digitData ? 7'h2 : _decoder_T_9; // @[C:\\Users\\maxim\\My Drive\\Uni\\2 Sem\\Digi2\\TT-Chip\\src\\main\\scala\\ChiselTop.scala 55:48]
  wire [6:0] _decoder_T_13 = 4'h7 == digitData ? 7'h78 : _decoder_T_11; // @[C:\\Users\\maxim\\My Drive\\Uni\\2 Sem\\Digi2\\TT-Chip\\src\\main\\scala\\ChiselTop.scala 55:48]
  wire [6:0] _decoder_T_15 = 4'h8 == digitData ? 7'h0 : _decoder_T_13; // @[C:\\Users\\maxim\\My Drive\\Uni\\2 Sem\\Digi2\\TT-Chip\\src\\main\\scala\\ChiselTop.scala 55:48]
  wire [6:0] _decoder_T_17 = 4'h9 == digitData ? 7'h10 : _decoder_T_15; // @[C:\\Users\\maxim\\My Drive\\Uni\\2 Sem\\Digi2\\TT-Chip\\src\\main\\scala\\ChiselTop.scala 55:48]
  wire [6:0] _decoder_T_19 = 4'ha == digitData ? 7'h8 : _decoder_T_17; // @[C:\\Users\\maxim\\My Drive\\Uni\\2 Sem\\Digi2\\TT-Chip\\src\\main\\scala\\ChiselTop.scala 55:48]
  wire [6:0] _decoder_T_21 = 4'hb == digitData ? 7'h3 : _decoder_T_19; // @[C:\\Users\\maxim\\My Drive\\Uni\\2 Sem\\Digi2\\TT-Chip\\src\\main\\scala\\ChiselTop.scala 55:48]
  wire [6:0] _decoder_T_23 = 4'hc == digitData ? 7'h46 : _decoder_T_21; // @[C:\\Users\\maxim\\My Drive\\Uni\\2 Sem\\Digi2\\TT-Chip\\src\\main\\scala\\ChiselTop.scala 55:48]
  wire [6:0] _decoder_T_25 = 4'hd == digitData ? 7'h21 : _decoder_T_23; // @[C:\\Users\\maxim\\My Drive\\Uni\\2 Sem\\Digi2\\TT-Chip\\src\\main\\scala\\ChiselTop.scala 55:48]
  wire [6:0] _decoder_T_27 = 4'he == digitData ? 7'h6 : _decoder_T_25; // @[C:\\Users\\maxim\\My Drive\\Uni\\2 Sem\\Digi2\\TT-Chip\\src\\main\\scala\\ChiselTop.scala 55:48]
  assign io_seg = 4'hf == digitData ? 7'he : _decoder_T_27; // @[C:\\Users\\maxim\\My Drive\\Uni\\2 Sem\\Digi2\\TT-Chip\\src\\main\\scala\\ChiselTop.scala 55:48]
  assign io_an = 2'h0 == digitSelect ? 4'he : _GEN_4; // @[C:\\Users\\maxim\\My Drive\\Uni\\2 Sem\\Digi2\\TT-Chip\\src\\main\\scala\\ChiselTop.scala 32:23 C:\\Users\\maxim\\My Drive\\Uni\\2 Sem\\Digi2\\TT-Chip\\src\\main\\scala\\ChiselTop.scala 34:17]
  assign io_dp = 1'h1; // @[C:\\Users\\maxim\\My Drive\\Uni\\2 Sem\\Digi2\\TT-Chip\\src\\main\\scala\\ChiselTop.scala 63:10]
  always @(posedge clock) begin
    if (reset) begin // @[C:\\Users\\maxim\\My Drive\\Uni\\2 Sem\\Digi2\\TT-Chip\\src\\main\\scala\\ChiselTop.scala 19:31]
      refreshCounter <= 17'h0; // @[C:\\Users\\maxim\\My Drive\\Uni\\2 Sem\\Digi2\\TT-Chip\\src\\main\\scala\\ChiselTop.scala 19:31]
    end else begin
      refreshCounter <= _refreshCounter_T_1; // @[C:\\Users\\maxim\\My Drive\\Uni\\2 Sem\\Digi2\\TT-Chip\\src\\main\\scala\\ChiselTop.scala 20:18]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  refreshCounter = _RAND_0[16:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
