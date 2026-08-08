.include "user_define.h"
.globl _start
.section .text
_start:           
                  .include "user_init.s"
                  csrr x5, 0xf14
                  li x6, 0
                  beq x5, x6, 0f

0: la x21, h0_start
jalr x0, x21, 0
h0_start:
                  li x31, 0x40001104
                  csrw 0x301, x31
kernel_sp:        
                  la x13, kernel_stack_end

trap_vec_init:    
                  la x31, mtvec_handler
                  ori x31, x31, 0
                  csrw 0x305, x31 # MTVEC

mepc_setup:       
                  la x31, init
                  csrw 0x341, x31

init_machine_mode:
                  li x31, 0x1800
                  csrw 0x300, x31 # MSTATUS
                  li x31, 0x0
                  csrw 0x304, x31 # MIE
                  mret
init:             
                  li x0, 0x9f35cd3f
                  li x1, 0xb
                  li x2, 0x1
                  li x3, 0x0
                  li x4, 0x5
                  li x5, 0xf827db92
                  li x6, 0xf82b4bdc
                  li x7, 0xfb7aa0c2
                  li x8, 0xf8ef86ef
                  li x9, 0x80000000
                  li x10, 0x80000000
                  li x11, 0xd
                  li x12, 0xfc9f8eb1
                  li x14, 0x0
                  li x15, 0x80000000
                  li x16, 0x5
                  li x17, 0x2
                  li x18, 0x0
                  li x19, 0x80000000
                  li x20, 0x80000000
                  li x21, 0x80000000
                  li x22, 0xfa0752d3
                  li x23, 0x0
                  li x24, 0xbd311f6d
                  li x25, 0xf33ab7e3
                  li x26, 0x0
                  li x28, 0x5e47ecfa
                  li x29, 0x0
                  li x30, 0xf89d4b0a
                  li x31, 0xfcf25277
                  la x27, user_stack_end
