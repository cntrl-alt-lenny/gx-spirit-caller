; func_ov002_022451b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd744
        .extern data_ov002_022ce288
        .extern data_ov002_022d016c
        .extern func_0202e234
        .extern func_02031470
        .global func_ov002_022451b8
        .arm
func_ov002_022451b8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x154
    ldr r7, _LIT0
    mov r9, r0
    ldr r0, [r7, #0x5d4]
    mov r8, r1
    cmp r0, #0x0
    mov r6, #0x0
    bls .L_cb4
    ldr r0, _LIT1
    ldr r4, _LIT2
    add sl, r0, #0x43
    add fp, r0, #0x4f0
    ldr r0, _LIT3
    str r7, [sp]
    add r0, r0, #0x3a
    str r0, [sp, #0x10]
    ldr r0, _LIT1
    mov r5, sl
    sub r0, r0, #0xd9
    str r0, [sp, #0x8]
    ldr r0, _LIT3
    add r0, r0, #0x3a
    str r0, [sp, #0xc]
    ldr r0, _LIT3
    add r0, r0, #0x154
    str r0, [sp, #0x14]
    ldr r0, _LIT4
    sub r0, r0, #0x8a
    str r0, [sp, #0x18]
    ldr r0, _LIT1
    sub r0, r0, #0xd9
    str r0, [sp, #0x4]
    ldr r0, _LIT4
    add r0, r0, #0x244
    str r0, [sp, #0x1c]
    ldr r0, _LIT3
    add r0, r0, #0x154
    str r0, [sp, #0x20]
    ldr r0, _LIT4
    add r0, r0, #0x244
    str r0, [sp, #0x24]
    ldr r0, _LIT3
    sub r0, r0, #0x51
    str r0, [sp, #0x34]
    ldr r0, _LIT3
    sub r0, r0, #0xcf
    str r0, [sp, #0x40]
    ldr r0, _LIT3
    sub r0, r0, #0xce
    str r0, [sp, #0x44]
    ldr r0, _LIT3
    sub r0, r0, #0x3a
    str r0, [sp, #0x4c]
    ldr r0, _LIT1
    sub r0, r0, #0x95
    str r0, [sp, #0x2c]
    ldr r0, _LIT3
    sub r0, r0, #0x51
    str r0, [sp, #0x30]
    ldr r0, _LIT3
    sub r0, r0, #0x3a
    str r0, [sp, #0x48]
    ldr r0, _LIT4
    rsb r0, r0, #0x2c80
    str r0, [sp, #0x50]
    ldr r0, _LIT4
    sub r0, r0, #0x314
    str r0, [sp, #0x60]
    ldr r0, _LIT1
    add r0, r0, #0x46
    str r0, [sp, #0x58]
    ldr r0, _LIT4
    sub r0, r0, #0x314
    str r0, [sp, #0x5c]
    ldr r0, _LIT4
    sub r0, r0, #0x2c0
    str r0, [sp, #0x64]
    ldr r0, _LIT1
    add r0, r0, #0x4b
    str r0, [sp, #0x6c]
    ldr r0, _LIT1
    sub r0, r0, #0x95
    str r0, [sp, #0x28]
    ldr r0, _LIT1
    add r0, r0, #0x46
    str r0, [sp, #0x54]
    ldr r0, _LIT1
    add r0, r0, #0x4b
    str r0, [sp, #0x68]
    ldr r0, _LIT3
    sub r0, r0, #0xcf
    str r0, [sp, #0x3c]
    sub r0, r4, #0x490
    str r0, [sp, #0x38]
    ldr r0, _LIT3
    sub r0, r0, #0x51
    str r0, [sp, #0x7c]
    ldr r0, _LIT3
    sub r0, r0, #0xcf
    str r0, [sp, #0x88]
    sub r0, r4, #0x490
    str r0, [sp, #0x8c]
    sub r0, r4, #0x3fc
    str r0, [sp, #0x94]
    sub r0, r4, #0x1c8
    str r0, [sp, #0x74]
    ldr r0, _LIT3
    sub r0, r0, #0x51
    str r0, [sp, #0x78]
    sub r0, r4, #0x3fc
    str r0, [sp, #0x90]
    ldr r0, _LIT4
    rsb r0, r0, #0x2c80
    str r0, [sp, #0x98]
    ldr r0, _LIT4
    sub r0, r0, #0x2c0
    str r0, [sp, #0xa0]
    ldr r0, _LIT4
    sub r0, r0, #0x314
    str r0, [sp, #0xa4]
    sub r0, r4, #0xe8
    str r0, [sp, #0xac]
    sub r0, r4, #0x1c8
    str r0, [sp, #0x70]
    ldr r0, _LIT4
    sub r0, r0, #0x2c0
    str r0, [sp, #0x9c]
    sub r0, r4, #0xe8
    str r0, [sp, #0xa8]
    ldr r0, _LIT3
    sub r0, r0, #0xcf
    str r0, [sp, #0x84]
    sub r0, r4, #0x490
    str r0, [sp, #0x80]
    ldr r0, _LIT3
    sub r0, r0, #0x51
    str r0, [sp, #0xbc]
    ldr r0, _LIT3
    add r0, r0, #0xf1
    str r0, [sp, #0xb4]
    ldr r0, _LIT3
    sub r0, r0, #0x51
    str r0, [sp, #0xb8]
    ldr r0, _LIT4
    rsb r0, r0, #0x2c80
    str r0, [sp, #0xc0]
    sub r0, r4, #0x1c8
    str r0, [sp, #0xc8]
    ldr r0, _LIT3
    add r0, r0, #0xf1
    str r0, [sp, #0xb0]
    sub r0, r4, #0x1c8
    str r0, [sp, #0xc4]
    sub r0, r4, #0xe8
    str r0, [sp, #0xcc]
    add r0, r4, #0x1f8
    str r0, [sp, #0xe0]
    add r0, r4, #0x1fc
    str r0, [sp, #0xe4]
    ldr r0, _LIT4
    add r0, r0, #0xd7
    str r0, [sp, #0xd4]
    add r0, r4, #0x1fc
    str r0, [sp, #0xd8]
    ldr r0, _LIT4
    add r0, r0, #0xa8
    str r0, [sp, #0xe8]
    ldr r0, _LIT4
    add r0, r0, #0x108
    str r0, [sp, #0xf0]
    ldr r0, _LIT4
    add r0, r0, #0xd7
    str r0, [sp, #0xd0]
    ldr r0, _LIT4
    add r0, r0, #0x108
    str r0, [sp, #0xec]
    add r0, r4, #0x1f8
    str r0, [sp, #0xdc]
    ldr r0, _LIT3
    sub r0, r0, #0x47
    str r0, [sp, #0xf4]
    ldr r0, _LIT3
    add r0, r0, #0xf1
    str r0, [sp, #0xf8]
    ldr r0, _LIT4
    add r0, r0, #0xa8
    str r0, [sp, #0xfc]
    ldr r0, _LIT3
    add r0, r0, #0x34
    str r0, [sp, #0x100]
    ldr r0, _LIT3
    add r0, r0, #0x3c
    str r0, [sp, #0x104]
    ldr r0, _LIT3
    add r0, r0, #0x30
    str r0, [sp, #0x108]
    ldr r0, _LIT3
    add r0, r0, #0x35
    str r0, [sp, #0x10c]
    sub r0, r4, #0x1c4
    str r0, [sp, #0x110]
    ldr r0, _LIT3
    add r0, r0, #0x3d
    str r0, [sp, #0x120]
    ldr r0, _LIT3
    add r0, r0, #0x2d
    str r0, [sp, #0x12c]
    sub r0, r4, #0x394
    str r0, [sp, #0x130]
    ldr r0, _LIT3
    add r0, r0, #0x2f
    str r0, [sp, #0x134]
    ldr r0, _LIT4
    add r0, r0, #0xd8
    str r0, [sp, #0x118]
    ldr r0, _LIT3
    add r0, r0, #0x3d
    str r0, [sp, #0x11c]
    ldr r0, _LIT1
    add r0, r0, #0x8
    str r0, [sp, #0x138]
    ldr r0, _LIT5
    sub r0, r0, #0x36
    str r0, [sp, #0x140]
    ldr r0, _LIT5
    sub r0, r0, #0x8b
    str r0, [sp, #0x144]
    ldr r0, _LIT4
    add r0, r0, #0xd8
    str r0, [sp, #0x114]
    ldr r0, _LIT5
    sub r0, r0, #0x36
    str r0, [sp, #0x13c]
    ldr r0, _LIT5
    add r0, r0, #0x8
    str r0, [sp, #0x148]
    sub r0, r4, #0x38c
    str r0, [sp, #0x14c]
    ldr r0, _LIT3
    sub r0, r0, #0x2b
    str r0, [sp, #0x150]
    ldr r0, _LIT3
    add r0, r0, #0x2d
    str r0, [sp, #0x128]
    ldr r0, _LIT3
    add r0, r0, #0x2f
    str r0, [sp, #0x124]
.L_5b4:
    ldrb r0, [r7, #0x5dc]
    cmp r0, #0x21
    addls pc, pc, r0, lsl #0x2
    b .L_c9c
    b .L_c9c
    b .L_64c
    b .L_668
    b .L_6b0
    b .L_72c
    b .L_c08
    b .L_74c
    b .L_878
    b .L_978
    b .L_ab4
    b .L_c9c
    b .L_a9c
    b .L_c9c
    b .L_c90
    b .L_c90
    b .L_c90
    b .L_ad4
    b .L_c9c
    b .L_af4
    b .L_af4
    b .L_c90
    b .L_c90
    b .L_c90
    b .L_c5c
    b .L_b00
    b .L_b18
    b .L_c9c
    b .L_b38
    b .L_c9c
    b .L_bf0
    b .L_c9c
    b .L_c84
    b .L_c84
    b .L_c84
.L_64c:
    ldr r0, _LIT6
    add sp, sp, #0x154
    ldr r0, [r0, r9, lsl #0x2]
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_668:
    ldr r0, _LIT1
    cmp r8, r0
    bgt .L_688
    bge .L_6a4
    ldr r0, _LIT3
    cmp r8, r0
    beq .L_6a4
    b .L_c9c
.L_688:
    cmp r8, r5
    bgt .L_69c
    cmp r8, sl
    beq .L_6a4
    b .L_c9c
.L_69c:
    cmp r8, fp
    bne .L_c9c
.L_6a4:
    add sp, sp, #0x154
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_6b0:
    ldr r0, [sp, #0x4]
    cmp r8, r0
    bgt .L_6f4
    ldr r0, [sp, #0x8]
    cmp r8, r0
    bge .L_720
    ldr r0, [sp, #0xc]
    cmp r8, r0
    bgt .L_6e4
    ldr r0, [sp, #0x10]
    cmp r8, r0
    beq .L_720
    b .L_c9c
.L_6e4:
    ldr r0, [sp, #0x14]
    cmp r8, r0
    beq .L_720
    b .L_c9c
.L_6f4:
    ldr r0, _LIT4
    cmp r8, r0
    bgt .L_714
    bge .L_720
    ldr r0, [sp, #0x18]
    cmp r8, r0
    beq .L_720
    b .L_c9c
.L_714:
    ldr r0, [sp, #0x1c]
    cmp r8, r0
    bne .L_c9c
.L_720:
    add sp, sp, #0x154
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_72c:
    ldr r0, [sp, #0x20]
    cmp r8, r0
    ldrne r0, [sp, #0x24]
    cmpne r8, r0
    bne .L_c9c
    add sp, sp, #0x154
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_74c:
    ldr r0, [sp, #0x28]
    cmp r8, r0
    bgt .L_7d8
    ldr r0, [sp, #0x2c]
    cmp r8, r0
    bge .L_840
    ldr r0, [sp, #0x30]
    cmp r8, r0
    bgt .L_7ac
    ldr r0, [sp, #0x34]
    cmp r8, r0
    bge .L_840
    ldr r0, [sp, #0x38]
    cmp r8, r0
    bgt .L_84c
    ldr r0, [sp, #0x3c]
    cmp r8, r0
    blt .L_84c
    ldr r0, [sp, #0x40]
    cmp r8, r0
    ldrne r0, [sp, #0x44]
    cmpne r8, r0
    beq .L_840
    b .L_84c
.L_7ac:
    ldr r0, [sp, #0x48]
    cmp r8, r0
    bgt .L_7c8
    ldr r0, [sp, #0x4c]
    cmp r8, r0
    beq .L_840
    b .L_84c
.L_7c8:
    ldr r0, [sp, #0x50]
    cmp r8, r0
    beq .L_840
    b .L_84c
.L_7d8:
    ldr r0, [sp, #0x54]
    cmp r8, r0
    bgt .L_81c
    ldr r0, [sp, #0x58]
    cmp r8, r0
    bge .L_840
    ldr r0, [sp, #0x5c]
    cmp r8, r0
    bgt .L_80c
    ldr r0, [sp, #0x60]
    cmp r8, r0
    beq .L_840
    b .L_84c
.L_80c:
    ldr r0, [sp, #0x64]
    cmp r8, r0
    beq .L_840
    b .L_84c
.L_81c:
    ldr r0, [sp, #0x68]
    cmp r8, r0
    bgt .L_838
    ldr r0, [sp, #0x6c]
    cmp r8, r0
    beq .L_840
    b .L_84c
.L_838:
    cmp r8, r4
    bne .L_84c
.L_840:
    add sp, sp, #0x154
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_84c:
    mov r0, r8
    bl func_0202e234
    cmp r0, #0x0
    beq .L_c9c
    mov r0, r8
    bl func_02031470
    cmp r0, #0x0
    bne .L_c9c
    add sp, sp, #0x154
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_878:
    ldr r0, [sp, #0x70]
    cmp r8, r0
    bgt .L_904
    ldr r0, [sp, #0x74]
    cmp r8, r0
    bge .L_950
    ldr r0, [sp, #0x78]
    cmp r8, r0
    bgt .L_8d8
    ldr r0, [sp, #0x7c]
    cmp r8, r0
    bge .L_950
    ldr r0, [sp, #0x80]
    cmp r8, r0
    bgt .L_95c
    ldr r0, [sp, #0x84]
    cmp r8, r0
    blt .L_95c
    ldr r0, [sp, #0x88]
    cmp r8, r0
    ldrne r0, [sp, #0x8c]
    cmpne r8, r0
    beq .L_950
    b .L_95c
.L_8d8:
    ldr r0, [sp, #0x90]
    cmp r8, r0
    bgt .L_8f4
    ldr r0, [sp, #0x94]
    cmp r8, r0
    beq .L_950
    b .L_95c
.L_8f4:
    ldr r0, [sp, #0x98]
    cmp r8, r0
    beq .L_950
    b .L_95c
.L_904:
    ldr r0, [sp, #0x9c]
    cmp r8, r0
    bgt .L_92c
    ldr r0, [sp, #0xa0]
    cmp r8, r0
    bge .L_950
    ldr r0, [sp, #0xa4]
    cmp r8, r0
    beq .L_950
    b .L_95c
.L_92c:
    ldr r0, [sp, #0xa8]
    cmp r8, r0
    bgt .L_948
    ldr r0, [sp, #0xac]
    cmp r8, r0
    beq .L_950
    b .L_95c
.L_948:
    cmp r8, r4
    bne .L_95c
.L_950:
    add sp, sp, #0x154
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_95c:
    mov r0, r8
    bl func_0202e234
    cmp r0, #0x0
    beq .L_c9c
    add sp, sp, #0x154
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_978:
    cmp r8, r4
    bgt .L_9f4
    bge .L_a74
    ldr r0, [sp, #0xb0]
    cmp r8, r0
    bgt .L_9c8
    ldr r0, [sp, #0xb4]
    cmp r8, r0
    bge .L_a74
    ldr r0, [sp, #0xb8]
    cmp r8, r0
    bgt .L_9b8
    ldr r0, [sp, #0xbc]
    cmp r8, r0
    beq .L_a74
    b .L_a80
.L_9b8:
    ldr r0, [sp, #0xc0]
    cmp r8, r0
    beq .L_a74
    b .L_a80
.L_9c8:
    ldr r0, [sp, #0xc4]
    cmp r8, r0
    bgt .L_9e4
    ldr r0, [sp, #0xc8]
    cmp r8, r0
    beq .L_a74
    b .L_a80
.L_9e4:
    ldr r0, [sp, #0xcc]
    cmp r8, r0
    beq .L_a74
    b .L_a80
.L_9f4:
    ldr r0, [sp, #0xd0]
    cmp r8, r0
    bgt .L_a4c
    ldr r0, [sp, #0xd4]
    cmp r8, r0
    bge .L_a74
    ldr r0, [sp, #0xd8]
    cmp r8, r0
    bgt .L_a3c
    ldr r0, [sp, #0xdc]
    cmp r8, r0
    blt .L_a80
    ldr r0, [sp, #0xe0]
    cmp r8, r0
    ldrne r0, [sp, #0xe4]
    cmpne r8, r0
    beq .L_a74
    b .L_a80
.L_a3c:
    ldr r0, [sp, #0xe8]
    cmp r8, r0
    beq .L_a74
    b .L_a80
.L_a4c:
    ldr r0, [sp, #0xec]
    cmp r8, r0
    bgt .L_a68
    ldr r0, [sp, #0xf0]
    cmp r8, r0
    beq .L_a74
    b .L_a80
.L_a68:
    ldr r0, _LIT5
    cmp r8, r0
    bne .L_a80
.L_a74:
    add sp, sp, #0x154
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_a80:
    mov r0, r8
    bl func_0202e234
    cmp r0, #0x0
    beq .L_c9c
    add sp, sp, #0x154
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_a9c:
    ldr r0, [sp, #0xf4]
    cmp r8, r0
    bne .L_c9c
    add sp, sp, #0x154
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_ab4:
    ldr r0, [sp, #0xf8]
    cmp r8, r0
    ldrne r0, [sp, #0xfc]
    cmpne r8, r0
    bne .L_c9c
    add sp, sp, #0x154
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_ad4:
    ldr r0, [sp, #0x100]
    cmp r8, r0
    ldrne r0, [sp, #0x104]
    cmpne r8, r0
    bne .L_c9c
    add sp, sp, #0x154
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_af4:
    add sp, sp, #0x154
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_b00:
    ldr r0, [sp, #0x108]
    cmp r8, r0
    bne .L_c9c
    add sp, sp, #0x154
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_b18:
    ldr r0, [sp, #0x10c]
    cmp r8, r0
    ldrne r0, [sp, #0x110]
    cmpne r8, r0
    bne .L_c9c
    add sp, sp, #0x154
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_b38:
    ldr r0, [sp, #0x114]
    cmp r8, r0
    bgt .L_bb0
    ldr r0, [sp, #0x118]
    cmp r8, r0
    bge .L_be4
    ldr r0, [sp, #0x11c]
    cmp r8, r0
    bgt .L_ba0
    ldr r0, [sp, #0x120]
    cmp r8, r0
    bge .L_be4
    ldr r0, [sp, #0x124]
    cmp r8, r0
    bgt .L_c9c
    ldr r0, [sp, #0x128]
    cmp r8, r0
    blt .L_c9c
    ldr r0, [sp, #0x12c]
    cmp r8, r0
    ldrne r0, [sp, #0x130]
    cmpne r8, r0
    ldrne r0, [sp, #0x134]
    cmpne r8, r0
    beq .L_be4
    b .L_c9c
.L_ba0:
    ldr r0, [sp, #0x138]
    cmp r8, r0
    beq .L_be4
    b .L_c9c
.L_bb0:
    ldr r0, [sp, #0x13c]
    cmp r8, r0
    bgt .L_bd8
    ldr r0, [sp, #0x140]
    cmp r8, r0
    bge .L_be4
    ldr r0, [sp, #0x144]
    cmp r8, r0
    beq .L_be4
    b .L_c9c
.L_bd8:
    ldr r0, [sp, #0x148]
    cmp r8, r0
    bne .L_c9c
.L_be4:
    add sp, sp, #0x154
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_bf0:
    ldr r0, [sp, #0x14c]
    cmp r8, r0
    bne .L_c9c
    add sp, sp, #0x154
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_c08:
    ldr r0, _LIT6
    ldr r0, [r0, r9, lsl #0x2]
    cmp r0, #0x1
    addeq sp, sp, #0x154
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT7
    cmp r8, r0
    addne r0, r0, #0x7a
    cmpne r8, r0
    bne .L_c40
    add sp, sp, #0x154
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_c40:
    ldr r0, _LIT8
    add sp, sp, #0x154
    ldr r0, [r0, #0xcec]
    cmp r9, r0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_c5c:
    ldr r0, _LIT8
    ldr r0, [r0, #0xcec]
    cmp r9, r0
    beq .L_c9c
    ldr r0, [sp, #0x150]
    cmp r8, r0
    bne .L_c9c
    add sp, sp, #0x154
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_c84:
    add sp, sp, #0x154
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_c90:
    add sp, sp, #0x154
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_c9c:
    ldr r0, [sp]
    add r6, r6, #0x1
    ldr r0, [r0, #0x5d4]
    add r7, r7, #0x1
    cmp r6, r0
    bcc .L_5b4
.L_cb4:
    mov r0, #0x0
    add sp, sp, #0x154
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x000015ad
_LIT2: .word 0x000016e0
_LIT3: .word 0x0000131e
_LIT4: .word 0x00001886
_LIT5: .word 0x00001aa1
_LIT6: .word data_ov002_022cd744
_LIT7: .word 0x00001aa8
_LIT8: .word data_ov002_022d016c
