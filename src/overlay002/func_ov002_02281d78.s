; func_ov002_02281d78 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern data_ov002_022d0254
        .extern func_0202b878
        .extern func_ov002_021b00d0
        .extern func_ov002_021c8940
        .extern func_ov002_02280c40
        .global func_ov002_02281d78
        .arm
func_ov002_02281d78:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x230
    ldr r2, _LIT0
    mov r3, #0x0
    mov r4, r0
    cmp r1, r2
    str r3, [sp, #0x4]
    beq .L_340
    add r2, r2, #0x1
    cmp r1, r2
    beq .L_13f4
    ldr r2, _LIT1
    cmp r1, r2
    beq .L_144c
    b .L_155c
.L_340:
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
.L_9e0:
    and r6, r7, #0x1
    cmp r6, r4
    bne .L_13e0
    ldrh r6, [r8]
    mov r6, r6, lsl #0x13
    cmp r5, r6, lsr #0x13
    mov r6, r6, lsr #0x13
    blt .L_ec8
    cmp r6, lr
    bge .L_135c
    cmp r6, ip
    bgt .L_c70
    cmp r6, r3
    bge .L_132c
    cmp r6, r2
    bgt .L_b80
    cmp r6, r1
    bge .L_135c
    cmp r6, r0
    bgt .L_b10
    cmp r6, sl
    bge .L_1314
    cmp r6, fp
    bgt .L_ae4
    ldr r9, [sp, #0x8]
    subs r9, r6, r9
    addpl pc, pc, r9, lsl #0x2
    b .L_ac0
    b .L_1398
    b .L_13e0
    b .L_13e0
    b .L_13e0
    b .L_135c
    b .L_135c
    b .L_13e0
    b .L_1368
    b .L_13e0
    b .L_1380
    b .L_13e0
    b .L_13b0
    b .L_13e0
    b .L_13e0
    b .L_13e0
    b .L_13c8
    b .L_13e0
    b .L_13e0
    b .L_1374
    b .L_13e0
    b .L_13e0
    b .L_1320
    b .L_13bc
    b .L_13e0
    b .L_1344
    b .L_1350
    b .L_13a4
    b .L_138c
.L_ac0:
    ldr r9, _LIT4
    cmp r6, r9
    bgt .L_ad4
    beq .L_1320
    b .L_13e0
.L_ad4:
    ldr r9, [sp, #0xc]
    cmp r6, r9
    beq .L_1380
    b .L_13e0
.L_ae4:
    ldr r9, [sp, #0x10]
    cmp r6, r9
    bgt .L_b00
    ldr r9, [sp, #0x14]
    cmp r6, r9
    beq .L_1344
    b .L_13e0
.L_b00:
    ldr r9, _LIT5
    cmp r6, r9
    beq .L_1314
    b .L_13e0
.L_b10:
    ldr r9, [sp, #0x18]
    cmp r6, r9
    bgt .L_b54
    ldr r9, [sp, #0x1c]
    cmp r6, r9
    bge .L_1314
    ldr r9, [sp, #0x20]
    cmp r6, r9
    bgt .L_b44
    ldr r9, [sp, #0x24]
    cmp r6, r9
    beq .L_1344
    b .L_13e0
.L_b44:
    ldr r9, [sp, #0x28]
    cmp r6, r9
    beq .L_135c
    b .L_13e0
.L_b54:
    ldr r9, [sp, #0x2c]
    cmp r6, r9
    bgt .L_b70
    ldr r9, [sp, #0x30]
    cmp r6, r9
    beq .L_1398
    b .L_13e0
.L_b70:
    ldr r9, [sp, #0x34]
    cmp r6, r9
    beq .L_1380
    b .L_13e0
.L_b80:
    ldr r9, _LIT3
    cmp r6, r9
    bgt .L_c00
    bge .L_13c8
    ldr r9, [sp, #0x38]
    cmp r6, r9
    bgt .L_bd4
    ldr r9, [sp, #0x3c]
    cmp r6, r9
    bge .L_1398
    ldr r9, [sp, #0x40]
    cmp r6, r9
    bgt .L_bc4
    ldr r9, [sp, #0x44]
    cmp r6, r9
    beq .L_1398
    b .L_13e0
.L_bc4:
    ldr r9, [sp, #0x48]
    cmp r6, r9
    beq .L_1344
    b .L_13e0
.L_bd4:
    ldr r9, [sp, #0x4c]
    cmp r6, r9
    bgt .L_bf0
    ldr r9, [sp, #0x50]
    cmp r6, r9
    beq .L_135c
    b .L_13e0
.L_bf0:
    ldr r9, [sp, #0x54]
    cmp r6, r9
    beq .L_1344
    b .L_13e0
.L_c00:
    ldr r9, [sp, #0x58]
    cmp r6, r9
    bgt .L_c44
    ldr r9, [sp, #0x5c]
    cmp r6, r9
    bge .L_132c
    ldr r9, [sp, #0x60]
    cmp r6, r9
    bgt .L_c34
    ldr r9, [sp, #0x64]
    cmp r6, r9
    beq .L_1398
    b .L_13e0
.L_c34:
    ldr r9, [sp, #0x68]
    cmp r6, r9
    beq .L_132c
    b .L_13e0
.L_c44:
    ldr r9, [sp, #0x6c]
    cmp r6, r9
    bgt .L_c60
    ldr r9, [sp, #0x70]
    cmp r6, r9
    beq .L_132c
    b .L_13e0
.L_c60:
    ldr r9, [sp, #0x74]
    cmp r6, r9
    beq .L_132c
    b .L_13e0
.L_c70:
    ldr r9, [sp, #0x78]
    cmp r6, r9
    bgt .L_dcc
    ldr r9, [sp, #0x7c]
    cmp r6, r9
    bge .L_1320
    ldr r9, [sp, #0x80]
    cmp r6, r9
    bgt .L_d10
    ldr r9, [sp, #0x84]
    cmp r6, r9
    bge .L_132c
    ldr r9, [sp, #0x88]
    cmp r6, r9
    bgt .L_ce4
    ldr r9, [sp, #0x8c]
    cmp r6, r9
    bge .L_1398
    ldr r9, [sp, #0x90]
    cmp r6, r9
    bgt .L_cd4
    ldr r9, [sp, #0x94]
    cmp r6, r9
    beq .L_132c
    b .L_13e0
.L_cd4:
    ldr r9, [sp, #0x98]
    cmp r6, r9
    beq .L_1398
    b .L_13e0
.L_ce4:
    ldr r9, [sp, #0x9c]
    cmp r6, r9
    bgt .L_d00
    ldr r9, [sp, #0xa0]
    cmp r6, r9
    beq .L_1398
    b .L_13e0
.L_d00:
    ldr r9, [sp, #0xa4]
    cmp r6, r9
    beq .L_1398
    b .L_13e0
.L_d10:
    ldr r9, [sp, #0xa8]
    cmp r6, r9
    bgt .L_da0
    ldr r9, [sp, #0xac]
    subs r9, r6, r9
    addpl pc, pc, r9, lsl #0x2
    b .L_d74
    b .L_1398
    b .L_13e0
    b .L_13e0
    b .L_13e0
    b .L_13e0
    b .L_13e0
    b .L_13e0
    b .L_13e0
    b .L_13e0
    b .L_13e0
    b .L_13e0
    b .L_1314
    b .L_1314
    b .L_1314
    b .L_1314
    b .L_1314
    b .L_1314
    b .L_1314
.L_d74:
    ldr r9, [sp, #0xb0]
    cmp r6, r9
    bgt .L_d90
    ldr r9, [sp, #0xb4]
    cmp r6, r9
    beq .L_1314
    b .L_13e0
.L_d90:
    ldr r9, [sp, #0xb8]
    cmp r6, r9
    beq .L_1398
    b .L_13e0
.L_da0:
    ldr r9, [sp, #0xbc]
    cmp r6, r9
    bgt .L_dbc
    ldr r9, [sp, #0xc0]
    cmp r6, r9
    beq .L_13b0
    b .L_13e0
.L_dbc:
    ldr r9, [sp, #0xc4]
    cmp r6, r9
    beq .L_1398
    b .L_13e0
.L_dcc:
    ldr r9, [sp, #0xc8]
    cmp r6, r9
    bgt .L_e4c
    ldr r9, [sp, #0xcc]
    cmp r6, r9
    bge .L_1344
    ldr r9, _LIT6
    cmp r6, r9
    bgt .L_e20
    bge .L_1314
    ldr r9, [sp, #0xd0]
    cmp r6, r9
    bgt .L_e10
    ldr r9, [sp, #0xd4]
    cmp r6, r9
    beq .L_1344
    b .L_13e0
.L_e10:
    ldr r9, [sp, #0xd8]
    cmp r6, r9
    beq .L_1314
    b .L_13e0
.L_e20:
    ldr r9, [sp, #0xdc]
    cmp r6, r9
    bgt .L_e3c
    ldr r9, [sp, #0xe0]
    cmp r6, r9
    beq .L_13bc
    b .L_13e0
.L_e3c:
    ldr r9, [sp, #0xe4]
    cmp r6, r9
    beq .L_13bc
    b .L_13e0
.L_e4c:
    ldr r9, [sp, #0xe8]
    cmp r6, r9
    bgt .L_e90
    ldr r9, [sp, #0xec]
    cmp r6, r9
    bge .L_13bc
    ldr r9, [sp, #0xf0]
    cmp r6, r9
    bgt .L_e80
    ldr r9, [sp, #0xf4]
    cmp r6, r9
    beq .L_1368
    b .L_13e0
.L_e80:
    ldr r9, [sp, #0xf8]
    cmp r6, r9
    beq .L_1314
    b .L_13e0
.L_e90:
    ldr r9, [sp, #0xfc]
    cmp r6, r9
    bgt .L_eb8
    ldr r9, [sp, #0x100]
    cmp r6, r9
    bge .L_1368
    ldr r9, [sp, #0x104]
    cmp r6, r9
    beq .L_1368
    b .L_13e0
.L_eb8:
    ldr r9, _LIT7
    cmp r6, r9
    beq .L_135c
    b .L_13e0
.L_ec8:
    ldr r9, [sp, #0x108]
    cmp r6, r9
    bgt .L_10ec
    ldr r9, [sp, #0x10c]
    cmp r6, r9
    bge .L_1320
    ldr r9, [sp, #0x110]
    cmp r6, r9
    bgt .L_ff0
    ldr r9, [sp, #0x114]
    cmp r6, r9
    bge .L_13b0
    ldr r9, [sp, #0x118]
    cmp r6, r9
    bgt .L_f80
    ldr r9, [sp, #0x11c]
    cmp r6, r9
    bge .L_1374
    ldr r9, [sp, #0x120]
    cmp r6, r9
    bgt .L_f54
    ldr r9, [sp, #0x124]
    cmp r6, r9
    bge .L_1398
    ldr r9, [sp, #0x128]
    cmp r6, r9
    bgt .L_f44
    ldr r9, [sp, #0x12c]
    cmp r6, r9
    beq .L_135c
    b .L_13e0
.L_f44:
    ldr r9, [sp, #0x130]
    cmp r6, r9
    beq .L_132c
    b .L_13e0
.L_f54:
    ldr r9, [sp, #0x134]
    cmp r6, r9
    bgt .L_f70
    ldr r9, [sp, #0x138]
    cmp r6, r9
    beq .L_13d4
    b .L_13e0
.L_f70:
    ldr r9, [sp, #0x13c]
    cmp r6, r9
    beq .L_13a4
    b .L_13e0
.L_f80:
    ldr r9, [sp, #0x140]
    cmp r6, r9
    bgt .L_fc4
    ldr r9, [sp, #0x144]
    cmp r6, r9
    bge .L_132c
    ldr r9, [sp, #0x148]
    cmp r6, r9
    bgt .L_fb4
    ldr r9, [sp, #0x14c]
    cmp r6, r9
    beq .L_1320
    b .L_13e0
.L_fb4:
    ldr r9, [sp, #0x150]
    cmp r6, r9
    beq .L_1380
    b .L_13e0
.L_fc4:
    ldr r9, [sp, #0x154]
    cmp r6, r9
    bgt .L_fe0
    ldr r9, [sp, #0x158]
    cmp r6, r9
    beq .L_1338
    b .L_13e0
.L_fe0:
    ldr r9, [sp, #0x15c]
    cmp r6, r9
    beq .L_1398
    b .L_13e0
.L_ff0:
    ldr r9, _LIT8
    cmp r6, r9
    bgt .L_1070
    bge .L_13a4
    ldr r9, [sp, #0x160]
    cmp r6, r9
    bgt .L_1044
    ldr r9, [sp, #0x164]
    cmp r6, r9
    bge .L_13bc
    ldr r9, [sp, #0x168]
    cmp r6, r9
    bgt .L_1034
    ldr r9, [sp, #0x16c]
    cmp r6, r9
    beq .L_13bc
    b .L_13e0
.L_1034:
    ldr r9, [sp, #0x170]
    cmp r6, r9
    beq .L_13bc
    b .L_13e0
.L_1044:
    ldr r9, [sp, #0x174]
    cmp r6, r9
    bgt .L_1060
    ldr r9, [sp, #0x178]
    cmp r6, r9
    beq .L_1344
    b .L_13e0
.L_1060:
    ldr r9, [sp, #0x17c]
    cmp r6, r9
    beq .L_1338
    b .L_13e0
.L_1070:
    ldr r9, [sp, #0x180]
    cmp r6, r9
    bgt .L_10b4
    ldr r9, [sp, #0x184]
    cmp r6, r9
    bge .L_1314
    ldr r9, [sp, #0x188]
    cmp r6, r9
    bgt .L_10a4
    ldr r9, [sp, #0x18c]
    cmp r6, r9
    beq .L_1344
    b .L_13e0
.L_10a4:
    ldr r9, [sp, #0x190]
    cmp r6, r9
    beq .L_1368
    b .L_13e0
.L_10b4:
    ldr r9, [sp, #0x194]
    cmp r6, r9
    bgt .L_10dc
    ldr r9, [sp, #0x198]
    cmp r6, r9
    bge .L_1368
    ldr r9, [sp, #0x19c]
    cmp r6, r9
    beq .L_1368
    b .L_13e0
.L_10dc:
    ldr r9, [sp, #0x1a0]
    cmp r6, r9
    beq .L_1368
    b .L_13e0
.L_10ec:
    ldr r9, [sp, #0x1a4]
    cmp r6, r9
    bgt .L_11f0
    ldr r9, [sp, #0x1a8]
    cmp r6, r9
    bge .L_13b0
    ldr r9, [sp, #0x1ac]
    cmp r6, r9
    bgt .L_118c
    ldr r9, [sp, #0x1b0]
    cmp r6, r9
    bge .L_1398
    ldr r9, [sp, #0x1b4]
    cmp r6, r9
    bgt .L_1160
    ldr r9, [sp, #0x1b8]
    cmp r6, r9
    bge .L_1344
    ldr r9, [sp, #0x1bc]
    cmp r6, r9
    bgt .L_1150
    ldr r9, [sp, #0x1c0]
    cmp r6, r9
    beq .L_1398
    b .L_13e0
.L_1150:
    ldr r9, [sp, #0x1c4]
    cmp r6, r9
    beq .L_1344
    b .L_13e0
.L_1160:
    ldr r9, [sp, #0x1c8]
    cmp r6, r9
    bgt .L_117c
    ldr r9, [sp, #0x1cc]
    cmp r6, r9
    beq .L_1314
    b .L_13e0
.L_117c:
    ldr r9, [sp, #0x1d0]
    cmp r6, r9
    beq .L_1398
    b .L_13e0
.L_118c:
    cmp r6, #0x1980
    bgt .L_11c4
    bge .L_1398
    ldr r9, [sp, #0x1d4]
    cmp r6, r9
    bgt .L_11b4
    ldr r9, [sp, #0x1d8]
    cmp r6, r9
    beq .L_135c
    b .L_13e0
.L_11b4:
    ldr r9, [sp, #0x1dc]
    cmp r6, r9
    beq .L_1338
    b .L_13e0
.L_11c4:
    ldr r9, [sp, #0x1e0]
    cmp r6, r9
    bgt .L_11e0
    ldr r9, [sp, #0x1e4]
    cmp r6, r9
    beq .L_13bc
    b .L_13e0
.L_11e0:
    ldr r9, [sp, #0x1e8]
    cmp r6, r9
    beq .L_132c
    b .L_13e0
.L_11f0:
    ldr r9, [sp, #0x1ec]
    cmp r6, r9
    bgt .L_1270
    ldr r9, [sp, #0x1f0]
    cmp r6, r9
    bge .L_13a4
    ldr r9, [sp, #0x1f4]
    cmp r6, r9
    bgt .L_124c
    ldr r9, [sp, #0x1f8]
    cmp r6, r9
    bge .L_1344
    ldr r9, [sp, #0x1fc]
    cmp r6, r9
    bgt .L_123c
    ldr r9, [sp, #0x200]
    cmp r6, r9
    beq .L_132c
    b .L_13e0
.L_123c:
    ldr r9, [sp, #0x204]
    cmp r6, r9
    beq .L_1344
    b .L_13e0
.L_124c:
    ldr r9, _LIT9
    cmp r6, r9
    bgt .L_1260
    beq .L_13b0
    b .L_13e0
.L_1260:
    ldr r9, [sp, #0x208]
    cmp r6, r9
    beq .L_13c8
    b .L_13e0
.L_1270:
    ldr r9, [sp, #0x20c]
    cmp r6, r9
    bgt .L_12dc
    ldr r9, [sp, #0x210]
    cmp r6, r9
    bge .L_1344
    ldr r9, [sp, #0x214]
    cmp r6, r9
    bgt .L_12a4
    ldr r9, [sp, #0x218]
    cmp r6, r9
    beq .L_1344
    b .L_13e0
.L_12a4:
    ldr r9, [sp, #0x21c]
    cmp r6, r9
    beq .L_1344
    b .L_13e0
_LIT0: .word 0x00001357
_LIT1: .word 0x0000161c
_LIT2: .word data_ov002_022d0254
_LIT3: .word 0x00001475
_LIT4: .word 0x00000ff9
_LIT5: .word 0x0000119a
_LIT6: .word 0x000015fc
_LIT7: .word 0x00001702
_LIT8: .word 0x0000183f
_LIT9: .word 0x00001a28
.L_12dc:
    ldr r9, [sp, #0x220]
    cmp r6, r9
    bgt .L_1304
    ldr r9, [sp, #0x224]
    cmp r6, r9
    bge .L_1350
    ldr r9, [sp, #0x228]
    cmp r6, r9
    beq .L_1344
    b .L_13e0
.L_1304:
    ldr r9, [sp, #0x22c]
    cmp r6, r9
    beq .L_1350
    b .L_13e0
.L_1314:
    add sp, sp, #0x230
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1320:
    add sp, sp, #0x230
    mov r0, #0x2
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_132c:
    add sp, sp, #0x230
    mov r0, #0x3
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1338:
    add sp, sp, #0x230
    mov r0, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1344:
    add sp, sp, #0x230
    mov r0, #0x7
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1350:
    add sp, sp, #0x230
    mov r0, #0x9
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_135c:
    add sp, sp, #0x230
    mov r0, #0xa
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1368:
    add sp, sp, #0x230
    mov r0, #0xb
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1374:
    add sp, sp, #0x230
    mov r0, #0xc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1380:
    add sp, sp, #0x230
    mov r0, #0xd
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_138c:
    add sp, sp, #0x230
    mov r0, #0xe
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1398:
    add sp, sp, #0x230
    mov r0, #0xf
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_13a4:
    add sp, sp, #0x230
    mov r0, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_13b0:
    add sp, sp, #0x230
    mov r0, #0x11
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_13bc:
    add sp, sp, #0x230
    mov r0, #0x12
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_13c8:
    add sp, sp, #0x230
    mov r0, #0x13
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_13d4:
    add sp, sp, #0x230
    mov r0, #0x14
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_13e0:
    add r8, r8, #0x4
    add r7, r7, #0x1
    cmp r7, #0x100
    blt .L_9e0
    b .L_155c
.L_13f4:
    rsb r5, r4, #0x1
    mov r2, r3
    ldr r4, [sp, #0x4]
    mov r1, r5
    sub r2, r2, #0x1
    mov r3, #0x1
    str r4, [sp]
    bl func_ov002_02280c40
    cmp r0, #0x0
    blt .L_155c
    ldr r1, _LIT10
    ldr r2, _LIT11
    and r3, r5, #0x1
    mla r2, r3, r1, r2
    mov r1, #0x14
    mla r1, r0, r1, r2
    ldr r0, [r1, #0x30]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b878
    str r0, [sp, #0x4]
    b .L_155c
.L_144c:
    mov r3, #0x1
    rsb r5, r4, #0x1
    mov r1, r5
    sub r2, r3, #0x2
    str r3, [sp]
    bl func_ov002_02280c40
    movs r1, r0
    bmi .L_149c
    ldr r0, _LIT10
    mov r2, #0x14
    ldr r3, _LIT12
    and r6, r5, #0x1
    mul r2, r1, r2
    mla r0, r6, r0, r3
    ldrh r0, [r2, r0]
    cmp r0, #0x0
    beq .L_149c
    mov r0, r5
    bl func_ov002_021c8940
    str r0, [sp, #0x4]
.L_149c:
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    bne .L_14fc
    ldr r2, _LIT11
    ldr r0, _LIT10
    and r1, r5, #0x1
    mla r3, r1, r0, r2
    add r2, r3, #0x30
    mov r1, #0x0
.L_14c0:
    ldr r0, [r2]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    ldrneh r0, [r3, #0x38]
    cmpne r0, #0x0
    beq .L_14e8
    mov r0, r5
    bl func_ov002_021c8940
    str r0, [sp, #0x4]
    b .L_14fc
.L_14e8:
    add r1, r1, #0x1
    cmp r1, #0x4
    add r2, r2, #0x14
    add r3, r3, #0x14
    ble .L_14c0
.L_14fc:
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    bne .L_155c
    ldr r2, _LIT11
    ldr r0, _LIT10
    and r1, r4, #0x1
    mla r3, r1, r0, r2
    add r2, r3, #0x30
    mov r1, #0x0
.L_1520:
    ldr r0, [r2]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    ldrneh r0, [r3, #0x38]
    cmpne r0, #0x0
    beq .L_1548
    mov r0, r4
    bl func_ov002_021c8940
    str r0, [sp, #0x4]
    b .L_155c
.L_1548:
    add r1, r1, #0x1
    cmp r1, #0x4
    add r2, r2, #0x14
    add r3, r3, #0x14
    ble .L_1520
.L_155c:
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_1570
    cmp r0, #0x14
    ble .L_1580
.L_1570:
    mov r0, #0x14
    bl func_ov002_021b00d0
    add r0, r0, #0x1
    str r0, [sp, #0x4]
.L_1580:
    ldr r0, [sp, #0x4]
    add sp, sp, #0x230
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT10: .word 0x00000868
_LIT11: .word data_ov002_022cf16c
_LIT12: .word data_ov002_022cf1a4
