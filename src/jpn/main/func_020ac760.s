; func_020ac760 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c35e0
        .extern data_020c3660
        .extern func_020b3714
        .global func_020ac760
        .arm
func_020ac760:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x1c
    ldr r4, [sp, #0x48]
    movs r9, r0
    ldr r0, [sp, #0x44]
    str r4, [sp, #0x48]
    mov r4, #0x0
    str r0, [sp, #0x44]
    ldr r0, [sp, #0x48]
    str r1, [sp]
    str r4, [r0]
    mov r0, r4
    str r0, [sp, #0xc]
    str r0, [sp, #0x8]
    ldr r0, [sp, #0x44]
    mov r1, r4
    str r1, [r0]
    ldr r0, [sp, #0x40]
    str r4, [sp, #0x14]
    mov r8, r2
    mov r7, r3
    mov r5, r4
    mov sl, r4
    mov fp, r4
    str r0, [sp, #0x40]
    mov r4, #0x1
    bmi .L_470
    cmp r9, #0x1
    beq .L_470
    cmp r9, #0x24
    bgt .L_470
    ldr r0, [sp]
    cmp r0, #0x1
    bge .L_478
.L_470:
    mov r4, #0x40
    b .L_490
.L_478:
    ldr r1, [sp, #0x14]
    mov r0, r7
    mov r2, r1
    add r5, r1, #0x1
    blx r8
    mov r6, r0
.L_490:
    cmp r9, #0x0
    beq .L_4b4
    mvn r0, #0x0
    mov r1, r0
    mov r3, r9, asr #0x1f
    mov r2, r9
    bl func_020b3714
    str r0, [sp, #0xc]
    str r1, [sp, #0x8]
.L_4b4:
    mvn r0, #0x0
    str r0, [sp, #0x18]
    b .L_7bc
.L_4c0:
    cmp r4, #0x8
    bgt .L_4f8
    cmp r4, #0x0
    addge pc, pc, r4, lsl #0x2
    b .L_7bc
    b .L_7bc
    b .L_504
    b .L_5b0
    b .L_7bc
    b .L_5ec
    b .L_7bc
    b .L_7bc
    b .L_7bc
    b .L_62c
.L_4f8:
    cmp r4, #0x10
    beq .L_62c
    b .L_7bc
.L_504:
    cmp r6, #0x0
    blt .L_514
    cmp r6, #0x80
    blt .L_51c
.L_514:
    mov r0, #0x0
    b .L_52c
.L_51c:
    ldr r0, _LIT0
    mov r1, r6, lsl #0x1
    ldrh r0, [r0, r1]
    and r0, r0, #0x100
.L_52c:
    cmp r0, #0x0
    beq .L_558
    mov r1, #0x0
    mov r0, r7
    mov r2, r1
    blx r8
    mov r6, r0
    ldr r0, [sp, #0x14]
    add r0, r0, #0x1
    str r0, [sp, #0x14]
    b .L_7bc
.L_558:
    cmp r6, #0x2b
    bne .L_57c
    mov r1, #0x0
    mov r0, r7
    mov r2, r1
    add r5, r5, #0x1
    blx r8
    mov r6, r0
    b .L_5a8
.L_57c:
    cmp r6, #0x2d
    bne .L_5a8
    mov r1, #0x0
    mov r0, r7
    mov r2, r1
    add r5, r5, #0x1
    blx r8
    mov r6, r0
    ldr r0, [sp, #0x44]
    mov r1, #0x1
    str r1, [r0]
.L_5a8:
    mov r4, #0x2
    b .L_7bc
.L_5b0:
    cmp r9, #0x0
    cmpne r9, #0x10
    bne .L_5e4
    cmp r6, #0x30
    bne .L_5e4
    mov r1, #0x0
    mov r0, r7
    mov r2, r1
    mov r4, #0x4
    add r5, r5, #0x1
    blx r8
    mov r6, r0
    b .L_7bc
.L_5e4:
    mov r4, #0x8
    b .L_7bc
.L_5ec:
    cmp r6, #0x58
    cmpne r6, #0x78
    bne .L_61c
    mov r1, #0x0
    mov r0, r7
    mov r2, r1
    mov r9, #0x10
    mov r4, #0x8
    add r5, r5, #0x1
    blx r8
    mov r6, r0
    b .L_7bc
.L_61c:
    cmp r9, #0x0
    moveq r9, #0x8
    mov r4, #0x10
    b .L_7bc
.L_62c:
    ldr r1, [sp, #0x8]
    mov r0, #0x0
    cmp r9, #0x0
    moveq r9, #0xa
    cmp r1, r0
    ldr r1, [sp, #0xc]
    cmpeq r1, r0
    bne .L_668
    ldr r0, [sp, #0x18]
    mov r3, r9, asr #0x1f
    mov r1, r0
    mov r2, r9
    bl func_020b3714
    str r0, [sp, #0xc]
    str r1, [sp, #0x8]
.L_668:
    cmp r6, #0x0
    blt .L_678
    cmp r6, #0x80
    blt .L_680
.L_678:
    mov r0, #0x0
    b .L_690
.L_680:
    ldr r0, _LIT0
    mov r1, r6, lsl #0x1
    ldrh r0, [r0, r1]
    and r0, r0, #0x8
.L_690:
    cmp r0, #0x0
    beq .L_6b8
    sub r6, r6, #0x30
    cmp r6, r9
    blt .L_740
    cmp r4, #0x10
    moveq r4, #0x20
    movne r4, #0x40
    add r6, r6, #0x30
    b .L_7bc
.L_6b8:
    cmp r6, #0x0
    blt .L_6c8
    cmp r6, #0x80
    blt .L_6d0
.L_6c8:
    mov r0, #0x0
    b .L_6e0
.L_6d0:
    ldr r0, _LIT0
    mov r1, r6, lsl #0x1
    ldrh r0, [r0, r1]
    and r0, r0, #0x1
.L_6e0:
    cmp r0, #0x0
    beq .L_714
    cmp r6, #0x0
    blt .L_6f8
    cmp r6, #0x80
    blt .L_700
.L_6f8:
    mov r0, r6
    b .L_708
.L_700:
    ldr r0, _LIT1
    ldrb r0, [r0, r6]
.L_708:
    sub r0, r0, #0x37
    cmp r0, r9
    blt .L_724
.L_714:
    cmp r4, #0x10
    moveq r4, #0x20
    movne r4, #0x40
    b .L_7bc
.L_724:
    cmp r6, #0x0
    blt .L_73c
    cmp r6, #0x80
    bge .L_73c
    ldr r0, _LIT1
    ldrb r6, [r0, r6]
.L_73c:
    sub r6, r6, #0x37
.L_740:
    ldr r0, [sp, #0x8]
    umull r2, r3, sl, r9
    cmp fp, r0
    ldr r0, [sp, #0xc]
    mov r4, #0x10
    cmpeq sl, r0
    ldrhi r0, [sp, #0x48]
    movhi r1, #0x1
    strhi r1, [r0]
    mov r1, r9, asr #0x1f
    mla r3, sl, r1, r3
    mla r3, fp, r9, r3
    ldr r1, [sp, #0x18]
    mov sl, r2
    subs r2, r1, r2
    mov r0, r6, asr #0x1f
    sbc r1, r1, r3
    cmp r0, r1
    cmpeq r6, r2
    ldrhi r1, [sp, #0x48]
    movhi r2, #0x1
    strhi r2, [r1]
    mov r1, #0x0
    mov fp, r3
    adds sl, sl, r6
    adc fp, fp, r0
    mov r0, r7
    mov r2, r1
    add r5, r5, #0x1
    blx r8
    mov r6, r0
.L_7bc:
    ldr r0, [sp]
    cmp r5, r0
    bgt .L_7dc
    ldr r0, [sp, #0x18]
    cmp r6, r0
    beq .L_7dc
    tst r4, #0x60
    beq .L_4c0
.L_7dc:
    tst r4, #0x34
    bne .L_7f8
    ldr r0, [sp, #0x40]
    mov sl, #0x0
    mov fp, sl
    str sl, [r0]
    b .L_80c
.L_7f8:
    ldr r0, [sp, #0x14]
    sub r1, r5, #0x1
    add r1, r1, r0
    ldr r0, [sp, #0x40]
    str r1, [r0]
.L_80c:
    mov r0, r7
    mov r1, r6
    mov r2, #0x1
    blx r8
    mov r0, sl
    mov r1, fp
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_020c3660
_LIT1: .word data_020c35e0
