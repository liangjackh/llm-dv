.include "user_define.h"
.globl _start
.section .text
_start:           
                  .include "user_init.s"
                  csrr x5, 0xf14
                  li x6, 0
                  beq x5, x6, 0f

0: la x30, h0_start
jalr x0, x30, 0
h0_start:
                  li x4, 0x40001104
                  csrw 0x301, x4
kernel_sp:        
                  la x29, kernel_stack_end

trap_vec_init:    
                  la x4, mtvec_handler
                  ori x4, x4, 1
                  csrw 0x305, x4 # MTVEC

mepc_setup:       
                  la x4, init
                  csrw 0x341, x4

init_machine_mode:
                  li x4, 0x1800
                  csrw 0x300, x4 # MSTATUS
                  li x4, 0x0
                  csrw 0x304, x4 # MIE
                  mret
init:             
                  li x0, 0xd
                  li x1, 0xed0f4d87
                  li x2, 0xb
                  li x3, 0x80000000
                  li x4, 0x0
                  li x5, 0x1f07ac87
                  li x6, 0x80000000
                  li x7, 0x80000000
                  li x8, 0xf50cbab0
                  li x9, 0xf5491be0
                  li x10, 0x46049aee
                  li x11, 0x80000000
                  li x12, 0x9
                  li x13, 0xa
                  li x14, 0xfe1049e2
                  li x15, 0x34b30c17
                  li x16, 0x80000000
                  li x17, 0x0
                  li x18, 0xa
                  li x19, 0xc
                  li x20, 0x6
                  li x21, 0x80000000
                  li x22, 0xfb141c29
                  li x23, 0x80000000
                  li x24, 0x2
                  li x26, 0x80000000
                  li x27, 0xf39a091f
                  li x28, 0x0
                  li x30, 0xf0d149cd
                  li x31, 0x18b98849
                  la x25, user_stack_end
main:             add         s6, s2, s11 #start riscv_llm_alu_raw_stream_1
                  sub         a4, s6, s1
                  sub         t3, a4, a6
                  add         a3, t3, t1
                  sub         gp, a3, t6
                  xor         a6, gp, a3 #end riscv_llm_alu_raw_stream_1
                  xori        s1, tp, 1178
                  xor         a0, t5, t1
                  and         a2, s11, a0
                  slt         s11, s10, ra
                  addi        t2, t0, -226
                  sltu        t0, ra, s3
                  c.sub       a3, a3
                  c.mv        a6, t3
                  sub         a7, s11, s11
                  slti        s8, s2, -1005
                  div         a7, t1, a1
                  bgeu        a5, s8, 28f
                  beq         t2, a1, 17f
                  c.slli      ra, 21
                  addi        s1, a0, -2019
                  sltu        a3, t6, gp
                  c.andi      a5, 2
                  and         t0, sp, gp #start riscv_llm_alu_raw_stream_0
                  and         sp, t0, s7
                  add         s5, sp, t6
                  or          t0, s5, a1
                  sub         s0, t0, gp
                  add         s11, s0, s8
                  or          t0, s11, t1
                  or          s5, t0, t2 #end riscv_llm_alu_raw_stream_0
17:               mulhsu      zero, a1, s8
                  c.and       a3, a0
                  c.or        a3, a3
                  slti        a6, s5, 1056
                  slli        zero, s2, 28
                  c.srli      a3, 19
                  c.nop
                  or          s5, a0, a6
                  slli        sp, a7, 14
                  lui         a5, 209027
                  xori        t0, a7, 1519
28:               bge         a1, s11, 34f
                  c.slli      s2, 1
                  c.addi      s7, 23
                  and         s1, a2, a0
                  mul         s8, s0, zero
                  c.slli      t2, 6
34:               or          a5, t5, s1
                  lui         s5, 966315
                  auipc       a4, 156105
                  or          a5, s8, a7
                  c.sub       a3, a3
                  srl         t0, a3, t3
                  c.bnez      a3, 55f
                  auipc       gp, 777662
                  slli        zero, ra, 30
                  c.slli      a6, 16
                  mul         s1, s2, a7
                  c.srli      a5, 25
                  mulh        s5, a0, a2
                  blt         tp, a4, 66f
                  c.add       s10, gp
                  sub         t0, t5, a7
                  mul         zero, a4, s1
                  slli        s2, s4, 20
                  sub         a5, a5, t2
                  xor         s1, a3, gp
                  add         gp, a7, a0
55:               c.bnez      a3, 62f
                  addi        zero, s1, -395
                  divu        t0, t5, a6
                  c.mv        s8, a1
                  c.xor       a3, a3
                  mulh        a2, a7, tp
                  c.srli      a3, 22
62:               c.addi      a1, -1
                  c.sub       s1, a3
                  c.li        s0, -1
                  c.lui       s10, 20
66:               sltu        t0, t4, a6
                  c.add       ra, ra
                  c.mv        s1, t1
                  rem         t0, s7, a0
                  mulhsu      s8, s5, sp
                  blt         a7, t4, 86f
                  lui         a2, 854986
                  slli        t3, sp, 7
                  slt         ra, t3, s4
                  c.beqz      a3, 95f
                  c.slli      s2, 1
                  c.add       a2, tp
                  auipc       a6, 816401
                  addi        ra, a2, 916
                  c.addi16sp  sp, 352
                  rem         t6, s9, s1
                  c.slli      s1, 14
                  andi        a0, t2, -139
                  lui         t2, 12487
                  mulh        s4, s0, a6
86:               sra         a5, tp, t0
                  div         t2, t5, a5
                  c.mv        s6, s3
                  mulhsu      s1, a2, s5
                  c.addi16sp  sp, 224
                  srai        a3, t6, 26
                  mulh        t2, s11, s1
                  c.srli      a3, 9
                  srl         ra, s10, t3
95:               andi        a0, s9, -1240
                  div         s11, s1, t1
                  c.li        ra, 26
                  sra         zero, s4, s6
                  mul         zero, s5, a7
                  c.li        a7, 8
                  beq         t0, s0, 107f
                  bne         sp, s7, 111f
                  bge         tp, t5, 112f
                  andi        t6, a7, 1241
                  divu        t6, a5, s3
                  sltu        zero, s6, s5
107:              div         s11, s6, s3
                  or          a4, a4, zero
                  slt         zero, a5, s9
                  mulh        t2, s6, gp
111:              slti        s10, tp, -1666
112:              lui         zero, 621392
                  mulh        t3, s6, t1
                  c.or        a3, a3
                  c.addi16sp  sp, -16
                  c.and       a2, a3
                  mulhsu      s4, s8, s2
                  bgeu        t2, s11, 132f
                  c.lui       s10, 5
                  lui         ra, 217956
                  sra         a0, s9, t3
                  c.li        ra, 4
                  xor         ra, ra, a3
                  bltu        s9, t2, 132f
                  c.slli      t2, 12
                  and         a1, t0, t6
                  sltiu       a2, s5, 155
                  mulh        s6, s10, a1
                  c.li        gp, 28
                  c.andi      a3, 0
                  c.sub       a3, a3
