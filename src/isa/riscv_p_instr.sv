/*
 * Copyright 2026 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// Base class for the RISC-V "P" (Packed-SIMD / DSP) extension, core subset.
//
// Most P-extension register-register instructions are encoded in the OP-32
// major opcode (7'b0111011) with a non-standard split of the usual funct7
// field into a 2-bit element-width selector `w` and a 4-bit function
// selector `f`:
//   bit31 | f[30:27] | w[26:25] | rs2[24:20] | rs1[19:15] | funct3[14:12]
//   | rd[11:7] | opcode[6:0]
// `w` selects the packed element width (byte/halfword/word), while `f`
// disambiguates the operation within a funct3 group. See riscv/riscv-p-spec
// for the authoritative encodings.
class riscv_p_instr extends riscv_instr;

  `uvm_object_utils(riscv_p_instr)

  function new(string name = "");
    super.new(name);
  endfunction

  // ABS/CLS/ABSW/CLSW are Zbb-style "func7+func5" unary scalar instructions:
  // rd,rs1 only, no immediate operand (the 12-bit I_FORMAT immediate field is
  // repurposed as a fixed opcode-selector constant, same trick as CLZ/CTZ/CPOP).
  virtual function void set_rand_mode();
    super.set_rand_mode();
    if (format == I_FORMAT && instr_name inside {ABS, CLS, ABSW, CLSW}) begin
      has_imm = 1'b0;
    end
  endfunction

  // 2-bit packed element-width selector used by most P-extension encodings.
  // 2'b10 = byte, 2'b00 = halfword, 2'b01 = word (RV64) / scalar XLEN-wide (RV32).
  virtual function bit [1:0] get_w();
    case (instr_name) inside
      PADD_B, PSADD_B, PSADDU_B, PSUB_B, PSSUB_B, PSSUBU_B,
      PAADD_B, PAADDU_B, PASUB_B, PASUBU_B : get_w = 2'b10;
      PADD_H, PSADD_H, PSADDU_H, PSUB_H, PSSUB_H, PSSUBU_H,
      PAADD_H, PAADDU_H, PASUB_H, PASUBU_H : get_w = 2'b00;
      PADD_W, PSADD_W, PSADDU_W, PSUB_W, PSSUB_W, PSSUBU_W,
      PAADD_W, PAADDU_W, PASUB_W, PASUBU_W,
      SADD, SADDU, SSUB, SSUBU,
      AADD, AADDU, ASUB, ASUBU : get_w = 2'b01;
      PABD_B, PABDU_B : get_w = 2'b10;
      PABD_H, PABDU_H : get_w = 2'b00;
      PMIN_B, PMINU_B, PMAX_B, PMAXU_B : get_w = 2'b10;
      PMIN_H, PMINU_H, PMAX_H, PMAXU_H : get_w = 2'b00;
      PMIN_W, PMINU_W, PMAX_W, PMAXU_W : get_w = 2'b01;
      PMSEQ_B, PMSLT_B, PMSLTU_B : get_w = 2'b10;
      PMSEQ_H, PMSLT_H, PMSLTU_H : get_w = 2'b00;
      PMSEQ_W, PMSLT_W, PMSLTU_W,
      MSEQ, MSLT, MSLTU : get_w = 2'b01;
      PSLL_BS, PSRL_BS, PSRA_BS, PSLLI_B, PSRLI_B, PSRAI_B : get_w = 2'b10;
      PSLL_HS, PSRL_HS, PSRA_HS, PSLLI_H, PSRLI_H, PSRAI_H : get_w = 2'b00;
      PSLL_WS, PSRL_WS, PSRA_WS, PSLLI_W, PSRLI_W, PSRAI_W : get_w = 2'b01;
      PMULH_H, PMULHU_H, PMULHSU_H : get_w = 2'b00;
      PMULH_W, PMULHU_W, PMULHSU_W : get_w = 2'b01;
      default : `uvm_fatal(`gfn, $sformatf("Unsupported instruction %0s for get_w",
                                            instr_name.name()))
    endcase
  endfunction

  // 4-bit function selector, unique within a given funct3 group.
  virtual function bit [3:0] get_f();
    case (instr_name) inside
      PADD_B, PADD_H, PADD_W                       : get_f = 4'h0;
      PSADD_B, PSADD_H, PSADD_W, SADD              : get_f = 4'h2;
      PSADDU_B, PSADDU_H, PSADDU_W, SADDU          : get_f = 4'h6;
      PSUB_B, PSUB_H, PSUB_W                       : get_f = 4'h8;
      PSSUB_B, PSSUB_H, PSSUB_W, SSUB              : get_f = 4'ha;
      PSSUBU_B, PSSUBU_H, PSSUBU_W, SSUBU          : get_f = 4'he;
      PAADD_B, PAADD_H, PAADD_W, AADD              : get_f = 4'h3;
      PAADDU_B, PAADDU_H, PAADDU_W, AADDU          : get_f = 4'h7;
      PASUB_B, PASUB_H, PASUB_W, ASUB              : get_f = 4'hb;
      PASUBU_B, PASUBU_H, PASUBU_W, ASUBU          : get_f = 4'hf;
      PABD_B, PABD_H                               : get_f = 4'h9;
      PABDU_B, PABDU_H                             : get_f = 4'hd;
      PMIN_B, PMIN_H, PMIN_W                       : get_f = 4'hc;
      PMINU_B, PMINU_H, PMINU_W                    : get_f = 4'hd;
      PMAX_B, PMAX_H, PMAX_W                       : get_f = 4'he;
      PMAXU_B, PMAXU_H, PMAXU_W                    : get_f = 4'hf;
      PMSEQ_B, PMSEQ_H, PMSEQ_W, MSEQ              : get_f = 4'h8;
      PMSLT_B, PMSLT_H, PMSLT_W, MSLT              : get_f = 4'ha;
      PMSLTU_B, PMSLTU_H, PMSLTU_W, MSLTU          : get_f = 4'hb;
      // Shift instructions only use the low 3 bits of get_f() (see convert2bin()).
      PSLL_BS, PSLL_HS, PSLL_WS,
      PSLLI_B, PSLLI_H, PSLLI_W                    : get_f = 4'h0;
      PSRL_BS, PSRL_HS, PSRL_WS,
      PSRLI_B, PSRLI_H, PSRLI_W                    : get_f = 4'h0;
      PSRA_BS, PSRA_HS, PSRA_WS,
      PSRAI_B, PSRAI_H, PSRAI_W                    : get_f = 4'h4;
      PMULH_H, PMULH_W                             : get_f = 4'h0;
      PMULHU_H, PMULHU_W                           : get_f = 4'h2;
      PMULHSU_H, PMULHSU_W                         : get_f = 4'h8;
      default : `uvm_fatal(`gfn, $sformatf("Unsupported instruction %0s for get_f",
                                            instr_name.name()))
    endcase
  endfunction

  function bit [6:0] get_opcode();
    case (instr_name) inside
      PADD_B, PADD_H, PADD_W,
      PSADD_B, PSADD_H, PSADD_W, SADD,
      PSADDU_B, PSADDU_H, PSADDU_W, SADDU,
      PSUB_B, PSUB_H, PSUB_W,
      PSSUB_B, PSSUB_H, PSSUB_W, SSUB,
      PSSUBU_B, PSSUBU_H, PSSUBU_W, SSUBU,
      PAADD_B, PAADD_H, PAADD_W, AADD,
      PAADDU_B, PAADDU_H, PAADDU_W, AADDU,
      PASUB_B, PASUB_H, PASUB_W, ASUB,
      PASUBU_B, PASUBU_H, PASUBU_W, ASUBU,
      PABD_B, PABD_H, PABDU_B, PABDU_H,
      PMIN_B, PMIN_H, PMIN_W, PMINU_B, PMINU_H, PMINU_W,
      PMAX_B, PMAX_H, PMAX_W, PMAXU_B, PMAXU_H, PMAXU_W,
      PMSEQ_B, PMSEQ_H, PMSEQ_W, MSEQ,
      PMSLT_B, PMSLT_H, PMSLT_W, MSLT,
      PMSLTU_B, PMSLTU_H, PMSLTU_W, MSLTU : get_opcode = 7'b0111011; // OP-32
      PSLL_BS, PSLL_HS, PSLL_WS, PSRL_BS, PSRL_HS, PSRL_WS,
      PSRA_BS, PSRA_HS, PSRA_WS,
      PSLLI_B, PSLLI_H, PSLLI_W, PSRLI_B, PSRLI_H, PSRLI_W,
      PSRAI_B, PSRAI_H, PSRAI_W : get_opcode = 7'b0011011; // OP-IMM-32
      PMULH_H, PMULH_W, PMULHU_H, PMULHU_W,
      PMULHSU_H, PMULHSU_W : get_opcode = 7'b0111011; // OP-32
      ABS, CLS : get_opcode = 7'b0010011; // OP-IMM
      ABSW, CLSW : get_opcode = 7'b0011011; // OP-IMM-32
      default : get_opcode = super.get_opcode();
    endcase
  endfunction

  virtual function bit [2:0] get_func3();
    case (instr_name) inside
      PADD_B, PADD_H, PADD_W,
      PSADD_B, PSADD_H, PSADD_W, SADD,
      PSADDU_B, PSADDU_H, PSADDU_W, SADDU,
      PSUB_B, PSUB_H, PSUB_W,
      PSSUB_B, PSSUB_H, PSSUB_W, SSUB,
      PSSUBU_B, PSSUBU_H, PSSUBU_W, SSUBU,
      PAADD_B, PAADD_H, PAADD_W, AADD,
      PAADDU_B, PAADDU_H, PAADDU_W, AADDU,
      PASUB_B, PASUB_H, PASUB_W, ASUB,
      PASUBU_B, PASUBU_H, PASUBU_W, ASUBU,
      PABD_B, PABD_H, PABDU_B, PABDU_H : get_func3 = 3'b000;
      PMIN_B, PMIN_H, PMIN_W, PMINU_B, PMINU_H, PMINU_W,
      PMAX_B, PMAX_H, PMAX_W, PMAXU_B, PMAXU_H, PMAXU_W,
      PMSEQ_B, PMSEQ_H, PMSEQ_W, MSEQ,
      PMSLT_B, PMSLT_H, PMSLT_W, MSLT,
      PMSLTU_B, PMSLTU_H, PMSLTU_W, MSLTU : get_func3 = 3'b110;
      PSLL_BS, PSLL_HS, PSLL_WS,
      PSLLI_B, PSLLI_H, PSLLI_W : get_func3 = 3'b010;
      PSRL_BS, PSRL_HS, PSRL_WS, PSRA_BS, PSRA_HS, PSRA_WS,
      PSRLI_B, PSRLI_H, PSRLI_W, PSRAI_B, PSRAI_H, PSRAI_W : get_func3 = 3'b100;
      PMULH_H, PMULH_W, PMULHU_H, PMULHU_W,
      PMULHSU_H, PMULHSU_W : get_func3 = 3'b111;
      ABS, CLS, ABSW, CLSW : get_func3 = 3'b001;
      default : get_func3 = super.get_func3();
    endcase
  endfunction

  // Precise per-instruction immediate width (in bits) for the packed
  // immediate-shift instructions. The shift amount width tracks the packed
  // element width (3 bits for byte, 4 for halfword, 5 for word), unlike
  // e.g. the B-extension where imm_len can be derived from category alone.
  virtual function int get_shift_imm_len();
    case (instr_name) inside
      PSLLI_B, PSRLI_B, PSRAI_B : get_shift_imm_len = 3;
      PSLLI_H, PSRLI_H, PSRAI_H : get_shift_imm_len = 4;
      PSLLI_W, PSRLI_W, PSRAI_W : get_shift_imm_len = 5;
      default : `uvm_fatal(`gfn, $sformatf("Unsupported instruction %0s for get_shift_imm_len",
                                            instr_name.name()))
    endcase
  endfunction

  virtual function void set_imm_len();
    if (instr_name inside {PSLLI_B, PSRLI_B, PSRAI_B, PSLLI_H, PSRLI_H, PSRAI_H,
                            PSLLI_W, PSRLI_W, PSRAI_W}) begin
      imm_len = get_shift_imm_len();
      imm_mask = imm_mask << imm_len;
    end else begin
      super.set_imm_len();
    end
  endfunction

  // Convert the instruction to binary.
  // R_FORMAT arithmetic/compare P instructions all share the OP-32 shape:
  //   {1'b1, f[3:0], w[1:0], rs2, rs1, funct3, rd, opcode}
  // R_FORMAT register-shift-amount instructions use OP-IMM-32 with the top
  // bit of the split funct7 fixed to 1:
  //   {1'b1, f[2:0], 1'b1, w[1:0], rs2, rs1, funct3, rd, opcode}
  // I_FORMAT immediate-shift instructions pack a variable-width marker bit
  // ahead of the immediate (see get_shift_imm_len()):
  //   {1'b1, f[2:0], 1'b0, w_uimm[6:0], rs1, funct3, rd, opcode}
  virtual function string convert2bin(string prefix = "");
    string binary = "";
    bit [6:0] w_uimm;
    case (format)
      R_FORMAT: begin
        if (instr_name inside {PSLL_BS, PSLL_HS, PSLL_WS, PSRL_BS, PSRL_HS, PSRL_WS,
                                PSRA_BS, PSRA_HS, PSRA_WS}) begin
          binary = $sformatf("%8h", {1'b1, get_f()[2:0], 1'b1, get_w(), rs2, rs1, get_func3(),
                                     rd, get_opcode()});
        end else begin
          binary = $sformatf("%8h", {1'b1, get_f(), get_w(), rs2, rs1, get_func3(), rd,
                                     get_opcode()});
        end
      end
      I_FORMAT: begin
        if (instr_name inside {PSLLI_B, PSRLI_B, PSRAI_B, PSLLI_H, PSRLI_H, PSRAI_H,
                                PSLLI_W, PSRLI_W, PSRAI_W}) begin
          w_uimm = (7'b1 << imm_len) | (imm[6:0] & ((7'b1 << imm_len) - 7'b1));
          binary = $sformatf("%8h", {1'b1, get_f()[2:0], 1'b0, w_uimm, rs1, get_func3(), rd,
                                     get_opcode()});
        end else if (instr_name inside {ABS, CLS, ABSW, CLSW}) begin
          binary = $sformatf("%8h", {get_func7(), get_func5(), rs1, get_func3(), rd,
                                     get_opcode()});
        end else begin
          binary = super.convert2bin(prefix);
        end
      end
      default: begin
        binary = super.convert2bin(prefix);
      end
    endcase
    return {prefix, binary};
  endfunction

  // ABS/CLS/ABSW/CLSW have no immediate operand: instr rd,rs1
  virtual function string convert2asm(string prefix = "");
    string asm_str;
    if (instr_name inside {ABS, CLS, ABSW, CLSW}) begin
      asm_str = format_string(get_instr_name(), MAX_INSTR_STR_LEN);
      asm_str = $sformatf("%0s%0s, %0s", asm_str, rd.name(), rs1.name());
      if (comment != "") asm_str = {asm_str, " #", comment};
      return asm_str.tolower();
    end
    return super.convert2asm(prefix);
  endfunction

  // ABS/CLS/ABSW/CLSW reuse the Zbb CLZ/CTZ/CPOP encoding trick: a fixed
  // 12-bit constant split into func7 (imm[11:5]) and func5 (imm[4:0]).
  function bit [6:0] get_func7();
    case (instr_name) inside
      ABS, ABSW : get_func7 = 7'b0110000;
      CLS, CLSW : get_func7 = 7'b0110000;
      default : `uvm_fatal(`gfn, $sformatf("Unsupported instruction %0s for get_func7",
                                            instr_name.name()))
    endcase
  endfunction

  function bit [4:0] get_func5();
    case (instr_name) inside
      ABS, ABSW : get_func5 = 5'b00111;
      CLS, CLSW : get_func5 = 5'b00011;
      default : `uvm_fatal(`gfn, $sformatf("Unsupported instruction %0s for get_func5",
                                            instr_name.name()))
    endcase
  endfunction

  virtual function bit is_supported(riscv_instr_gen_config cfg);
    return cfg.enable_p_extension;
  endfunction

  // ABS/CLS/ABSW/CLSW have no immediate operand: instr rd,rs1
  virtual function void update_src_regs(string operands[$]);
    if (instr_name inside {ABS, CLS, ABSW, CLSW}) begin
      `DV_CHECK_FATAL(operands.size() == 2, instr_name)
      rs1 = get_gpr(operands[1]);
      rs1_value = get_gpr_state(operands[1]);
      return;
    end
    super.update_src_regs(operands);
  endfunction

endclass
