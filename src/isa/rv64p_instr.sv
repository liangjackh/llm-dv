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

// RV64P instructions (core subset): packed-word (.W) variants that require
// XLEN=64 to hold two 32-bit elements per register.

// Basic Packed Add
`DEFINE_P_INSTR(PADD_W, R_FORMAT, ARITHMETIC, RV64P)

// Saturating Add
`DEFINE_P_INSTR(PSADD_W, R_FORMAT, ARITHMETIC, RV64P)

// Saturating Add Unsigned
`DEFINE_P_INSTR(PSADDU_W, R_FORMAT, ARITHMETIC, RV64P)

// Basic Packed Subtract
`DEFINE_P_INSTR(PSUB_W, R_FORMAT, ARITHMETIC, RV64P)

// Saturating Subtract
`DEFINE_P_INSTR(PSSUB_W, R_FORMAT, ARITHMETIC, RV64P)

// Saturating Subtract Unsigned
`DEFINE_P_INSTR(PSSUBU_W, R_FORMAT, ARITHMETIC, RV64P)

// Averaging Add
`DEFINE_P_INSTR(PAADD_W, R_FORMAT, ARITHMETIC, RV64P)

// Averaging Add Unsigned
`DEFINE_P_INSTR(PAADDU_W, R_FORMAT, ARITHMETIC, RV64P)

// Averaging Subtract
`DEFINE_P_INSTR(PASUB_W, R_FORMAT, ARITHMETIC, RV64P)

// Averaging Subtract Unsigned
`DEFINE_P_INSTR(PASUBU_W, R_FORMAT, ARITHMETIC, RV64P)

// Minimum
`DEFINE_P_INSTR(PMIN_W, R_FORMAT, ARITHMETIC, RV64P)

// Minimum Unsigned
`DEFINE_P_INSTR(PMINU_W, R_FORMAT, ARITHMETIC, RV64P)

// Maximum
`DEFINE_P_INSTR(PMAX_W, R_FORMAT, ARITHMETIC, RV64P)

// Maximum Unsigned
`DEFINE_P_INSTR(PMAXU_W, R_FORMAT, ARITHMETIC, RV64P)

// Compare Equal
`DEFINE_P_INSTR(PMSEQ_W, R_FORMAT, COMPARE, RV64P)

// Compare Less Than
`DEFINE_P_INSTR(PMSLT_W, R_FORMAT, COMPARE, RV64P)

// Compare Less Than Unsigned
`DEFINE_P_INSTR(PMSLTU_W, R_FORMAT, COMPARE, RV64P)

// Shift Left Logical (register shift amount)
`DEFINE_P_INSTR(PSLL_WS, R_FORMAT, SHIFT, RV64P)

// Shift Right Logical (register shift amount)
`DEFINE_P_INSTR(PSRL_WS, R_FORMAT, SHIFT, RV64P)

// Shift Right Arithmetic (register shift amount)
`DEFINE_P_INSTR(PSRA_WS, R_FORMAT, SHIFT, RV64P)

// Shift Left Logical Immediate
`DEFINE_P_INSTR(PSLLI_W, I_FORMAT, SHIFT, RV64P, UIMM)

// Shift Right Logical Immediate
`DEFINE_P_INSTR(PSRLI_W, I_FORMAT, SHIFT, RV64P, UIMM)

// Shift Right Arithmetic Immediate
`DEFINE_P_INSTR(PSRAI_W, I_FORMAT, SHIFT, RV64P, UIMM)

// Multiply High
`DEFINE_P_INSTR(PMULH_W, R_FORMAT, ARITHMETIC, RV64P)

// Multiply High Unsigned
`DEFINE_P_INSTR(PMULHU_W, R_FORMAT, ARITHMETIC, RV64P)

// Multiply High Signed-Unsigned
`DEFINE_P_INSTR(PMULHSU_W, R_FORMAT, ARITHMETIC, RV64P)

// Absolute Value (misc scalar, Zbb-style func7+func5 encoding, XLEN=64)
`DEFINE_P_INSTR(ABSW, I_FORMAT, ARITHMETIC, RV64P)

// Count Leading Sign Bits (misc scalar, Zbb-style func7+func5 encoding, XLEN=64)
`DEFINE_P_INSTR(CLSW, I_FORMAT, ARITHMETIC, RV64P)