132:              c.li        ra, -1
                  la x30, test_done
                  jalr x0, x30, 0
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
.section .region_0,"aw",@progbits;
region_0:
.word 0xb546bd15, 0x43c63938, 0xd0b2dc98, 0x378eec12, 0x0f897bfb, 0x86c7f8c1, 0xbff17061, 0xe5df4cb2
.word 0x934dfeb4, 0xd4dab731, 0x1170f065, 0x3969c712, 0x81663724, 0x2005cb8d, 0xae5c7c7b, 0xcdb8849c
.word 0x7d54e50e, 0x799103cc, 0xd81f9881, 0x1c81fb98, 0xa6b50007, 0x93d86a50, 0xfe9f68b7, 0x714fc262
.word 0x7ef0aaa5, 0x6a7c4bc1, 0x3e33752a, 0x50aeb2c7, 0xe240b84e, 0x153732de, 0x87906c6b, 0x86b81578
.word 0xceb9ac9e, 0x332c52e9, 0x30cb89da, 0x833b9718, 0x1942946a, 0xc0d2550f, 0x98ea7289, 0x6136a549
.word 0x4dfb6985, 0x9922429c, 0x23b3dd41, 0x6e51eb06, 0x4a068b9d, 0xbc0b637d, 0x3eeada75, 0x5a74288b
.word 0x1593dcac, 0xb3c564d3, 0xaa9e4e77, 0xaf592515, 0xb2a2040c, 0x91c286df, 0xa861bb17, 0x8cabe1a4
.word 0x4fb8cc53, 0x6ed576a8, 0x8fd3de88, 0x18d2c5b0, 0x784dc32d, 0xb6310dc5, 0xa11384d5, 0x70dd34e9
.word 0xe5933951, 0xc02edeb9, 0x6dde884d, 0x918407ab, 0x3d02e408, 0x245c0298, 0x2646d320, 0x1dcf4eed
.word 0x4dc3aa3d, 0x62dca34e, 0xec681024, 0x925c4587, 0xfdb9c0f0, 0x161c3b89, 0x0d91df3a, 0xf2ba6cd7
.word 0x5a36faf9, 0xce98904c, 0x97b7d75e, 0x50032b3d, 0x6106e713, 0xb2f59f5b, 0x5f9e873f, 0x4f75f4af
.word 0x772baff9, 0xe5f74347, 0x2a9863ca, 0x9c393553, 0x6e36a515, 0x12e0da40, 0x9e183f2f, 0xbe3a3469
.word 0x133027e9, 0x734c1136, 0x514da463, 0x8d9b1efd, 0xf9b1485d, 0x8adcafc0, 0x1c2933c9, 0xd04a8cf2
.word 0xe4498f83, 0x8a4f8fca, 0xab989aeb, 0x9d4d3a90, 0x89bbb288, 0x43b0f3f8, 0xc87055c6, 0x420d1672
.word 0x6b7e59d3, 0xc58bf6ef, 0xd10a7a43, 0xd65d27fa, 0x6cdb6921, 0x6d405c0c, 0xacb0cc62, 0x81cf623b
.word 0x1c9346e7, 0x196fc096, 0x4524ef2f, 0x2719dafa, 0x2c70cc8d, 0xc92d07e9, 0x738893ed, 0x03403dca
.word 0x43a5b085, 0x92103930, 0xf8d05625, 0x02de4762, 0xb31216b3, 0xd8f7e9b3, 0x532befba, 0xf7b62825
.word 0x48785472, 0xf9b3bac6, 0x246eb954, 0x12712838, 0xb2dd6e51, 0x11cccd25, 0xae856bc0, 0x4b6af987
.word 0xde0241e5, 0x1d755b51, 0x1dcaf739, 0xd50131d5, 0x416e781a, 0x00d9bc28, 0xd8a43839, 0x3188f8b4
.word 0xfe24e0b0, 0xf49b541a, 0x8dfe1b12, 0x25c065ba, 0x0b7e594b, 0xee8a727a, 0xe464a5d7, 0x8e539f16
.word 0xa3711552, 0x8503401f, 0x7023526a, 0xf45d0371, 0x45b0b4bc, 0x1b48fae1, 0xac08619f, 0x592aa774
.word 0x89d3e155, 0xe2669275, 0x18102491, 0x0323dc5c, 0x91e37f88, 0x30e2b2cc, 0x729d4eb3, 0x95feaf74
.word 0x69b85cf5, 0x55af133e, 0x87ac43ce, 0x10123cd8, 0x4d6863f6, 0x88e2c6bc, 0x402eb9bd, 0x44264960
.word 0x0400f9b6, 0xbd2fd43a, 0x14c1c50e, 0x1742c296, 0x26c82f17, 0x99c3979f, 0xc27187c2, 0x1584dab9
.word 0x75cb8442, 0x1250a068, 0xe2403170, 0x426795b2, 0xb2e38b0e, 0xa5d8b30b, 0x9da240ab, 0x2a0378f2
.word 0x2be8a642, 0xd7cf10b5, 0x2c55fc62, 0x4dd5c9d0, 0x9619df21, 0x1243570e, 0x899b9f4f, 0xdd8bc902
.word 0x329b0d26, 0xb8af95eb, 0x7a8e1904, 0x3206e242, 0x4b581242, 0xc354d7ef, 0x528d7af4, 0x4ca4268d
.word 0x59a37a3a, 0xebc06d62, 0x9a3eb803, 0xca1477d1, 0xae7b1a4a, 0x9d954e40, 0x5eb495ea, 0x135ae73d
.word 0xec6df99c, 0x13c592fe, 0x8216a6f9, 0x78c7a5d3, 0x4b239cdf, 0x72ddf063, 0x280737a8, 0x65a04c80
.word 0x20ec6637, 0x999fdee8, 0x7a0c5aaa, 0x6fc0b08a, 0xa695f230, 0x3d57ae80, 0x9646380b, 0x8a73ad82
.word 0x871e62c7, 0xfac7e780, 0x4e2f7d04, 0x3e1ff08a, 0x098b887c, 0xf1772a9a, 0xd60bd6fe, 0xce2a1118
.word 0x2f73199b, 0xa8d39b1d, 0x7b2542dc, 0x6c0a7600, 0x7e55ab53, 0x6bf7007e, 0xfd1bf3c8, 0xd83b602c
.word 0x12a90132, 0xc44b6775, 0x9e6ba269, 0xa22991a2, 0x77663a52, 0x594f9e9a, 0x632823bb, 0x73016ce6
.word 0x4b7848d2, 0x4015b252, 0xf7234011, 0x223bf058, 0xcb68720d, 0x498471cd, 0xf7f17bca, 0x3f1c1d2b
.word 0x124979f4, 0xf130912e, 0x5c3b5460, 0xfa810130, 0xc8b971af, 0x97699a8a, 0x8130bb98, 0xba74a06f
.word 0xd0698703, 0x417abf55, 0xfac9fcd5, 0x9eef9a2f, 0x502dd947, 0x03acdecd, 0xea5cfd20, 0x48a923b8
.word 0xe2f05201, 0x725c2880, 0x9eb160ba, 0x316b5894, 0xb6b3d169, 0x89902edb, 0xb0b9d730, 0xee57f1a4
.word 0x323744a2, 0xb851f0e1, 0xe97b9471, 0x690369c5, 0x0103895c, 0xf47e1d56, 0x4281211a, 0x7987e749
.word 0x9c7ee1dd, 0x72cac691, 0x5cecc1e2, 0x1c3175d7, 0xe75fa31c, 0x79d10b30, 0x814d32f8, 0x4ca5e305
.word 0x3fd27e23, 0x33089c98, 0x5681c6b5, 0xfed79f5b, 0x25967e85, 0x3f03b7dc, 0x8a05341e, 0x0ca56907
.word 0xe85c53fc, 0x04b4b9cd, 0x3216c5e9, 0xd8cd2583, 0xb94f9b50, 0x37221ec1, 0xe94083a9, 0xc8c323b5
.word 0x360f8de6, 0x5e8ed55d, 0x268738a3, 0x045563e3, 0x91599eed, 0x9fb43163, 0x339027d3, 0xf077a2cc
.word 0xfd0160d4, 0xf7f63150, 0xb2b6a83a, 0x91de3cd5, 0xfb68ce87, 0xbff4759c, 0x6afb33b3, 0x3658f7d4
.word 0xfd071454, 0xb7d2d7a8, 0x1eeb43e7, 0xfbd18083, 0x523c8f54, 0x76041425, 0xc8100da0, 0xdb27cffe
.word 0xc5c52b8b, 0x1f5a7197, 0x1e585faf, 0x606f50a6, 0xbdc15540, 0x43b691c0, 0xba5df223, 0x0bbf8c4b
.word 0x7ae39834, 0x91f759a7, 0xf85fd08e, 0xfbd19472, 0x84bf965a, 0xa7f1a59a, 0x63a0182b, 0x86bf5593
.word 0x34f87e78, 0x700547b7, 0x8b8661da, 0x17990d42, 0xde34fd63, 0x7795b1f5, 0x2641849d, 0x7fb60b5c
.word 0xc8334797, 0x8da8ba03, 0x370a5760, 0x53bbcff4, 0xabd86dee, 0x3173318a, 0x5041aeab, 0x71f1492a
.word 0xaaf82a6e, 0xb0ec0938, 0xb795a4d4, 0x7e9e364a, 0xb6e58698, 0xd9f770d8, 0x485f3ce3, 0x7b756778
.word 0x0506bdbc, 0xa0d29751, 0x495bb576, 0xc0a6c001, 0x6b0b57b2, 0x35da70cf, 0xf5e45c1c, 0xc2dc1812
.word 0x8e609be4, 0x920d9e64, 0x22a5c9a1, 0x025e8f8c, 0xad7c78dd, 0x9a436dac, 0x41dcebe5, 0xfb242c75
.word 0x0b4a1691, 0xe486bc52, 0xa14598ec, 0x7ba2d56a, 0x53677185, 0x8ed90054, 0x2ef23a7b, 0x46df7416
.word 0xe02fe4f0, 0xfd5d6551, 0xdcf55c1e, 0x7edf415b, 0x9095443f, 0xef14547a, 0x3f3094e2, 0x001f947d
.word 0x1276d44f, 0xfe053f4c, 0x27745cef, 0x1580dca0, 0xd942f998, 0x3fdd36cf, 0x0b4bb1b9, 0xc56c8a7f
.word 0xef6b5ff6, 0x8b49150a, 0xfae4abf1, 0x19d4ae15, 0x7ab518dd, 0x5e32fe65, 0x3939c6e5, 0x1083dbb5
.word 0xe4f19956, 0xe2a424cc, 0x22e88af1, 0xfe2ecd42, 0xbffd73c5, 0x020e7aa1, 0xc51e3b13, 0x139e6a67
.word 0x8ea439c9, 0x18ca5f4d, 0xfd1a5652, 0x88e91b4a, 0x7c12c454, 0x4e45473c, 0x8cb9a307, 0xa57fdea4
.word 0xac0e2424, 0xfb11ed5e, 0x494c9cc2, 0x26bd2ad1, 0xafce972f, 0x674144f1, 0xf562a070, 0xc0f334c5
.word 0x99acfd6c, 0x8de7f965, 0x90d67f16, 0x490bba2a, 0x5610bdb8, 0xc8c5f166, 0xc2223e95, 0xbb7ea4d0
.word 0xa5a79f4c, 0x64bd6159, 0x63144be2, 0x0b9a09f1, 0x0d21d3fc, 0xa2a25411, 0x72aff0ef, 0x14d9bb67
.word 0x3f836184, 0xbfa99431, 0x85971871, 0xae31b0b5, 0xc90ca2b4, 0xe45c6a16, 0xf1b44db3, 0xc7a16931
.word 0x8c35c61b, 0x4d82e93c, 0x860d1ffd, 0x642320f2, 0x1c625cad, 0xe548d979, 0xe71863ba, 0x55cbd72b
.word 0x8f99a1a7, 0xea4f197e, 0x84c17dfd, 0x81e23f08, 0x577a6c6a, 0x96b28da5, 0x04afbc8e, 0xc3df49a7
.word 0x480826eb, 0x649dd0a1, 0x58bada2d, 0xc07878ce, 0xdcef9c05, 0xac78ef65, 0x2b4fd3e2, 0x44c44db7
.word 0xb870d6f4, 0xd7bfdfc3, 0xf7624fb2, 0x2e76587b, 0xe8276d9f, 0x43d1cc97, 0xeb12e597, 0x71b2cc21
.word 0xb4550f31, 0xc3a9ac57, 0x38f35c17, 0x85c10fad, 0x5cfb0aed, 0x94a9989e, 0xd30f602f, 0xe20cd1c8
.word 0xc756eb66, 0xc6d0b33c, 0x1feb8012, 0x0de8fdd0, 0x30cde6d9, 0xf9514749, 0x48a4d2ab, 0xbffd584f
.word 0x3dfdba7a, 0xb234e058, 0x8c44ee04, 0x2a1dcc5c, 0xcfccecac, 0x7bc02089, 0xa6ba159b, 0x8ce3e711
.word 0x63d3e52f, 0x2713a550, 0xb6560ab7, 0x9313ece7, 0x709810ef, 0x7fc2895d, 0x18f1e5c8, 0xdddaa0cf
.word 0x2cfa23c8, 0x493188a0, 0x337f08ac, 0xe77609de, 0xef267857, 0x6ebc762c, 0x40094106, 0x07ded409
.word 0x1b39e0df, 0x23a1d9d3, 0x5271b5af, 0x79d8f168, 0x4317ee73, 0x2ef76743, 0x30e6fd49, 0x437ce0cf
.word 0xa9133421, 0x5be98ca7, 0x052d6cf3, 0x962d28e8, 0xe9461b32, 0xfec54955, 0x7a2ed8f6, 0x218d2484
.word 0x8ce55b23, 0x49c1d43e, 0x5aa521e1, 0x766ef04b, 0x6f5d95d4, 0x72fe854d, 0x5d7a1873, 0xef7ff1b1
.word 0xdd9dad30, 0x5afb363a, 0x119c9825, 0x188db1a3, 0x8a7302f5, 0x70d7c489, 0xb751781b, 0x6e9bb5f3
.word 0x6937ec6d, 0xd3f62fb0, 0x079a8a0e, 0xb423ed34, 0x3a1e98ee, 0x3f4cc27d, 0x8327f1e4, 0x2f4faac9
.word 0x20ee5687, 0xec6783ae, 0x9cab2c4e, 0x471b1803, 0x449b35a8, 0xae432015, 0x6aea909b, 0x8d30229e
.word 0x56a912d9, 0xa4fe4d63, 0xe98959b3, 0x0885ef79, 0x9fbcade3, 0xf702680e, 0xa4978e1b, 0x62759a17
.word 0x95d896bb, 0xa77ba2c9, 0x3711655a, 0x725f26c7, 0xdde5a7be, 0x202f9f13, 0x64651c51, 0xe0ab8b3d
.word 0xd2331a8d, 0xd75509f4, 0xd78e7ed9, 0xb18ce8fc, 0x0c6d8f59, 0xd93f04f0, 0x1b5ec996, 0x73eb2c36
.word 0xf29b435f, 0x9a5be270, 0x942910de, 0x8fd9cf6d, 0x8a9b8a2b, 0x431ccce8, 0xcdc0ac7b, 0x81603f3b
.word 0xb3afda83, 0xa31498c0, 0xbd7e3f52, 0xc92beff7, 0xc900339e, 0x5bf1186a, 0x3ca21077, 0x3d3db72c
.word 0x707b8ba1, 0x7bd13844, 0xac0ae7c0, 0x085f43f0, 0x1fe83bf2, 0x8ac13fe9, 0x7a9576cc, 0x5ff1fe82
.word 0xa51c860a, 0x6e8fd87a, 0xa4bab1c4, 0x4233fa60, 0xd584ce13, 0xaa318746, 0x70d48b5b, 0x89849548
.word 0xc08af705, 0x425079dd, 0x9631bf36, 0xf85fd011, 0xb88ccda5, 0xf1a6188c, 0xf24aaaad, 0x76415950
.word 0x3aa6a83d, 0xf3a84bc8, 0x592802f2, 0xd148e65e, 0xa2aebb52, 0x27094340, 0x57d0772b, 0x1bca17a9
.word 0xfeea9202, 0x45b71c1d, 0x89f0e00f, 0xcaa4c6c1, 0xe6f1ebac, 0x96de226b, 0xae6fd5fc, 0x9f45415c
.word 0x94bc8839, 0x8cfdb5ea, 0x713f2175, 0xc6afee32, 0x9263d711, 0xfabbfb65, 0x31de55de, 0x40b274c9
.word 0x9e63fe74, 0x1d64573e, 0x41c33580, 0x4b54c708, 0x4ec3724c, 0xbdec73b8, 0x03ba9db5, 0xa8b18412
.word 0xd653e13d, 0x907ff26f, 0xc19c8c13, 0x481adcd8, 0xfc20732c, 0x90bd94da, 0xa3e0cd3d, 0x4462076f
.word 0xc4d6ee0a, 0x323c35bb, 0xd3b5fc15, 0x3b68bf0b, 0xb9724344, 0x9210ad8d, 0x43833eea, 0xb0509e5f
.word 0x666e1aa3, 0x490b3bb1, 0x24bffaa2, 0x95404777, 0x8f8f654a, 0x632980b2, 0xfac158c2, 0xf4b01655
.word 0x50730bc2, 0xc6621cb7, 0x5cda0368, 0xd0920482, 0x21476101, 0xe48ecb09, 0x2fe64fc4, 0xc1443f44
.word 0xebee8b03, 0xec96f495, 0x6c8451fb, 0x8ac50b53, 0x1e524150, 0xae72452d, 0xc331dbbf, 0xc46fb00d
.word 0xc64cf79a, 0xe0e53622, 0xed65eb33, 0x173d7088, 0xbce4ea27, 0x92a95122, 0xd860bb02, 0x3c6e43a9
.word 0x4316562f, 0xf22374ec, 0x7ca9175d, 0x49d47886, 0xf0966204, 0xa74c3700, 0x57842443, 0x5a331aa4
.word 0x148a26fb, 0x16b12b44, 0xa1c857a3, 0x9a68f887, 0x39f6fdad, 0x2916a6d9, 0x965f23fe, 0x7c7bc210
.word 0x23ca6c1a, 0xd7c5c396, 0x430a04fc, 0xccb5a573, 0xa3eb5faa, 0x681ea57a, 0x5ed24c00, 0xf95835b9
.word 0xb0fa2241, 0x5bc4300c, 0x0641466f, 0x2121b964, 0x842e89b3, 0xaa2b1819, 0xd41ca042, 0x55e16ac4
.word 0x56a5977f, 0x585c8c32, 0x2cf4cc99, 0x3751bb1b, 0xfaab65c2, 0x3c6920cc, 0x66464db1, 0x15694185
.word 0x24621c79, 0xdbc38625, 0x498d81db, 0xbb6cb1dd, 0x68d629d0, 0x4038956e, 0xb6568742, 0xfd8486b8
.word 0x827a2273, 0x73b05376, 0xdebade25, 0xf65f4486, 0x0a31befb, 0x1df558be, 0xa3b51451, 0xafc3393d
.word 0xcea35e7f, 0x8eeb2097, 0x641d27f9, 0xdd92f490, 0xf72ce6b3, 0x8880709b, 0xb99465f8, 0x6cc7bac9
.word 0x01986628, 0x8775ede4, 0xa062dc70, 0xbf931dc0, 0x45b7cc99, 0x5959e782, 0x65fa5fe4, 0x8a5dcf75
.word 0x221851a7, 0x1d4fe109, 0xf2aede23, 0x54c34ee1, 0xfb178bce, 0xc337bb06, 0x886f0cf3, 0x435c3e04
.word 0xe00937c6, 0x68e7c63c, 0x0ab51265, 0x2b0a5eb7, 0xeaa2f3ed, 0xbca2814d, 0x730f4fc2, 0x8051608b
.word 0x5f8dfa3a, 0xbb9b20ea, 0x050ee98e, 0x5e665040, 0xb5ed6169, 0xdd6c77fd, 0xfc9ca5a1, 0xd543fe57
.word 0xc9854283, 0x148029e7, 0xf55d087c, 0xb664ef81, 0x535a5dd1, 0xf15cdcfa, 0x953cfb47, 0xe3072727
.word 0xd221b0a2, 0x3a415743, 0xfdf5e98b, 0x301e97e8, 0xce510afc, 0x83f2984a, 0x08f35a1a, 0x0fe6a32f
.word 0xb12013a8, 0x62c48d4b, 0xdbd759f0, 0x81995dcc, 0xb816e8c8, 0x02205065, 0xf2224268, 0xa8f22e54
.word 0x603f58d4, 0x171c5eaf, 0xe4107b59, 0x90672000, 0x7407263b, 0x9623377b, 0x355a14f9, 0x28f9f835
.word 0x73bafb39, 0xcf9d8649, 0xd99fbb60, 0x4f7bb526, 0x9a86554a, 0x4d3b277f, 0xe41cc4c5, 0xf5c7fbe3
.word 0xb73d4a03, 0xa03d1415, 0xbb9cb46b, 0xba420d67, 0xc64a2a0d, 0xdc2dccb0, 0xc5cb0e84, 0xa10f3997
.word 0xb3108470, 0xda081e97, 0xbd51494c, 0xd4ba6797, 0xa0239a00, 0xbfb1768a, 0x19e5876b, 0xfba1e356
.word 0x13c0240f, 0x59cb1f5f, 0x38ddbaa2, 0x575761e2, 0x90a6bcc2, 0x4d95654b, 0xc463f289, 0x06fa336b
.word 0x88159c67, 0xeebdb47d, 0x4cc7d107, 0xbb670d65, 0x27e448d6, 0x30edb408, 0x12e9c965, 0xd5e99e74
.word 0x1c8a20d3, 0x6182ec4b, 0xa70d1564, 0xd676cfad, 0x75946367, 0xeeb23761, 0x87661e77, 0x37ea456e
.word 0x164f95e1, 0xa03d1470, 0x2e5a7e91, 0x3cf5f69b, 0xdf36401b, 0x4cf9e946, 0xbb333e80, 0xdc6cd253
.word 0xbeacfbd0, 0xafc4156e, 0x0dcb84cf, 0xd026f116, 0x95641e35, 0xde751d94, 0x67c14a51, 0x16afe48e
.word 0x9f56bc3f, 0x53df500e, 0xf7938807, 0xb33d16bf, 0x4d8c1d33, 0xc6592c5d, 0x040da937, 0xf41c9db3
.word 0x30d2c3d8, 0x5aafbdbd, 0x8fea15be, 0x8c19a7cb, 0xc8ca529c, 0x15a6605d, 0x9ebbd018, 0x763f94d9
.word 0x0ec1afc6, 0xf3159068, 0xdca394f6, 0x12af27b3, 0x8e7eccd4, 0x2e22aa50, 0xbcadd198, 0x0bb93609
.word 0xf8d9bd40, 0x13e2c516, 0xe425ba47, 0xb25274ee, 0x91ac0346, 0x87d8250c, 0x9a4e1c36, 0x0e054900
.word 0x92c42cc0, 0x0f01841a, 0x9e99b4b0, 0x403eb671, 0x07d2eb85, 0xd2e30ee1, 0x6e65a1f6, 0x69ef0d42
.word 0xdb6fb177, 0xb1d1e8d1, 0xeff03936, 0xdd4fa2e4, 0xc4aef629, 0x6da75862, 0xd7b50353, 0x510b27d4
.word 0x7d60c92d, 0x3a2cebba, 0x7852b187, 0x1f61af14, 0xa8144258, 0xa7e3c108, 0x16d39966, 0xe492d345
.word 0x06094a07, 0x50377db1, 0x3b5161eb, 0x3d1d0e95, 0x2f246dba, 0x640562c4, 0x991106f5, 0x7e1cb278
.word 0xbd9386d8, 0xebba5c2d, 0x51742468, 0x81a52dd6, 0xc9fe6aa1, 0x460453a0, 0x94978be1, 0x53e97573
.word 0x63cfdcb5, 0xc9950a11, 0x6603a89f, 0x8580c02e, 0xe4b29179, 0x3c78496f, 0x598760e9, 0x1aa628d4
.section .region_1,"aw",@progbits;
region_1:
.word 0xf1eb7c93, 0x9d9a8424, 0x734dec81, 0xaede46df, 0x3009188f, 0x8fdea50e, 0xa9d6a22b, 0xb461e62b
.word 0xbb0bcdb5, 0x5ee6c32d, 0xba77ebbd, 0xdc876f35, 0x515e7e0f, 0x763458fd, 0x89f553da, 0x5cad80bd
.word 0x7a1ac59d, 0x1b034243, 0x28074b3b, 0x83e53447, 0x155d045f, 0xbaa6792e, 0xce7ef548, 0x1ee0d7cf
.word 0xc94da2db, 0x0e17d938, 0xafe67d5f, 0x33a026f4, 0x3808317f, 0xe1caa7de, 0x53410cbf, 0x89f7b8e3
.word 0x78a4d4fa, 0x35422709, 0x8065ce1f, 0xdd9ee154, 0x22bec235, 0x42d4b41f, 0x3805a488, 0x2639444c
.word 0xe0056929, 0x8d15b704, 0xf23848e3, 0x21a74adf, 0x43ec92c6, 0xe9260d8c, 0x0900b39e, 0x00f9ed89
.word 0xf1407504, 0x056cf37f, 0x42381e79, 0xe9d4eee6, 0x1d4a887e, 0xe2f17919, 0x83958b12, 0x0365b7b5
.word 0x5b2e8166, 0x7d349e99, 0xde957bef, 0x2a9e28bc, 0xe044b18f, 0x0348eb89, 0xb7c0c8f5, 0xdaf1bf31
.word 0xb5449fbc, 0xa9028ec8, 0xc7dc3907, 0xf00fac59, 0xd4aacc24, 0xa346275c, 0xd66900ba, 0x27ba6c9f
.word 0x5685e624, 0xa0a75ae6, 0xd0eab5fd, 0x54146a1f, 0xbbcddcb3, 0x55dd23de, 0xbdaf5173, 0x9f53731a
.word 0xb712e05b, 0x2772e76c, 0x3b5351a5, 0xfb56b6c8, 0x93097164, 0x6983da70, 0x40db4b9c, 0x6d3b31b2
.word 0xf4c15a7d, 0xb04ec81f, 0x9211ca7b, 0x89f2893b, 0x5f1ca118, 0x06d3630b, 0x983cd534, 0x7158a906
.word 0x07c1b982, 0x637a5108, 0xdd29922a, 0x6e18c1c1, 0x3f37d4bf, 0x5c5dcddb, 0xe4c91d10, 0x51ef4e4c
.word 0x0594f1bf, 0x2cf61995, 0x1a8e08f5, 0x94260758, 0xd9148ed1, 0x24e67129, 0x495c35e6, 0xc48b0357
.word 0x41a06216, 0x8593a220, 0xcdc80327, 0x494e5fc1, 0x3c13f401, 0x66f1812d, 0x4f3894f8, 0xaf1b3df4
.word 0x376c654b, 0x58dd1100, 0x39978ac5, 0xc30a89bd, 0x3281296b, 0xb20de87d, 0xe92cbe1f, 0xb39f6537
.word 0xe69d9732, 0xb2a6bce2, 0x57f3f6c6, 0x374f94fe, 0xb31f70a7, 0x11e58682, 0x763a1a49, 0xf6de102c
.word 0x7b39955a, 0x951b2b88, 0xf50b6f47, 0xe7a8e8cd, 0x184eef4a, 0x6de4c419, 0xa58d32ab, 0x46e53466
.word 0x3a75809c, 0xcc6b5e2c, 0xbca947cf, 0x196e3926, 0x646e4050, 0x2da7c107, 0x0601f689, 0x5d56861f
.word 0x6367d3b0, 0xe53774cc, 0x483860e8, 0xf99f5451, 0xb0b3ca43, 0x5ce95172, 0x91774958, 0xed668197
.word 0xb8c5ca5e, 0x549e421d, 0xec942861, 0x73979662, 0xe17510ac, 0x540f62dc, 0x0157c7e7, 0x0ad64c9c
.word 0xa1859b81, 0x50a3b26e, 0x888477c3, 0xf45ce2d1, 0xeb23f6e2, 0x66c507eb, 0x2381723f, 0xc9e5299d
.word 0x0cd2e393, 0x5158a203, 0x8203dcc7, 0xb8a4bf49, 0x51f089d3, 0x50fb8cfd, 0xbee0f5c3, 0x9c0d0bf9
.word 0x324420d7, 0xc7f2324e, 0x715a3e3c, 0x0f796062, 0xab28d952, 0x91c24682, 0x9b72bcc3, 0x090cc21c
.word 0xa65353d6, 0x2f7ab221, 0xd05a5576, 0xc1b56eae, 0x441b582f, 0x35f9e7f9, 0x4dac6126, 0x4ca6f281
.word 0x9f33ab3f, 0x72115d81, 0x859bf479, 0x226642f7, 0x9941dee6, 0x0ea41a4c, 0xc5437e0c, 0x0a10eb3c
.word 0xf6066a62, 0x8843706a, 0xc663106d, 0x0bdf31dd, 0x56f3c1bf, 0x8e797957, 0x625668c0, 0x15d352c2
.word 0xa046911d, 0x6a1cf161, 0x3f9edcfc, 0x38ee693c, 0x9978d4d3, 0xe1546d01, 0x689c3557, 0x287afa45
.word 0x7bb37d29, 0x13b771f1, 0x804af0f1, 0x7bd59782, 0x9c9c182e, 0x34576dbf, 0x29d8d29c, 0x8a127713
.word 0xeaa6b062, 0xa8212b8d, 0x10af33e7, 0xf3af239c, 0xfbef9c98, 0x0b76add8, 0x43935de6, 0xdaada4c0
.word 0xde717265, 0xd21c1183, 0x03332e7b, 0xf29fd178, 0xc3849dba, 0xe75056da, 0xa1c7de72, 0xcf109d66
.word 0xa8a9ac7e, 0xaeddc6e9, 0xa9c8d35d, 0x4760ce69, 0x8de3f94d, 0xfafa7b14, 0x861a4989, 0xb630f203
.word 0x8a863302, 0xb9034b71, 0x16eb79c2, 0x3a846520, 0x9354ae82, 0x61c86be3, 0xc4e064cb, 0x7dba9dd0
.word 0x7b0134ad, 0x633f8b00, 0x2cfc5259, 0x0d3c53f4, 0x1c717864, 0x42d89805, 0x1759351b, 0xb61979d9
.word 0x3c0ae514, 0x89d16b30, 0xb554843e, 0x98a0ee45, 0xfe164e9b, 0x7931caef, 0x1e3098c0, 0x10131ed9
.word 0xdee8c89a, 0x2552fdf1, 0xd38eb610, 0x5a76e39a, 0xea9018ed, 0x078ec781, 0x60c8241e, 0x1f25ab5d
.word 0xd1b54718, 0x71a9761f, 0x6a2103c5, 0x8f3ec3fc, 0xc721ad51, 0x44bbdfab, 0x1f930c0c, 0x70ad4650
.word 0x10cc71eb, 0x9085cf13, 0x7e5d1686, 0x58cee192, 0xa3118610, 0x2a80532a, 0x62d34246, 0xcf8c0af0
.word 0x64f0bdab, 0x1beef3d9, 0xcb66e0f1, 0xdf262f4c, 0xf24b83f5, 0x6ae06fe5, 0x288c0d52, 0x59978962
.word 0xa5612c9c, 0x7d694bd3, 0xacf72b1f, 0xa4f7a6f5, 0x0ba2b1c2, 0xb2cc6c71, 0x810777f7, 0x31a9f1b7
.word 0xeae13dfe, 0x26a4474b, 0xd0db36a3, 0x3363bf4d, 0x00e43653, 0x71c731ca, 0xac7fc95b, 0x60ee0298
.word 0x7588adc6, 0x5809dd0f, 0xbaea1ff9, 0x890600f2, 0xbaaa995b, 0x2cb7c7ae, 0xbb5fdae1, 0x9679439f
.word 0x23605077, 0x566d9551, 0xb1995671, 0x397497a0, 0x8f695a25, 0x2b8043f3, 0xf565b15d, 0x750fbc80
.word 0x725f68e0, 0x0a0b8b31, 0xe06ab6c3, 0x52801da7, 0xf64b9bac, 0x82df90a3, 0xc06a573f, 0xe7bceab9
.word 0x4b2c7b54, 0x55c8202b, 0x693d2b14, 0x46cdfe54, 0xccfcbda7, 0x7e515239, 0x81f1f985, 0x8d10ea6a
.word 0xe332fd84, 0x1f144cc0, 0x0282eb10, 0x111da2a4, 0x722942a0, 0xb771e9da, 0x01b561ac, 0x7da722b2
.word 0x7c5cca78, 0x0316da82, 0xbb379e6c, 0x301c1b68, 0xeb79e9c2, 0x04fec7c7, 0x9e9cfe7d, 0xdc22b360
.word 0x7fdfc882, 0xab99093e, 0xea738ea3, 0x52667ae7, 0x21054437, 0x86f2ce70, 0xd7b33a9f, 0x9789d4a3
.word 0xd8d516a9, 0x3795db57, 0xea39c7b5, 0xa9be0bef, 0xf62da529, 0x0dfde952, 0x93c2315b, 0xa72599f0
.word 0xb4530b08, 0x8f6b166b, 0xa2a9603a, 0xbe2d644f, 0xc024c50b, 0x863a6b20, 0x1faef575, 0x7e4b4556
.word 0x0da3a7b0, 0xf714bc8f, 0xe214790d, 0x56fd9fa1, 0xdd136b19, 0x1609838f, 0xa80257f7, 0x5509e9b2
.word 0x8e04486c, 0xc4a823f2, 0x0353f41f, 0xa4e94a65, 0x59037b06, 0x76be6c93, 0x82854af3, 0x751999a3
.word 0x08e30112, 0x843ffa37, 0x2431d26f, 0x471c677e, 0x2259744b, 0xcd120f0f, 0x7fa2313a, 0x4811abb6
.word 0xf064da0c, 0xeb3e101b, 0xa61a928c, 0x1a66935b, 0x0851f164, 0x7b94d728, 0x393bb7d6, 0x13a381f0
.word 0x3906922d, 0x141bec80, 0x3b001cb0, 0x0737db7b, 0x92befa25, 0x561b3fde, 0xef432f23, 0xfb7ef98a
.word 0x0d5c693d, 0x2022d0de, 0xa4c69844, 0x7f81a25c, 0x3d1a6417, 0x222856d1, 0x33a5f9f9, 0x86e7f0d1
.word 0xf071d476, 0xb4b74f31, 0x16c6dab1, 0x8d4dbab5, 0xea595458, 0x82823a4e, 0x79eb4149, 0xd909adee
.word 0x58675d5c, 0x57c69ddf, 0x0119e9cc, 0x4671f293, 0x7e005b3d, 0xc5b536d6, 0x3ca8f483, 0xc691315b
.word 0x2def99cb, 0x65891776, 0x423f3043, 0xa97ef406, 0x0407f645, 0x5a6d8b07, 0x649451a6, 0xb64c74a9
.word 0xbdaf7612, 0x1d50632f, 0x6f8f872f, 0x8d4371d1, 0xaac16d67, 0xdef628b2, 0x107d4d80, 0x7886a2d0
.word 0xf1c9741a, 0x2cb62893, 0xaadc4ed1, 0x63ee6907, 0x5bbb4566, 0xd0b12471, 0xa2662bd5, 0xf44e3436
.word 0x7bb54375, 0xe3cc6bbd, 0xcf1e0b5b, 0x672fcfd6, 0xeeb6bb6c, 0xf0c7237b, 0x7a27f824, 0x16fb6c6c
.word 0x7242879b, 0xe46dccfd, 0xece4fd3d, 0x32132ddc, 0x3916cf88, 0x1a288c10, 0xc64f784b, 0xe8579a89
.word 0xac3edc09, 0xdc04481f, 0x00e1d7ae, 0x247ca8d9, 0xadb220ee, 0x09271330, 0xf3ef718a, 0x959e2c33
.word 0xe6d15a71, 0x422cf127, 0x8c0638fc, 0x706f563b, 0x7058d356, 0x4689c387, 0x210246ad, 0x60905e78
.word 0xbf50b0e6, 0x4f213a52, 0x4db5df89, 0x202fa29d, 0xa27f7ac6, 0x06d0f206, 0x21396391, 0xef04c98b
.word 0xe1959748, 0xfba4a226, 0xe7c6b5a1, 0xdd12220a, 0x38accb79, 0xb108c05b, 0x02ab0303, 0xdadea5aa
.word 0x4c9e2d7c, 0x804d0ddc, 0x1a693435, 0xcbd7213d, 0xb7a6b6aa, 0x959ed662, 0x507c2bdb, 0xea658e18
.word 0xf486933c, 0x36189097, 0xb55c3fea, 0x0deed3de, 0x29444ffa, 0x7a32d3ee, 0xbffc3d5f, 0xec0462ad
.word 0xc395baee, 0x9e84598c, 0x652c20f6, 0xd0525289, 0xd59049c7, 0x33eeb85b, 0xe9e78d4f, 0xb3030234
.word 0x72d88a1a, 0x8d41fe59, 0x11a0fb6c, 0x1d4cac54, 0xb2496b8b, 0x3d63cd4c, 0x73424473, 0xca5dec0d
.word 0x5922684e, 0x7612616b, 0x84b8d694, 0x3492f33e, 0xe198796d, 0xcd89cbe4, 0x5d135081, 0x2963902d
.word 0x5b9e64ea, 0x65004e78, 0xdadae212, 0x18dfe805, 0x7b460561, 0x0d547ac5, 0x94b309c1, 0x1729114b
.word 0xbbadc4c6, 0xf10b31ad, 0x945ef5c8, 0xb2c33994, 0x2f7c75aa, 0xa3b77cfe, 0xf7a3daf6, 0x262bf1d5
.word 0xa2901239, 0x6c613661, 0xc709b7eb, 0x4fe5529a, 0x2fd0d4d1, 0x6bf5aa05, 0x8388b491, 0x1e688069
.word 0xcd5f79f1, 0x64afed38, 0x6800e689, 0x8b89a7e1, 0xc82f3070, 0x043eba71, 0xe748343c, 0x50f8741b
.word 0x605adb37, 0x94e9a533, 0xc505506c, 0xdfa7e5f6, 0xbc4121fb, 0xa5be0efb, 0x39dbee4a, 0xe1c44298
.word 0x6dc5624c, 0x17c32195, 0x25008af3, 0x89c5663d, 0xadb4c917, 0xa1a5d486, 0xde3a8f08, 0xea1d5472
.word 0xe5c5316d, 0x92f4c19e, 0xacc7a97c, 0x7aa1eaea, 0x48fcaed8, 0x67a37063, 0xfc248aed, 0xc307ef4c
.word 0xc0aebcec, 0xf233a4b0, 0xc25c6249, 0x488edd2a, 0x3a614410, 0x57c4e1c7, 0xf19660b9, 0xc7e46593
.word 0x047e723f, 0x7f536c22, 0x5ca08851, 0x0bba8a3c, 0xb2d142a1, 0xb3fde1ea, 0xf494ce88, 0xda4e32ef
.word 0x462b04a9, 0xfa18ed28, 0x1eccfa5f, 0x6c3625f3, 0x84aa9409, 0x806e86b7, 0x6ec5abab, 0x88227b02
.word 0xbbdf4cd0, 0x1aefd020, 0x6966b44c, 0x601f12bb, 0x5f384364, 0x208e2356, 0x5a56af05, 0xf953b50d
.word 0x6e8fde8e, 0xd9e0d51c, 0xae03f26e, 0xc9cfa793, 0xe63254eb, 0xf53f116c, 0x4c5c9fea, 0x800ff697
.word 0x6c40a279, 0x5952d344, 0xc8ab00bc, 0x27d75cab, 0xd72c0445, 0xd8f4047f, 0xb20728c1, 0xa4bdf133
.word 0xc8a6582c, 0x3265b494, 0xfcf9ae4f, 0x99fdf2f1, 0x5dcb148a, 0xa6cebb61, 0x9b3f6835, 0x4e65bb20
.word 0x5547c9cc, 0x1212c9aa, 0xbca9e144, 0xcd86bbe9, 0x98e7d3db, 0xd31d732d, 0x4e28f384, 0x5fc0e24c
.word 0x6ed56394, 0xb2a44f3f, 0x368ec6fb, 0x726d0c3d, 0x39a3d8c0, 0x1d0635f0, 0x8501804c, 0x90576bb6
.word 0xde5c9005, 0xfe0e3050, 0xe49cea4d, 0x52450792, 0x31d8c4b5, 0x5fccfcd8, 0x937cded5, 0x8904e6ed
.word 0x88803568, 0xa6aeaa30, 0xd23aa631, 0xfcc793c3, 0x9642bd9b, 0xe82d9932, 0x45311ca0, 0xa4545879
.word 0x125d6c76, 0x97c336b0, 0xf854f660, 0xe0c9971a, 0x59126bda, 0xd2a1e66b, 0xaaa479af, 0x332b70a1
.word 0x5b947ac6, 0x65bbb509, 0x1e0ae1f3, 0xa353a2aa, 0x918d18c2, 0x5ac2a726, 0xa19f9668, 0x25216081
.word 0x90f7a4ee, 0x7e222e26, 0xce5cf1fb, 0x94134099, 0x3fbfb334, 0xc8a18457, 0xca699108, 0xd16b85f9
.word 0xa86d084f, 0x68e42a05, 0x225d3f62, 0x21480485, 0x6703bacc, 0x1f5c025b, 0x87559073, 0xad16247a
.word 0xc4b80bac, 0x7e2c2ca0, 0x561f0894, 0xc95b2df4, 0x83abd9ca, 0xb23bcaaa, 0x85ca209c, 0x4cb42ade
.word 0xd4f18a4b, 0xe9536e9e, 0xed257704, 0x4e466515, 0x75fc8fa4, 0xf9b896b8, 0x75d699d2, 0xa3d0424e
.word 0xd121a6fe, 0xfec5def4, 0x80806e66, 0x387eab98, 0x738f21f9, 0x94e42d43, 0xc70cbf3d, 0xd5ab82b9
.word 0xd5a190d3, 0xdea8b6d3, 0x5f4b703f, 0x73466b60, 0x7e7d8507, 0x95afcaec, 0xfa9d5ef2, 0x7d94faf3
.word 0xc6dcadbe, 0x23b94c28, 0x85c0f3e1, 0x2d9b7b50, 0xa4e4f51e, 0x702835cc, 0xf04f4b9c, 0xae7ada5c
.word 0x0aefb9d0, 0x5f796cbf, 0x49d9e0ed, 0xd0d9603d, 0xeca53642, 0x159e949d, 0xb25d4539, 0xf431cc56
.word 0x865d3bd1, 0xc4e0e198, 0x7b007893, 0x64be8551, 0x02bcbfa5, 0x1c5dd074, 0x69fc3867, 0x3a449fbf
.word 0x5a936f5b, 0x3e5c5a52, 0xcb69ed63, 0xd634bb88, 0xaaf7451d, 0x45aa096d, 0xe30ecd41, 0x27c8c1e5
.word 0x5a1af7fc, 0x1edd8ec4, 0x39ab114e, 0xb8f739ec, 0xa09b1ad7, 0x3c4bea83, 0x7bbc30c5, 0xcf838594
.word 0x18cded7b, 0x3965dff1, 0x208ee7ab, 0xb8db70f7, 0x871fce4c, 0xb26ecabc, 0x057f1db8, 0x92ba8670
.word 0xf1bfeaea, 0x8ac28b70, 0xc7fbef99, 0xf9c73159, 0x73a63971, 0x9d88cc2e, 0xd464a348, 0x7d2ddd59
.word 0xbd6b30e8, 0xe141711f, 0x35437381, 0xfc1f8f2a, 0x7bc518dc, 0xa45581ba, 0xf3479644, 0xc67430f4
.word 0x6175f0b3, 0xfa4ef0f2, 0xfc4af463, 0x16595000, 0xd60d34ee, 0x1c9e8e1e, 0x7c8d0cbd, 0xdf8329ca
.word 0xfcd3990c, 0x611070ad, 0xabe414e3, 0x66bebd18, 0xb562789c, 0x9119be0f, 0x8045101b, 0xa2c71f8d
.word 0xcabd3dd6, 0x9cf60d18, 0x59375b07, 0xdf174499, 0x7bb7f9e1, 0x814f85bf, 0x35824f45, 0x4cea8544
.word 0xd6e7ee8b, 0xc6337f2e, 0x587f6dc1, 0x344cc6e6, 0x19c033a3, 0xd9b1e632, 0xbd3fdd08, 0xc8a23ec0
.word 0x0b065e18, 0xe02630cb, 0x8f3dd7f4, 0xc830089b, 0x9b362604, 0xec25baa5, 0xe15a1b5c, 0x34ca5686
.word 0x2ddcc3fa, 0x9c5a130f, 0xf2983d63, 0x1f096741, 0x293ce0e9, 0xcb5ec6d7, 0x6cf72ee6, 0x275e76b8
.word 0xb916e1e4, 0xcfce49e4, 0x10bf303f, 0xcef10e24, 0x279906dd, 0x91980ccf, 0x49e69871, 0xabb06fd1
.word 0x843f8b4b, 0x7d01a500, 0x55b29685, 0xb036e812, 0xfbc3eb44, 0xd34eab88, 0x996b2363, 0x887455f4
.word 0xfdde3ed4, 0xe6556f7a, 0x62fa3ec2, 0xd023ea2b, 0x0b2e850f, 0x6b02897e, 0xbdba81c9, 0x91661e14
.word 0xc571376e, 0x9802d1c1, 0x0bad9369, 0xcb428e28, 0x12bcecfc, 0x73b013a3, 0x927ee55c, 0xf62d63d3
.word 0x1c30b6fb, 0xeb11eeea, 0xb6421aa1, 0x00ebdaac, 0xfaf0c655, 0xc45382ea, 0xe2e50cce, 0x0e6c4ebb
.word 0x455ab6a0, 0x88cf3f34, 0x466723d5, 0xe18b7796, 0x6642144d, 0x7bcfb817, 0x3a2c0262, 0xfa7aa223
.word 0x95002324, 0xb0a37b99, 0x866df3fe, 0x46f711d8, 0x0804f9b4, 0xbb6a00cf, 0x8914b410, 0x2eb17dfd
.word 0xbc9413f0, 0x823f287a, 0xdd776294, 0xe2392ff4, 0x71698ad0, 0xbe8366d8, 0x4977eded, 0xf24bab9f
.word 0xa001c67e, 0x496be3ab, 0x17e4712e, 0x1dc4073d, 0x13df4c39, 0x51fc5583, 0x847cfc05, 0x0860f50b
.word 0xe78d5115, 0x061a4040, 0xbcd9b7ec, 0x57ae97da, 0xb4ea43f1, 0x21f154ef, 0xe215471d, 0x6ec95050
.word 0x5b7418cb, 0xd61ec63d, 0x26cc05c8, 0x5fd10e22, 0x3c97d447, 0x22648acc, 0x598ce2dc, 0x72fcb6b5
.word 0xe6b5f632, 0x9cec0e6c, 0x38f31f2b, 0x462c15e3, 0x75ba460c, 0x43440f3d, 0x35033f24, 0xf0010f35
.word 0xf9f8b50d, 0x080f35a0, 0x226ef145, 0x4e10ce0f, 0x931f172c, 0xfadb41d7, 0xc22ccf6f, 0x99a0f190
.word 0x66906658, 0xce3a202a, 0x402b0d46, 0xd2475f26, 0xf585112e, 0xacd4c789, 0x50da2cca, 0x57161d26
.word 0xd24644f5, 0x91ea46c4, 0x410b2755, 0xbedf4cac, 0x6d622c62, 0xd5ebfcbe, 0xb67c57bd, 0xd2394516
.word 0x4db67952, 0x70e268d2, 0x0350ab18, 0x4882535f, 0x7b0658aa, 0x2190e031, 0xa77d4537, 0x48f1d095
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
mmode_intr_vector_1:
                  csrrw x25, 0x340, x25
                  add x25, x29, zero
                  1: addi x25, x25, -124
                  sw x1, 4(x25)
                  sw x2, 8(x25)
                  sw x3, 12(x25)
                  sw x4, 16(x25)
                  sw x5, 20(x25)
                  sw x6, 24(x25)
                  sw x7, 28(x25)
                  sw x8, 32(x25)
                  sw x9, 36(x25)
                  sw x10, 40(x25)
                  sw x11, 44(x25)
                  sw x12, 48(x25)
                  sw x13, 52(x25)
                  sw x14, 56(x25)
                  sw x15, 60(x25)
                  sw x16, 64(x25)
                  sw x17, 68(x25)
                  sw x18, 72(x25)
                  sw x19, 76(x25)
                  sw x20, 80(x25)
                  sw x21, 84(x25)
                  sw x22, 88(x25)
                  sw x23, 92(x25)
                  sw x24, 96(x25)
                  sw x25, 100(x25)
                  sw x26, 104(x25)
                  sw x27, 108(x25)
                  sw x28, 112(x25)
                  sw x29, 116(x25)
                  sw x30, 120(x25)
                  sw x31, 124(x25)
                  csrr x4, 0x342 # MCAUSE
                  srli x4, x4, 0x1f
                  beqz x4, 1f
                  j mmode_intr_handler
                  1: la x30, test_done
                  jalr x0, x30, 0

