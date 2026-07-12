; func_ov002_02281c68 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern data_ov002_022d0174
        .extern func_0202b824
        .extern func_ov002_021afff0
        .extern func_ov002_021c8860
        .extern func_ov002_02280b30
        .global func_ov002_02281c68
        .arm
func_ov002_02281c68:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x230
    ldr r2, _LIT0
    mov r3, #0x0
    mov r4, r0
    cmp r1, r2
    str r3, [sp, #0x4]
    beq .L_3c
    add r2, r2, #0x1
    cmp r1, r2
    beq .L_10f0
    ldr r2, _LIT1
    cmp r1, r2
    beq .L_1148
    b .L_1258
.L_3c:
    ldr r8, _LIT2
    mov r7, #0x1
    ldr r5, _LIT3
    ldr r0, _LIT4
    add r5, r5, #0x44
    str r5, [sp, #0x58]
    ldr r5, _LIT3
    add r0, r0, #0xda
    add r5, r5, #0x47
    str r5, [sp, #0x6c]
    ldr r5, _LIT3
    str r0, [sp, #0x8]
    add r5, r5, #0x49
    str r5, [sp, #0x74]
    ldr r5, _LIT3
    ldr r0, _LIT4
    add r5, r5, #0x4d
    str r5, [sp, #0x94]
    ldr r5, _LIT3
    add r3, r2, #0x20
    add r5, r5, #0x51
    str r5, [sp, #0x8c]
    ldr r5, _LIT3
    add r0, r0, #0x98
    add r5, r5, #0x4d
    str r5, [sp, #0x90]
    ldr r5, _LIT3
    str r3, [sp, #0x18]
    add r5, r5, #0x50
    str r5, [sp, #0x98]
    ldr r5, _LIT3
    ldr r3, _LIT4
    add r5, r5, #0x54
    str r5, [sp, #0xa0]
    ldr r5, _LIT3
    str r0, [sp, #0xc]
    add r5, r5, #0x58
    str r5, [sp, #0x84]
    ldr r5, _LIT3
    ldr r0, _LIT4
    add r5, r5, #0x51
    str r5, [sp, #0x88]
    ldr r5, _LIT3
    add r3, r3, #0x3a0
    add r5, r5, #0x54
    str r5, [sp, #0x9c]
    ldr r5, _LIT3
    add r0, r0, #0x144
    add r5, r5, #0x55
    str r5, [sp, #0xa4]
    ldr r5, _LIT3
    str r3, [sp, #0x2c]
    add r5, r5, #0x59
    str r5, [sp, #0xb4]
    ldr r5, _LIT3
    add r3, r2, #0x49
    add r5, r5, #0x5e
    str r5, [sp, #0xac]
    ldr r5, _LIT3
    str r0, [sp, #0x14]
    add r5, r5, #0x59
    str r5, [sp, #0xb0]
    ldr r5, _LIT3
    ldr r0, _LIT4
    add r5, r5, #0x5a
    str r5, [sp, #0xb8]
    ldr r5, _LIT3
    str r3, [sp, #0x34]
    add r5, r5, #0x78
    str r5, [sp, #0xc0]
    ldr r5, _LIT3
    ldr r3, _LIT5
    add r5, r5, #0xc9
    str r5, [sp, #0x7c]
    ldr r5, _LIT3
    add fp, r0, #0xf5
    add r5, r5, #0x58
    str r5, [sp, #0x80]
    ldr r5, _LIT3
    add r0, r0, #0x144
    add r5, r5, #0x6f
    str r5, [sp, #0xa8]
    ldr r5, _LIT3
    add r3, r3, #0x210
    add r5, r5, #0x78
    str r5, [sp, #0xbc]
    ldr r5, _LIT3
    str r0, [sp, #0x10]
    add r5, r5, #0x97
    str r5, [sp, #0xc4]
    ldr r5, _LIT5
    ldr r0, _LIT5
    add r5, r5, #0x3e0
    str r5, [sp, #0xd4]
    ldr r5, _LIT6
    str r3, [sp, #0x44]
    sub r5, r5, #0x82
    str r5, [sp, #0xd0]
    ldr r5, _LIT6
    ldr r3, _LIT5
    sub r5, r5, #0x7e
    str r5, [sp, #0xd8]
    ldr r5, _LIT6
    add r0, r0, #0x12c
    add r5, r5, #0x3
    str r5, [sp, #0xe0]
    ldr r5, _LIT6
    add r3, r3, #0x25c
    add r5, r5, #0xb0
    str r5, [sp, #0xcc]
    ldr r5, _LIT6
    str r0, [sp, #0x24]
    add r5, r5, #0x3
    str r5, [sp, #0xdc]
    ldr r5, _LIT6
    add r0, r2, #0x20
    add r5, r5, #0x7c
    str r5, [sp, #0xe4]
    ldr r5, _LIT6
    str r3, [sp, #0x3c]
    add r5, r5, #0xd2
    str r5, [sp, #0xf4]
    ldr r5, _LIT6
    ldr r3, _LIT5
    add r5, r5, #0xf1
    str r5, [sp, #0xec]
    ldr r5, _LIT6
    str r0, [sp, #0x1c]
    add r5, r5, #0xd2
    str r5, [sp, #0xf0]
    ldr r5, _LIT6
    ldr r0, _LIT5
    add r5, r5, #0xf0
    str r5, [sp, #0xf8]
    ldr r5, _LIT6
    add r3, r3, #0x210
    add r5, r5, #0x100
    str r5, [sp, #0x100]
    ldr r5, _LIT6
    add r0, r0, #0x12c
    add r5, r5, #0xfd
    str r5, [sp, #0x104]
    ldr r5, _LIT3
    str r3, [sp, #0x40]
    add ip, r5, #0x4c
    ldr r5, _LIT6
    add r3, r2, #0x59
    sub r5, r5, #0xbe
    str r5, [sp, #0x78]
    ldr r5, _LIT6
    str r0, [sp, #0x20]
    add r5, r5, #0xb0
    str r5, [sp, #0xc8]
    ldr r5, _LIT6
    sub r0, r2, #0x77
    add r5, r5, #0xf1
    str r5, [sp, #0xe8]
    ldr r5, _LIT6
    str r3, [sp, #0x48]
    add r5, r5, #0x100
    str r5, [sp, #0xfc]
    ldr r5, _LIT7
    add r3, r2, #0xa5
    add r5, r5, #0x2
    str r5, [sp, #0x12c]
    ldr r5, _LIT7
    ldr r6, _LIT8
    add r5, r5, #0xc
    str r5, [sp, #0x124]
    ldr r5, _LIT7
    add r6, r6, #0x54
    add r5, r5, #0x2
    str r5, [sp, #0x128]
    ldr r5, _LIT7
    str r6, [sp, #0x108]
    add r5, r5, #0xb
    str r5, [sp, #0x130]
    ldr r5, _LIT7
    ldr r6, _LIT9
    add r5, r5, #0x13
    str r5, [sp, #0x138]
    ldr r5, _LIT7
    sub r6, r6, #0xa2
    add r5, r5, #0x27
    str r5, [sp, #0x11c]
    ldr r5, _LIT7
    str r6, [sp, #0x1a4]
    add r5, r5, #0xc
    str r5, [sp, #0x120]
    ldr r5, _LIT7
    ldr r6, _LIT9
    add r5, r5, #0x13
    str r5, [sp, #0x134]
    ldr r5, _LIT7
    add r6, r6, #0xd
    add r5, r5, #0x23
    str r5, [sp, #0x13c]
    ldr r5, _LIT7
    str r6, [sp, #0x1ec]
    add r5, r5, #0x42
    str r5, [sp, #0x14c]
    ldr r5, _LIT7
    ldr r6, _LIT9
    add r5, r5, #0x53
    str r5, [sp, #0x144]
    ldr r5, _LIT7
    str r0, [sp, #0x28]
    add r5, r5, #0x42
    str r5, [sp, #0x148]
    ldr r5, _LIT7
    ldr r0, _LIT4
    add r5, r5, #0x51
    str r5, [sp, #0x150]
    ldr r5, _LIT7
    add r6, r6, #0x33
    add r5, r5, #0x54
    str r5, [sp, #0x158]
    ldr r5, _LIT7
    str r6, [sp, #0x20c]
    add r5, r5, #0x5c
    str r5, [sp, #0x114]
    ldr r5, _LIT7
    ldr r6, _LIT9
    add r5, r5, #0x27
    str r5, [sp, #0x118]
    ldr r5, _LIT7
    add r0, r0, #0x3a0
    add r5, r5, #0x53
    str r5, [sp, #0x140]
    ldr r5, _LIT7
    str r0, [sp, #0x30]
    add r5, r5, #0x54
    str r5, [sp, #0x154]
    ldr r5, _LIT7
    ldr r0, _LIT4
    add r5, r5, #0x5b
    str r5, [sp, #0x15c]
    ldr r5, _LIT7
    add r6, r6, #0x7b
    add r5, r5, #0xc4
    str r5, [sp, #0x16c]
    ldr r5, _LIT3
    str r6, [sp, #0x220]
    add r5, r5, #0x3a4
    str r5, [sp, #0x164]
    ldr r5, _LIT7
    ldr r6, _LIT9
    add r5, r5, #0xc4
    str r5, [sp, #0x168]
    ldr r5, _LIT6
    add r1, r0, #0x3b0
    add r5, r5, #0x21c
    str r5, [sp, #0x170]
    ldr r5, _LIT3
    ldr r0, _LIT5
    add r5, r5, #0x3b0
    str r5, [sp, #0x178]
    ldr r5, _LIT8
    add r6, r6, #0x7e
    sub r5, r5, #0x26
    str r5, [sp, #0x160]
    ldr r5, _LIT8
    sub sl, r2, #0xcc
    sub r5, r5, #0x1a
    str r5, [sp, #0x174]
    ldr r5, _LIT8
    add lr, r2, #0x3ac
    sub r5, r5, #0xa
    str r5, [sp, #0x17c]
    ldr r5, _LIT8
    ldr r2, _LIT3
    add r5, r5, #0xc
    str r5, [sp, #0x18c]
    ldr r5, _LIT8
    sub r2, r2, #0x7f
    add r5, r5, #0x3a
    str r5, [sp, #0x184]
    ldr r5, _LIT8
    str r2, [sp, #0x38]
    add r5, r5, #0xc
    str r5, [sp, #0x188]
    ldr r5, _LIT8
    ldr r2, _LIT3
    add r5, r5, #0x23
    str r5, [sp, #0x190]
    ldr r5, _LIT8
    sub r2, r2, #0x79
    add r5, r5, #0x43
    str r5, [sp, #0x198]
    ldr r5, _LIT8
    str r2, [sp, #0x4c]
    add r5, r5, #0x3c
    str r5, [sp, #0x19c]
    ldr r5, _LIT8
    ldr r2, _LIT3
    add r5, r5, #0x54
    str r5, [sp, #0x10c]
    ldr r5, _LIT8
    sub r2, r2, #0x6c
    sub r5, r5, #0xe1
    str r5, [sp, #0x110]
    ldr r5, _LIT8
    str r2, [sp, #0x54]
    add r5, r5, #0x3a
    str r5, [sp, #0x180]
    ldr r5, _LIT8
    ldr r2, _LIT3
    add r5, r5, #0x43
    str r5, [sp, #0x194]
    ldr r5, _LIT8
    add r2, r2, #0x2a
    add r5, r5, #0x4a
    str r5, [sp, #0x1a0]
    ldr r5, _LIT8
    str r2, [sp, #0x64]
    add r5, r5, #0xbc
    str r5, [sp, #0x1c0]
    ldr r5, _LIT8
    ldr r2, _LIT3
    add r5, r5, #0xdd
    str r5, [sp, #0x1b8]
    ldr r5, _LIT8
    add r2, r2, #0x44
    add r5, r5, #0xbc
    str r5, [sp, #0x1bc]
    ldr r5, _LIT8
    str r2, [sp, #0x5c]
    add r5, r5, #0xbf
    str r5, [sp, #0x1c4]
    ldr r5, _LIT8
    ldr r2, _LIT3
    add r5, r5, #0xe2
    str r5, [sp, #0x1cc]
    ldr r5, _LIT8
    add r2, r2, #0x2a
    add r5, r5, #0xfb
    str r5, [sp, #0x1b0]
    ldr r5, _LIT8
    str r2, [sp, #0x60]
    add r5, r5, #0xdd
    str r5, [sp, #0x1b4]
    ldr r5, _LIT8
    ldr r2, _LIT3
    add r5, r5, #0xe2
    str r5, [sp, #0x1c8]
    ldr r5, _LIT8
    add r2, r2, #0x40
    add r5, r5, #0xf9
    str r5, [sp, #0x1d0]
    ldr r5, _LIT8
    str r2, [sp, #0x68]
    rsb r5, r5, #0x3180
    str r5, [sp, #0x1d8]
    ldr r5, _LIT8
    ldr r2, _LIT3
    rsb r5, r5, #0x3180
    str r5, [sp, #0x1d4]
    ldr r5, _LIT6
    add r2, r2, #0x47
    add r5, r5, #0x354
    str r5, [sp, #0x1dc]
    ldr r5, _LIT6
    str r2, [sp, #0x70]
    add r5, r5, #0x388
    str r5, [sp, #0x1e4]
    ldr r5, _LIT7
    ldr r2, _LIT3
    add r5, r5, #0x284
    str r5, [sp, #0x1a8]
    ldr r5, _LIT8
    str r3, [sp, #0x50]
    add r5, r5, #0xfb
    str r5, [sp, #0x1ac]
    ldr r5, _LIT6
    add r3, r2, #0x4c
    add r5, r5, #0x388
    str r5, [sp, #0x1e0]
    ldr r5, _LIT3
    add r0, r0, #0xf1
    add r5, r5, #0x510
    str r5, [sp, #0x1e8]
    ldr r5, _LIT3
    sub r2, r2, #0xcc
    add r5, r5, #0x530
    str r5, [sp, #0x200]
    ldr r5, _LIT8
    str r6, [sp, #0x22c]
    add r5, r5, #0x1c8
    str r5, [sp, #0x1f8]
    ldr r5, _LIT3
    add r5, r5, #0x530
    str r5, [sp, #0x1fc]
    ldr r5, _LIT7
    add r5, r5, #0x2bc
    str r5, [sp, #0x204]
    ldr r5, _LIT9
    add r5, r5, #0xd
    str r5, [sp, #0x1f0]
    ldr r5, _LIT9
    sub r5, r5, #0x21
    str r5, [sp, #0x1f4]
    ldr r5, _LIT9
    add r5, r5, #0x7
    str r5, [sp, #0x208]
    ldr r5, _LIT9
    add r5, r5, #0x26
    str r5, [sp, #0x218]
    ldr r5, _LIT9
    add r5, r5, #0x33
    str r5, [sp, #0x210]
    ldr r5, _LIT9
    add r5, r5, #0x26
    str r5, [sp, #0x214]
    ldr r5, _LIT9
    add r5, r5, #0x29
    str r5, [sp, #0x21c]
    ldr r5, _LIT9
    add r5, r5, #0x7b
    str r5, [sp, #0x224]
    ldr r5, _LIT9
    add r5, r5, #0x57
    str r5, [sp, #0x228]
    ldr r5, _LIT8
    sub r5, r5, #0x13c
.L_6dc:
    and r6, r7, #0x1
    cmp r6, r4
    bne .L_10dc
    ldrh r6, [r8]
    mov r6, r6, lsl #0x13
    cmp r5, r6, lsr #0x13
    mov r6, r6, lsr #0x13
    blt .L_bc4
    cmp r6, lr
    bge .L_1058
    cmp r6, ip
    bgt .L_96c
    cmp r6, r3
    bge .L_1028
    cmp r6, r2
    bgt .L_87c
    cmp r6, r1
    bge .L_1058
    cmp r6, r0
    bgt .L_80c
    cmp r6, sl
    bge .L_1010
    cmp r6, fp
    bgt .L_7e0
    ldr r9, [sp, #0x8]
    subs r9, r6, r9
    addpl pc, pc, r9, lsl #0x2
    b .L_7bc
    b .L_1094
    b .L_10dc
    b .L_10dc
    b .L_10dc
    b .L_1058
    b .L_1058
    b .L_10dc
    b .L_1064
    b .L_10dc
    b .L_107c
    b .L_10dc
    b .L_10ac
    b .L_10dc
    b .L_10dc
    b .L_10dc
    b .L_10c4
    b .L_10dc
    b .L_10dc
    b .L_1070
    b .L_10dc
    b .L_10dc
    b .L_101c
    b .L_10b8
    b .L_10dc
    b .L_1040
    b .L_104c
    b .L_10a0
    b .L_1088
.L_7bc:
    ldr r9, _LIT4
    cmp r6, r9
    bgt .L_7d0
    beq .L_101c
    b .L_10dc
.L_7d0:
    ldr r9, [sp, #0xc]
    cmp r6, r9
    beq .L_107c
    b .L_10dc
.L_7e0:
    ldr r9, [sp, #0x10]
    cmp r6, r9
    bgt .L_7fc
    ldr r9, [sp, #0x14]
    cmp r6, r9
    beq .L_1040
    b .L_10dc
.L_7fc:
    ldr r9, _LIT5
    cmp r6, r9
    beq .L_1010
    b .L_10dc
.L_80c:
    ldr r9, [sp, #0x18]
    cmp r6, r9
    bgt .L_850
    ldr r9, [sp, #0x1c]
    cmp r6, r9
    bge .L_1010
    ldr r9, [sp, #0x20]
    cmp r6, r9
    bgt .L_840
    ldr r9, [sp, #0x24]
    cmp r6, r9
    beq .L_1040
    b .L_10dc
.L_840:
    ldr r9, [sp, #0x28]
    cmp r6, r9
    beq .L_1058
    b .L_10dc
.L_850:
    ldr r9, [sp, #0x2c]
    cmp r6, r9
    bgt .L_86c
    ldr r9, [sp, #0x30]
    cmp r6, r9
    beq .L_1094
    b .L_10dc
.L_86c:
    ldr r9, [sp, #0x34]
    cmp r6, r9
    beq .L_107c
    b .L_10dc
.L_87c:
    ldr r9, _LIT3
    cmp r6, r9
    bgt .L_8fc
    bge .L_10c4
    ldr r9, [sp, #0x38]
    cmp r6, r9
    bgt .L_8d0
    ldr r9, [sp, #0x3c]
    cmp r6, r9
    bge .L_1094
    ldr r9, [sp, #0x40]
    cmp r6, r9
    bgt .L_8c0
    ldr r9, [sp, #0x44]
    cmp r6, r9
    beq .L_1094
    b .L_10dc
.L_8c0:
    ldr r9, [sp, #0x48]
    cmp r6, r9
    beq .L_1040
    b .L_10dc
.L_8d0:
    ldr r9, [sp, #0x4c]
    cmp r6, r9
    bgt .L_8ec
    ldr r9, [sp, #0x50]
    cmp r6, r9
    beq .L_1058
    b .L_10dc
.L_8ec:
    ldr r9, [sp, #0x54]
    cmp r6, r9
    beq .L_1040
    b .L_10dc
.L_8fc:
    ldr r9, [sp, #0x58]
    cmp r6, r9
    bgt .L_940
    ldr r9, [sp, #0x5c]
    cmp r6, r9
    bge .L_1028
    ldr r9, [sp, #0x60]
    cmp r6, r9
    bgt .L_930
    ldr r9, [sp, #0x64]
    cmp r6, r9
    beq .L_1094
    b .L_10dc
.L_930:
    ldr r9, [sp, #0x68]
    cmp r6, r9
    beq .L_1028
    b .L_10dc
.L_940:
    ldr r9, [sp, #0x6c]
    cmp r6, r9
    bgt .L_95c
    ldr r9, [sp, #0x70]
    cmp r6, r9
    beq .L_1028
    b .L_10dc
.L_95c:
    ldr r9, [sp, #0x74]
    cmp r6, r9
    beq .L_1028
    b .L_10dc
.L_96c:
    ldr r9, [sp, #0x78]
    cmp r6, r9
    bgt .L_ac8
    ldr r9, [sp, #0x7c]
    cmp r6, r9
    bge .L_101c
    ldr r9, [sp, #0x80]
    cmp r6, r9
    bgt .L_a0c
    ldr r9, [sp, #0x84]
    cmp r6, r9
    bge .L_1028
    ldr r9, [sp, #0x88]
    cmp r6, r9
    bgt .L_9e0
    ldr r9, [sp, #0x8c]
    cmp r6, r9
    bge .L_1094
    ldr r9, [sp, #0x90]
    cmp r6, r9
    bgt .L_9d0
    ldr r9, [sp, #0x94]
    cmp r6, r9
    beq .L_1028
    b .L_10dc
.L_9d0:
    ldr r9, [sp, #0x98]
    cmp r6, r9
    beq .L_1094
    b .L_10dc
.L_9e0:
    ldr r9, [sp, #0x9c]
    cmp r6, r9
    bgt .L_9fc
    ldr r9, [sp, #0xa0]
    cmp r6, r9
    beq .L_1094
    b .L_10dc
.L_9fc:
    ldr r9, [sp, #0xa4]
    cmp r6, r9
    beq .L_1094
    b .L_10dc
.L_a0c:
    ldr r9, [sp, #0xa8]
    cmp r6, r9
    bgt .L_a9c
    ldr r9, [sp, #0xac]
    subs r9, r6, r9
    addpl pc, pc, r9, lsl #0x2
    b .L_a70
    b .L_1094
    b .L_10dc
    b .L_10dc
    b .L_10dc
    b .L_10dc
    b .L_10dc
    b .L_10dc
    b .L_10dc
    b .L_10dc
    b .L_10dc
    b .L_10dc
    b .L_1010
    b .L_1010
    b .L_1010
    b .L_1010
    b .L_1010
    b .L_1010
    b .L_1010
.L_a70:
    ldr r9, [sp, #0xb0]
    cmp r6, r9
    bgt .L_a8c
    ldr r9, [sp, #0xb4]
    cmp r6, r9
    beq .L_1010
    b .L_10dc
.L_a8c:
    ldr r9, [sp, #0xb8]
    cmp r6, r9
    beq .L_1094
    b .L_10dc
.L_a9c:
    ldr r9, [sp, #0xbc]
    cmp r6, r9
    bgt .L_ab8
    ldr r9, [sp, #0xc0]
    cmp r6, r9
    beq .L_10ac
    b .L_10dc
.L_ab8:
    ldr r9, [sp, #0xc4]
    cmp r6, r9
    beq .L_1094
    b .L_10dc
.L_ac8:
    ldr r9, [sp, #0xc8]
    cmp r6, r9
    bgt .L_b48
    ldr r9, [sp, #0xcc]
    cmp r6, r9
    bge .L_1040
    ldr r9, _LIT6
    cmp r6, r9
    bgt .L_b1c
    bge .L_1010
    ldr r9, [sp, #0xd0]
    cmp r6, r9
    bgt .L_b0c
    ldr r9, [sp, #0xd4]
    cmp r6, r9
    beq .L_1040
    b .L_10dc
.L_b0c:
    ldr r9, [sp, #0xd8]
    cmp r6, r9
    beq .L_1010
    b .L_10dc
.L_b1c:
    ldr r9, [sp, #0xdc]
    cmp r6, r9
    bgt .L_b38
    ldr r9, [sp, #0xe0]
    cmp r6, r9
    beq .L_10b8
    b .L_10dc
.L_b38:
    ldr r9, [sp, #0xe4]
    cmp r6, r9
    beq .L_10b8
    b .L_10dc
.L_b48:
    ldr r9, [sp, #0xe8]
    cmp r6, r9
    bgt .L_b8c
    ldr r9, [sp, #0xec]
    cmp r6, r9
    bge .L_10b8
    ldr r9, [sp, #0xf0]
    cmp r6, r9
    bgt .L_b7c
    ldr r9, [sp, #0xf4]
    cmp r6, r9
    beq .L_1064
    b .L_10dc
.L_b7c:
    ldr r9, [sp, #0xf8]
    cmp r6, r9
    beq .L_1010
    b .L_10dc
.L_b8c:
    ldr r9, [sp, #0xfc]
    cmp r6, r9
    bgt .L_bb4
    ldr r9, [sp, #0x100]
    cmp r6, r9
    bge .L_1064
    ldr r9, [sp, #0x104]
    cmp r6, r9
    beq .L_1064
    b .L_10dc
.L_bb4:
    ldr r9, _LIT7
    cmp r6, r9
    beq .L_1058
    b .L_10dc
.L_bc4:
    ldr r9, [sp, #0x108]
    cmp r6, r9
    bgt .L_de8
    ldr r9, [sp, #0x10c]
    cmp r6, r9
    bge .L_101c
    ldr r9, [sp, #0x110]
    cmp r6, r9
    bgt .L_cec
    ldr r9, [sp, #0x114]
    cmp r6, r9
    bge .L_10ac
    ldr r9, [sp, #0x118]
    cmp r6, r9
    bgt .L_c7c
    ldr r9, [sp, #0x11c]
    cmp r6, r9
    bge .L_1070
    ldr r9, [sp, #0x120]
    cmp r6, r9
    bgt .L_c50
    ldr r9, [sp, #0x124]
    cmp r6, r9
    bge .L_1094
    ldr r9, [sp, #0x128]
    cmp r6, r9
    bgt .L_c40
    ldr r9, [sp, #0x12c]
    cmp r6, r9
    beq .L_1058
    b .L_10dc
.L_c40:
    ldr r9, [sp, #0x130]
    cmp r6, r9
    beq .L_1028
    b .L_10dc
.L_c50:
    ldr r9, [sp, #0x134]
    cmp r6, r9
    bgt .L_c6c
    ldr r9, [sp, #0x138]
    cmp r6, r9
    beq .L_10d0
    b .L_10dc
.L_c6c:
    ldr r9, [sp, #0x13c]
    cmp r6, r9
    beq .L_10a0
    b .L_10dc
.L_c7c:
    ldr r9, [sp, #0x140]
    cmp r6, r9
    bgt .L_cc0
    ldr r9, [sp, #0x144]
    cmp r6, r9
    bge .L_1028
    ldr r9, [sp, #0x148]
    cmp r6, r9
    bgt .L_cb0
    ldr r9, [sp, #0x14c]
    cmp r6, r9
    beq .L_101c
    b .L_10dc
.L_cb0:
    ldr r9, [sp, #0x150]
    cmp r6, r9
    beq .L_107c
    b .L_10dc
.L_cc0:
    ldr r9, [sp, #0x154]
    cmp r6, r9
    bgt .L_cdc
    ldr r9, [sp, #0x158]
    cmp r6, r9
    beq .L_1034
    b .L_10dc
.L_cdc:
    ldr r9, [sp, #0x15c]
    cmp r6, r9
    beq .L_1094
    b .L_10dc
.L_cec:
    ldr r9, _LIT8
    cmp r6, r9
    bgt .L_d6c
    bge .L_10a0
    ldr r9, [sp, #0x160]
    cmp r6, r9
    bgt .L_d40
    ldr r9, [sp, #0x164]
    cmp r6, r9
    bge .L_10b8
    ldr r9, [sp, #0x168]
    cmp r6, r9
    bgt .L_d30
    ldr r9, [sp, #0x16c]
    cmp r6, r9
    beq .L_10b8
    b .L_10dc
.L_d30:
    ldr r9, [sp, #0x170]
    cmp r6, r9
    beq .L_10b8
    b .L_10dc
.L_d40:
    ldr r9, [sp, #0x174]
    cmp r6, r9
    bgt .L_d5c
    ldr r9, [sp, #0x178]
    cmp r6, r9
    beq .L_1040
    b .L_10dc
.L_d5c:
    ldr r9, [sp, #0x17c]
    cmp r6, r9
    beq .L_1034
    b .L_10dc
.L_d6c:
    ldr r9, [sp, #0x180]
    cmp r6, r9
    bgt .L_db0
    ldr r9, [sp, #0x184]
    cmp r6, r9
    bge .L_1010
    ldr r9, [sp, #0x188]
    cmp r6, r9
    bgt .L_da0
    ldr r9, [sp, #0x18c]
    cmp r6, r9
    beq .L_1040
    b .L_10dc
.L_da0:
    ldr r9, [sp, #0x190]
    cmp r6, r9
    beq .L_1064
    b .L_10dc
.L_db0:
    ldr r9, [sp, #0x194]
    cmp r6, r9
    bgt .L_dd8
    ldr r9, [sp, #0x198]
    cmp r6, r9
    bge .L_1064
    ldr r9, [sp, #0x19c]
    cmp r6, r9
    beq .L_1064
    b .L_10dc
.L_dd8:
    ldr r9, [sp, #0x1a0]
    cmp r6, r9
    beq .L_1064
    b .L_10dc
.L_de8:
    ldr r9, [sp, #0x1a4]
    cmp r6, r9
    bgt .L_eec
    ldr r9, [sp, #0x1a8]
    cmp r6, r9
    bge .L_10ac
    ldr r9, [sp, #0x1ac]
    cmp r6, r9
    bgt .L_e88
    ldr r9, [sp, #0x1b0]
    cmp r6, r9
    bge .L_1094
    ldr r9, [sp, #0x1b4]
    cmp r6, r9
    bgt .L_e5c
    ldr r9, [sp, #0x1b8]
    cmp r6, r9
    bge .L_1040
    ldr r9, [sp, #0x1bc]
    cmp r6, r9
    bgt .L_e4c
    ldr r9, [sp, #0x1c0]
    cmp r6, r9
    beq .L_1094
    b .L_10dc
.L_e4c:
    ldr r9, [sp, #0x1c4]
    cmp r6, r9
    beq .L_1040
    b .L_10dc
.L_e5c:
    ldr r9, [sp, #0x1c8]
    cmp r6, r9
    bgt .L_e78
    ldr r9, [sp, #0x1cc]
    cmp r6, r9
    beq .L_1010
    b .L_10dc
.L_e78:
    ldr r9, [sp, #0x1d0]
    cmp r6, r9
    beq .L_1094
    b .L_10dc
.L_e88:
    cmp r6, #0x1980
    bgt .L_ec0
    bge .L_1094
    ldr r9, [sp, #0x1d4]
    cmp r6, r9
    bgt .L_eb0
    ldr r9, [sp, #0x1d8]
    cmp r6, r9
    beq .L_1058
    b .L_10dc
.L_eb0:
    ldr r9, [sp, #0x1dc]
    cmp r6, r9
    beq .L_1034
    b .L_10dc
.L_ec0:
    ldr r9, [sp, #0x1e0]
    cmp r6, r9
    bgt .L_edc
    ldr r9, [sp, #0x1e4]
    cmp r6, r9
    beq .L_10b8
    b .L_10dc
.L_edc:
    ldr r9, [sp, #0x1e8]
    cmp r6, r9
    beq .L_1028
    b .L_10dc
.L_eec:
    ldr r9, [sp, #0x1ec]
    cmp r6, r9
    bgt .L_f6c
    ldr r9, [sp, #0x1f0]
    cmp r6, r9
    bge .L_10a0
    ldr r9, [sp, #0x1f4]
    cmp r6, r9
    bgt .L_f48
    ldr r9, [sp, #0x1f8]
    cmp r6, r9
    bge .L_1040
    ldr r9, [sp, #0x1fc]
    cmp r6, r9
    bgt .L_f38
    ldr r9, [sp, #0x200]
    cmp r6, r9
    beq .L_1028
    b .L_10dc
.L_f38:
    ldr r9, [sp, #0x204]
    cmp r6, r9
    beq .L_1040
    b .L_10dc
.L_f48:
    ldr r9, _LIT9
    cmp r6, r9
    bgt .L_f5c
    beq .L_10ac
    b .L_10dc
.L_f5c:
    ldr r9, [sp, #0x208]
    cmp r6, r9
    beq .L_10c4
    b .L_10dc
.L_f6c:
    ldr r9, [sp, #0x20c]
    cmp r6, r9
    bgt .L_fd8
    ldr r9, [sp, #0x210]
    cmp r6, r9
    bge .L_1040
    ldr r9, [sp, #0x214]
    cmp r6, r9
    bgt .L_fa0
    ldr r9, [sp, #0x218]
    cmp r6, r9
    beq .L_1040
    b .L_10dc
.L_fa0:
    ldr r9, [sp, #0x21c]
    cmp r6, r9
    beq .L_1040
    b .L_10dc
_LIT0: .word 0x00001357
_LIT1: .word 0x0000161c
_LIT2: .word data_ov002_022d0174
_LIT3: .word 0x00001475
_LIT4: .word 0x00000ff9
_LIT5: .word 0x0000119a
_LIT6: .word 0x000015fc
_LIT7: .word 0x00001702
_LIT8: .word 0x0000183f
_LIT9: .word 0x00001a28
.L_fd8:
    ldr r9, [sp, #0x220]
    cmp r6, r9
    bgt .L_1000
    ldr r9, [sp, #0x224]
    cmp r6, r9
    bge .L_104c
    ldr r9, [sp, #0x228]
    cmp r6, r9
    beq .L_1040
    b .L_10dc
.L_1000:
    ldr r9, [sp, #0x22c]
    cmp r6, r9
    beq .L_104c
    b .L_10dc
.L_1010:
    add sp, sp, #0x230
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_101c:
    add sp, sp, #0x230
    mov r0, #0x2
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1028:
    add sp, sp, #0x230
    mov r0, #0x3
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1034:
    add sp, sp, #0x230
    mov r0, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1040:
    add sp, sp, #0x230
    mov r0, #0x7
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_104c:
    add sp, sp, #0x230
    mov r0, #0x9
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1058:
    add sp, sp, #0x230
    mov r0, #0xa
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1064:
    add sp, sp, #0x230
    mov r0, #0xb
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1070:
    add sp, sp, #0x230
    mov r0, #0xc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_107c:
    add sp, sp, #0x230
    mov r0, #0xd
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1088:
    add sp, sp, #0x230
    mov r0, #0xe
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1094:
    add sp, sp, #0x230
    mov r0, #0xf
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_10a0:
    add sp, sp, #0x230
    mov r0, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_10ac:
    add sp, sp, #0x230
    mov r0, #0x11
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_10b8:
    add sp, sp, #0x230
    mov r0, #0x12
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_10c4:
    add sp, sp, #0x230
    mov r0, #0x13
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_10d0:
    add sp, sp, #0x230
    mov r0, #0x14
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_10dc:
    add r8, r8, #0x4
    add r7, r7, #0x1
    cmp r7, #0x100
    blt .L_6dc
    b .L_1258
.L_10f0:
    rsb r5, r4, #0x1
    mov r2, r3
    ldr r4, [sp, #0x4]
    mov r1, r5
    sub r2, r2, #0x1
    mov r3, #0x1
    str r4, [sp]
    bl func_ov002_02280b30
    cmp r0, #0x0
    blt .L_1258
    ldr r1, _LIT10
    ldr r2, _LIT11
    and r3, r5, #0x1
    mla r2, r3, r1, r2
    mov r1, #0x14
    mla r1, r0, r1, r2
    ldr r0, [r1, #0x30]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b824
    str r0, [sp, #0x4]
    b .L_1258
.L_1148:
    mov r3, #0x1
    rsb r5, r4, #0x1
    mov r1, r5
    sub r2, r3, #0x2
    str r3, [sp]
    bl func_ov002_02280b30
    movs r1, r0
    bmi .L_1198
    ldr r0, _LIT10
    mov r2, #0x14
    ldr r3, _LIT12
    and r6, r5, #0x1
    mul r2, r1, r2
    mla r0, r6, r0, r3
    ldrh r0, [r2, r0]
    cmp r0, #0x0
    beq .L_1198
    mov r0, r5
    bl func_ov002_021c8860
    str r0, [sp, #0x4]
.L_1198:
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    bne .L_11f8
    ldr r2, _LIT11
    ldr r0, _LIT10
    and r1, r5, #0x1
    mla r3, r1, r0, r2
    add r2, r3, #0x30
    mov r1, #0x0
.L_11bc:
    ldr r0, [r2]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    ldrneh r0, [r3, #0x38]
    cmpne r0, #0x0
    beq .L_11e4
    mov r0, r5
    bl func_ov002_021c8860
    str r0, [sp, #0x4]
    b .L_11f8
.L_11e4:
    add r1, r1, #0x1
    cmp r1, #0x4
    add r2, r2, #0x14
    add r3, r3, #0x14
    ble .L_11bc
.L_11f8:
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    bne .L_1258
    ldr r2, _LIT11
    ldr r0, _LIT10
    and r1, r4, #0x1
    mla r3, r1, r0, r2
    add r2, r3, #0x30
    mov r1, #0x0
.L_121c:
    ldr r0, [r2]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    ldrneh r0, [r3, #0x38]
    cmpne r0, #0x0
    beq .L_1244
    mov r0, r4
    bl func_ov002_021c8860
    str r0, [sp, #0x4]
    b .L_1258
.L_1244:
    add r1, r1, #0x1
    cmp r1, #0x4
    add r2, r2, #0x14
    add r3, r3, #0x14
    ble .L_121c
.L_1258:
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_126c
    cmp r0, #0x14
    ble .L_127c
.L_126c:
    mov r0, #0x14
    bl func_ov002_021afff0
    add r0, r0, #0x1
    str r0, [sp, #0x4]
.L_127c:
    ldr r0, [sp, #0x4]
    add sp, sp, #0x230
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT10: .word 0x00000868
_LIT11: .word data_ov002_022cf08c
_LIT12: .word data_ov002_022cf0c4