main:             li         t6, 0x0 #start riscv_int_numeric_corner_stream_1
                  li         a0, 0x0
                  li         t3, 0x0
                  li         t0, 0x0
                  li         s8, 0x1
                  li         t5, 0x0
                  li         t4, 0x0
                  li         s1, 0x0
                  li         ra, 0x0
                  li         a5, 0x1
                  lui         t0, 676995
                  mulh        a1, tp, s0
                  mul         gp, t2, a5
                  sub         s8, a1, a1
                  nop
                  c.li        s2, -1
                  mulh        s2, tp, s5
                  rem         s9, t3, s3
                  c.sub       a4, a4
                  lui         s0, 202332
                  rem         a7, a2, a2
                  lui         s3, 644314
                  mulh        t1, a4, gp
                  divu        s1, s1, a0
                  rem         ra, a4, a2
                  addi        zero, a5, 1723
                  c.sub       a4, a3
                  mulhsu      s9, t2, tp
                  rem         s8, t0, a6
                  c.addi4spn  a4, sp, 560
                  sub         a7, t1, s7
                  divu        t5, a0, s6
                  c.addi4spn  a4, sp, 128
                  lui         zero, 162136
                  mul         t2, t2, s10
                  c.addi      s6, 31
                  c.add       a0, a7
                  mulh        sp, a5, t6
                  c.slli      a2, 20
                  c.xor       a4, a3
                  lui         s9, 1002599
                  add         t2, a0, s7
                  xor         gp, s9, a1
                  lui         tp, 395021
                  c.xor       s1, a3
                  ori         s8, a7, -1388
                  c.sub       a4, a3
                  mulhsu      s4, s9, a4
                  slt         a1, a1, a0
                  c.li        t4, 12
                  addi        zero, s5, 861
                  or          a0, s1, sp
                  sltiu       a1, t4, 1128
                  and         s1, t5, a2
                  divu        s0, a5, t2
                  mulhu       a4, zero, s2
                  add         t1, s2, a5
                  slli        zero, a4, 20
                  c.mv        s8, ra
                  c.add       a1, s2
                  c.lui       t3, 17
                  c.srli      s0, 22
                  sra         a2, a3, a2
                  c.xor       a4, a4
                  div         s6, s11, s2
                  sra         gp, t3, s1
                  c.or        a4, a3
                  nop
                  rem         s4, s5, t1
                  mul         s0, s3, s2
                  and         s3, zero, t5
                  slt         s4, a5, a3
                  c.addi16sp  sp, -16
                  c.lui       ra, 8
                  srl         ra, s2, s7
                  mul         s4, a7, gp
                  c.srai      a4, 7
                  mul         s6, t0, a2
                  c.or        a4, a3
                  c.slli      a0, 21
                  mulhsu      s6, gp, a2
                  and         t3, a7, s11
                  div         t1, s3, t6
                  lui         a5, 175913
                  c.addi      ra, 30
                  c.sub       a4, a5
                  c.and       a4, a3
                  c.nop
                  rem         gp, t2, s6
                  sltu        sp, s10, t5
                  xor         s0, s6, s2
                  c.addi      s0, 11
                  c.and       s1, a2
                  c.addi      t3, -1
                  sltiu       t6, gp, 1105
                  div         a1, s8, zero
                  mulh        s10, s0, zero
                  c.xor       a4, a3
                  mulh        s6, s3, t4
                  xori        t6, t4, -1114
                  c.or        s1, a3
                  div         zero, s7, t0
                  addi        t0, s3, -1425
                  c.srli      a4, 15
                  divu        sp, s8, zero
                  divu        t4, ra, tp
                  c.and       a4, a3
                  or          a6, a5, s2
                  xor         a0, t6, a3
                  slli        t6, s7, 6
                  sltiu       zero, s0, 1306
                  auipc       t5, 555732
                  c.sub       a4, a3
                  addi        t0, a4, 636
                  c.lui       s9, 17
                  srl         a4, ra, gp
                  sltu        s3, ra, t6
                  c.mv        a4, t5
                  c.addi4spn  a4, sp, 384
                  sll         t1, sp, s9
                  addi        zero, s9, -1873
                  c.sub       a4, a0
                  lui         a0, 315159
                  xor         tp, s9, t3
                  c.nop
                  sra         s3, s4, t3
                  addi        a5, s5, -1056
                  srai        zero, a4, 16
                  c.or        s1, a3
                  andi        tp, t3, -248
                  c.slli      tp, 26
                  add         t4, s7, a2
                  xori        t0, s8, -1683
                  c.andi      a4, -1
                  mulh        tp, s2, ra
                  c.and       a4, a3
                  rem         zero, s2, a3
                  slt         t3, t3, s1
                  xor         t3, t2, t1
                  c.lui       t0, 22
                  c.srli      a4, 14
                  mul         a6, s3, s10
                  srai        a2, a3, 19
                  c.li        s4, -1
                  c.and       a4, a3
                  sub         s8, s1, a5
                  c.addi16sp  sp, -16
                  c.addi      sp, -1
                  or          s1, a5, s1
                  mulhu       ra, a0, t0
                  sll         a1, s0, t1
                  add         s4, s6, gp
                  c.and       a0, a3
                  sltu        a0, s11, sp
                  divu        s0, s10, a0
                  c.mv        a0, a4
                  addi        s9, a3, -867
                  slt         s1, a3, t0
                  xori        zero, s5, -141
                  slt         ra, s4, s8
                  rem         a5, sp, s11
                  c.sub       a4, a0
                  andi        t6, t3, -717
                  auipc       zero, 824571
                  srli        s6, a3, 29
                  li         t6, 0x0 #start riscv_int_numeric_corner_stream_4
                  li         ra, 0x0
                  li         t5, 0x0
                  li         t3, 0x1
                  li         a4, 0x0
                  li         t0, 0x1
                  li         t4, 0x1
                  li         a5, 0x0
                  li         s8, 0x0
                  li         t1, 0x0
                  div         s8, sp, s7
                  c.lui       ra, 8
                  div         zero, t2, s0
                  div         s9, sp, t5
                  c.addi4spn  a0, sp, 608
                  c.addi      t0, 16
                  div         s10, a4, a1
                  c.addi16sp  sp, 320
                  c.sub       a4, a3
                  auipc       a4, 632502
                  div         t2, t2, a2
                  rem         s3, t1, s2
                  sub         sp, t2, zero
                  auipc       s8, 33829
                  rem         s7, a1, s5
                  nop
                  c.sub       a4, a3
                  mulhsu      a0, s2, a5
                  lui         a0, 372137
                  c.addi16sp  sp, -16
                  c.addi      s0, 12
                  c.lui       tp, 29
                  mulhsu      zero, s9, s11
                  lui         a4, 782525
                  addi        a2, t6, -1235 #end riscv_int_numeric_corner_stream_4
                  ori         zero, s5, -659
                  sltu        a6, s3, a5
                  xor         s7, s5, s7
                  slt         zero, a7, t0
                  slt         s2, a6, t6
                  c.sub       a4, a3
                  c.or        a4, a3
                  c.slli      ra, 7
                  sltiu       s9, s9, -431
                  c.slli      t0, 7
                  and         s3, t3, a4
                  c.addi16sp  sp, -16
                  c.sub       a4, s0
                  mul         a7, s4, s2
                  c.addi4spn  a4, sp, 704
                  mulhsu      t2, s5, s7
                  mulhu       t5, s10, s1
                  or          s7, a0, a7
                  c.srli      a4, 20
                  srl         ra, s0, a1
                  mulh        s1, s1, gp
                  div         a4, gp, s6
                  c.srli      s0, 5
                  c.andi      a4, -1
                  or          zero, a3, t0
                  rem         t4, s5, s4
                  c.srli      a0, 9
                  c.mv        ra, s3
                  c.add       s2, s8
                  xor         s8, tp, t6
                  c.lui       s8, 23
                  sll         t2, s0, s0
                  srai        s2, s10, 27
                  sra         t0, s4, a2
                  c.addi16sp  sp, -16
                  c.srli      a4, 7
                  sra         t5, s9, a6
                  sll         a5, s11, a1
                  srl         ra, s11, s3
                  c.or        a4, a3
                  ori         t4, t6, -92
                  c.or        a4, a3
                  sll         zero, ra, s7
                  divu        a7, t5, t2
                  sub         t1, tp, t1
                  slti        s8, a4, 237
                  c.addi      t6, 9
                  c.add       a5, t1
                  slli        t2, s10, 27
                  xor         t0, t3, s3
                  xor         sp, s10, s5
                  mulh        t3, s6, t5
                  lui         t4, 160109
                  c.addi16sp  sp, -16
                  c.srai      a4, 17
                  c.andi      a4, -1
                  c.sub       a0, a3
                  divu        s0, s9, t5
                  sltu        s6, s2, a2
                  rem         s3, t0, t2
                  mul         a2, s10, a2
                  c.addi4spn  a4, sp, 320
                  mulhsu      a5, a1, a1
                  c.lui       t3, 5
                  mulh        s2, s3, s1
                  divu        sp, s3, gp
                  c.xor       a4, a3
                  or          sp, t0, t4
                  c.srli      a4, 27
                  c.sub       a4, a5
                  c.add       s4, s0
                  c.add       s7, s9
                  mulhu       a0, s0, s0
                  c.andi      a4, 17
                  sltu        s0, s3, s10
                  c.li        t3, -1
                  c.srai      a4, 14
                  mulhsu      sp, a4, s8
                  sra         tp, a6, s6
                  c.addi4spn  a4, sp, 384
                  li         a0, 0x1 #start riscv_int_numeric_corner_stream_0
                  li         s4, 0x1
                  li         t6, 0x0
                  li         t5, 0x0
                  li         a5, 0x0
                  li         a4, 0x1
                  li         t4, 0x41b79876
                  li         s10, 0x2792499a
                  li         t3, 0x54545b8b
                  li         t1, 0x0
                  c.addi      t2, 27
                  lui         t2, 702548
                  c.nop
                  addi        zero, a7, -1300
                  c.addi16sp  sp, -16
                  rem         s3, a3, t2
                  lui         zero, 963934
                  c.li        t4, -1
                  mulh        a4, a1, zero
                  mulhu       s7, a3, s8
                  c.lui       t4, 3
                  c.lui       s7, 21
                  c.sub       a4, a3
                  nop
                  sub         t1, a6, s10
                  c.mv        tp, t1
                  c.add       a7, s11
                  lui         s7, 834261 #end riscv_int_numeric_corner_stream_0
                  sll         t1, s11, ra
                  nop
                  c.and       a4, a3
                  c.xor       a4, a3
                  c.xor       a4, a3
                  auipc       ra, 889889
                  sra         s6, t0, ra
                  srl         a7, t6, s7
                  xor         s0, s11, a6
                  sub         t6, a1, a3
                  slti        s2, a4, -573
                  addi        ra, zero, 960
                  andi        s6, s5, 1452
                  xori        a2, t1, -42
                  c.add       a5, t4
                  srli        a5, a1, 25
                  c.addi      s10, 27
                  xori        zero, t2, 0
                  mulhsu      zero, gp, a5
                  c.and       a4, a3
                  div         zero, a4, a1
                  c.or        a1, a3
                  c.addi4spn  a1, sp, 896
                  mulhu       t2, s0, t1
                  div         a6, t5, s11
                  c.addi      t5, 12
                  c.addi      t3, 21
                  c.li        tp, -1
                  c.addi      sp, 31
                  c.addi4spn  a4, sp, 416
                  sub         tp, s9, t6
                  or          s0, t4, s3
                  mulhsu      t1, a0, t2
                  or          t0, sp, a6
                  mul         s4, tp, s10
                  slli        a6, s4, 21
                  c.or        a4, a3
                  andi        s2, s1, 1266
                  auipc       s4, 305689
                  srli        t2, gp, 31
                  sll         gp, s6, s10
                  andi        sp, t4, 1982
                  or          s0, s0, t3
                  c.andi      a4, 24
                  sll         t1, a0, s6
                  mul         a5, t3, s1
                  div         t6, s6, a5
                  nop
                  c.and       a4, a3
                  auipc       zero, 868486
                  slt         s2, a6, zero
                  slti        ra, s9, 241
                  c.addi16sp  sp, 240
                  add         tp, s8, t6
                  sltiu       t6, t3, 74
                  rem         s1, s2, s10
                  srai        s7, a1, 9
                  mulhsu      s1, s1, a3
                  nop
                  sub         t5, a4, a3
                  lui         t0, 583262
                  srli        t3, s5, 3
                  c.sub       a4, a3
                  mulhu       t0, t4, a0
                  mul         t5, t2, t4
                  xor         zero, t4, t0
                  c.li        ra, 4
                  or          s8, s9, a5
                  c.add       s4, s5
                  mulhu       t5, s8, a2
                  mulhu       a0, t0, t5
                  c.srli      a4, 22
                  c.and       a4, s0
                  c.or        a4, a3
                  c.slli      s10, 10
                  c.andi      a4, -1
                  c.addi      a2, -1
                  sub         ra, a0, t2
                  mulhsu      a1, a2, a7
                  sll         a7, t0, s7
                  rem         zero, a3, t3
                  sltiu       gp, t0, 1802
                  c.slli      s4, 6
                  c.mv        t3, s10
                  c.sub       a4, a3
                  c.sub       a4, a3
                  c.li        gp, -1
                  slti        a1, s9, 1615
                  slli        s2, s2, 20
                  mulh        t1, s1, t3
                  mulhsu      zero, s8, t2
                  ori         sp, tp, -1270
                  add         zero, t0, t6
                  rem         tp, a6, t3
                  c.slli      ra, 3
                  sra         s2, tp, t5
                  srli        t0, zero, 7
                  slti        a7, s5, 1581
                  sll         sp, zero, t1
                  mulh        gp, t3, a5
                  mulhu       s2, s5, s6
                  srai        a2, s0, 10
                  slt         sp, zero, s0
                  andi        zero, s4, -152
                  c.andi      s0, -1
                  c.srai      s0, 30
                  c.addi      t6, 25
                  mulhsu      s2, s3, s6
                  mulhsu      s1, s5, t2
                  sltiu       a4, s1, 342
                  and         zero, t5, a6
                  c.xor       a4, a3
                  c.or        a4, a3
                  c.mv        ra, t5
                  c.or        s1, a3
                  c.xor       a2, a3
                  mulhu       s9, gp, a7
                  c.slli      s10, 2
                  sll         t5, a6, a5
                  addi        ra, a5, -1071
                  lui         s8, 685856
                  xor         s1, gp, a6
                  mulh        a5, t1, s4
                  and         s1, gp, t4
                  nop
                  srai        a4, s11, 14
                  mulhu       a6, s3, s0
                  andi        a5, s3, -172
                  c.sub       a1, a3
                  c.mv        t2, t3
                  c.add       s1, a7
                  c.and       a4, a3
                  nop
                  sra         s1, ra, gp
                  div         s4, s9, s2
                  c.nop
                  c.sub       a4, a3
                  slli        t4, t1, 23
                  c.and       s1, a3
                  mulh        sp, s4, ra
                  c.li        t5, 3
                  ori         a2, s8, -1719
                  c.mv        t4, s9
                  lui         s3, 292304
                  divu        a6, s11, gp
                  c.addi4spn  a4, sp, 176
                  sll         t2, gp, s4
                  srai        sp, s4, 10
                  or          gp, a0, ra
                  c.srli      a4, 23
                  c.andi      a0, 19
                  c.lui       s7, 5
                  c.lui       a5, 2
                  c.nop
                  or          gp, s4, t1
                  divu        a0, t5, t0
                  sra         s7, a5, a1
                  sltiu       s0, t1, 1798
                  mulh        s2, s1, t2
                  c.and       a1, a3
                  xori        t3, a5, -2031
                  rem         sp, s7, a4
                  c.addi      t3, -1
                  srai        a7, s6, 18
                  srli        t1, s5, 28
                  c.li        t2, 26
                  andi        t4, a2, 301
                  lui         s9, 864478
                  c.srai      a4, 17
                  mulhsu      a0, s1, t3
                  addi        zero, t2, -2023
                  c.srli      a4, 13
                  srli        s6, a0, 31
                  slli        zero, t0, 10
                  c.slli      s0, 25
                  c.addi16sp  sp, -16
                  c.li        a6, 24
                  and         zero, s5, t1
                  srl         sp, gp, s7
                  ori         t2, a4, 2009
                  c.nop
                  or          a6, s6, a7
                  mulhsu      a6, t0, s4
                  nop
                  c.sub       a1, a3
                  auipc       a5, 358190
                  c.and       a4, a3
                  c.and       a4, a3
                  andi        s3, s11, -332
                  sra         zero, t2, zero
                  xori        zero, a2, -932
                  c.andi      a4, -1
                  slli        s2, s3, 20
                  ori         tp, s4, 705
                  c.mv        ra, sp
                  andi        sp, ra, 261
                  sll         t0, s6, a0
                  c.nop
                  auipc       s2, 723043
                  div         s7, a2, s5
                  and         a4, tp, sp
                  mulhu       t3, s1, s8
                  c.sub       a4, a3
                  mulh        s4, a1, s9
                  c.or        a5, a3
                  xori        zero, sp, -429
                  c.li        s6, -1
                  c.sub       a2, a3
                  c.sub       a2, a3
                  add         a2, gp, gp
                  add         tp, s3, t5
                  sra         t1, a4, ra
                  sub         a5, a6, s0
                  mulh        s3, a5, s7
                  c.srli      a4, 4
                  c.and       a4, a3
                  c.addi      a5, -1
                  rem         zero, a3, zero
                  mulhu       s1, t1, a7
                  auipc       s4, 617973
                  c.addi16sp  sp, -16
                  xor         t0, s6, s10
                  sltiu       gp, s3, -1150
                  div         zero, t2, t3
                  sub         t0, s0, t5
                  add         tp, s2, a4
                  c.mv        a2, a3
                  c.and       a4, a3
                  nop
                  slli        a6, s10, 27
                  auipc       a0, 524391
                  srl         t4, t3, t5
                  mul         s2, a6, s4
                  c.addi4spn  a0, sp, 704
                  ori         s8, s8, -1297
                  xor         a7, s6, a7
                  nop
                  c.add       a2, s1
                  mulhsu      zero, t5, s8
                  sltu        s0, a5, t2
                  add         a4, s9, a3
                  mulhsu      s1, t1, zero
                  srai        t5, a1, 25
                  c.lui       a6, 15
                  srli        sp, t6, 15
                  mulhu       s3, s2, s10
                  divu        s9, tp, a5
                  ori         s6, a4, -1972
                  sltiu       a4, s6, 414
                  sll         a4, zero, t3
                  srai        sp, a2, 7
                  srai        a4, ra, 8
                  c.srli      a4, 28
                  c.sub       a4, a3
                  auipc       t5, 2829
                  c.mv        s3, s9
                  slt         zero, s9, a4
                  sltu        s1, s4, zero
                  li         t6, 0x1 #start riscv_int_numeric_corner_stream_6
                  li         t4, 0x1
                  li         a6, 0x0
                  li         t3, 0x0
                  li         s9, 0x0
                  li         s8, 0x0
                  li         a0, 0x1
                  li         t5, 0x0
                  li         s4, 0x0
                  li         a2, 0x76b16596
                  addi        a7, s10, -890
                  mul         gp, a3, s3
                  mulhsu      t1, t3, a2
                  mul         a6, a2, s10
                  c.li        a5, -1
                  c.sub       a4, a3
                  c.lui       ra, 4
                  c.li        s9, -1
                  mul         s8, s2, t4
                  rem         t3, s10, s6
                  mul         s0, t3, s5
                  c.addi16sp  sp, -16
                  mulhu       t5, a5, a7
                  c.li        gp, 20
                  c.lui       s6, 24
                  c.addi16sp  sp, 480
                  c.lui       gp, 31
                  add         zero, a1, t6
                  c.add       s4, a2
                  rem         a2, s5, t2
                  sub         zero, ra, s9
                  c.mv        t2, t2
                  c.addi16sp  sp, 352
                  lui         t4, 997541
                  divu        s3, t4, s3
                  mulhsu      s1, zero, t5 #end riscv_int_numeric_corner_stream_6
                  add         zero, zero, s11
                  c.addi16sp  sp, -16
                  c.slli      t1, 1
                  rem         s0, a5, s2
                  sltu        s10, a0, s4
                  xori        s3, t6, 1432
                  xor         zero, zero, gp
                  mulh        s8, s0, t2
                  c.lui       t1, 18
                  sll         sp, s2, s1
                  c.nop
                  nop
                  c.and       a4, a0
                  sra         t3, s1, ra
                  xor         s9, s5, t2
                  c.and       a4, a3
                  lui         t2, 973294
                  mulhsu      s2, a5, t6
                  sra         s9, t4, t6
                  rem         s1, s2, a2
                  c.nop
                  rem         s4, a2, a0
                  mulh        zero, t3, a5
                  sra         zero, s11, a0
                  c.lui       s4, 6
                  divu        a2, s6, a5
                  c.addi16sp  sp, 192
                  c.add       ra, s7
                  slli        s4, s0, 28
                  xori        a5, a2, 71
                  srli        t6, s7, 8
                  sra         s3, s8, s2
                  c.nop
                  c.or        a1, a3
                  auipc       s2, 895395
                  sra         t2, a4, t5
                  c.or        a4, a3
                  c.addi4spn  a4, sp, 832
                  c.andi      a4, -1
                  c.and       a4, a3
                  c.srli      a4, 14
                  xori        t0, sp, -737
                  c.srai      a4, 21
                  sltiu       tp, sp, 1817
                  c.add       s7, s0
                  c.addi      a1, 30
                  slti        s1, t6, -638
                  slli        a4, ra, 20
                  rem         a2, s8, s9
                  xor         a5, s5, t2
                  c.add       s9, sp
                  mul         s4, gp, a3
                  xor         zero, s0, zero
                  xor         s6, t2, a3
                  c.andi      a2, -1
                  c.slli      s10, 17
                  xor         zero, s2, a5
                  c.or        a4, a5
                  mulhu       sp, a7, t1
                  slti        s0, a2, -373
                  slt         s7, t4, t6
                  add         sp, s5, tp
                  rem         zero, s8, s3
                  c.mv        s8, s10
                  c.srai      a4, 2
                  div         a6, t0, s5
                  c.mv        t6, ra
                  auipc       t6, 206747
                  srli        t5, a7, 8
                  mul         s2, ra, s5
                  andi        a2, s8, 453
                  ori         zero, s9, 536
                  c.addi      t0, -1
                  srl         a6, s8, t6
                  c.or        a4, s0
                  sltu        a0, s0, ra
                  addi        s3, t2, 159
                  addi        a5, t1, 445
                  mul         zero, a6, a3
                  div         s10, zero, s6
                  c.lui       s8, 23
                  div         s6, t3, zero
                  or          zero, s0, s0
                  c.xor       s1, a3
                  xori        t1, s5, -1397
                  c.nop
                  c.nop
                  c.srai      a4, 27
                  sll         zero, a3, t3
                  c.srai      a4, 6
                  rem         ra, a5, a1
                  c.or        a4, a3
                  srai        sp, s9, 11
                  c.addi4spn  a4, sp, 448
                  c.addi4spn  a1, sp, 576
                  divu        s7, t4, a6
                  xor         a1, s4, tp
                  c.addi4spn  a4, sp, 320
                  li         t6, 0x0 #start riscv_int_numeric_corner_stream_5
                  li         t5, 0x1
                  li         a1, 0x119d8337
                  li         t4, 0x231da746
                  li         a5, 0x0
                  li         s1, 0x731db430
                  li         t3, 0x0
                  li         s9, 0x1
                  li         s6, 0x1
                  li         a2, 0x1
                  rem         zero, t1, t1
                  divu        s2, sp, a5
                  c.addi      t3, -1
                  lui         zero, 424374
                  c.addi4spn  a4, sp, 704
                  nop
                  sub         a7, s5, t5
                  c.mv        s10, tp
                  mulhsu      t4, a2, s9
                  c.lui       a2, 2
                  add         zero, t4, t6
                  c.li        s7, 4
                  mulhsu      s4, s0, t5
                  c.nop
                  mulhu       zero, sp, s6
                  nop
                  c.addi4spn  a4, sp, 576
                  nop
                  c.addi16sp  sp, -16
                  c.li        t4, 25
                  c.mv        s7, t4
                  auipc       gp, 113363
                  c.addi16sp  sp, 464
                  c.sub       a4, a3
                  divu        s9, t0, a5
                  mulhu       t4, t4, s3
                  nop
                  mul         a1, t1, s10 #end riscv_int_numeric_corner_stream_5
                  sra         t6, s5, s4
                  slti        s4, t0, 754
                  c.addi16sp  sp, 464
                  c.lui       a1, 5
                  c.sub       a4, a3
                  srl         a7, s8, s2
                  c.andi      a4, 5
                  c.add       s7, t0
                  c.addi16sp  sp, -16
                  c.addi4spn  a4, sp, 160
                  slt         a5, s5, a5
                  lui         t4, 224804
                  xori        ra, tp, 653
                  srl         t3, a0, s6
                  c.lui       t5, 29
                  rem         a7, s6, s0
                  c.andi      a4, 26
                  c.addi      s6, -1
                  slli        a6, s10, 25
                  slli        a6, s1, 13
                  slt         s0, s11, s7
                  xori        s7, a2, 1715
                  c.lui       t4, 1
                  c.mv        ra, ra
                  lui         t1, 909498
                  c.addi4spn  a5, sp, 320
                  c.andi      a5, 31
                  divu        s4, s8, t5
                  auipc       tp, 333056
                  srl         ra, t2, a6
                  c.slli      s0, 2
                  slli        t0, a5, 5
                  c.slli      a2, 25
                  c.sub       a4, a3
                  auipc       s3, 815126
                  add         s1, a0, s9
                  or          a1, s0, a6
                  mul         t4, a4, a7
                  sll         t4, s4, s8
                  sltu        s9, t0, s11
                  c.srli      a4, 6
                  c.srai      s1, 24
                  sltu        s8, s10, ra
                  c.srai      a4, 11
                  srli        s10, t6, 11
                  mulh        zero, s10, s0
                  sra         t3, s9, t6
                  mulhsu      s6, t1, gp
                  c.add       s10, s4
                  and         a4, s3, s5
                  c.lui       a2, 1
                  mulhsu      t2, a4, t0
                  ori         s1, a4, 1445
                  c.sub       a4, a3
                  div         tp, s0, t0
                  or          s2, t0, s2
                  or          gp, s1, s3
                  c.or        a4, s1
                  lui         a6, 813834
                  rem         t3, t6, sp
                  mulhu       s0, t3, a2
                  div         zero, s6, sp
                  slti        gp, s5, -378
                  c.addi      ra, -1
                  srl         s1, a3, t1
                  c.slli      t5, 4
                  srai        t4, t2, 0
                  mul         t3, t6, s0
                  c.lui       a2, 22
                  c.addi4spn  a4, sp, 320
                  xori        t1, zero, -1927
                  xori        zero, s7, -1871
                  sltu        zero, a5, t2
                  c.or        a4, a3
                  sll         s2, t1, s10
                  mulhsu      s7, t1, t1
                  sltiu       a1, tp, 1390
                  c.li        s0, -1
                  c.nop
                  c.addi16sp  sp, 48
                  slt         tp, s7, s6
                  xor         sp, s2, zero
                  xor         t2, s1, sp
                  c.lui       ra, 17
                  c.slli      sp, 30
                  xori        t2, gp, -1188
                  mul         ra, a2, zero
                  or          zero, zero, gp
                  rem         s2, a0, s6
                  slt         s2, t1, a4
                  c.addi4spn  a4, sp, 384
                  srli        s9, a4, 8
                  slt         s2, t6, s7
                  sub         gp, a6, a7
                  c.slli      ra, 20
                  sra         t1, ra, t4
                  auipc       s6, 444514
                  sltu        a4, s11, s10
                  c.and       a4, a3
                  addi        t2, ra, -1165
                  c.addi16sp  sp, -16
                  div         zero, s3, a3
                  xori        zero, t1, 918
                  sll         zero, s1, t4
                  c.nop
                  and         gp, s1, s10
                  slli        t0, a4, 10
                  c.addi4spn  a4, sp, 832
                  c.srli      a1, 10
                  xor         zero, s7, s2
                  c.andi      a0, 1
                  c.andi      a4, 2
                  c.srli      a4, 25
                  divu        sp, s11, s11
                  sra         s4, t5, s2
                  c.mv        a4, a4
                  c.mv        a7, ra
                  srl         t1, s10, a2
                  xor         a0, a5, a4
                  sra         tp, a0, s4
                  srli        t4, s11, 3
                  c.addi4spn  a4, sp, 960
                  ori         zero, s11, 1626
                  divu        s1, t6, ra
                  slti        zero, t5, 171
                  c.add       t4, a7
                  xor         a7, s0, t0
                  nop
                  nop
                  srl         t4, s5, a0
                  xori        a0, a1, 1558
                  xor         t0, s10, s0
                  srl         s10, gp, tp
                  srli        s8, a3, 3
                  mulhsu      zero, s10, s6
                  c.add       t4, a1
                  c.and       a4, a4
                  addi        sp, s6, 258
                  slt         t2, s11, a0
                  sub         a6, gp, s9
                  mulhu       s7, s3, a6
                  c.andi      a4, 31
                  slti        a4, t4, -1920
                  c.nop
                  lui         a1, 1013739
                  c.add       s10, ra
                  c.addi16sp  sp, -16
                  lui         a2, 564857
                  mulhsu      s7, s4, s1
                  c.addi16sp  sp, 336
                  c.andi      a4, -1
                  sltiu       sp, a6, -1353
                  xor         a5, a2, a1
                  auipc       a0, 647330
                  slli        t4, tp, 9
                  slt         t6, a4, t2
                  andi        s8, s1, 255
                  sltiu       zero, a5, 1106
                  li         s3, 0x0 #start riscv_int_numeric_corner_stream_2
                  li         t6, 0x0
                  li         t5, 0x53492924
                  li         t3, 0x1
                  li         s10, 0x1732d13f
                  li         s7, 0x0
                  li         t4, 0x0
                  li         s9, 0x1
                  li         a2, 0x0
                  li         a4, 0x0
                  c.mv        a1, s4
                  div         s4, t3, ra
                  lui         a0, 387639
                  div         a6, ra, t1
                  mulhu       s3, s3, t5
                  sub         a6, s0, s10
                  nop
                  mul         ra, s2, a4
                  mul         a1, zero, s8
                  mul         ra, a0, a0
                  addi        t3, a3, -1959
                  c.addi16sp  sp, -16
                  c.addi4spn  a4, sp, 832
                  c.addi4spn  a4, sp, 704
                  c.addi      ra, -1
                  c.li        t6, 14
                  mulhsu      t1, s8, s4
                  c.or        a4, a3
                  c.addi      a5, -1
                  sltu        t3, s0, s7
                  mulhsu      a7, s4, s3
                  auipc       s0, 392403
                  c.addi16sp  sp, -16
                  mulh        t5, t5, s4
                  c.or        a4, a3
                  c.addi      ra, 24
                  sll         s1, zero, s10
                  c.nop
                  c.add       t3, s6
                  mul         t3, a5, s7
                  or          zero, a2, gp
                  mulhsu      s0, a4, s0
                  rem         s6, a0, s3
                  c.addi      a6, 12
                  lui         t0, 950947
                  c.srli      a4, 28
                  slt         s3, tp, t3
                  mulhsu      a6, a5, a0
                  c.li        a4, -1
                  c.slli      s3, 6
                  sra         sp, ra, s1
                  slli        zero, a3, 23
                  c.srli      a4, 15
                  srl         a2, a5, a1
                  c.xor       a4, a3
                  mulhu       zero, ra, s2
                  sltu        t0, a4, t4
                  c.mv        s6, ra
                  c.nop
                  div         s0, s9, a4
                  xori        t4, a0, -538
                  andi        a2, tp, 253
                  or          a0, t6, sp
                  slli        s10, s6, 18
                  xori        t1, tp, -128
                  srl         s1, s1, s3
                  slti        s2, s6, 1040
                  nop
                  or          s1, s2, s0
                  andi        t3, s11, -650
                  andi        a6, t0, 915
                  mulhu       t0, a0, s3
                  srli        t3, t4, 21
                  c.andi      a1, -1
                  srai        ra, a3, 4
                  xori        s6, t6, 1764
                  c.or        a4, a3
                  nop
                  sltu        t5, a7, s3
                  c.sub       a4, a3
                  c.or        a4, a3
                  slti        s9, s0, 439
                  slti        s2, t4, 810
                  sltiu       s1, gp, 1028
                  nop
                  div         zero, t4, a3
                  c.srli      a1, 16
                  sll         zero, t1, a5
                  c.xor       a4, a3
                  srai        gp, a7, 15
                  c.andi      a5, 2
                  andi        zero, a5, 1591
                  add         s10, a2, t6
                  c.slli      t5, 7
                  slt         a7, zero, s3
                  div         a0, s6, tp
                  div         a7, a6, s3
                  srl         a0, sp, t5
                  srl         t1, a4, a0
                  or          zero, s6, s2
                  div         t2, t3, ra
                  c.lui       t4, 8
                  c.srli      a4, 2
                  c.addi4spn  a4, sp, 640
                  c.addi16sp  sp, 192
                  add         a0, t3, s7
                  div         s2, a7, s6
                  c.addi16sp  sp, -16
                  c.or        a4, a3
                  mulh        s4, a6, s11
                  lui         s1, 63923
                  slt         s2, s4, t4
                  slli        s6, a6, 26
                  c.and       a5, a3
                  mulhsu      t6, a1, t5
                  c.srli      s0, 29
                  srl         a1, t3, s6
                  lui         a7, 905065
                  c.lui       a2, 3
                  srl         s7, ra, s1
                  slt         t1, s9, t6
                  ori         s9, tp, 948
                  ori         t4, s11, -1197
                  mulhsu      a5, t6, t6
                  c.srli      a4, 27
                  c.slli      s10, 1
                  xori        tp, ra, -904
                  c.lui       ra, 12
                  xor         t4, a3, s3
                  srli        s4, s2, 29
                  c.and       a4, a3
                  c.li        s8, -1
                  addi        zero, t1, 1340
                  lui         t5, 343015
                  auipc       s10, 116780
                  srai        s3, s6, 16
                  srl         a0, a6, s5
                  xor         s7, t4, a6
                  c.lui       t5, 15
                  ori         t0, t5, -243
                  c.add       t0, s10
                  c.srli      a4, 25
                  srl         a4, s5, sp
                  c.li        ra, -1
                  mulh        s2, a4, a1
                  andi        tp, t5, 150
                  slti        a6, s6, -1093
                  c.addi      tp, 23
                  c.and       a4, a3
                  or          t2, a2, s5
                  srli        s6, t3, 13
                  slli        s4, s8, 15
                  or          t6, sp, s2
                  c.xor       a2, a3
                  srli        s6, s4, 3
                  rem         a0, a1, s11
                  c.and       a4, a3
                  andi        s3, a1, 1219
                  andi        zero, tp, -867
                  c.srli      a4, 15
                  and         a6, a2, t3
                  lui         zero, 808360
                  ori         tp, s3, 2043
                  c.xor       a4, a3
                  xor         sp, tp, s7
                  slli        t5, a0, 2
                  c.or        a4, a3
                  c.add       a1, a5
                  c.xor       a4, a4
                  c.srai      a4, 2
                  c.srai      a0, 24
                  srl         s0, t1, t6
                  mul         a4, s5, a3
                  c.lui       a0, 6
                  auipc       s6, 802820
                  srl         s10, tp, s3
                  c.add       a1, s10
                  c.addi4spn  a4, sp, 128
                  sub         s0, a1, s5
                  auipc       t3, 199002
                  slti        t4, s5, 625
                  add         a6, gp, t2
                  c.srai      s0, 24
                  c.addi      ra, -1
                  c.and       a4, a3
                  mul         a2, s4, t6
                  rem         s1, s0, s7
                  sltu        t0, a4, s4
                  and         s6, s10, a5
                  mulhsu      t2, t3, t4
                  c.slli      ra, 7
                  sltu        a6, t5, s4
                  mulh        zero, s5, a7
                  srai        zero, t2, 1
                  and         s1, zero, zero
                  c.andi      a4, 12
                  c.xor       a4, a3
                  slti        s10, t2, 1481
                  sub         s6, a0, a3
                  nop
                  div         zero, a0, s3
                  xori        a4, a1, 1738
                  sra         t0, t3, zero
                  c.addi      a0, -1
                  div         t1, s3, s11
                  andi        gp, t4, 1689
                  c.srli      a4, 13
                  slti        sp, t1, 1553
                  srai        t6, sp, 4
                  c.li        a0, -1
                  c.addi      s1, -1
                  andi        s1, a2, -1175
                  c.slli      a2, 1
                  c.mv        ra, t4
                  srai        s4, s2, 3
                  mulhsu      zero, t6, s2
                  ori         s8, s1, 1923
                  addi        a6, s4, -1888
                  c.slli      t6, 6
                  c.addi4spn  a4, sp, 64
                  addi        a2, a6, 363
                  c.addi16sp  sp, -16
                  c.or        a4, a3
                  xori        t5, s8, -1691
                  c.srli      a4, 27
                  sll         zero, t3, tp
                  mul         gp, t2, a3
                  c.mv        t2, s3
                  lui         a1, 911268
                  lui         s1, 1030352
                  sll         zero, s6, a7
                  lui         t4, 666372
                  addi        zero, t5, 1072
                  xori        s0, s6, 30
                  sra         s7, s8, sp
                  or          s3, t1, t4
                  sltiu       zero, t5, 1831
                  divu        t3, s2, s5
                  xor         a6, t4, ra
                  c.slli      ra, 3
                  c.add       a4, t6
                  lui         s8, 736554
                  c.nop
                  mulh        s3, s2, s7
                  c.and       s1, a3
                  c.xor       a4, a4
                  rem         zero, t0, ra
                  nop
                  c.li        ra, -1
                  c.andi      a4, 25
                  mulhu       s2, s8, t3
                  c.sub       a4, a3
                  sltu        t1, a5, s7
                  c.andi      a2, 23
                  sltu        zero, t2, t2
                  srl         tp, a1, tp
                  srli        s9, t0, 20
                  c.addi      a0, 21
                  slt         t1, s2, t0
                  slt         t1, s4, t5
                  c.sub       a4, a3
                  add         a2, s1, t2
                  srai        zero, t1, 6
                  addi        s3, t2, -438
                  sub         s8, a3, a2
                  sltiu       s8, a3, 404
                  mul         s4, s9, s5
                  c.nop
                  andi        s0, gp, -1968
                  slli        s1, ra, 19
                  mulhsu      t2, t2, t0
                  c.xor       a4, a3
                  srl         sp, s3, s2
                  srli        a1, t6, 23
                  c.nop
                  srl         t1, s6, zero
                  ori         s1, t0, -1708
                  and         t3, ra, a7
                  sll         s8, t5, s8
                  c.addi4spn  a5, sp, 640
                  rem         zero, a2, a3
                  c.xor       a4, a1
                  sra         a6, s6, s0
                  c.li        s4, 8
                  auipc       s7, 587540
                  xor         s7, a5, s8
                  c.or        a4, a4
                  sll         a2, a3, t3
                  c.andi      a4, -1
                  addi        sp, a4, -888
                  c.andi      a4, -1
                  div         zero, t5, s8
                  xor         s1, s11, t6
                  mulhu       s2, t4, s8
                  c.and       a4, a3
                  c.xor       a4, a3
                  sltu        a2, s2, s6
                  slli        ra, s1, 8
                  mulhu       ra, t2, s11
                  c.or        a4, a3
                  c.addi      a5, 22
                  c.xor       a4, a3
                  c.addi      ra, -1
                  andi        t2, s4, -1145
                  c.li        ra, -1
                  div         tp, gp, s10
                  and         gp, t6, a3
                  srai        t6, t1, 6
                  andi        s1, t5, -1841
                  c.or        a5, a3
                  sltiu       s10, a1, 1911
                  c.slli      s0, 25
                  sltu        s2, t4, a5
                  mul         s9, s7, s3
                  ori         t6, t4, -2032
                  slli        s8, s10, 18
                  sltu        gp, tp, t5
                  slt         a2, s5, a7
                  c.andi      a0, -1
                  mulh        t0, s3, t1
                  c.addi16sp  sp, -16
                  and         s4, s11, t0
                  or          s4, s9, a5
                  andi        s4, a7, 1691
                  c.add       s0, a6
                  and         tp, s9, s3
                  slt         s7, sp, t5
                  mulhsu      s3, s7, t2
                  lui         s10, 140301
                  c.xor       a4, a3
                  xor         s7, s3, ra
                  ori         a6, s7, -1475
                  sltiu       s4, t5, 475
                  srai        tp, s8, 26
                  and         zero, gp, a0
                  ori         zero, s4, 1973
                  rem         s2, s1, t3
                  mulhsu      zero, gp, a0
                  c.sub       a4, a3
                  xori        s3, a1, -1876
                  sra         zero, s10, gp
                  ori         t5, s10, -956
                  sub         t5, t5, a3
                  c.nop
                  c.lui       a1, 17
                  c.slli      s10, 19
                  c.andi      a4, 31
                  mulhu       s9, s10, t5
                  srl         s4, s6, s9
                  xori        s7, s5, -1124
                  srli        s0, a5, 8
                  nop
                  c.addi4spn  a4, sp, 640
                  sltiu       a0, sp, -1525
                  mul         a5, t5, s1
                  slli        zero, s7, 17
                  slt         t2, s0, s10
                  c.srli      a4, 20
                  divu        zero, s9, s4
                  sub         tp, s11, a5
                  mulhsu      s9, s1, s2
                  c.li        a4, 4
                  c.sub       a4, a3
                  slt         a7, s0, t5
                  srl         t4, a0, a6
                  c.srli      a2, 31
                  c.or        s0, a0
                  sll         sp, s4, s9
                  c.mv        s3, s4
                  c.nop
                  mulh        t5, tp, a0
                  c.addi      t2, -1
                  mul         s8, a4, t3
                  slti        s6, t4, 159
                  c.addi4spn  a1, sp, 352
                  c.srai      a1, 19
                  auipc       t5, 6483
                  xori        s6, t1, -1563
                  mulhsu      zero, zero, t2
                  sub         s1, t1, s9
                  andi        zero, zero, -2024
                  xori        a0, s1, -293
                  sub         tp, t6, a2
                  ori         s0, tp, 1138
                  or          s8, s9, a0
                  srli        t1, t5, 27
                  c.sub       a4, a3
                  slti        a5, a1, -703
                  ori         a2, s4, -581
                  c.srai      a4, 29
                  c.li        s7, 10
                  c.addi      ra, 31
                  c.and       a4, s1
                  and         s0, a7, s7
                  div         tp, zero, a4
                  div         a2, s5, t6
                  c.and       a0, a3
                  c.or        a4, a4
                  c.lui       a7, 11
                  div         s3, a0, s4
                  c.add       t1, a2
                  c.sub       a4, a3
                  c.sub       a4, a3
                  sra         a1, t3, gp
                  sra         zero, a0, a0
                  sll         t4, s2, s9
                  xori        zero, t6, -1454
                  add         zero, tp, t3
                  and         a1, t2, a4
                  c.srai      a4, 24
                  sll         a6, t6, s10
                  mulhsu      ra, s0, a7
                  divu        t5, t0, a0
                  or          t6, t3, t3
                  add         s4, gp, s10
                  xor         s9, a0, zero
                  slli        s7, s2, 0
                  div         zero, zero, a6
                  c.addi      s4, -1
                  srl         zero, a1, a0
                  div         s2, t5, t2
                  slt         t3, s7, s1
                  sub         a7, s8, a5
                  addi        a6, s8, 702
                  ori         s3, s2, -214
                  add         s1, a0, s11
                  sra         t3, t0, zero
                  or          t2, tp, s6
                  add         ra, s8, s8
                  c.srai      a4, 13
                  xori        s2, s8, 1767
                  or          tp, t1, t4
                  c.and       a5, a3
                  slli        zero, s6, 18
                  c.and       a4, a3
                  ori         t1, ra, -1627
                  c.lui       a6, 18
                  c.slli      s9, 3
                  sltiu       a4, s9, 1321
                  c.or        a4, a3
                  mul         a7, a6, s4
                  srli        zero, t2, 19
                  add         sp, s6, s10
                  add         s3, ra, t5
                  c.li        ra, -1
                  sltu        a7, t0, t6
                  c.sub       a4, a3
                  sltu        t5, s5, t3
                  sub         s1, a1, a1
                  c.or        s1, a3
                  c.nop
                  c.slli      a1, 22
                  or          a5, t2, a7
                  sltiu       a1, s5, -411
                  srl         zero, s0, gp
                  c.srli      a4, 9
                  slti        t6, s5, 683
                  srli        t6, t4, 21
                  srai        a7, s2, 10
                  slti        a0, sp, 1695
                  rem         tp, a6, a5
                  sra         tp, zero, t4
                  or          s6, a5, a1
                  sub         sp, a4, t1
                  c.srli      a4, 12
                  sll         a2, a3, a0
                  c.andi      a4, -1
                  c.addi16sp  sp, 16
                  nop
                  andi        t3, a6, -1315
                  mulh        a5, s8, t4
                  slti        s0, s0, 1603
                  div         a6, a2, s11
                  xor         a1, t5, s4
                  sub         zero, a6, s1
                  divu        s0, sp, ra
                  sra         s6, t6, s1
                  srl         zero, a3, s11
                  c.mv        a7, t1
                  slli        s10, s5, 2
                  lui         t2, 78445
                  slti        ra, s6, -863
                  srai        sp, s5, 11
                  srli        a6, s10, 18
                  andi        zero, t0, 1856
                  c.slli      t5, 17
                  sltiu       s2, a2, -1484
                  auipc       s2, 974186
                  c.slli      t4, 31
                  c.or        a4, a4
                  c.srai      a4, 23
                  andi        zero, a4, 561
                  nop
                  c.andi      a4, -1
                  srl         s4, s10, a0
                  srai        tp, a6, 13
                  andi        t1, t5, 757
                  srli        zero, s4, 26
                  divu        a5, a0, s4
                  c.nop
                  c.andi      a4, 11
                  nop
                  xori        zero, a3, -1688
                  c.slli      tp, 20
                  slti        s3, s11, 1815
                  c.and       a4, a0
                  lui         a1, 629346
                  c.addi4spn  a4, sp, 400
                  srai        t1, a2, 28
                  add         sp, t4, s4
                  divu        t0, tp, t2
                  sub         t0, s7, t3
                  c.srli      a4, 10
                  mulhsu      t3, t2, a0
                  sra         ra, s5, sp
                  divu        s6, a5, s0
                  or          a0, t5, t5
                  slt         s10, tp, ra
                  c.addi4spn  a4, sp, 960
                  sll         s7, s3, s2
                  mulhu       sp, tp, s4
                  c.srai      a4, 27
                  c.xor       a4, a5
                  sltiu       t5, s3, 1910
                  c.nop
                  ori         zero, t0, 738
                  sra         t6, a2, a2
                  ori         s6, tp, -1257
                  c.sub       a4, a3
                  or          t5, s7, s6
                  mulhu       t4, t4, tp
                  lui         s9, 182371
                  sra         s6, tp, zero
                  c.addi      t3, -1
                  mul         a5, t4, tp
                  c.add       s9, gp
                  lui         t6, 45871
                  slli        zero, a1, 13
                  and         t5, t3, s9
                  sra         a4, t5, a3
                  ori         s7, a4, -772
                  c.nop
                  lui         t3, 430725
                  andi        zero, a4, -1979
                  c.add       sp, s10
                  c.or        a4, a1
                  slt         s1, t4, t3
                  c.slli      s0, 31
                  c.lui       t6, 20
                  nop
                  sra         zero, s7, sp
                  c.nop
                  c.andi      a4, -1
                  xori        zero, t1, 1953
                  sltu        zero, t4, sp
                  divu        tp, a5, s7
                  c.sub       a4, a3
                  sra         tp, t4, a0
                  mul         zero, zero, t1
                  c.li        s9, -1
                  divu        s3, s7, s8
                  c.slli      t5, 21
                  andi        a7, t0, -276
                  c.li        ra, -1
                  xor         a6, a4, s2
                  c.sub       a4, a3
                  c.lui       s4, 28
                  mulhu       zero, a1, sp
                  sltiu       t4, t3, -941
                  c.andi      a4, 15
                  sltu        zero, sp, s10
                  xor         zero, t6, s8
                  c.li        t0, 17
                  c.add       gp, s1
                  mulh        s2, t5, s10
                  mul         a1, t1, a1
                  c.sub       a4, a3
                  sub         t0, ra, t4
                  xori        t4, s4, -617
                  srli        a6, s7, 9
                  auipc       s6, 110874
                  ori         sp, t6, 395
                  sltiu       a2, s9, -219
                  sll         s2, a1, a0
                  slt         s6, t4, s0
                  mul         a4, a6, t0
                  c.add       ra, s5
                  srli        sp, a0, 25
                  xori        s3, t2, -888
                  c.addi4spn  a1, sp, 368
                  slli        a0, s5, 22
                  rem         sp, s1, t2
                  c.add       a7, s5
                  mulhsu      zero, t6, t6
                  c.nop
                  lui         s0, 150415
                  c.srli      a4, 30
                  sltiu       a5, s0, -1946
                  c.and       a4, a3
                  rem         zero, t6, s2
                  c.li        s1, 14
                  srl         a1, s7, t4
                  srl         s6, a5, s7
                  c.add       ra, s0
                  c.addi16sp  sp, 224
                  c.add       ra, s9
                  auipc       s10, 645958
                  srl         s4, s5, a0
                  addi        s8, s11, 1118
                  sra         s7, gp, a3
                  sll         t6, sp, s0
                  c.or        s0, a3
                  c.slli      tp, 2
                  mul         s9, s8, t6
                  rem         gp, t1, t1
                  andi        a4, a1, 196
                  rem         s2, s0, t5
                  or          t6, t4, ra
                  srai        gp, t2, 11
                  sltiu       s4, a2, -1031
                  sltiu       t6, s1, 1794
                  c.slli      tp, 14
                  nop
                  srli        s2, t3, 3
                  add         s8, a4, a2
                  and         t3, a5, s7
                  c.and       a4, a3
                  slt         ra, s5, a4
                  c.sub       a4, a3
                  c.sub       a4, s0
                  c.sub       a4, a3
                  c.srli      a4, 27
                  mulhu       a0, s5, t5
                  c.addi4spn  a5, sp, 640
                  and         t3, t6, s4
                  mulh        t6, s3, tp
                  mul         s3, s7, a5
                  c.andi      a4, 3
                  sltiu       s9, a2, 532
                  c.or        a4, a4
                  srli        t1, a0, 9
                  sltiu       t0, tp, -543
                  c.addi16sp  sp, 448
                  c.mv        s10, a3
                  xori        a0, s6, -1065
                  c.xor       a4, a0
                  sltu        zero, s4, zero
                  c.sub       a4, a5
                  div         s9, s11, a5
                  and         tp, s5, t0
                  slt         s6, s8, t0
                  srli        a1, gp, 11
                  c.add       gp, a0
                  ori         a4, a2, 224
                  c.addi16sp  sp, 416
                  mul         ra, t2, a5
                  xori        s3, a4, 1266
                  and         t4, s1, s3
                  c.sub       a4, a3
                  lui         gp, 84952
                  srli        s10, s6, 28
                  sltiu       zero, s10, -1595
                  rem         s10, s9, a0
                  c.srli      a4, 16
                  c.srli      a4, 7
                  c.and       a4, a1
                  c.and       a4, a3
                  mulh        s2, a1, a3
                  slli        t2, a7, 1
                  c.sub       a4, a3
                  srli        s2, s5, 6
                  lui         s7, 757547
                  c.slli      a7, 31
                  xori        s9, t3, 839
                  c.mv        s10, s11
                  mulh        t5, s6, a7
                  lui         s2, 285690
                  mulhu       zero, a0, s10
                  slt         s9, a7, t1
                  mulhsu      t3, t3, t5
                  slti        s8, t6, 1447
                  divu        s6, t6, a5
                  mulhsu      tp, s10, s1
                  nop
                  c.srai      a4, 18
                  sltu        zero, t2, a7
                  nop
                  mulh        s3, t1, s0
                  slli        sp, a4, 15
                  mulhu       a2, tp, sp
                  c.add       a7, s7
                  add         tp, s2, s10
                  c.addi      t2, -1
                  andi        s7, s4, 799
                  or          s1, a2, zero
                  c.sub       a4, a3
                  c.slli      s0, 1
                  mulhu       zero, a3, gp
                  or          t2, s5, s10
                  xori        t2, s9, 192
                  c.sub       a4, a3
                  sra         s3, s6, t6
                  c.addi      t4, 29
                  ori         s8, a7, 1149
                  mulhsu      s3, a1, t4
                  div         a4, gp, t2
                  c.sub       a2, a0
                  c.add       a2, s8
                  c.srai      a0, 10
                  c.mv        s1, ra
                  and         s3, a7, t1
                  c.andi      a4, -1
                  xori        tp, s0, 636
                  c.addi      s1, -1
                  mulhsu      s4, t1, tp
                  srli        s8, t6, 15
                  sll         s4, s2, t1
                  mulhu       t0, t5, sp
                  or          a4, t4, s7
                  srli        t1, s8, 10
                  slti        t4, gp, 715
                  addi        t2, a4, -1976
                  c.addi4spn  a4, sp, 576
                  div         tp, s3, s8
                  c.sub       a5, a3
                  srai        s1, sp, 0
                  c.mv        a7, s4
                  srli        tp, sp, 10
                  c.nop
                  add         a4, t4, tp
                  or          sp, s6, t5
                  auipc       a2, 108483
                  srli        a5, s11, 8
                  c.and       a4, s0
                  nop
                  addi        t3, s5, -1778
                  c.xor       a4, a3
                  slli        s10, s0, 16
                  andi        tp, tp, 753
                  lui         a1, 672211
                  sub         sp, s1, sp
                  c.or        a4, a3
                  mulhsu      t5, s2, s2
                  rem         s7, s10, s9
                  xori        t3, s5, -1805
                  c.lui       ra, 21
                  c.andi      s0, -1
                  sltiu       s6, s4, 200
                  xori        sp, s2, 1426
                  c.and       a4, a3
                  xori        s7, tp, 1528
                  ori         s6, s7, -1720
                  c.slli      a2, 25
                  srai        s0, t3, 7
                  lui         tp, 950302
                  lui         a4, 359545
                  slti        s2, s6, 1451
                  c.mv        t3, a3
                  sra         zero, a4, t3
                  c.and       s0, a3
                  c.and       a4, a3
                  addi        s1, gp, 1726
                  mul         zero, s3, t3
                  div         a1, t0, s9
                  div         s2, s1, s4
                  slti        sp, s0, 944
                  c.mv        sp, t3
                  mulhu       zero, t2, s11
                  c.xor       a4, a3
                  nop
                  divu        a2, zero, tp
                  lui         a4, 525803
                  sltiu       t2, t5, -1489
                  sra         s6, a1, ra
                  div         s10, t6, t6
                  c.srai      a0, 22
                  addi        gp, t3, 1094
                  c.li        ra, 27
                  xori        s7, s1, 126
                  xori        s1, zero, 771
                  andi        zero, s4, -1368
                  sub         zero, s7, s4
                  auipc       tp, 106329
                  c.addi      a1, -1
                  xor         s10, s8, a4
                  nop
                  lui         zero, 797144
                  div         tp, a1, a2
                  c.nop
                  and         zero, a3, t6
                  c.slli      s10, 11
                  mul         tp, t2, gp
                  c.li        ra, -1
                  c.and       a4, a3
                  sra         s1, s10, s9
                  c.and       a4, a3
                  c.andi      a4, -1
                  c.add       s4, t1
                  c.addi      t4, 24
                  sub         t6, gp, s10
                  c.mv        ra, tp
                  or          s4, a7, t4
                  rem         a4, tp, t4
                  mul         t4, a0, a2
                  c.srai      a0, 23
                  sll         t3, s5, a2
                  addi        gp, s2, -996
                  xor         a5, s8, sp
                  c.srli      a0, 11
                  rem         sp, s8, a1
                  xor         s4, t5, t4
                  c.andi      a4, 0
                  c.andi      a4, 26
                  and         s6, tp, zero
                  andi        s8, t1, -1227
                  c.addi16sp  sp, -16
                  c.srli      a4, 21
                  sub         t6, s6, gp
                  c.add       s7, t2
                  mulh        s3, s1, ra
                  c.srli      a4, 28
                  c.li        ra, 8
                  sltu        a5, s11, gp
                  c.xor       a4, a3
                  divu        t3, s5, ra
                  and         s4, a4, t4
                  c.or        a5, a3
                  c.li        s0, -1
                  slti        a5, t6, -1298
                  sltu        zero, t3, zero
                  andi        sp, s3, -1102
                  c.or        a4, a3
                  c.li        ra, 12
                  srl         s1, tp, a1
                  sltiu       s9, a2, 207
                  and         ra, t5, a6
                  andi        gp, s7, 762
                  div         gp, s4, s5
                  mul         gp, zero, zero
                  nop
                  xor         gp, s11, s4
                  xor         zero, s6, s0
                  c.srai      a4, 23
                  c.slli      t4, 16
                  and         s1, s2, a5
                  c.and       a2, a3
                  c.li        sp, -1
                  mulh        a4, a3, s0
                  c.nop
                  mulh        tp, t5, t1
                  or          tp, s4, s7
                  c.or        a4, s1
                  and         s10, t6, gp
                  and         a5, s11, s11
                  add         t3, a3, a6
                  c.li        t5, -1
                  c.andi      s0, -1
                  addi        t2, s10, 38
                  rem         a4, a6, s4
                  slli        zero, a3, 9
                  or          a1, s3, a0
                  mul         a6, s7, a1
                  c.andi      a4, -1
                  xor         a4, t2, gp
                  xori        zero, sp, 1060
                  sub         t4, t4, t3
                  div         a2, zero, a7
                  srl         s4, s2, tp
                  lui         zero, 115601
                  mulhsu      a7, t0, s0
                  c.xor       a4, a3
                  rem         t6, s3, a0
                  slt         a6, a4, s0
                  mulhsu      a7, a1, tp
                  addi        t6, gp, 979
                  nop
                  srl         zero, tp, s8
                  c.mv        t3, t0
                  xor         zero, s10, t4
                  mulhsu      a5, a7, s0
                  c.or        a4, a3
                  c.sub       a4, a5
                  c.and       a4, a3
                  c.sub       a4, a3
                  rem         t6, s8, a1
                  c.li        ra, 19
                  c.li        sp, 8
                  c.and       a0, a3
                  add         zero, a3, t2
                  c.addi      s2, 19
                  c.slli      t5, 13
                  sltu        t4, s3, a6
                  and         s9, a5, t0
                  and         t2, t4, a2
                  c.and       a4, s0
                  mulh        s3, s7, s6
                  auipc       t3, 274893
                  slli        s7, s6, 26
                  sub         a1, a5, s7
                  mulh        gp, s11, a4
                  and         s0, t0, a4
                  and         a4, s5, a6
                  c.addi16sp  sp, -16
                  xori        t5, t1, 502
                  c.nop
                  xor         ra, t1, t2
                  lui         a2, 830288
                  c.sub       a4, a3
                  divu        a4, s5, a0
                  add         a2, ra, gp
                  auipc       zero, 505986
                  srli        t6, s1, 23
                  srl         zero, s6, s9
                  c.and       a4, a3
                  c.addi      t2, -1
                  c.add       t5, s11
                  ori         zero, t5, 686
                  sltu        s0, a1, s7
                  sra         s0, s2, s7
                  mulhu       zero, t2, s10
                  div         s8, a3, a6
                  srli        s3, s4, 25
                  c.andi      a4, 15
                  or          zero, s7, s7
                  c.addi      sp, 10
                  c.nop
                  sub         zero, t3, a5
                  c.xor       a4, a3
                  mulhu       s7, t3, a0
                  add         tp, a4, s5
                  c.mv        s10, s11
                  c.addi16sp  sp, -16
                  c.lui       s4, 8
                  sll         ra, tp, s6
                  addi        s1, a6, -1771
                  ori         a6, s10, 1596
                  mulhu       a5, a4, a5
                  nop
                  slt         s1, a7, t6
                  sltu        s2, a6, s5
                  slti        a5, s9, 1031
                  add         zero, sp, t3
                  or          t3, t0, a2
                  slt         s3, t3, gp
                  c.and       a4, a3
                  and         zero, s8, a0
                  xori        a7, t0, 1905
                  sub         s10, a7, s1
                  slt         a0, a6, s1
                  slti        t3, a4, 1867
                  c.srai      a4, 8
                  c.addi      a7, 21
                  lui         a2, 212939
                  or          zero, s6, gp
                  sltu        sp, ra, a2
                  c.or        a1, a3
                  c.lui       s3, 2
                  c.slli      t4, 1
                  srai        s9, t2, 14
                  c.lui       t5, 13
                  sltu        a4, gp, s3
                  nop
                  c.add       s0, s8
                  sltiu       s9, t6, -1649
                  srl         t1, a7, s7
                  auipc       s1, 487401
                  sll         s7, a3, t2
                  c.addi4spn  a4, sp, 128
                  nop
                  sll         s2, zero, s10
                  sltiu       s8, s6, -1632
                  slt         s7, s7, s8
                  c.srai      a4, 20
                  rem         zero, s9, s5
                  andi        s7, t3, -1911
                  c.mv        s8, s7
                  mulh        a6, t2, a1
                  mulhsu      t6, t2, zero
                  c.addi      a5, -1
                  and         s9, t6, tp
                  add         s10, tp, gp
                  slt         t6, t2, s9
                  nop
                  c.srai      a4, 12
                  sll         ra, s1, s4
                  srai        sp, a3, 13
                  srai        a7, s9, 26
                  mulh        zero, s6, a3
                  c.add       a5, t3
                  sra         s4, zero, t0
                  c.srli      a0, 30
                  mul         t1, s0, s10
                  c.srai      a4, 10
                  slt         zero, t6, a7
                  srl         t6, s7, t3
                  xor         tp, s3, gp
                  sltiu       s0, a5, -332
                  auipc       s9, 55404
                  c.mv        ra, s3
                  srai        s7, s6, 16
                  slli        s7, t6, 18
                  c.xor       s0, a3
                  divu        gp, sp, a0
                  rem         a2, s9, t0
                  c.slli      t3, 15
                  sra         t0, a1, t5
                  nop
                  c.addi16sp  sp, -16
                  c.andi      a4, 7
                  andi        t1, sp, 854
                  nop
                  c.mv        a6, s8
                  lui         a0, 368632
                  c.addi      tp, -1
                  slti        a7, a7, 936
                  c.li        ra, 22
                  c.srai      a4, 23
                  slli        t3, s4, 5
                  sub         s10, s10, s2
                  c.lui       s3, 9
                  srai        t3, a7, 26
                  c.slli      t2, 6
                  srli        t5, a0, 13
                  and         sp, s8, a4
                  or          s4, s7, tp
                  srli        a5, a2, 0
                  c.nop
                  slli        s10, a4, 23
                  c.or        a4, a3
                  nop
                  divu        s3, t0, t6
                  mulh        sp, zero, a6
                  addi        zero, t0, -1248
                  sltiu       s7, s8, -1547
                  c.addi      s3, -1
                  nop
                  slti        t4, gp, -1219
                  div         s1, t0, s10
                  sltu        s7, s4, s6
                  c.add       s6, a3
                  slti        a2, s8, 128
                  c.nop
                  c.srli      a4, 10
                  mul         zero, s0, s9
                  addi        t0, a7, -784
                  slli        a4, s1, 13
                  nop
                  c.addi      t6, -1
                  addi        sp, t0, 1564
                  andi        s0, s11, -1865
                  and         t5, s8, s3
                  mulhsu      s0, s9, ra
                  slt         t1, s3, s5
                  auipc       t3, 967057
                  addi        a1, ra, -186
                  ori         zero, a3, -1533
                  c.li        s8, -1
                  c.add       a1, s1
                  c.xor       s0, a3
                  mul         zero, s6, t2
                  c.li        t0, -1
                  c.nop
                  c.or        a4, a3
                  sub         a2, s0, a0
                  c.srli      a4, 10
                  div         t6, a4, s4
                  sub         a1, s8, s1
                  ori         s0, s1, -1561
                  sub         t2, s10, s0
                  mulhsu      s4, sp, tp
                  sra         t1, zero, t2
                  sra         t3, ra, s1
                  c.or        a4, a3
                  srai        s9, s7, 16
                  div         s9, a5, a3
                  auipc       t0, 564920
                  c.srai      a4, 18
                  c.or        a4, a3
                  c.and       a4, a3
                  lui         a6, 564089
                  slt         a0, t5, t6
                  addi        a7, s3, -1465
                  c.srli      a4, 5
                  or          t5, t6, s0
                  nop
                  and         t5, t1, a3
                  add         t6, s10, t1
                  xor         ra, t6, s11
                  c.addi4spn  a4, sp, 576
                  c.addi4spn  a4, sp, 896
                  or          a1, s7, s7
                  c.lui       a1, 31
                  c.lui       s0, 6
                  c.addi4spn  a4, sp, 704
                  rem         s9, a4, zero
                  c.xor       a4, a3
                  c.addi16sp  sp, -16
                  xor         t0, s11, s7
                  andi        a7, s0, -143
                  c.or        a4, a1
                  c.add       s2, s4
                  c.mv        t0, t4
                  sub         sp, sp, a6
                  sltiu       t1, s8, -1605
                  c.sub       a4, a3
                  slt         s4, s5, t4
                  add         a7, s5, zero
                  c.srai      a4, 19
                  lui         t0, 1029653
                  c.lui       tp, 5
                  c.addi16sp  sp, -16
                  c.add       t2, t1
                  rem         tp, s7, s2
                  srli        gp, a3, 21
                  c.or        a4, a2
                  slli        tp, t4, 5
                  srai        zero, zero, 18
                  andi        t1, s11, 197
                  mulhu       t2, t5, s2
                  c.slli      t5, 2
                  slt         zero, s8, a7
                  c.addi      s9, 6
                  mulhsu      gp, s8, a1
                  sltiu       ra, s1, -1988
                  mulhsu      t4, s2, a4
                  c.add       t1, a6
                  srli        s9, s1, 16
                  c.addi16sp  sp, -16
                  and         t6, s2, tp
                  c.add       t6, s11
                  sra         s1, s5, s7
                  rem         ra, sp, s4
                  c.sub       a4, a0
                  c.or        a4, a3
                  sltiu       t4, s7, -1468
                  slli        a6, ra, 9
                  or          s8, s5, s3
                  divu        zero, t6, t3
                  slti        a7, s5, 1959
                  mulh        t1, s2, s1
                  rem         t5, s0, s11
                  nop
                  andi        a5, t5, -1723
                  srl         s2, a7, t0
                  ori         zero, s8, -680
                  nop
                  c.li        t5, 18
                  divu        s4, s1, sp
                  c.srai      a4, 27
                  slli        s9, s5, 30
                  lui         s1, 1026321
                  sub         s10, s6, a7
                  addi        a1, a1, -1969
                  srai        s7, gp, 31
                  c.xor       a4, a2
                  srl         s7, a5, s0
                  and         s6, s6, a6
                  mul         a7, tp, t4
                  c.li        s8, 6
                  c.addi      s10, -1
                  or          s9, t5, t4
                  srli        sp, t4, 22
                  c.and       a5, a3
                  xor         t2, a7, t0
                  slti        t5, t2, 993
                  mulh        zero, a7, s3
                  c.srli      a4, 7
                  ori         t5, a7, -418
                  slti        a4, zero, -1817
                  divu        a6, a1, t2
                  add         s1, s5, a0
                  c.addi16sp  sp, 192
                  c.lui       ra, 1
                  slti        a7, s3, -1058
                  nop
                  slti        s3, t5, -564
                  slli        s4, t4, 1
                  sltiu       a4, s5, 209
                  c.addi4spn  a4, sp, 832
                  div         t2, s5, t0
                  sub         gp, a7, s7
                  ori         t5, t4, 2019
                  sltu        zero, a4, a5
                  nop
                  srl         a5, s11, a2
                  slti        a4, gp, -1174
                  slti        s6, t0, -1648
                  mul         gp, t6, s10
                  c.nop
                  c.sub       a4, a3
                  srli        zero, a3, 22
                  sub         tp, a5, a2
                  div         a4, a6, ra
                  c.li        s1, -1
                  srl         zero, s10, t2
                  slt         gp, a0, a4
                  andi        s10, a5, 387
                  xori        a6, a6, 1095
                  c.li        t0, 22
                  c.li        a7, 31
                  add         s6, s0, s11
                  mul         t6, t5, ra
                  slt         s7, zero, sp
                  sll         s6, a7, t5
                  c.addi      s6, 2
                  slti        s3, a1, 395
                  c.sub       a4, a3
                  c.sub       a0, a3
                  srai        tp, t6, 7
                  c.addi      a2, 7
                  mulhsu      gp, t4, t2
                  c.add       a4, t5
                  sll         t6, t1, s5
                  slti        a6, s1, -1127
                  addi        t5, tp, -1927
                  c.mv        s1, s11
                  mulh        t4, t3, t3
                  c.xor       a4, a3
                  sub         s1, s8, ra
                  c.srai      a4, 4
                  rem         s2, s9, s5
                  mulh        a1, a7, t2
                  c.sub       a4, a4
                  or          s10, s4, t4
                  c.srai      a4, 10
                  mulh        zero, s9, sp
                  srl         tp, s6, a7
                  c.li        s9, 30
                  c.addi16sp  sp, 16
                  sra         t5, a0, s7
                  andi        s7, a7, -994
                  or          t2, s10, a7
                  sltiu       ra, tp, -412
                  slli        s1, s1, 2
                  c.addi4spn  a4, sp, 64
                  slti        zero, a6, -419
                  and         s9, t2, s0
                  nop
                  slti        ra, a7, 1355
                  sltu        s6, s3, s2
                  c.slli      t0, 24
                  div         ra, s5, gp
                  sltiu       zero, s4, 550
                  sra         t4, s9, sp
                  addi        t2, s4, 990
                  c.add       gp, s6
                  sltiu       s8, a4, -324
                  mulhu       a4, s2, a0
                  srl         s7, ra, gp
                  c.andi      a4, 14
                  c.xor       a4, a3
                  and         a5, t4, t1
                  c.andi      a4, 26
                  sltu        a4, a2, ra
                  lui         s3, 40251
                  div         ra, sp, a7
                  srl         s2, a3, s10
                  nop
                  div         s6, gp, a3
                  c.sub       a4, a3
                  xor         a4, t5, t3
                  addi        s1, a6, 1431
                  mul         s0, t1, tp
                  mulhsu      s9, s10, t6
                  c.lui       ra, 21
                  c.srai      a4, 21
                  andi        zero, a4, 1699
                  c.slli      s1, 13
                  mulhsu      zero, t1, t1
                  mul         ra, s11, s6
                  c.addi      s9, 28
                  slti        s7, a2, -627
                  c.or        a4, a3
                  sltu        a5, zero, a4
                  c.or        a4, a3
                  li         t6, 0x1 #start riscv_int_numeric_corner_stream_7
                  li         t5, 0x1
                  li         s8, 0x3fb2c7bf
                  li         a4, 0x0
                  li         t4, 0x0
                  li         s10, 0x1
                  li         t3, 0x1
                  li         a5, 0x0
                  li         t1, 0x3f6aa949
                  li         s6, 0x1
                  c.li        ra, -1
                  c.nop
                  divu        a4, s10, s8
                  addi        a7, ra, -1464
                  mulh        s3, t6, a1
                  mulhsu      zero, a3, t2
                  lui         a6, 959247
                  c.addi      s3, 25
                  c.mv        a0, a5
                  c.addi4spn  a4, sp, 576
                  mul         a7, a2, s0
                  auipc       s7, 833523
                  sub         s1, s1, s3
                  mulh        a1, a1, a4
                  mulhsu      s8, t2, a5 #end riscv_int_numeric_corner_stream_7
                  div         zero, t4, a6
                  sll         t0, a2, t2
                  c.xor       a4, a3
                  addi        s2, t1, 1474
                  c.addi4spn  a2, sp, 368
                  c.addi4spn  s0, sp, 64
                  c.addi      tp, 31
                  slli        t6, t3, 9
                  slli        zero, s1, 9
                  xori        s4, t3, 1651
                  mulhu       t5, t1, a3
                  sltu        s1, ra, ra
                  c.add       t2, t3
                  add         a4, t1, s3
                  rem         s3, s9, tp
                  c.lui       gp, 27
                  add         s2, t3, s8
                  c.slli      t3, 25
                  auipc       t2, 893450
                  c.addi      s2, 9
                  auipc       s2, 470619
                  c.addi16sp  sp, -16
                  srli        s4, s4, 19
                  add         sp, sp, t6
                  mulhsu      ra, t3, t4
                  mul         t2, t4, t3
                  c.sub       a1, a3
                  nop
                  c.addi16sp  sp, -16
                  c.andi      a4, -1
                  xor         s6, a4, gp
                  c.srli      a4, 3
                  addi        s0, a4, -1130
                  c.nop
                  xori        zero, t2, -1047
                  sltu        s8, a5, gp
                  srli        t5, a0, 24
                  xor         a4, a6, a0
                  sltu        t6, t0, a1
                  c.srli      s0, 12
                  addi        s2, s3, 1417
                  c.srai      a4, 12
                  or          zero, t6, t0
                  slt         s6, a3, s10
                  mulhu       t3, s6, s6
                  add         t6, s6, t6
                  divu        s4, a1, t6
                  c.slli      t0, 29
                  mul         ra, s6, a1
                  sll         s10, tp, s1
                  c.addi4spn  a4, sp, 176
                  c.srai      a4, 21
                  c.addi16sp  sp, -16
                  c.addi      s6, 11
                  mulh        s10, t5, ra
                  ori         a0, s3, -1986
                  c.and       a4, a3
                  mul         t0, a3, s1
                  c.slli      ra, 1
                  mulh        s3, a0, ra
                  c.srai      a4, 31
                  c.srai      a4, 20
                  mulh        s7, a2, a4
                  c.and       a1, a3
                  c.or        a4, a3
                  c.sub       a4, a3
                  divu        s0, s10, s2
                  c.slli      a0, 18
                  and         s2, s4, gp
                  sub         s9, t0, t6
                  auipc       s3, 755127
                  c.sub       a4, a3
                  sltu        a5, t0, t4
                  mulh        s9, s0, s11
                  c.sub       a4, a3
                  andi        gp, t3, 337
                  mulh        a4, t2, s1
                  c.sub       a4, a3
                  slli        zero, t4, 0
                  c.sub       a4, a3
                  c.or        a4, a3
                  sra         t3, s2, s7
                  nop
                  sltu        s0, ra, sp
                  mul         a5, s11, s10
                  c.li        a0, -1
                  c.slli      s10, 24
                  c.srli      a4, 15
                  c.add       s9, s1
                  or          tp, s3, t0
                  c.addi16sp  sp, -16
                  c.sub       a0, a3
                  addi        s7, a6, -440
                  c.addi      ra, 18
                  c.li        s8, 13
                  c.sub       a4, s0
                  c.andi      a4, -1
                  slli        sp, t0, 18
                  mulh        t1, s3, t6
                  sub         s2, t3, s8
                  slt         zero, a7, t6
                  sltu        t4, s0, a6
                  c.and       a4, a3
                  c.addi16sp  sp, 176
                  nop
                  c.srai      a4, 1
                  rem         t6, s0, t4
                  lui         a7, 727705
                  sltu        s3, t3, zero
                  srli        zero, a0, 22
                  c.add       s6, s10
                  mul         s6, s3, t4
                  slti        t4, s9, 1630
                  sltiu       s8, s5, 806
                  sltiu       s2, s4, 1608
                  sub         s4, a1, t5
                  xori        s10, s0, 306
                  c.xor       s1, a3
                  c.addi      t6, -1
                  c.slli      t3, 12
                  c.sub       a4, a3
                  xori        a6, t2, 432
                  andi        zero, s11, -757
                  c.and       a4, a3
                  c.or        a4, a3
                  c.srai      a4, 17
                  mulhu       a0, s3, s2
                  addi        t6, t5, 1673
                  sltiu       t0, a4, -1906
                  c.xor       a4, a3
                  c.addi4spn  a4, sp, 464
                  sltiu       t2, gp, 1791
                  srai        a4, a3, 30
                  c.li        ra, 16
                  mul         zero, s3, t3
                  sltu        sp, s6, gp
                  nop
                  c.andi      a4, 12
                  c.add       s8, a5
                  c.lui       gp, 1
                  c.slli      ra, 30
                  c.nop
                  slli        s6, a2, 11
                  c.and       a4, a3
                  auipc       s1, 701191
                  sltiu       t1, t5, 1613
                  xor         zero, s4, s8
                  lui         zero, 774186
                  mulhu       s6, s6, tp
                  div         t1, s10, t1
                  c.srai      a4, 12
                  sub         s0, t3, t5
                  divu        s0, s10, s1
                  c.srai      a4, 19
                  c.addi      a2, 6
                  divu        t0, s5, sp
                  sra         a0, s2, s9
                  mulhsu      tp, a3, a1
                  xori        s9, s1, 170
                  divu        s8, a5, a2
                  c.lui       t2, 21
                  c.addi4spn  a4, sp, 320
                  or          s8, t3, t1
                  c.add       s4, a0
                  addi        s3, s2, 1444
                  or          zero, a5, s0
                  c.andi      a4, 31
                  slt         t3, s9, t6
                  andi        a6, s7, 2008
                  and         t6, s6, s0
                  c.addi4spn  a1, sp, 976
                  c.lui       s2, 13
                  c.or        a4, a3
                  c.add       s7, t1
                  li         s2, 0x1 #start riscv_int_numeric_corner_stream_3
                  li         t6, 0x14de0d0c
                  li         t5, 0x1cfe823a
                  li         s6, 0x0
                  li         t4, 0x0
                  li         a4, 0x7b69f286
                  li         s7, 0x0
                  li         s10, 0x0
                  li         t1, 0x6bdbcb13
                  li         t2, 0x0
                  c.lui       ra, 26
                  c.sub       a4, a3
                  c.li        s2, 27
                  divu        t0, a2, s3
                  mulhsu      s10, a6, t0
                  c.addi      ra, 20
                  mulhsu      sp, a6, zero
                  mulh        s2, t0, a2
                  nop
                  auipc       t6, 264934
                  nop
                  auipc       a0, 297551
                  c.addi4spn  a2, sp, 448
                  c.addi16sp  sp, 160
                  c.mv        s0, s9
                  c.li        ra, 7
                  c.add       a7, sp
                  lui         sp, 232794
                  mul         zero, s1, sp #end riscv_int_numeric_corner_stream_3
                  slt         t0, s4, tp
                  c.addi4spn  a4, sp, 576
                  c.li        s10, -1
                  mul         s6, t0, t2
                  c.xor       a4, a3
                  c.addi16sp  sp, -16
                  ori         s4, tp, 1768
                  c.add       s7, s1
                  slli        a0, t1, 21
                  c.addi4spn  a4, sp, 384
                  c.mv        a7, gp
                  c.mv        ra, a2
                  mulhsu      tp, a0, a1
                  c.li        a5, -1
                  slti        s4, t2, 1150
                  c.addi      t5, -1
                  sra         t5, s8, s4
                  sll         a2, s6, t4
                  rem         t1, tp, s8
                  auipc       zero, 1021446
                  and         t1, s6, s2
                  c.li        a2, 21
                  c.addi4spn  a4, sp, 128
                  c.lui       a6, 25
                  sltu        zero, a4, t0
                  c.srli      a4, 27
                  slli        a4, s2, 21
                  nop
                  addi        t3, sp, -51
                  divu        zero, s0, s8
                  rem         zero, a5, a2
                  c.addi16sp  sp, 400
                  mulh        tp, s4, ra
                  sll         a6, gp, s8
                  lui         t6, 655450
                  lui         t6, 333994
                  c.srli      a4, 2
                  c.xor       a4, s0
                  c.lui       ra, 19
                  c.mv        t5, s6
                  c.addi      t1, -1
                  or          s4, t3, ra
                  addi        t6, a3, -169
                  c.slli      s9, 28
                  c.addi      t1, 30
                  sub         s6, s9, t4
                  xor         t0, a1, a1
                  andi        a6, a5, -608
                  xor         t5, a2, s4
                  mulhsu      t4, s6, t0
                  mul         a6, s10, s0
                  c.addi16sp  sp, 368
                  slti        t6, a3, -1091
                  divu        a7, t6, s4
                  sra         s0, s3, t1
                  rem         s7, a3, t3
                  auipc       zero, 308678
                  c.and       a4, a5
                  c.addi16sp  sp, 256
                  xori        a5, a2, 462
                  c.srai      a4, 17
                  srl         t6, s7, s8
                  auipc       t1, 854726
                  and         a7, s4, s4
                  mulhsu      a0, t2, a7
                  c.add       gp, s10
                  slli        a5, s1, 9
                  srli        t2, zero, 1
                  sll         t5, t5, a4
                  c.slli      tp, 4
                  la x21, test_done
                  jalr x0, x21, 0