mmode_intr_vector_2:
                  csrrw x25, 0x340, x25
                  add x25, x29, zero
                  1: addi x25, x25, -124
                  sw x1, 4(x25)
                  sw x2, 8(x25)
                  sw x3, 12(x25)
                  sw x4, 16(x25)
                  sw x5, 20(x25)
                  sw x6, 24(x25)
                  sw x7, 28(x25)
                  sw x8, 32(x25)
                  sw x9, 36(x25)
                  sw x10, 40(x25)
                  sw x11, 44(x25)
                  sw x12, 48(x25)
                  sw x13, 52(x25)
                  sw x14, 56(x25)
                  sw x15, 60(x25)
                  sw x16, 64(x25)
                  sw x17, 68(x25)
                  sw x18, 72(x25)
                  sw x19, 76(x25)
                  sw x20, 80(x25)
                  sw x21, 84(x25)
                  sw x22, 88(x25)
                  sw x23, 92(x25)
                  sw x24, 96(x25)
                  sw x25, 100(x25)
                  sw x26, 104(x25)
                  sw x27, 108(x25)
                  sw x28, 112(x25)
                  sw x29, 116(x25)
                  sw x30, 120(x25)
                  sw x31, 124(x25)
                  csrr x4, 0x342 # MCAUSE
                  srli x4, x4, 0x1f
                  beqz x4, 1f
                  j mmode_intr_handler
                  1: la x30, test_done
                  jalr x0, x30, 0

