; func_ov004_021d1448 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104bac
        .extern data_ov004_0220b500
        .extern func_02006110
        .extern func_02006164
        .extern func_0200617c
        .extern func_02006194
        .extern func_0201cd1c
        .extern func_0201cfe0
        .extern func_02021c0c
        .extern func_ov004_021d02f4
        .extern func_ov004_021d0530
        .extern func_ov004_021d05f4
        .extern func_ov004_021d1264
        .extern func_ov004_021d12b0
        .extern func_ov004_021d1308
        .extern func_ov004_021d1360
        .extern func_ov004_021d13dc
        .global func_ov004_021d1448
        .arm
func_ov004_021d1448:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x18
    ldr r8, _LIT0
    mov r0, #0x0
    str r0, [r8, #0x9c]
    ldr r0, [r8, #0x5c]
    cmp r0, #0x0
    addne sp, sp, #0x18
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [r8, #0x54]
    cmp r0, #0xf
    add r0, r8, #0x3000
    beq .L_370
    ldr r0, [r0, #0xc84]
    str r0, [sp]
    bl func_02006194
    cmp r0, #0x0
    bne .L_54
    bl func_0200617c
    cmp r0, #0x0
    beq .L_1e0
.L_54:
    add r0, sp, #0x14
    add r1, sp, #0x10
    bl func_02006110
    ldr r0, [sp, #0x14]
    cmp r0, #0xe0
    blt .L_a0
    cmp r0, #0xfa
    bge .L_a0
    ldr r0, [sp, #0x10]
    cmp r0, #0xa4
    blt .L_a0
    cmp r0, #0xbe
    bge .L_a0
    mov r0, #0x1
    str r0, [r8, #0xa0]
    bl func_0200617c
    cmp r0, #0x0
    beq .L_a0
    bl func_ov004_021d1264
.L_a0:
    mov r7, #0x1
    ldr r5, _LIT1
    mov r9, #0x0
    add r4, r8, #0x3000
    mov r6, r7
    mov fp, #0x17
.L_b8:
    cmp r9, #0x0
    movne r0, #0x25
    ldr r1, [sp, #0x10]
    moveq r0, #0x6a
    cmp r1, r0
    blt .L_184
    add r0, r0, #0x1a
    cmp r1, r0
    bge .L_184
    ldr r0, [sp, #0x14]
    cmp r0, #0xf
    blt .L_184
    cmp r0, #0xef
    bge .L_184
    sub r0, r0, #0xf
    smull r1, r2, r5, r0
    add r2, r0, r2
    mov r3, r0, lsr #0x1f
    add r2, r3, r2, asr #0x4
    smull r1, r2, fp, r2
    sub r2, r0, r1
    cmp r2, #0x14
    bge .L_180
    smull r1, sl, r5, r0
    add sl, r0, sl
    add sl, r3, sl, asr #0x4
    bl func_02006164
    cmp r0, #0x0
    cmpne r9, #0x0
    beq .L_168
    moveq r1, #0x1
    ldr r0, [r4, #0xc84]
    movne r1, #0x0
    cmp r0, r1
    ldreq r0, [r4, #0xc80]
    cmpeq r0, sl
    bne .L_168
    add r0, r8, r9, lsl #0x2
    add r0, r0, #0x3000
    ldr r0, [r0, #0xc0c]
    cmp sl, r0
    bge .L_168
    str r7, [r4, #0xc88]
    bl func_ov004_021d1308
.L_168:
    cmp r9, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    str r0, [r4, #0xc84]
    str sl, [r4, #0xc80]
    b .L_184
.L_180:
    str r6, [r8, #0x60]
.L_184:
    add r9, r9, #0x1
    cmp r9, #0x2
    blt .L_b8
    ldr r0, [sp, #0x10]
    cmp r0, #0x89
    blt .L_320
    cmp r0, #0x9d
    bge .L_320
    ldr r0, [sp, #0x14]
    cmp r0, #0x29
    blt .L_320
    cmp r0, #0xd7
    bge .L_320
    mov r1, #0x1
    add r0, r8, #0x3000
    mov r2, #0x2
    str r2, [r0, #0xc84]
    str r1, [r8, #0x9c]
    bl func_0200617c
    cmp r0, #0x0
    beq .L_320
    bl func_ov004_021d12b0
    b .L_320
.L_1e0:
    ldr r0, _LIT2
    ldrh r2, [r0, #0x54]
    tst r2, #0x2
    beq .L_200
    mov r0, #0x1
    str r0, [r8, #0xa0]
    bl func_ov004_021d1264
    b .L_320
.L_200:
    tst r2, #0x400
    beq .L_218
    mov r0, #0x1
    str r0, [r8, #0x9c]
    bl func_ov004_021d12b0
    b .L_320
.L_218:
    tst r2, #0x40
    beq .L_238
    add r0, r8, #0x3000
    ldr r1, [r0, #0xc84]
    cmp r1, #0x0
    subgt r1, r1, #0x1
    strgt r1, [r0, #0xc84]
    b .L_320
.L_238:
    add r0, r8, #0x3000
    tst r2, #0x80
    ldr r1, [r0, #0xc84]
    beq .L_258
    cmp r1, #0x2
    addlt r1, r1, #0x1
    strlt r1, [r0, #0xc84]
    b .L_320
.L_258:
    cmp r1, #0x0
    beq .L_274
    cmp r1, #0x1
    beq .L_2d4
    cmp r1, #0x2
    beq .L_30c
    b .L_320
.L_274:
    tst r2, #0x1
    beq .L_29c
    ldr r2, [r0, #0xc80]
    ldr r1, [r0, #0xc10]
    cmp r2, r1
    bge .L_320
    mov r1, #0x1
    str r1, [r0, #0xc88]
    bl func_ov004_021d1308
    b .L_320
.L_29c:
    tst r2, #0x10
    beq .L_2b8
    ldr r1, [r0, #0xc80]
    cmp r1, #0x9
    addlt r1, r1, #0x1
    strlt r1, [r0, #0xc80]
    b .L_320
.L_2b8:
    tst r2, #0x20
    beq .L_320
    ldr r1, [r0, #0xc80]
    cmp r1, #0x0
    subgt r1, r1, #0x1
    strgt r1, [r0, #0xc80]
    b .L_320
.L_2d4:
    tst r2, #0x10
    beq .L_2f0
    ldr r1, [r0, #0xc80]
    cmp r1, #0x9
    addlt r1, r1, #0x1
    strlt r1, [r0, #0xc80]
    b .L_320
.L_2f0:
    tst r2, #0x20
    beq .L_320
    ldr r1, [r0, #0xc80]
    cmp r1, #0x0
    subgt r1, r1, #0x1
    strgt r1, [r0, #0xc80]
    b .L_320
.L_30c:
    tst r2, #0x1
    beq .L_320
    mov r0, #0x1
    str r0, [r8, #0x9c]
    bl func_ov004_021d12b0
.L_320:
    ldr r0, [sp]
    add r1, r8, #0x3000
    cmp r0, #0x0
    ldr r0, [r1, #0xc84]
    movgt r1, #0x1
    movle r1, #0x0
    cmp r0, #0x0
    movgt r2, #0x1
    movle r2, #0x0
    cmp r1, r2
    beq .L_364
    cmp r0, #0x0
    movne r0, #0x9
    moveq r0, #0xc
    add r0, r0, #0xb6
    add r0, r0, #0x300
    bl func_ov004_021d0530
.L_364:
    mov r0, #0x1
    bl func_ov004_021d05f4
    b .L_5d4
.L_370:
    ldr r1, [r0, #0xc74]
    cmp r1, #0x0
    bne .L_59c
    bl func_02006194
    cmp r0, #0x0
    bne .L_394
    bl func_0200617c
    cmp r0, #0x0
    beq .L_494
.L_394:
    add r0, sp, #0xc
    add r1, sp, #0x8
    bl func_02006110
    mov r9, #0x0
    ldr r3, [sp, #0xc]
    ldr r5, [sp, #0x8]
    add r0, r8, #0x3000
    mov r6, #0x6a
    mov r7, #0x25
    mov r1, r9
    mov r2, #0x1
.L_3c0:
    cmp r9, #0x0
    movne r4, r7
    moveq r4, r6
    cmp r5, r4
    blt .L_400
    add r4, r4, #0x1a
    cmp r5, r4
    bge .L_400
    cmp r3, #0x76
    blt .L_400
    cmp r3, #0x8a
    bge .L_400
    cmp r9, #0x0
    moveq r4, r2
    movne r4, r1
    str r4, [r0, #0xc84]
.L_400:
    add r9, r9, #0x1
    cmp r9, #0x2
    blt .L_3c0
    ldr r0, [sp, #0x8]
    cmp r0, #0x89
    blt .L_5d4
    cmp r0, #0x9e
    bge .L_5d4
    ldr r0, [sp, #0xc]
    cmp r0, #0x2f
    blt .L_458
    cmp r0, #0x7b
    bge .L_458
    mov r2, #0x1
    add r0, r8, #0x3000
    mov r1, #0x2
    str r2, [r8, #0x9c]
    str r1, [r0, #0xc84]
    bl func_0200617c
    cmp r0, #0x0
    beq .L_458
    bl func_ov004_021d1360
.L_458:
    ldr r0, [sp, #0xc]
    cmp r0, #0x84
    blt .L_5d4
    cmp r0, #0xd0
    bge .L_5d4
    mov r2, #0x1
    add r0, r8, #0x3000
    mov r1, #0x3
    str r2, [r8, #0xa0]
    str r1, [r0, #0xc84]
    bl func_0200617c
    cmp r0, #0x0
    beq .L_5d4
    bl func_ov004_021d13dc
    b .L_5d4
.L_494:
    ldr r0, _LIT2
    ldrh r0, [r0, #0x54]
    tst r0, #0x1
    beq .L_4e0
    add r0, r8, #0x3000
    ldr r0, [r0, #0xc84]
    cmp r0, #0x2
    beq .L_4c0
    cmp r0, #0x3
    beq .L_4d0
    b .L_5d4
.L_4c0:
    mov r0, #0x1
    str r0, [r8, #0x9c]
    bl func_ov004_021d1360
    b .L_5d4
.L_4d0:
    mov r0, #0x1
    str r0, [r8, #0xa0]
    bl func_ov004_021d13dc
    b .L_5d4
.L_4e0:
    tst r0, #0x2
    beq .L_504
    mov r2, #0x1
    add r0, r8, #0x3000
    mov r1, #0x3
    str r2, [r8, #0xa0]
    str r1, [r0, #0xc84]
    bl func_ov004_021d13dc
    b .L_5d4
.L_504:
    tst r0, #0x40
    beq .L_52c
    add r0, r8, #0x3000
    ldr r0, [r0, #0xc84]
    cmp r0, #0x1
    movgt r1, #0x1
    movle r1, #0x0
    add r0, r8, #0x3000
    str r1, [r0, #0xc84]
    b .L_5d4
.L_52c:
    tst r0, #0x80
    beq .L_55c
    add r0, r8, #0x3000
    ldr r0, [r0, #0xc84]
    cmp r0, #0x3
    add r0, r8, #0x3000
    movlt r2, #0x1
    ldr r1, [r0, #0xc84]
    movge r2, #0x0
    add r1, r1, r2
    str r1, [r0, #0xc84]
    b .L_5d4
.L_55c:
    tst r0, #0x10
    beq .L_57c
    add r0, r8, #0x3000
    ldr r1, [r0, #0xc84]
    cmp r1, #0x2
    moveq r1, #0x3
    streq r1, [r0, #0xc84]
    b .L_5d4
.L_57c:
    tst r0, #0x20
    beq .L_5d4
    add r0, r8, #0x3000
    ldr r1, [r0, #0xc84]
    cmp r1, #0x3
    moveq r1, #0x2
    streq r1, [r0, #0xc84]
    b .L_5d4
.L_59c:
    ldr r4, [r0, #0xc78]
    cmp r1, r4
    movle r4, r1
    bl func_0201cfe0
    cmp r0, #0x0
    beq .L_5d4
    cmp r4, #0xc0
    bne .L_5d4
    mov r3, #0x10
    add r1, sp, #0x4
    mov r0, #0x6
    mov r2, #0x2
    strh r3, [sp, #0x4]
    bl func_0201cd1c
.L_5d4:
    bl func_ov004_021d02f4
    bl func_02021c0c
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov004_0220b500
_LIT1: .word 0xb21642c9
_LIT2: .word data_02104bac