test_done:        
                  li gp, 1
                  ecall
write_tohost:     
                  sw gp, tohost, t5

_exit:            
                  j write_tohost

instr_end:        
                  nop

.section .data
.align 6; .global tohost; tohost: .dword 0;
.align 6; .global fromhost; fromhost: .dword 0;
.section .user_stack,"aw",@progbits;
.align 2
user_stack_start:
.rept 4999
.4byte 0x0
.endr
user_stack_end:
.4byte 0x0
.align 2
kernel_instr_start:
.text
.align 2
mtvec_handler:    
                  csrrw x27, 0x340, x27
                  add x27, x13, zero
                  1: addi x27, x27, -124
                  sw x1, 4(x27)
                  sw x2, 8(x27)
                  sw x3, 12(x27)
                  sw x4, 16(x27)
                  sw x5, 20(x27)
                  sw x6, 24(x27)
                  sw x7, 28(x27)
                  sw x8, 32(x27)
                  sw x9, 36(x27)
                  sw x10, 40(x27)
                  sw x11, 44(x27)
                  sw x12, 48(x27)
                  sw x13, 52(x27)
                  sw x14, 56(x27)
                  sw x15, 60(x27)
                  sw x16, 64(x27)
                  sw x17, 68(x27)
                  sw x18, 72(x27)
                  sw x19, 76(x27)
                  sw x20, 80(x27)
                  sw x21, 84(x27)
                  sw x22, 88(x27)
                  sw x23, 92(x27)
                  sw x24, 96(x27)
                  sw x25, 100(x27)
                  sw x26, 104(x27)
                  sw x27, 108(x27)
                  sw x28, 112(x27)
                  sw x29, 116(x27)
                  sw x30, 120(x27)
                  sw x31, 124(x27)
                  csrr x31, 0x300 # MSTATUS
                  csrr x31, 0x342 # MCAUSE
                  srli x31, x31, 31
                  bne x31, x0, mmode_intr_handler