mmode_intr_vector_3:
                  csrrw x25, 0x340, x25
                  add x25, x29, zero
                  1: addi x25, x25, -124
                  sw x1, 4(x25)
                  sw x2, 8(x25)
                  sw x3, 12(x25)
                  sw x4, 16(x25)
                  sw x5, 20(x25)
                  sw x6, 24(x25)
                  sw x7, 28(x25)
                  sw x8, 32(x25)
                  sw x9, 36(x25)
                  sw x10, 40(x25)
                  sw x11, 44(x25)
                  sw x12, 48(x25)
                  sw x13, 52(x25)
                  sw x14, 56(x25)
                  sw x15, 60(x25)
                  sw x16, 64(x25)
                  sw x17, 68(x25)
                  sw x18, 72(x25)
                  sw x19, 76(x25)
                  sw x20, 80(x25)
                  sw x21, 84(x25)
                  sw x22, 88(x25)
                  sw x23, 92(x25)
                  sw x24, 96(x25)
                  sw x25, 100(x25)
                  sw x26, 104(x25)
                  sw x27, 108(x25)
                  sw x28, 112(x25)
                  sw x29, 116(x25)
                  sw x30, 120(x25)
                  sw x31, 124(x25)
                  csrr x4, 0x342 # MCAUSE
                  srli x4, x4, 0x1f
                  beqz x4, 1f
                  j mmode_intr_handler
                  1: la x30, test_done
                  jalr x0, x30, 0

mmode_intr_vector_4:
                  csrrw x25, 0x340, x25
                  add x25, x29, zero
                  1: addi x25, x25, -124
                  sw x1, 4(x25)
                  sw x2, 8(x25)
                  sw x3, 12(x25)
                  sw x4, 16(x25)
                  sw x5, 20(x25)
                  sw x6, 24(x25)
                  sw x7, 28(x25)
                  sw x8, 32(x25)
                  sw x9, 36(x25)
                  sw x10, 40(x25)
                  sw x11, 44(x25)
                  sw x12, 48(x25)
                  sw x13, 52(x25)
                  sw x14, 56(x25)
                  sw x15, 60(x25)
                  sw x16, 64(x25)
                  sw x17, 68(x25)
                  sw x18, 72(x25)
                  sw x19, 76(x25)
                  sw x20, 80(x25)
                  sw x21, 84(x25)
                  sw x22, 88(x25)
                  sw x23, 92(x25)
                  sw x24, 96(x25)
                  sw x25, 100(x25)
                  sw x26, 104(x25)
                  sw x27, 108(x25)
                  sw x28, 112(x25)
                  sw x29, 116(x25)
                  sw x30, 120(x25)
                  sw x31, 124(x25)
                  csrr x4, 0x342 # MCAUSE
                  srli x4, x4, 0x1f
                  beqz x4, 1f
                  j mmode_intr_handler
                  1: la x30, test_done
                  jalr x0, x30, 0

mmode_intr_vector_5:
                  csrrw x25, 0x340, x25
                  add x25, x29, zero
                  1: addi x25, x25, -124
                  sw x1, 4(x25)
                  sw x2, 8(x25)
                  sw x3, 12(x25)
                  sw x4, 16(x25)
                  sw x5, 20(x25)
                  sw x6, 24(x25)
                  sw x7, 28(x25)
                  sw x8, 32(x25)
                  sw x9, 36(x25)
                  sw x10, 40(x25)
                  sw x11, 44(x25)
                  sw x12, 48(x25)
                  sw x13, 52(x25)
                  sw x14, 56(x25)
                  sw x15, 60(x25)
                  sw x16, 64(x25)
                  sw x17, 68(x25)
                  sw x18, 72(x25)
                  sw x19, 76(x25)
                  sw x20, 80(x25)
                  sw x21, 84(x25)
                  sw x22, 88(x25)
                  sw x23, 92(x25)
                  sw x24, 96(x25)
                  sw x25, 100(x25)
                  sw x26, 104(x25)
                  sw x27, 108(x25)
                  sw x28, 112(x25)
                  sw x29, 116(x25)
                  sw x30, 120(x25)
                  sw x31, 124(x25)
                  csrr x4, 0x342 # MCAUSE
                  srli x4, x4, 0x1f
                  beqz x4, 1f
                  j mmode_intr_handler
                  1: la x30, test_done
                  jalr x0, x30, 0

mmode_intr_vector_6:
                  csrrw x25, 0x340, x25
                  add x25, x29, zero
                  1: addi x25, x25, -124
                  sw x1, 4(x25)
                  sw x2, 8(x25)
                  sw x3, 12(x25)
                  sw x4, 16(x25)
                  sw x5, 20(x25)
                  sw x6, 24(x25)
                  sw x7, 28(x25)
                  sw x8, 32(x25)
                  sw x9, 36(x25)
                  sw x10, 40(x25)
                  sw x11, 44(x25)
                  sw x12, 48(x25)
                  sw x13, 52(x25)
                  sw x14, 56(x25)
                  sw x15, 60(x25)
                  sw x16, 64(x25)
                  sw x17, 68(x25)
                  sw x18, 72(x25)
                  sw x19, 76(x25)
                  sw x20, 80(x25)
                  sw x21, 84(x25)
                  sw x22, 88(x25)
                  sw x23, 92(x25)
                  sw x24, 96(x25)
                  sw x25, 100(x25)
                  sw x26, 104(x25)
                  sw x27, 108(x25)
                  sw x28, 112(x25)
                  sw x29, 116(x25)
                  sw x30, 120(x25)
                  sw x31, 124(x25)
                  csrr x4, 0x342 # MCAUSE
                  srli x4, x4, 0x1f
                  beqz x4, 1f
                  j mmode_intr_handler
                  1: la x30, test_done
                  jalr x0, x30, 0

mmode_intr_vector_7:
                  csrrw x25, 0x340, x25
                  add x25, x29, zero
                  1: addi x25, x25, -124
                  sw x1, 4(x25)
                  sw x2, 8(x25)
                  sw x3, 12(x25)
                  sw x4, 16(x25)
                  sw x5, 20(x25)
                  sw x6, 24(x25)
                  sw x7, 28(x25)
                  sw x8, 32(x25)
                  sw x9, 36(x25)
                  sw x10, 40(x25)
                  sw x11, 44(x25)
                  sw x12, 48(x25)
                  sw x13, 52(x25)
                  sw x14, 56(x25)
                  sw x15, 60(x25)
                  sw x16, 64(x25)
                  sw x17, 68(x25)
                  sw x18, 72(x25)
                  sw x19, 76(x25)
                  sw x20, 80(x25)
                  sw x21, 84(x25)
                  sw x22, 88(x25)
                  sw x23, 92(x25)
                  sw x24, 96(x25)
                  sw x25, 100(x25)
                  sw x26, 104(x25)
                  sw x27, 108(x25)
                  sw x28, 112(x25)
                  sw x29, 116(x25)
                  sw x30, 120(x25)
                  sw x31, 124(x25)
                  csrr x4, 0x342 # MCAUSE
                  srli x4, x4, 0x1f
                  beqz x4, 1f
                  j mmode_intr_handler
                  1: la x30, test_done
                  jalr x0, x30, 0

