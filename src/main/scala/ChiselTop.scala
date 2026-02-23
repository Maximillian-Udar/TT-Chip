import chisel3._
import chisel3.util._

class ChiselTop extends Module {
  val io = IO(new Bundle {
    val sw  = Input(UInt(16.W))      // 16 Switches
    val seg = Output(UInt(7.W))      // 7 Segments (Cathodes)
    val an  = Output(UInt(4.W))      // 4 Anodes (Digit Select)
    val dp  = Output(UInt(1.W))      // Decimal Point
  })

  // --- 1. The 4-Bit Adder Logic ---
  val a = io.sw(3, 0)                // First 4-bit number (Switches 0-3)
  val b = io.sw(7, 4)                // Second 4-bit number (Switches 4-7)
  val sum = a +& b                   // 5-bit result

  // --- 2. Display Multiplexing Logic ---
  // Counter to scan through digits
  val refreshCounter = RegInit(0.U(17.W))
  refreshCounter := refreshCounter + 1.U

  // Use top 2 bits to select active digit
  val digitSelect = refreshCounter(16, 15)

  // --- 3. Digit Selection & Data Routing ---
  val digitData = Wire(UInt(4.W))
  digitData := 0.U // *** FIX: Initialize wire to 0 to satisfy compiler ***

  // Default: all anodes OFF
  io.an := "b1111".U

  switch(digitSelect) {
    is(0.U) { // Rightmost digit
      io.an     := "b1110".U
      digitData := sum(3, 0)
    }
    is(1.U) { // Second digit
      io.an     := "b1101".U
      digitData := 0.U(3.W) ## sum(4)
    }
    is(2.U) { // Third digit
      io.an     := "b1011".U
      digitData := 0.U
    }
    is(3.U) { // Leftmost digit
      io.an     := "b0111".U
      digitData := 0.U
    }
  }

  // --- 4. Seven-Segment Decoder ---
  val decoder = Wire(UInt(7.W))

  // 0 -> 1000000 (0x40), etc. (Active LOW)
  decoder := MuxLookup(digitData, "b1111111".U)(Seq(
    0.U  -> "b1000000".U, 1.U  -> "b1111001".U, 2.U  -> "b0100100".U, 3.U  -> "b0110000".U,
    4.U  -> "b0011001".U, 5.U  -> "b0010010".U, 6.U  -> "b0000010".U, 7.U  -> "b1111000".U,
    8.U  -> "b0000000".U, 9.U  -> "b0010000".U, 10.U -> "b0001000".U, 11.U -> "b0000011".U,
    12.U -> "b1000110".U, 13.U -> "b0100001".U, 14.U -> "b0000110".U, 15.U -> "b0001110".U
  ))

  io.seg := decoder
  io.dp  := 1.U
}

object ChiselTop extends App {
  emitVerilog(new ChiselTop(), Array("--target-dir", "src"))
}