mmode_exception_handler:
                  csrr x31, 0x341 # MEPC
                  csrr x31, 0x342 # MCAUSE
                  li x20, 0xb # ECALL_MMODE
                  beq x31, x20, ecall_handler
                  li x20, 0x2 # ILLEGAL_INSTRUCTION
                  beq x31, x20, illegal_instr_handler
                  csrr x20, 0x343 # MTVAL
                  1: la x21, test_done
                  jalr x1, x21, 0

ecall_handler:    
                  la x31, _start
                  sw x0, 0(x31)
                  sw x1, 4(x31)
                  sw x2, 8(x31)
                  sw x3, 12(x31)
                  sw x4, 16(x31)
                  sw x5, 20(x31)
                  sw x6, 24(x31)
                  sw x7, 28(x31)
                  sw x8, 32(x31)
                  sw x9, 36(x31)
                  sw x10, 40(x31)
                  sw x11, 44(x31)
                  sw x12, 48(x31)
                  sw x13, 52(x31)
                  sw x14, 56(x31)
                  sw x15, 60(x31)
                  sw x16, 64(x31)
                  sw x17, 68(x31)
                  sw x18, 72(x31)
                  sw x19, 76(x31)
                  sw x20, 80(x31)
                  sw x21, 84(x31)
                  sw x22, 88(x31)
                  sw x23, 92(x31)
                  sw x24, 96(x31)
                  sw x25, 100(x31)
                  sw x26, 104(x31)
                  sw x27, 108(x31)
                  sw x28, 112(x31)
                  sw x29, 116(x31)
                  sw x30, 120(x31)
                  sw x31, 124(x31)
                  la x21, write_tohost
                  jalr x0, x21, 0