mmode_intr_vector_8:
                  csrrw x25, 0x340, x25
                  add x25, x29, zero
                  1: addi x25, x25, -124
                  sw x1, 4(x25)
                  sw x2, 8(x25)
                  sw x3, 12(x25)
                  sw x4, 16(x25)
                  sw x5, 20(x25)
                  sw x6, 24(x25)
                  sw x7, 28(x25)
                  sw x8, 32(x25)
                  sw x9, 36(x25)
                  sw x10, 40(x25)
                  sw x11, 44(x25)
                  sw x12, 48(x25)
                  sw x13, 52(x25)
                  sw x14, 56(x25)
                  sw x15, 60(x25)
                  sw x16, 64(x25)
                  sw x17, 68(x25)
                  sw x18, 72(x25)
                  sw x19, 76(x25)
                  sw x20, 80(x25)
                  sw x21, 84(x25)
                  sw x22, 88(x25)
                  sw x23, 92(x25)
                  sw x24, 96(x25)
                  sw x25, 100(x25)
                  sw x26, 104(x25)
                  sw x27, 108(x25)
                  sw x28, 112(x25)
                  sw x29, 116(x25)
                  sw x30, 120(x25)
                  sw x31, 124(x25)
                  csrr x4, 0x342 # MCAUSE
                  srli x4, x4, 0x1f
                  beqz x4, 1f
                  j mmode_intr_handler
                  1: la x30, test_done
                  jalr x0, x30, 0

mmode_intr_vector_9:
                  csrrw x25, 0x340, x25
                  add x25, x29, zero
                  1: addi x25, x25, -124
                  sw x1, 4(x25)
                  sw x2, 8(x25)
                  sw x3, 12(x25)
                  sw x4, 16(x25)
                  sw x5, 20(x25)
                  sw x6, 24(x25)
                  sw x7, 28(x25)
                  sw x8, 32(x25)
                  sw x9, 36(x25)
                  sw x10, 40(x25)
                  sw x11, 44(x25)
                  sw x12, 48(x25)
                  sw x13, 52(x25)
                  sw x14, 56(x25)
                  sw x15, 60(x25)
                  sw x16, 64(x25)
                  sw x17, 68(x25)
                  sw x18, 72(x25)
                  sw x19, 76(x25)
                  sw x20, 80(x25)
                  sw x21, 84(x25)
                  sw x22, 88(x25)
                  sw x23, 92(x25)
                  sw x24, 96(x25)
                  sw x25, 100(x25)
                  sw x26, 104(x25)
                  sw x27, 108(x25)
                  sw x28, 112(x25)
                  sw x29, 116(x25)
                  sw x30, 120(x25)
                  sw x31, 124(x25)
                  csrr x4, 0x342 # MCAUSE
                  srli x4, x4, 0x1f
                  beqz x4, 1f
                  j mmode_intr_handler
                  1: la x30, test_done
                  jalr x0, x30, 0

mmode_intr_vector_10:
                  csrrw x25, 0x340, x25
                  add x25, x29, zero
                  1: addi x25, x25, -124
                  sw x1, 4(x25)
                  sw x2, 8(x25)
                  sw x3, 12(x25)
                  sw x4, 16(x25)
                  sw x5, 20(x25)
                  sw x6, 24(x25)
                  sw x7, 28(x25)
                  sw x8, 32(x25)
                  sw x9, 36(x25)
                  sw x10, 40(x25)
                  sw x11, 44(x25)
                  sw x12, 48(x25)
                  sw x13, 52(x25)
                  sw x14, 56(x25)
                  sw x15, 60(x25)
                  sw x16, 64(x25)
                  sw x17, 68(x25)
                  sw x18, 72(x25)
                  sw x19, 76(x25)
                  sw x20, 80(x25)
                  sw x21, 84(x25)
                  sw x22, 88(x25)
                  sw x23, 92(x25)
                  sw x24, 96(x25)
                  sw x25, 100(x25)
                  sw x26, 104(x25)
                  sw x27, 108(x25)
                  sw x28, 112(x25)
                  sw x29, 116(x25)
                  sw x30, 120(x25)
                  sw x31, 124(x25)
                  csrr x4, 0x342 # MCAUSE
                  srli x4, x4, 0x1f
                  beqz x4, 1f
                  j mmode_intr_handler
                  1: la x30, test_done
                  jalr x0, x30, 0

mmode_intr_vector_11:
                  csrrw x25, 0x340, x25
                  add x25, x29, zero
                  1: addi x25, x25, -124
                  sw x1, 4(x25)
                  sw x2, 8(x25)
                  sw x3, 12(x25)
                  sw x4, 16(x25)
                  sw x5, 20(x25)
                  sw x6, 24(x25)
                  sw x7, 28(x25)
                  sw x8, 32(x25)
                  sw x9, 36(x25)
                  sw x10, 40(x25)
                  sw x11, 44(x25)
                  sw x12, 48(x25)
                  sw x13, 52(x25)
                  sw x14, 56(x25)
                  sw x15, 60(x25)
                  sw x16, 64(x25)
                  sw x17, 68(x25)
                  sw x18, 72(x25)
                  sw x19, 76(x25)
                  sw x20, 80(x25)
                  sw x21, 84(x25)
                  sw x22, 88(x25)
                  sw x23, 92(x25)
                  sw x24, 96(x25)
                  sw x25, 100(x25)
                  sw x26, 104(x25)
                  sw x27, 108(x25)
                  sw x28, 112(x25)
                  sw x29, 116(x25)
                  sw x30, 120(x25)
                  sw x31, 124(x25)
                  csrr x4, 0x342 # MCAUSE
                  srli x4, x4, 0x1f
                  beqz x4, 1f
                  j mmode_intr_handler
                  1: la x30, test_done
                  jalr x0, x30, 0

mmode_intr_vector_12:
                  csrrw x25, 0x340, x25
                  add x25, x29, zero
                  1: addi x25, x25, -124
                  sw x1, 4(x25)
                  sw x2, 8(x25)
                  sw x3, 12(x25)
                  sw x4, 16(x25)
                  sw x5, 20(x25)
                  sw x6, 24(x25)
                  sw x7, 28(x25)
                  sw x8, 32(x25)
                  sw x9, 36(x25)
                  sw x10, 40(x25)
                  sw x11, 44(x25)
                  sw x12, 48(x25)
                  sw x13, 52(x25)
                  sw x14, 56(x25)
                  sw x15, 60(x25)
                  sw x16, 64(x25)
                  sw x17, 68(x25)
                  sw x18, 72(x25)
                  sw x19, 76(x25)
                  sw x20, 80(x25)
                  sw x21, 84(x25)
                  sw x22, 88(x25)
                  sw x23, 92(x25)
                  sw x24, 96(x25)
                  sw x25, 100(x25)
                  sw x26, 104(x25)
                  sw x27, 108(x25)
                  sw x28, 112(x25)
                  sw x29, 116(x25)
                  sw x30, 120(x25)
                  sw x31, 124(x25)
                  csrr x4, 0x342 # MCAUSE
                  srli x4, x4, 0x1f
                  beqz x4, 1f
                  j mmode_intr_handler
                  1: la x30, test_done
                  jalr x0, x30, 0

mmode_intr_vector_13:
                  csrrw x25, 0x340, x25
                  add x25, x29, zero
                  1: addi x25, x25, -124
                  sw x1, 4(x25)
                  sw x2, 8(x25)
                  sw x3, 12(x25)
                  sw x4, 16(x25)
                  sw x5, 20(x25)
                  sw x6, 24(x25)
                  sw x7, 28(x25)
                  sw x8, 32(x25)
                  sw x9, 36(x25)
                  sw x10, 40(x25)
                  sw x11, 44(x25)
                  sw x12, 48(x25)
                  sw x13, 52(x25)
                  sw x14, 56(x25)
                  sw x15, 60(x25)
                  sw x16, 64(x25)
                  sw x17, 68(x25)
                  sw x18, 72(x25)
                  sw x19, 76(x25)
                  sw x20, 80(x25)
                  sw x21, 84(x25)
                  sw x22, 88(x25)
                  sw x23, 92(x25)
                  sw x24, 96(x25)
                  sw x25, 100(x25)
                  sw x26, 104(x25)
                  sw x27, 108(x25)
                  sw x28, 112(x25)
                  sw x29, 116(x25)
                  sw x30, 120(x25)
                  sw x31, 124(x25)
                  csrr x4, 0x342 # MCAUSE
                  srli x4, x4, 0x1f
                  beqz x4, 1f
                  j mmode_intr_handler
                  1: la x30, test_done
                  jalr x0, x30, 0

mmode_intr_vector_14:
                  csrrw x25, 0x340, x25
                  add x25, x29, zero
                  1: addi x25, x25, -124
                  sw x1, 4(x25)
                  sw x2, 8(x25)
                  sw x3, 12(x25)
                  sw x4, 16(x25)
                  sw x5, 20(x25)
                  sw x6, 24(x25)
                  sw x7, 28(x25)
                  sw x8, 32(x25)
                  sw x9, 36(x25)
                  sw x10, 40(x25)
                  sw x11, 44(x25)
                  sw x12, 48(x25)
                  sw x13, 52(x25)
                  sw x14, 56(x25)
                  sw x15, 60(x25)
                  sw x16, 64(x25)
                  sw x17, 68(x25)
                  sw x18, 72(x25)
                  sw x19, 76(x25)
                  sw x20, 80(x25)
                  sw x21, 84(x25)
                  sw x22, 88(x25)
                  sw x23, 92(x25)
                  sw x24, 96(x25)
                  sw x25, 100(x25)
                  sw x26, 104(x25)
                  sw x27, 108(x25)
                  sw x28, 112(x25)
                  sw x29, 116(x25)
                  sw x30, 120(x25)
                  sw x31, 124(x25)
                  csrr x4, 0x342 # MCAUSE
                  srli x4, x4, 0x1f
                  beqz x4, 1f
                  j mmode_intr_handler
                  1: la x30, test_done
                  jalr x0, x30, 0

mmode_intr_vector_15:
                  csrrw x25, 0x340, x25
                  add x25, x29, zero
                  1: addi x25, x25, -124
                  sw x1, 4(x25)
                  sw x2, 8(x25)
                  sw x3, 12(x25)
                  sw x4, 16(x25)
                  sw x5, 20(x25)
                  sw x6, 24(x25)
                  sw x7, 28(x25)
                  sw x8, 32(x25)
                  sw x9, 36(x25)
                  sw x10, 40(x25)
                  sw x11, 44(x25)
                  sw x12, 48(x25)
                  sw x13, 52(x25)
                  sw x14, 56(x25)
                  sw x15, 60(x25)
                  sw x16, 64(x25)
                  sw x17, 68(x25)
                  sw x18, 72(x25)
                  sw x19, 76(x25)
                  sw x20, 80(x25)
                  sw x21, 84(x25)
                  sw x22, 88(x25)
                  sw x23, 92(x25)
                  sw x24, 96(x25)
                  sw x25, 100(x25)
                  sw x26, 104(x25)
                  sw x27, 108(x25)
                  sw x28, 112(x25)
                  sw x29, 116(x25)
                  sw x30, 120(x25)
                  sw x31, 124(x25)
                  csrr x4, 0x342 # MCAUSE
                  srli x4, x4, 0x1f
                  beqz x4, 1f
                  j mmode_intr_handler
                  1: la x30, test_done
                  jalr x0, x30, 0

.align 4
mtvec_handler:    
                  .option norvc;
                  j mmode_exception_handler
                  j mmode_intr_vector_1
                  j mmode_intr_vector_2
                  j mmode_intr_vector_3
                  j mmode_intr_vector_4
                  j mmode_intr_vector_5
                  j mmode_intr_vector_6
                  j mmode_intr_vector_7
                  j mmode_intr_vector_8
                  j mmode_intr_vector_9
                  j mmode_intr_vector_10
                  j mmode_intr_vector_11
                  j mmode_intr_vector_12
                  j mmode_intr_vector_13
                  j mmode_intr_vector_14
                  j mmode_intr_vector_15
                  .option rvc;

mmode_exception_handler:
                  csrrw x25, 0x340, x25
                  add x25, x29, zero
                  1: addi x25, x25, -124
                  sw x1, 4(x25)
                  sw x2, 8(x25)
                  sw x3, 12(x25)
                  sw x4, 16(x25)
                  sw x5, 20(x25)
                  sw x6, 24(x25)
                  sw x7, 28(x25)
                  sw x8, 32(x25)
                  sw x9, 36(x25)
                  sw x10, 40(x25)
                  sw x11, 44(x25)
                  sw x12, 48(x25)
                  sw x13, 52(x25)
                  sw x14, 56(x25)
                  sw x15, 60(x25)
                  sw x16, 64(x25)
                  sw x17, 68(x25)
                  sw x18, 72(x25)
                  sw x19, 76(x25)
                  sw x20, 80(x25)
                  sw x21, 84(x25)
                  sw x22, 88(x25)
                  sw x23, 92(x25)
                  sw x24, 96(x25)
                  sw x25, 100(x25)
                  sw x26, 104(x25)
                  sw x27, 108(x25)
                  sw x28, 112(x25)
                  sw x29, 116(x25)
                  sw x30, 120(x25)
                  sw x31, 124(x25)
                  csrr x4, 0x341 # MEPC
                  csrr x4, 0x342 # MCAUSE
                  li x31, 0xb # ECALL_MMODE
                  beq x4, x31, ecall_handler
                  li x31, 0x2 # ILLEGAL_INSTRUCTION
                  beq x4, x31, illegal_instr_handler
                  csrr x31, 0x343 # MTVAL
                  1: la x30, test_done
                  jalr x1, x30, 0

ecall_handler:    
                  la x4, _start
                  sw x0, 0(x4)
                  sw x1, 4(x4)
                  sw x2, 8(x4)
                  sw x3, 12(x4)
                  sw x4, 16(x4)
                  sw x5, 20(x4)
                  sw x6, 24(x4)
                  sw x7, 28(x4)
                  sw x8, 32(x4)
                  sw x9, 36(x4)
                  sw x10, 40(x4)
                  sw x11, 44(x4)
                  sw x12, 48(x4)
                  sw x13, 52(x4)
                  sw x14, 56(x4)
                  sw x15, 60(x4)
                  sw x16, 64(x4)
                  sw x17, 68(x4)
                  sw x18, 72(x4)
                  sw x19, 76(x4)
                  sw x20, 80(x4)
                  sw x21, 84(x4)
                  sw x22, 88(x4)
                  sw x23, 92(x4)
                  sw x24, 96(x4)
                  sw x25, 100(x4)
                  sw x26, 104(x4)
                  sw x27, 108(x4)
                  sw x28, 112(x4)
                  sw x29, 116(x4)
                  sw x30, 120(x4)
                  sw x31, 124(x4)
                  la x30, write_tohost
                  jalr x0, x30, 0

illegal_instr_handler:
                  csrr  x4, 0x341
                  addi  x4, x4, 4
                  csrw  0x341, x4
                  lw x1, 4(x25)
                  lw x2, 8(x25)
                  lw x3, 12(x25)
                  lw x4, 16(x25)
                  lw x5, 20(x25)
                  lw x6, 24(x25)
                  lw x7, 28(x25)
                  lw x8, 32(x25)
                  lw x9, 36(x25)
                  lw x10, 40(x25)
                  lw x11, 44(x25)
                  lw x12, 48(x25)
                  lw x13, 52(x25)
                  lw x14, 56(x25)
                  lw x15, 60(x25)
                  lw x16, 64(x25)
                  lw x17, 68(x25)
                  lw x18, 72(x25)
                  lw x19, 76(x25)
                  lw x20, 80(x25)
                  lw x21, 84(x25)
                  lw x22, 88(x25)
                  lw x23, 92(x25)
                  lw x24, 96(x25)
                  lw x25, 100(x25)
                  lw x26, 104(x25)
                  lw x27, 108(x25)
                  lw x28, 112(x25)
                  lw x29, 116(x25)
                  lw x30, 120(x25)
                  lw x31, 124(x25)
                  addi x25, x25, 124
                  add x29, x25, zero
                  csrrw x25, 0x340, x25
                  mret

pt_fault_handler: 

