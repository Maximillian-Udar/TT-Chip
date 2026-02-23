module ChiselTop(
  input        clock,
  input        reset,
  input  [7:0] io_ui_in, // @[C:\\Users\\maxim\\My Drive\\Uni\\2 Sem\\Digi2\\TT-Chip\\src\\main\\scala\\ChiselTop.scala 8:14]
  output [7:0] io_uo_out, // @[C:\\Users\\maxim\\My Drive\\Uni\\2 Sem\\Digi2\\TT-Chip\\src\\main\\scala\\ChiselTop.scala 8:14]
  input  [7:0] io_uio_in, // @[C:\\Users\\maxim\\My Drive\\Uni\\2 Sem\\Digi2\\TT-Chip\\src\\main\\scala\\ChiselTop.scala 8:14]
  output [7:0] io_uio_out, // @[C:\\Users\\maxim\\My Drive\\Uni\\2 Sem\\Digi2\\TT-Chip\\src\\main\\scala\\ChiselTop.scala 8:14]
  output [7:0] io_uio_oe // @[C:\\Users\\maxim\\My Drive\\Uni\\2 Sem\\Digi2\\TT-Chip\\src\\main\\scala\\ChiselTop.scala 8:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire [7:0] _add_T_1 = io_ui_in + io_uio_in; // @[C:\\Users\\maxim\\My Drive\\Uni\\2 Sem\\Digi2\\TT-Chip\\src\\main\\scala\\ChiselTop.scala 22:19]
  reg [31:0] cntReg; // @[C:\\Users\\maxim\\My Drive\\Uni\\2 Sem\\Digi2\\TT-Chip\\src\\main\\scala\\ChiselTop.scala 25:23]
  reg  ledReg; // @[C:\\Users\\maxim\\My Drive\\Uni\\2 Sem\\Digi2\\TT-Chip\\src\\main\\scala\\ChiselTop.scala 26:23]
  wire [31:0] _cntReg_T_1 = cntReg + 32'h1; // @[C:\\Users\\maxim\\My Drive\\Uni\\2 Sem\\Digi2\\TT-Chip\\src\\main\\scala\\ChiselTop.scala 27:20]
  wire [6:0] add = _add_T_1[6:0]; // @[C:\\Users\\maxim\\My Drive\\Uni\\2 Sem\\Digi2\\TT-Chip\\src\\main\\scala\\ChiselTop.scala 21:24 C:\\Users\\maxim\\My Drive\\Uni\\2 Sem\\Digi2\\TT-Chip\\src\\main\\scala\\ChiselTop.scala 22:7]
  assign io_uo_out = {ledReg,add}; // @[C:\\Users\\maxim\\My Drive\\Uni\\2 Sem\\Digi2\\TT-Chip\\src\\main\\scala\\ChiselTop.scala 32:23]
  assign io_uio_out = 8'h0; // @[C:\\Users\\maxim\\My Drive\\Uni\\2 Sem\\Digi2\\TT-Chip\\src\\main\\scala\\ChiselTop.scala 16:14]
  assign io_uio_oe = 8'h0; // @[C:\\Users\\maxim\\My Drive\\Uni\\2 Sem\\Digi2\\TT-Chip\\src\\main\\scala\\ChiselTop.scala 19:13]
  always @(posedge clock) begin
    if (reset) begin // @[C:\\Users\\maxim\\My Drive\\Uni\\2 Sem\\Digi2\\TT-Chip\\src\\main\\scala\\ChiselTop.scala 25:23]
      cntReg <= 32'h0; // @[C:\\Users\\maxim\\My Drive\\Uni\\2 Sem\\Digi2\\TT-Chip\\src\\main\\scala\\ChiselTop.scala 25:23]
    end else if (cntReg == 32'h17d7840) begin // @[C:\\Users\\maxim\\My Drive\\Uni\\2 Sem\\Digi2\\TT-Chip\\src\\main\\scala\\ChiselTop.scala 28:32]
      cntReg <= 32'h0; // @[C:\\Users\\maxim\\My Drive\\Uni\\2 Sem\\Digi2\\TT-Chip\\src\\main\\scala\\ChiselTop.scala 29:12]
    end else begin
      cntReg <= _cntReg_T_1; // @[C:\\Users\\maxim\\My Drive\\Uni\\2 Sem\\Digi2\\TT-Chip\\src\\main\\scala\\ChiselTop.scala 27:10]
    end
    if (reset) begin // @[C:\\Users\\maxim\\My Drive\\Uni\\2 Sem\\Digi2\\TT-Chip\\src\\main\\scala\\ChiselTop.scala 26:23]
      ledReg <= 1'h0; // @[C:\\Users\\maxim\\My Drive\\Uni\\2 Sem\\Digi2\\TT-Chip\\src\\main\\scala\\ChiselTop.scala 26:23]
    end else if (cntReg == 32'h17d7840) begin // @[C:\\Users\\maxim\\My Drive\\Uni\\2 Sem\\Digi2\\TT-Chip\\src\\main\\scala\\ChiselTop.scala 28:32]
      ledReg <= ~ledReg; // @[C:\\Users\\maxim\\My Drive\\Uni\\2 Sem\\Digi2\\TT-Chip\\src\\main\\scala\\ChiselTop.scala 30:12]
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
  cntReg = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  ledReg = _RAND_1[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