illegal_instr_handler:
                  csrr  x31, 0x341
                  addi  x31, x31, 4
                  csrw  0x341, x31
                  lw x1, 4(x27)
                  lw x2, 8(x27)
                  lw x3, 12(x27)
                  lw x4, 16(x27)
                  lw x5, 20(x27)
                  lw x6, 24(x27)
                  lw x7, 28(x27)
                  lw x8, 32(x27)
                  lw x9, 36(x27)
                  lw x10, 40(x27)
                  lw x11, 44(x27)
                  lw x12, 48(x27)
                  lw x13, 52(x27)
                  lw x14, 56(x27)
                  lw x15, 60(x27)
                  lw x16, 64(x27)
                  lw x17, 68(x27)
                  lw x18, 72(x27)
                  lw x19, 76(x27)
                  lw x20, 80(x27)
                  lw x21, 84(x27)
                  lw x22, 88(x27)
                  lw x23, 92(x27)
                  lw x24, 96(x27)
                  lw x25, 100(x27)
                  lw x26, 104(x27)
                  lw x27, 108(x27)
                  lw x28, 112(x27)
                  lw x29, 116(x27)
                  lw x30, 120(x27)
                  lw x31, 124(x27)
                  addi x27, x27, 124
                  add x13, x27, zero
                  csrrw x27, 0x340, x27
                  mret