.align 2
mmode_intr_handler:
                  csrr  x4, 0x300 # MSTATUS;
                  csrr  x4, 0x304 # MIE;
                  csrr  x4, 0x344 # MIP;
                  csrrc x4, 0x344, x4 # MIP;
                  lw x1, 4(x25)
                  lw x2, 8(x25)
                  lw x3, 12(x25)
                  lw x4, 16(x25)
                  lw x5, 20(x25)
                  lw x6, 24(x25)
                  lw x7, 28(x25)
                  lw x8, 32(x25)
                  lw x9, 36(x25)
                  lw x10, 40(x25)
                  lw x11, 44(x25)
                  lw x12, 48(x25)
                  lw x13, 52(x25)
                  lw x14, 56(x25)
                  lw x15, 60(x25)
                  lw x16, 64(x25)
                  lw x17, 68(x25)
                  lw x18, 72(x25)
                  lw x19, 76(x25)
                  lw x20, 80(x25)
                  lw x21, 84(x25)
                  lw x22, 88(x25)
                  lw x23, 92(x25)
                  lw x24, 96(x25)
                  lw x25, 100(x25)
                  lw x26, 104(x25)
                  lw x27, 108(x25)
                  lw x28, 112(x25)
                  lw x29, 116(x25)
                  lw x30, 120(x25)
                  lw x31, 124(x25)
                  addi x25, x25, 124
                  add x29, x25, zero
                  csrrw x25, 0x340, x25
                  mret;

kernel_instr_end: nop
.align 2
kernel_data_start:
.section .s_region_0,"aw",@progbits;
s_region_0:
.word 0x817a90cc, 0x37af12d9, 0x5bf0b4e5, 0xa1d90bc4, 0x574fd629, 0xab311191, 0x4bef2085, 0x33aa1063
.word 0xa9dd7f55, 0x37e63564, 0x2004501e, 0x2c16706a, 0x1d2278d2, 0xaedb51a2, 0x0bd721dd, 0x36bd3339
.word 0x481f9244, 0xf40eb270, 0x87208b37, 0xe98fd01f, 0x59b3c820, 0xec86a3a4, 0x5d359818, 0x4bb1c667
.word 0xe6615e66, 0x57091c56, 0x3fec2210, 0x4030f56d, 0xa8c9f87b, 0xbd982c21, 0x31a375c5, 0x142996e0
.word 0x210047ad, 0x8ed4aa4d, 0xe6cd8c3b, 0x562d3870, 0xd57030d0, 0xf3587138, 0x53199dfa, 0xb9f2727e
.word 0x75c65256, 0x4370fd6d, 0x133a974e, 0x0cd1a7ad, 0x4caed937, 0x1a915b82, 0xfefaaa8d, 0x8f044323
.word 0x8a0dcc88, 0xa397f973, 0x10e58773, 0x00a34c03, 0x3938590b, 0x39408c7c, 0x354438c3, 0x14e86fb7
.word 0x84f530a4, 0x15c472e3, 0x726df473, 0x119e2b4d, 0x6e1c170d, 0x88a111d1, 0x8af35473, 0x5e440908
.word 0xc425e19b, 0x72d3d780, 0xb472261d, 0x6f979840, 0x70a00b80, 0x1f3cd3ac, 0x7acb69dc, 0x5dfed219
.word 0x409c5bdc, 0x3c301b70, 0xb9109e4c, 0x8acc53c7, 0x868ecdbc, 0xd5faa258, 0xf33492f6, 0xa4b32301
.word 0xa0b2f0d2, 0xe6975d96, 0x96f16b47, 0xa3d26a23, 0x9310568b, 0x4133df4e, 0x77d67928, 0x0e8445c0
.word 0x69bbe3a2, 0x02207a6c, 0xe056adcd, 0x4ab37e3d, 0x7b4d8c54, 0x40b1e98d, 0x5030f89b, 0x7cbce166
.word 0x7cf95992, 0x7cdf904b, 0x53707b86, 0xf3a7a2f7, 0x9d7af67a, 0x3486ef5f, 0xceee23f8, 0xbd6e5850
.word 0x6e954fc0, 0x5f5e79a2, 0x6d90fee8, 0x1c6f2043, 0x567d4d60, 0xe61c7a4f, 0x9db6d44b, 0xa0372399
.word 0xd1bd3dcf, 0xa3c1b254, 0x0289cbbc, 0xe32e9a24, 0xae943a80, 0x06e95f81, 0x3565ed58, 0xa82ff2cf
.word 0x99b5c568, 0x58181d7f, 0x75a1f6b7, 0xcf753a29, 0x05b204c8, 0x81e92e70, 0x1e5601a3, 0x4b33fbdf
.word 0x14958b37, 0x5a6469a8, 0xe4349807, 0x23db997a, 0x3881ba55, 0xec70b1f7, 0xade847fe, 0x7854a8bf
.word 0x4afbc5de, 0x8c2650fd, 0x510c7c4e, 0x7e0756e0, 0x8097fb9b, 0x9fa194fd, 0x402290ca, 0xd22f5abf
.word 0x299a514a, 0xa6b1e56d, 0xf7451af3, 0x339a13d7, 0xe7b0e844, 0xa9feabaf, 0xb7024fad, 0xe3401bd6
.word 0xba88e316, 0x4446f298, 0x771767ed, 0x7dd5e0b9, 0x91720a6c, 0xc4c27700, 0x4e93b842, 0x34ce7926
.word 0x8283a11f, 0x6b7fed66, 0x52196e2b, 0xcf889a4e, 0x235427c9, 0x8162a5f0, 0xa1f060dc, 0x3630c6c1
.word 0x72556e0e, 0x354839d4, 0xb5da401b, 0xc7838d2d, 0x41f92275, 0x50d8c030, 0xd612f589, 0xcdcc8a5f
.word 0x4d955580, 0xe0c80122, 0xa278fb38, 0xcf525743, 0x21571623, 0xe2d8bd13, 0xa465f97b, 0x10220de5
.word 0x7b56a2b6, 0x7121b038, 0x07082961, 0xd52b748d, 0xb9d693d4, 0xf43ed20f, 0x6fddde2d, 0x843af440
.word 0xe5ee8589, 0x3006ab64, 0x9fe5fc31, 0x224cfb99, 0x66bb24aa, 0x3118f717, 0x3b321450, 0x228a9ca7
.word 0x017b79b9, 0x56c291fa, 0x708e8ba1, 0x9f4faf65, 0xcc46f74f, 0x9ad40d6d, 0xb58718df, 0x05064e2c
.word 0xf6957a61, 0xc8a433ab, 0x98ef998c, 0x583bf846, 0x0c35041d, 0xb5d355a3, 0xe292317e, 0xa39703d7
.word 0x80d4934c, 0x2448d205, 0xae04bb8a, 0xfad40211, 0x6d553d86, 0x78b19a99, 0x5533dc41, 0xd0756893
.word 0x3264efed, 0x7efea706, 0x74c71796, 0x51af9062, 0x28b6a182, 0x319423a2, 0xbe6d4d21, 0x9dace882
.word 0x6f3bc075, 0xeb1e2f89, 0xf8ca5470, 0x8638e23d, 0x427b9678, 0x1e6852a5, 0xd778fe42, 0x7744f977
.word 0x9cc287e9, 0xa239a6a8, 0xc1b8cc49, 0x92e92b4c, 0xcb965a34, 0x6396e236, 0x495a9ff6, 0x229d87be
.word 0x9f15571d, 0xf8becd7a, 0xe57b473a, 0x8871ba0c, 0x87f48561, 0x9c673c46, 0xeeafa9d8, 0x771b2fb4
.word 0xdfda8ff7, 0x818cda7f, 0xf581d88e, 0x48cfd07a, 0x439f2ed1, 0x16bedc82, 0xd0f193d5, 0xf4a38e0e
.word 0x73300eee, 0x9f6c14ba, 0xa8b52a71, 0x79801fdc, 0xdcc0f06c, 0x51476910, 0x55c90864, 0x55029796
.word 0xd8fb0b7e, 0x674bfb41, 0x90f7ea23, 0xb3ef366e, 0x2f4c586b, 0xfc94e294, 0xd2a502dd, 0x7aa269a2
.word 0xae3ff7b5, 0x75043c1e, 0x54d0f64c, 0xbf61283a, 0xdb377f6b, 0x572f6e46, 0xfb3e297e, 0x075529c4
.word 0xde100d46, 0xa46fdf86, 0x1bd9945f, 0x9ec93b21, 0x367c4d70, 0xb894adb8, 0x5ccffb93, 0xb303695c
.word 0xb4474d9d, 0x2b859ba1, 0xc98b8afe, 0x45834c8e, 0xca44301c, 0x4f5b6821, 0x018cd485, 0xdaa79e04
.word 0xccdeed38, 0xca75dde1, 0x68be07d2, 0x0715e82b, 0xe2c03b09, 0x2195bba6, 0xe413b774, 0x172b02d2
.word 0x853e894a, 0xbd0c7099, 0x1058f2ee, 0x33581872, 0x3ef7d9ee, 0x3c6c0d5b, 0xa42a703c, 0x73e6d078
.word 0x828f1136, 0x23110e46, 0x760b415d, 0xceb3b51d, 0xcb1dcae2, 0x5f5e4f64, 0xfdcd97b3, 0x067f0642
.word 0x17d62965, 0xc18bd6f1, 0x1b37651d, 0xf18bfb10, 0xf60ad634, 0x772c1578, 0x93b0c5f4, 0x2148ea04
.word 0xfc2dbe67, 0x9aaf4476, 0xa484338f, 0x44bc450b, 0x98012756, 0x75728636, 0x02d23db2, 0x046975fc
.word 0xfc6e0a2c, 0x306bb685, 0x4d155411, 0xfd906d38, 0x11ed2fa1, 0x17f6820a, 0x731f6510, 0x86081738
.word 0x3db86d7a, 0x80054e23, 0x51a62e0e, 0xb35dd974, 0x67584039, 0xb75cc776, 0x1cdde265, 0x90f396f0
.word 0xc04dfa14, 0x3233a0ab, 0xeb6f7099, 0x14e22787, 0x2d076ed5, 0x18903fc2, 0x2646bce0, 0x84797603
.word 0x5614224c, 0x95459e42, 0x6bac0f19, 0x943dac36, 0x8098a5e6, 0x89573a2e, 0x10f9c1d8, 0xf29d81dc
.word 0xf055ad1b, 0xb72745b0, 0xa08d65c8, 0x7c9454ec, 0x9f6d8dee, 0x7afa8588, 0x729c82a8, 0xe728e0c4
.word 0xc338d2e9, 0x6016cc45, 0x1369f268, 0x1a957a10, 0x9b86e4e1, 0x276d7357, 0x8f42b397, 0xdc8abea4
.word 0x64c07bea, 0x3162b219, 0x4b30d938, 0x2f2e72b6, 0x2f2a7ff7, 0x3cf24864, 0xd0b250ca, 0xed55c181
.word 0xae2bc6d2, 0xc7723459, 0xbfcbdd48, 0x30505bd0, 0x9f21c959, 0xbc0d9268, 0x333b2a0c, 0x0b656ef4
.word 0x8f74ab4f, 0xcde14453, 0xd6a71483, 0xd262b8e8, 0x847067fc, 0xfdab0843, 0xa8ddef08, 0xb7cb4547
.word 0xddb783dc, 0xac4d63a9, 0x4931110c, 0xdd3f8576, 0x5baad144, 0xfd76072b, 0x2f88a363, 0x07f128f3
.word 0x6aa721c3, 0x779350c2, 0x8ac8279f, 0x2d52dc7b, 0x3166ad0b, 0x410f8de8, 0xfa7971c3, 0x18a73704
.word 0xe9c572d9, 0x7cc37d95, 0x0848c96a, 0xfbeaea73, 0x15c7522d, 0x2aeb741c, 0xe8aa8f29, 0x4e7250b0
.word 0xfbc9b42d, 0x41792a2b, 0xf3ca08b4, 0xa45fbecc, 0x4556aff0, 0x6815348b, 0xda2e73bf, 0xdc45b3ba
.word 0xe61e5742, 0x88d45d47, 0x0688d0ea, 0xe53316a5, 0x80029c98, 0x9dddeb73, 0x86d52b21, 0x86b0917e
.word 0x059beedc, 0x1aa95c2e, 0x2e4e2849, 0x34fc51b9, 0xb27af8f1, 0xd7f51cf1, 0x1bb1b225, 0x0395665d
.word 0x29561663, 0x41681391, 0x9ffcc440, 0x9e6bc048, 0xcc47c424, 0x4497155e, 0xea8a872b, 0xe4b621c4
.word 0x5037b68e, 0x4b9c2225, 0x5da75715, 0x8b6e573b, 0x5cec9b42, 0xb579a474, 0x2ed928cb, 0xe0943010
.word 0xd1020aab, 0xc0d138e0, 0xd30ee63e, 0xf4f03faf, 0x2ab23e23, 0x09c6c7da, 0x477974b7, 0x18ed6039
.word 0xee8146f5, 0x84d3e231, 0xa2d2c914, 0xe0648dde, 0xcd6e56eb, 0x237ab2bf, 0x63df646e, 0x9ab70228
.word 0x62bdbb96, 0x91d57644, 0xde430e22, 0x41fe64c6, 0x6a0d0e23, 0xe2894d42, 0x63f17796, 0x0016d0b5
.word 0x06021926, 0x890645b5, 0xd1f44193, 0xb75186da, 0xe1107432, 0x9333f4d0, 0x603cafe0, 0xcadb7dd1
.word 0x7bd7c4ab, 0xe7a45757, 0x49c3e3fd, 0xd504f5c6, 0xc5dcf0cf, 0xd4387a5d, 0x27659098, 0x6144b571
.word 0x3b07b77d, 0x9ad3b6ac, 0xfda10d1c, 0x5fe5376e, 0x7bd074f5, 0xb4478be5, 0x4dcf1ea2, 0xf2e1b2d4
.word 0x37024012, 0x02648a78, 0x6190f40e, 0x75aed576, 0x43030a2f, 0x8dafcb12, 0xc76b4ba7, 0xd88e9081
.word 0x3c6de4e9, 0xcea045b6, 0x26e1e950, 0xbab08679, 0x0a60912c, 0xa72c3c80, 0xf1fbf20d, 0x302f31c5
.word 0x34b53c1d, 0xf219d370, 0x395ead1b, 0xac293e88, 0x5ecb26cf, 0x436bfaa6, 0x9a53eb99, 0x7ec77869
.word 0x508c9a5b, 0x51114351, 0x655fa992, 0x54443e13, 0xa9069d0f, 0x05ba2dae, 0x46af833e, 0x0854209e
.word 0x2f4551cb, 0x2420ca7c, 0x88302031, 0xdd93bf59, 0xe6ef5b57, 0x3512d897, 0xbb012819, 0xdb106457
.word 0x6ede05e8, 0x1cb9e97c, 0x67f212dd, 0x6197bda2, 0x32bc83be, 0xeba6dda6, 0xf40ad4a3, 0xa9fe6c0e
.word 0x66d9e498, 0x26b96456, 0x486aac28, 0x23aac1c2, 0x0c260608, 0xa98e3de8, 0xe3d900a7, 0x28d3a221
.word 0x4a7e8e71, 0x603dfc98, 0x0794bd16, 0xef0b2ce9, 0x88779402, 0x79d1cec3, 0xcfc4e98b, 0x9e79e59b
.word 0x3ec54f43, 0x74364c25, 0x6617edc5, 0x5507105f, 0xd8f8e296, 0xf6efa8c1, 0xb4a74fb5, 0x31649682
.word 0xaa815617, 0x69c2631d, 0xaabf7896, 0xdeae9498, 0xac402272, 0x8c4749ca, 0x217e5bd6, 0x5c7d59f3
.word 0x93c682a8, 0x8c13cc19, 0x1aade7f4, 0x2ccd11ce, 0x87e6ba07, 0x5992edb0, 0x9522fa1c, 0x42bf3bb8
.word 0x5dfb5b4e, 0xb96236db, 0xa5de3cba, 0x3419898c, 0xa14d47bd, 0x4f7c52da, 0xc5550da3, 0x96c7b628
.word 0xaf6f0b13, 0x457ef926, 0x119e13eb, 0xd46175fc, 0x84e58b91, 0x24e78576, 0x2220ca33, 0xd108d890
.word 0x48feeaca, 0x662153cd, 0xe097b085, 0xc286b20b, 0x3221935c, 0x7e56b206, 0x91345cd7, 0xcd4dc139
.word 0x210aae3a, 0x8a62a86e, 0x37aa65b3, 0x534ddb6d, 0x616bf711, 0x76f72980, 0xd042bd16, 0x333099a6
.word 0x72f32ac6, 0xb10bbaa7, 0xdfce1e60, 0x450c3d5e, 0x2839f3d9, 0x10ab2d1f, 0x0dc68da5, 0xdf381797
.word 0xf4809ae3, 0xc0375823, 0x9c51b772, 0xeffcdb6d, 0x82770780, 0xba051a32, 0xaf36a1e9, 0x724d2335
.word 0x70f7ae51, 0x5b13119c, 0x9205cc8a, 0x7c3e3d59, 0x116fcbb8, 0x5b9453c4, 0x46f3c50b, 0x77bac41a
.word 0xdb9c4b89, 0x8e39bebf, 0x71e8c5d1, 0x03421d41, 0x60bfbcb1, 0x68922002, 0xc2703bdf, 0xdb95e6ba
.word 0xf5661e13, 0x844938e2, 0x21d88197, 0x59b4bcc3, 0xa2b69bc9, 0x22e01a1a, 0x68e63457, 0x9d550935
.word 0x0c3cf009, 0x914c8650, 0xc3b6fa57, 0x2bd45337, 0x831f3ffb, 0x532965cf, 0xbff906c7, 0xa03ebcf0
.word 0xee976dbf, 0x9de7332b, 0x1fe8d8f5, 0xfeba4c07, 0x06fee977, 0xf90e417a, 0xd2d116b0, 0xaff4e999
.word 0xa9632bb8, 0xd5859572, 0x06c7b15a, 0x8352c735, 0x536eed53, 0xfd8fd837, 0xf519ae4d, 0x2525ec84
.word 0xa9513bac, 0x97893200, 0x539fe293, 0x4d8f0eae, 0x045f054c, 0xdfce1974, 0x8d113e47, 0xd7ad0eb5
.word 0x71a5a14b, 0x0a8030e1, 0xd296a321, 0x73554423, 0x99b7666f, 0x67c2b4ee, 0x287fdfd2, 0x0c38162a
.word 0x4b2d21df, 0x0244325a, 0xa91d5bef, 0x71e37749, 0x63663760, 0xe870f95f, 0x46e165f8, 0xf116230c
.word 0x6f91586d, 0x47095e12, 0x22015bd7, 0x2c4b2b5b, 0x6c23a8be, 0xe73f6596, 0xd22a6905, 0x3da7d5d0
.word 0xe6dbbadc, 0x13fb4cf9, 0x760c5d4c, 0xea7f6b72, 0x0ff695ea, 0x3cd107c3, 0x28d9dc30, 0x44d48e5f
.word 0xbbe994a2, 0xf9fdc7dc, 0x59f2a8aa, 0xca51e12e, 0xcb7e95f0, 0x2a2187f8, 0xa3ab681b, 0x4c548d6b
.word 0xdabcc31c, 0x9978e877, 0x5da597c3, 0x588a06c4, 0xd8568df1, 0x4a69622d, 0x8a99764a, 0xc12731c4
.word 0xed495bfe, 0x913d41e3, 0x9f30175b, 0x609da2c3, 0xd09bc785, 0x1e650165, 0xb2abba65, 0x513bf894
.word 0x4a18c115, 0x56a0871f, 0x644e1719, 0x08c242f6, 0xe572ae78, 0x5fc82aa0, 0xed705130, 0xcc2e9763
.word 0x569f17b4, 0x467326c9, 0x5d1f7396, 0xe4530c4c, 0xa95cdafd, 0xd17b327a, 0x228bd8c0, 0x03a69fcc
.word 0x6aa4f722, 0x46f7630d, 0x0b40b6f3, 0xcc347b9e, 0x8b90e31a, 0x51e32231, 0x1213c06a, 0xbfbbf716
.word 0x241ae6c7, 0x77a5a03a, 0x13ea415f, 0xd5d1899b, 0x3bf9b353, 0x86a4f7f7, 0x05580f6b, 0x3622922c
.word 0xa097c178, 0x68a2f80f, 0xf288e21a, 0xfeb1a002, 0x0c74108d, 0xe402c12b, 0x3117bbcc, 0xf8224763
.word 0xb606552c, 0x7821f308, 0x444d8f8c, 0x64b2cb48, 0xaa1bc111, 0x9324e52b, 0xc1ef92e5, 0xebba432d
.word 0xf9507ced, 0x6e13a1f4, 0xb50bb88d, 0xd9458db8, 0xfa526110, 0x1810e631, 0xbfaeb01f, 0xa57799d9
.word 0x1b6880da, 0xe5749649, 0xbba7e3c6, 0x8e951df4, 0xb745df69, 0x31f505ad, 0x4f2deb02, 0xac3477f8
.word 0xbc0c4f23, 0xa9ddaba8, 0x5f6db712, 0x11557ac4, 0xdd1ae855, 0x4312c553, 0x3757b823, 0x036710e2
.word 0x9f968fe8, 0x3f41c84f, 0x0e2b6f87, 0xf1ce86b9, 0x0871700f, 0x86b53b6e, 0x43a40f89, 0x4caa9fc4
.word 0x2e334f9b, 0xafcc7383, 0xb4f0dda6, 0xf8eef1df, 0xa6e15bdf, 0xf9c176fa, 0xc2185c4d, 0xd30137e7
.word 0xd6811c8f, 0x1681f37f, 0xfdd3d55d, 0xfc44da61, 0x274f8daf, 0x834d7128, 0x8d06b6a7, 0x00659eb8
.word 0x751e82a7, 0xf5745e05, 0x06c495e8, 0x0299df66, 0xb62afe82, 0x6e2f19e0, 0xae5dc7c6, 0x80ac6323
.word 0x033806fe, 0xb71ce63a, 0xd990dab9, 0x6423fa4a, 0x384ecda2, 0xa9640fa2, 0x86e9b00f, 0x53144033
.word 0x0819c025, 0xdb5d5187, 0x653785df, 0x1ce00060, 0x44bf3034, 0xfb6df4de, 0x5b22f61e, 0x0e877d86
.word 0xe9d4955c, 0x965915e2, 0x919cc7e1, 0xd4fdda44, 0x5c16c6de, 0xb8445511, 0xd2ae8b2d, 0x652cdef4
.word 0x86e327d7, 0x6d7df391, 0x5de72eb4, 0x3c2f32b3, 0x8ad7e77c, 0x85c7f40e, 0x30e3d4ae, 0xe620b8b6
.word 0x650f1924, 0x88dc1fb9, 0x1da0c088, 0xb92a4bb0, 0xe3fd0f14, 0xe4572bd4, 0xece38283, 0xed66388c
.word 0x5242f3e3, 0x725685ba, 0xe7c1a4f9, 0xc0060fad, 0xcc08037e, 0xeac0b975, 0x56f5f573, 0x6b6c4bcf
.word 0x96dc3b62, 0xa8210f04, 0xa3949453, 0x338d8411, 0x84647e01, 0xd18aa2b7, 0xaae8d053, 0x3b4c948d
.word 0xb0cb5e32, 0xde020d13, 0x03b6bce5, 0x1cd37b7b, 0x2c56df2c, 0x4e49752f, 0x45b08b76, 0x0cc533bd
.word 0x103b80f3, 0x50d476ed, 0x8c92f7f6, 0x311b0481, 0x10725e42, 0xd8eea268, 0x8fa5f663, 0x68c4c4f3
.word 0x174bbc00, 0xbd74ea8a, 0x1caefdca, 0x5d246ae2, 0x6bfd192c, 0xd6d369e5, 0xc7e475fd, 0x6b9681d3
.word 0xfcbc1065, 0x3d30bb20, 0xa612d438, 0xa17f9003, 0x351c9e49, 0x4d5d37bb, 0xc93156a8, 0xbb732ac6
.word 0xca0cbee7, 0x5377dee0, 0x9ebf58d1, 0xcb632440, 0x7fcfcac1, 0xac48cdc5, 0x8d6c9a04, 0x1c30281a
.word 0x8bae303d, 0x84e9ce99, 0x3e3616cd, 0x88d61bca, 0xf1eaf133, 0x14946d9d, 0xc7c3a48f, 0xef05b5c7
.word 0xeb818e93, 0x4395a45f, 0x161d8df4, 0x1ea66c8b, 0xadf7345e, 0x5dba858f, 0xe1078816, 0x88a22e55
.word 0x7ba48965, 0x1f775f01, 0xbf5e8c0c, 0xef00905b, 0x853085f7, 0xa3ee1071, 0x3174c5b4, 0x1f0b72b8
.word 0xa1f0e85d, 0xd81bb2b8, 0x1d9d7f5a, 0xbaf31873, 0x01750f19, 0x92ed5576, 0x1334167d, 0xb6117794
.word 0xd818237b, 0x3bf84828, 0x058b2073, 0x451b6e26, 0xaa1ca25b, 0x0309502a, 0x106aceec, 0xc04413e8
.word 0x67235b39, 0x12f1f92e, 0x531de171, 0xd0101791, 0x9da06b1c, 0xfa62b23c, 0x93d629ae, 0xb5215a3d
.section .s_region_1,"aw",@progbits;
s_region_1:
.word 0x4de127c9, 0x728d869d, 0xac32bfce, 0xf4e77888, 0x1418ec92, 0x3d7a21ab, 0x031281d6, 0xdf9e2d5d
.word 0x21c43d43, 0xaad4595b, 0x35a0450e, 0x70aebc93, 0x1f7dc8b5, 0xad252dd1, 0x6871aa02, 0xbe5a6a5a
.word 0x69d2b467, 0xa53d3adc, 0x3fde51e5, 0x62c4f47b, 0xb02c0fcd, 0xca2ba8d4, 0x016e8f9e, 0x20a23730
.word 0x694b9d17, 0x311db5ce, 0xb998cb36, 0x4f3dfcf0, 0xd40439f5, 0xe3bb7f6c, 0xcbe977b7, 0xdad9131d
.word 0x1a8f6922, 0xa10bb6a9, 0xd8c52235, 0x7b7c788b, 0x4e0ac68d, 0x3347f502, 0x1a0f8821, 0x605f7e8f
.word 0x7747d8d4, 0x802f4f6c, 0x5c99978b, 0x13e8600d, 0x12710267, 0x36b64fb8, 0xd096c11f, 0x28a19fc1
.word 0xb7363531, 0x1cfb1a0e, 0xfd7cfe0f, 0x714e42b2, 0x318c0bea, 0xea8b939a, 0x1f84f407, 0x15303aa8
.word 0xe36ae3bd, 0x8f727294, 0x1062ac6d, 0xbb08b1d6, 0x61a7f61c, 0xe79767fb, 0x992e2fae, 0xf5dd6c0a
.word 0xcf1dad16, 0x152fbbe1, 0xbe4f4875, 0xa4d3cd67, 0x116716cb, 0xee67b6a7, 0x1290fb4d, 0xa0e4e497
.word 0x624c6c28, 0xca145936, 0xd9702d08, 0xbb72bcfa, 0xa8498468, 0xe0980a9f, 0x4e28424b, 0xdf9adb14
.word 0xabe803d4, 0xc0d034f3, 0x2108308d, 0x95e6251d, 0x3b3ffa8c, 0x3b217daf, 0x4cca990d, 0xb01c4b69
.word 0x2a35ece6, 0x18f7eb3c, 0xe627f920, 0x61217624, 0xe2f5941e, 0x49a56ee8, 0x8bfc2657, 0x2db2bb12
.word 0x90b31042, 0x85d2b9b2, 0x11fa9704, 0x2777a07d, 0x238480bf, 0x3a2bcc22, 0x204982ec, 0xc65d8396
.word 0xd0faeacf, 0x30e4bbdd, 0xd550031a, 0x47345166, 0x733b2414, 0x9ec73059, 0xe3cd52c2, 0xdd3e116f
.word 0x68b41a16, 0x3628deac, 0xfa7ac40a, 0xe0c22125, 0xa0e2eeef, 0xa746e4e2, 0x90f043f9, 0x15e52874
.word 0x6b2b6954, 0x4744062a, 0x9bd89481, 0xd5708f6e, 0x03ee45df, 0xf7ad9372, 0xb38d91a0, 0xa6ea1a24
.word 0xe88e77d0, 0x771898f5, 0xd0589e0f, 0x45765d84, 0x01b12e2a, 0xb6d34b24, 0x732808f6, 0x43132e45
.word 0xbb0d5e8a, 0x65363bd0, 0x507f905e, 0x067c55c2, 0xd4052e9a, 0x799bb8c5, 0x596ab3ec, 0x9be5f108
.word 0x0c9055b3, 0xf7ab6cc7, 0xb166ae63, 0xf3d678d2, 0x517d2ba0, 0xe35d61d5, 0xdc4febe5, 0xb22ba962
.word 0x62982682, 0xba644f5d, 0x62beeecf, 0x94cc04a6, 0x43ced2fe, 0xe1a2b1de, 0x37a6a283, 0x855cd326
.word 0x63d46153, 0x76f26ac4, 0x2ac61344, 0x80f7a982, 0xd6a86b28, 0x328e2efa, 0x8b964901, 0x2de3464e
.word 0xd613086c, 0x480a5f18, 0x892a358b, 0x7efc9def, 0x2d547291, 0x697503b7, 0x85edf07c, 0x17132629
.word 0x267756a4, 0xa96b1e75, 0x996c672d, 0xe3a57ff2, 0x3847ae42, 0x23f62f6e, 0x92438ca3, 0x73a1710f
.word 0x45c653a0, 0xc718eb63, 0xda7d83b5, 0x8f497d55, 0xd63280cf, 0xb6e7165d, 0xfa48623d, 0x6b821175
.word 0x6f7f00cd, 0x6129cbb5, 0x14a421ec, 0xf868267c, 0x52f7148d, 0xb29aa399, 0xc4b77568, 0x40f45cdc
.word 0x9b962b42, 0x33dec627, 0xc24ddee1, 0x25fdaee7, 0x87620c9c, 0x80f75d96, 0x91b43aea, 0xb7484b58
.word 0x44ae2171, 0x2f4849b5, 0xe9be696c, 0xebdcecc9, 0x31d3cb3a, 0x56f9f1ae, 0x22df319f, 0x68a7c744
.word 0x9b281cb3, 0x57d13ab1, 0x4a828eb6, 0xb67f4c4d, 0xb999848c, 0xebf52e4d, 0x8c140655, 0x10d03f06
.word 0x03484500, 0xf500c83b, 0xb2c1384a, 0x8db03f43, 0xc6367afc, 0x3947fdc9, 0x871df05e, 0x940d2a90
.word 0x561f28bb, 0x2d3bb9c0, 0x5f01634a, 0xb45e16d8, 0xe81ccb8b, 0xe3fb5077, 0x169a8fe2, 0x04f973d0
.word 0x17cd161d, 0x91240e93, 0x98175e32, 0x63d28ea7, 0x88eaa2ad, 0x88f5c996, 0xa56d25b1, 0x5c945e17
.word 0x18b2b200, 0xdd3e4184, 0xb562112f, 0x38e3350d, 0xea4185f2, 0xc7cb3ba2, 0x60d47734, 0x4c151f8d
.word 0xb4276aa1, 0xc065686b, 0x90f5b898, 0xfa5b9bb6, 0x490ff4c6, 0x4bce9ef9, 0x62a61fbd, 0x17a086dc
.word 0x0f264bac, 0xd136e74e, 0x86711dfc, 0xb96fa08d, 0x8c888756, 0x001733e6, 0x461553c8, 0x9a30317b
.word 0x48742b0c, 0x605aa806, 0x807f9098, 0x0b45527e, 0x4cae7ad4, 0xefe77446, 0x23a7ee47, 0x1229631a
.word 0xdd18205a, 0x7de2f844, 0x63629003, 0x5050a087, 0x016d30bf, 0x032edd0e, 0x637ab00e, 0x9197e783
.word 0x465a46b3, 0x0a89f996, 0x6b89b45a, 0x9efbb12d, 0x6f7e2b40, 0x5a202add, 0x08abb850, 0x968ee269
.word 0x36e2980a, 0xe18e9106, 0x52b34d95, 0x2f716252, 0x06621892, 0xf6ccbf99, 0x70cdc2e1, 0x781b4689
.word 0x04def831, 0xa3cfed4d, 0x77a7c0e3, 0xae7376dd, 0x89ad56e7, 0xe65ae861, 0x86e19440, 0xc76a3214
.word 0x5a131a44, 0x36fdf6d6, 0xaa76f2e4, 0x78f50a1c, 0x18455aae, 0x17914d21, 0x5fc8f810, 0xa6903787
.word 0x4caa1c65, 0x6d09386c, 0x9587bc66, 0x2f9d5e21, 0xeb926c73, 0xd2fc49ad, 0xec29ddb9, 0xd093fab4
.word 0x2b21d288, 0x16748c7b, 0xefb2f054, 0x42108ecc, 0xa0f18cb7, 0xe5ddc4e0, 0xebded144, 0xefe14bd9
.word 0xf93c9ec0, 0x40ce1367, 0x3403e6a2, 0x002c4579, 0x18837ca3, 0x25429b28, 0x05ab1380, 0xfa8abc00
.word 0x31604e71, 0x3c397b47, 0xba8ed5b2, 0x08890ad4, 0x0be7f766, 0xc251529d, 0x1b34b87d, 0x74756e7e
.word 0x7bfd7825, 0xad085e51, 0x7cf1af85, 0x71a69b74, 0xbc3eade3, 0xc5c4d454, 0x625b06f2, 0xc6f7fcc7
.word 0x937011d3, 0x8e497b62, 0xf1d14a8e, 0xdc21ee00, 0x008c6ac7, 0x2f5da2dd, 0xd72fec1f, 0xb95b554d
.word 0x3ea1c447, 0x3fbd8a35, 0x131e54c6, 0x98e860aa, 0xa9895109, 0x48fbf42e, 0x7bc70b17, 0x6e170a2a
.word 0xd5d404f3, 0x60c09a73, 0xa03273ae, 0x017a93fa, 0x55b1a6ae, 0x6f9dc55c, 0x68748590, 0x4ee268f4
.word 0x9b6c2365, 0x6464b442, 0x6d767733, 0xe5860acf, 0xf952694b, 0x7089073e, 0x38d95ec3, 0xc072cfd6
.word 0xfe78ed69, 0xcb38cc6f, 0xc74b906b, 0x1a3fabdf, 0x3e03222c, 0xde035ff8, 0x4fe58962, 0xa387bd3f
.word 0x43230055, 0x31b66843, 0x082b25a7, 0xcc67e0e2, 0x41157f1b, 0xc52abdba, 0x3d441b5c, 0x772916cd
.word 0x3de22052, 0xe6fc6b33, 0xde1e0b0c, 0x2a7d56bc, 0x47fc2a74, 0x22c6a849, 0x5deee14e, 0x320e17b3
.word 0xb8d91565, 0x528f2668, 0x619843eb, 0x82a5b8da, 0x32a73995, 0xcbe1eedf, 0xa838086b, 0xeec0a8a2
.word 0x24b87a5b, 0xeabde553, 0xc3110aba, 0xd0c0526b, 0x6a227ccf, 0x71fc1670, 0x463e735a, 0xaf360804
.word 0x561a332c, 0xcb3004c9, 0xf447b5ca, 0x8b7c2e8a, 0xe93e858a, 0xe8e48d61, 0x77882041, 0x08ca331b
.word 0x127b9c6a, 0x0425b9bf, 0x3dacf7df, 0x877a7b2e, 0x4fc545f8, 0x6832a6b5, 0x7927a52d, 0xce44d59a
.word 0xdbf18201, 0x336d9f71, 0x01dfb1a2, 0xc04428c2, 0x0334f9d8, 0x6f21ea6d, 0x7af8a149, 0x08e69ad8
.word 0xeba0d5b3, 0x1dbf9903, 0x5548ccfa, 0x00dc27ca, 0x07e64eb6, 0xd98175e9, 0x90f6ec7f, 0x43975a4c
.word 0xb67976fb, 0x396d8467, 0x37e9f5a8, 0x05190ee2, 0x035c94c4, 0x4697911b, 0x8960de37, 0xda156fcd
.word 0xf73e73d3, 0x5298e89f, 0xab0abf2e, 0x36b351d3, 0x1580b6d3, 0x7a0e3570, 0x6c04fe31, 0xa948b22a
.word 0x29a4cdb0, 0x4fb88b22, 0x76acf5df, 0x3d323420, 0x4f266743, 0xe7533bc4, 0x1aba8e65, 0xc1ec2382
.word 0x465dd8af, 0x9b5f2ce8, 0xafdf71ac, 0x47c7c460, 0xb38ef532, 0x55b3535a, 0xce5205c1, 0x08fca144
.word 0x6f441f01, 0x1a4bded4, 0x9bba6344, 0xbd30be50, 0x7c8fa7c7, 0xe28544fb, 0xd652ca71, 0x3c6f4acb
.word 0x4cc3b493, 0x96db4328, 0xbc0b940f, 0x2095395c, 0xc0249766, 0x258050a7, 0x18cac6a2, 0x1395c1e5
.word 0x703af781, 0xea9da2ed, 0xabbdb9b6, 0x89733cdf, 0x946be33c, 0x0d01a4ca, 0x6ea32704, 0xc234b937
.word 0xd80b4ac6, 0xbbf15616, 0xb1fa8615, 0x7bf31123, 0x52a2ef09, 0x29ece8a4, 0xd36b94f6, 0x328ab39e
.word 0x2d4166e5, 0x926752a2, 0x6b5d7bfa, 0x505bfe7f, 0x03e1ed16, 0xf56bc53a, 0x93aa5aea, 0xd28f18e6
.word 0x01977761, 0xf738c933, 0xb8f98eed, 0x374b0091, 0xf2893ebb, 0x32bde196, 0x19194a74, 0x5a19e2c9
.word 0x435d65f3, 0xfae1404d, 0x53ebc755, 0x8db0fe92, 0x7b807d38, 0x756f4410, 0x73070ef1, 0xf5f4a8f4
.word 0x9cce7044, 0x87c3c91f, 0x76b9228d, 0x25b2c3bf, 0xf1ec4810, 0xb50b5c7d, 0x2b1be8bc, 0xa4438541
.word 0x2d18dab6, 0xbe12f049, 0xb2357ccf, 0x22bdb581, 0x4727b0a9, 0x228a379c, 0xb8dcfc08, 0xb34278fe
.word 0x05e35353, 0x21f92bda, 0x46a2fadf, 0xa8b55538, 0x404e4a07, 0x94e2c82c, 0x5bcda824, 0x577dcefb
.word 0xdcdbb4c1, 0xc9413ba6, 0x908cea89, 0x12371bf7, 0xe6e76e39, 0x14ac33cf, 0xc23621df, 0x88fd4462
.word 0xd275bb56, 0x379eb8ab, 0x61af3b71, 0x85b26cc5, 0x72b6d164, 0x5d8f7817, 0xc3246bcb, 0x4715b582
.word 0x8f976b9c, 0xbf1fc00c, 0x067ef868, 0xfb33fe9c, 0xcc4a4c30, 0x7aa19565, 0xa512036d, 0xc7399229
.word 0xabb2b33b, 0xce0842bd, 0xb298d11a, 0x5122f091, 0x05823a9c, 0x6c81f217, 0xd2eea054, 0xd132fad3
.word 0x4e84b823, 0x7a064c9d, 0x2c4f64dc, 0x5c6648e1, 0xdf715647, 0x17b1785f, 0x456dc0bb, 0xa7962fe8
.word 0xd4a215a6, 0x2c2b91b0, 0xa85f2eb5, 0x034dde42, 0xbe1518fa, 0x11fe38ca, 0x6c622e8b, 0x847ad7fd
.word 0x3d365522, 0x4e837e41, 0x68fd4ae8, 0x0600b2da, 0x63ed53b8, 0x3847676c, 0x8a16e742, 0xca5b7ceb
.word 0xbb26571c, 0xa3a44320, 0x66d25245, 0xd969ddf1, 0x8f71d4de, 0x5ce85285, 0x583d947a, 0x0828e5b4
.word 0x0818a968, 0xd79f9dbb, 0x6ee70f55, 0x47b55b22, 0xd57403e8, 0x83fbfc67, 0xdb425441, 0x71d86079
.word 0x784f662a, 0x2d912613, 0x03edbc55, 0x6c34d088, 0x1d380cdd, 0xc721e8c6, 0x4e877a11, 0xf6e00453
.word 0x4e61df8b, 0x1958e4cb, 0x172e355d, 0x32da3fc1, 0x0405007b, 0xe00078ae, 0xde345a3a, 0x40d4f42c
.word 0x99b27b1f, 0xe652b18d, 0xecee46e0, 0xae0bbc6c, 0x6ca538a0, 0x33ef90b7, 0x26a05a9b, 0x802c21ec
.word 0xeef02297, 0x98abe56c, 0x6e64737d, 0x2c5fdb1a, 0xfd94b3d9, 0x15192adf, 0xa75d4096, 0x8eefef5f
.word 0xf24118cd, 0xf9245cdc, 0x39e46dbc, 0xb11f6b71, 0xcc8d4563, 0xe9c21a3c, 0x7d9a1702, 0x82f97de1
.word 0x0b2397d0, 0xbf769b98, 0xce09e566, 0x69e5f186, 0x5c26dddd, 0x7fa9b7df, 0xabb04585, 0x8b624971
.word 0x03c5bfe1, 0x8c839945, 0x1fa57dd0, 0x34d2108f, 0x38816603, 0x1891c6f2, 0xb2fc68c8, 0xad2df545
.word 0x82b82adb, 0xa848c4ca, 0xa1d6ae6b, 0xba934179, 0x9449c433, 0x825d54d5, 0x4196877e, 0xc8bcc006
.word 0xdf86bdfd, 0x6f870499, 0xc46b30c9, 0x6b1d047b, 0x9f1b9a17, 0x9da0786d, 0x83670015, 0xf6a05663
.word 0x0b08942e, 0x00e37bca, 0xbe74f9ba, 0x7e965d3d, 0xbf8d017f, 0x7596ed55, 0x6e7f6a2f, 0xfc6b62bb
.word 0xa05a95f8, 0xeaabcdc2, 0x26fdebd3, 0xc1f4cf58, 0x1cf31f15, 0x8fe4e54a, 0xa1fe2fa3, 0x91b04f54
.word 0x44eac20c, 0x2cd2bfb8, 0xe2f5787f, 0x24d76ffb, 0x53898f33, 0x9d0521ee, 0x0172b333, 0x23990588
.word 0x8ea0e519, 0xb26337fb, 0x8d727968, 0x2f865f66, 0xbc2a7195, 0x3490f432, 0xdee0be32, 0x5b2bf563
.word 0x772a3728, 0x66bb3a71, 0x92f5c517, 0xc381a4e8, 0x377583a6, 0x6eeb3a3a, 0x47ab0a47, 0x921b399d
.word 0x84c19ba8, 0xdbc2da0d, 0x71e9fb8f, 0x02a5bb72, 0xc188b339, 0xec7cf949, 0x92abe63b, 0xd4189234
.word 0x137a65a4, 0xd5147e6f, 0xd550354c, 0xb335dca4, 0xce0a0da8, 0xaf2c5d9d, 0x80b59fac, 0xbd701b66
.word 0x60f90384, 0x9b5c6001, 0x33166fab, 0x3da9172a, 0x6f98cf8c, 0x84214fb2, 0x029df612, 0x19340fdd
.word 0x8979f526, 0x4a81dfbe, 0x76ef09ad, 0xb05df454, 0x822ca224, 0xe738d5c1, 0x4d276c96, 0x41e05acc
.word 0x8efe7d21, 0xa2293439, 0xd9286ec1, 0x14630790, 0x839202b4, 0xd4b71919, 0xacc9d373, 0x2cb53a23
.word 0x94ce2396, 0x3ac50007, 0x620f5bfd, 0xd8c55297, 0xc2e302de, 0xfa8ea8f2, 0x175347a9, 0x9023788f
.word 0x808fb938, 0x082f5d1f, 0x17ba7f73, 0xa5697820, 0x20b88c62, 0xa36a72f2, 0x99728a52, 0xec310ce5
.word 0x400d1562, 0xe2610e4d, 0x68dd5675, 0xd2adabd0, 0x26270578, 0x4abecc54, 0x353196c8, 0xad1db277
.word 0x6564665b, 0xe110eb3b, 0x7f04c7eb, 0x3fc9671c, 0x616e83ef, 0x458024ca, 0x81641c6a, 0xbd044146
.word 0xf13bd772, 0x8585b943, 0xe9d9e797, 0x250b6270, 0xf81d0472, 0x7347f386, 0xb9bcf1f8, 0x1dc1fe59
.word 0x68320dcb, 0x9fbcf15d, 0x02a0a05b, 0x3fc25b21, 0xe14b4746, 0x620ce059, 0x3d74ad4d, 0x6c2c9f8d
.word 0x84486c81, 0x06c34a79, 0x65f956a9, 0xd55d8368, 0x113c31a1, 0x05a8c1a4, 0x50031fcd, 0x61e8b0e7
.word 0xa9553f02, 0x449aa885, 0x2576a3e8, 0x0b864243, 0x203b2499, 0x95edad64, 0x84cedde7, 0x8ecc48f9
.word 0x5868dc3d, 0x9c03443b, 0xc6fca5c7, 0x95a6e1fb, 0xcad415df, 0xeaa34316, 0xdd90098a, 0xad383312
.word 0x57664f72, 0x196124a3, 0x894a9bc2, 0xd02062d4, 0xb7c2ee89, 0x2839d9e1, 0x919173f6, 0x7b7cb670
.word 0x4932d5ee, 0xe130e15c, 0xe28333c2, 0x74ee8c05, 0x2b955e5c, 0x9df34d80, 0x8c0fbd8b, 0xfa8bf665
.word 0x2158cab2, 0x9c757f1d, 0xd9fcef20, 0xbb998a2e, 0xe31604b4, 0xe07854e9, 0xc9d1ddb9, 0xaf98194c
.word 0x2893ad86, 0x09b06f8a, 0xa45e3799, 0xe880fcf8, 0xaf90de90, 0x46cbe890, 0x91865aaa, 0x0c955d81
.word 0x4a669a9e, 0x371a5af0, 0xc4516e6d, 0x3d729d64, 0xb080e2bd, 0x6bc6e8f7, 0xa7ab931d, 0x78993677
.word 0xa056202f, 0x4b10fb7e, 0x99de094c, 0xeab87ec3, 0x9c1fd403, 0x5b0b004b, 0x1d1f0246, 0x94ba4c95
.word 0xd0827d10, 0x4077bb4e, 0xf3880e7b, 0x60db0440, 0x2f9890e3, 0x0b69faef, 0x665f22b6, 0x894a82ec
.word 0xe12714f0, 0xce6dfbf3, 0x53e5040d, 0x6fd0affb, 0x5a4d787e, 0x4d7df289, 0xbdc12229, 0xca043296
.word 0xab483ee9, 0xa0af4af2, 0x2b1121da, 0x6d9b1f06, 0xb8662e8c, 0x1ecd0cc6, 0xe2ce289c, 0x082c414a
.word 0x5d8db825, 0xd265bf2a, 0x895908f2, 0x221ef8c0, 0xb138d121, 0xe699bfb0, 0x0357f93e, 0xa0eae1fd
.word 0xc999ddb1, 0x2eba4abc, 0x278238ba, 0xc2c952c8, 0xf5c19189, 0x03b7fe1d, 0xadd6ebf0, 0x110cb9ea
.word 0xc424ba7e, 0x2873177b, 0xc5881af4, 0x129be2a5, 0x9cb8940c, 0xdf50fbb8, 0x21493786, 0x6cd12d41
.word 0x7ec12fa6, 0x12e74421, 0xe8c56627, 0x31d5b7cb, 0x41145928, 0x4a424ac2, 0x562715eb, 0xdf4eaa0a
.word 0xa635aabf, 0xbaf563d0, 0x3de61248, 0x9782a86d, 0x42845d16, 0x08539122, 0x01c2209e, 0x219d0edd
.word 0x69b4a600, 0x62c91d85, 0xa2e78b1d, 0x73dcea6f, 0x04858a54, 0x12ef1417, 0xd98e9ec8, 0xc1e25310
.word 0xbc7691ad, 0x1201b3bb, 0x317d303f, 0x1699480b, 0x9beed129, 0xb5029f1a, 0x9939db4a, 0x140ebe4a
.word 0x505a4d70, 0xa346f735, 0xe2e9f1e3, 0xf500aae1, 0x91efa2f5, 0xb337eece, 0xcb430843, 0x37897995
.word 0xdf8fb426, 0xeb1599a6, 0x3a2221e7, 0x7472fa25, 0x211f30b4, 0x9b9c1fcb, 0x8cb828f6, 0xebcc2604
.word 0x27e865c7, 0x5c639c00, 0x41341083, 0xd7af2831, 0xd74eb022, 0x43c4786f, 0x81459a58, 0x6a40180c
.section .kernel_stack,"aw",@progbits;
.align 2
kernel_stack_start:
.rept 4999
.4byte 0x0
.endr
kernel_stack_end:
.4byte 0x0