pt_fault_handler: 

.align 2
mmode_intr_handler:
                  csrr  x31, 0x300 # MSTATUS;
                  csrr  x31, 0x304 # MIE;
                  csrr  x31, 0x344 # MIP;
                  csrrc x31, 0x344, x31 # MIP;
                  lw x1, 4(x27)
                  lw x2, 8(x27)
                  lw x3, 12(x27)
                  lw x4, 16(x27)
                  lw x5, 20(x27)
                  lw x6, 24(x27)
                  lw x7, 28(x27)
                  lw x8, 32(x27)
                  lw x9, 36(x27)
                  lw x10, 40(x27)
                  lw x11, 44(x27)
                  lw x12, 48(x27)
                  lw x13, 52(x27)
                  lw x14, 56(x27)
                  lw x15, 60(x27)
                  lw x16, 64(x27)
                  lw x17, 68(x27)
                  lw x18, 72(x27)
                  lw x19, 76(x27)
                  lw x20, 80(x27)
                  lw x21, 84(x27)
                  lw x22, 88(x27)
                  lw x23, 92(x27)
                  lw x24, 96(x27)
                  lw x25, 100(x27)
                  lw x26, 104(x27)
                  lw x27, 108(x27)
                  lw x28, 112(x27)
                  lw x29, 116(x27)
                  lw x30, 120(x27)
                  lw x31, 124(x27)
                  addi x27, x27, 124
                  add x13, x27, zero
                  csrrw x27, 0x340, x27
                  mret;

kernel_instr_end: nop
.align 2
kernel_data_start:
.section .kernel_stack,"aw",@progbits;
.align 2
kernel_stack_start:
.rept 4999
.4byte 0x0
.endr
kernel_stack_end:
.4byte 0x0
