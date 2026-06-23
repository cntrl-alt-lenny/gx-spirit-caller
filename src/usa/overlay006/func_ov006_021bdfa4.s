; func_ov006_021bdfa4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov006_0224f328
        .extern func_0202de48
        .extern func_ov006_021b6c1c
        .extern func_ov006_021b6cac
        .extern func_ov006_021b6f10
        .extern func_ov006_021b74f0
        .extern func_ov006_021bd5b0
        .global func_ov006_021bdfa4
        .arm
func_ov006_021bdfa4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    mov sl, r0
    mov r9, r1
    ldr r1, [sl, #0x50]
    add r4, sl, #0xa0
    mov r3, #0x24
    mla r4, r1, r3, r4
    mov r8, r2
    mov fp, #0x0
    bl func_ov006_021bd5b0
    movs r2, r0
    addmi sp, sp, #0x8
    movmi r0, fp
    ldmmiia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [r4, #0x20]
    ldr r1, [sl, #0x50]
    mov r3, r0, lsl #0x1f
    ldr r0, _LIT0
    mov r3, r3, lsr #0x1f
    bl func_ov006_021b6c1c
    mov r4, r0
    bl func_0202de48
    cmp r9, r8
    addeq sp, sp, #0x8
    moveq r0, fp
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, [sl, #0x40]
    cmp r1, #0x2
    beq .L_390
    cmp r9, #0x1
    cmpne r9, #0x2
    beq .L_36c
    cmp r9, #0x3
    beq .L_380
    b .L_390
.L_36c:
    cmp r0, #0x3
    bne .L_390
    add sp, sp, #0x8
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_380:
    cmp r0, #0x3
    addne sp, sp, #0x8
    movne r0, fp
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_390:
    cmp r1, #0x1
    bne .L_3c4
    cmp r9, #0x1
    beq .L_3b4
    cmp r9, #0x2
    beq .L_3bc
    cmp r9, #0x3
    moveq r5, #0x80
    b .L_400
.L_3b4:
    mov r5, #0x80
    b .L_400
.L_3bc:
    mov r5, #0x80
    b .L_400
.L_3c4:
    cmp r1, #0x2
    bne .L_3d8
    cmp r9, #0x1
    moveq r5, #0xa
    b .L_400
.L_3d8:
    cmp r9, #0x1
    beq .L_3f4
    cmp r9, #0x2
    beq .L_3fc
    cmp r9, #0x3
    moveq r5, #0x1e
    b .L_400
.L_3f4:
    mov r5, #0x50
    b .L_400
.L_3fc:
    mov r5, #0xf
.L_400:
    cmp r9, #0x0
    beq .L_498
    ldr r0, _LIT0
    add r0, r0, r9, lsl #0x1
    add r0, r0, #0x8100
    ldrh r0, [r0, #0x6a]
    cmp r0, r5
    blt .L_498
    cmp r9, #0x1
    beq .L_43c
    cmp r9, #0x2
    beq .L_460
    cmp r9, #0x3
    beq .L_478
    b .L_48c
.L_43c:
    mov r0, #0x6
    str r0, [sl, #0x88]
    ldr r0, [sl, #0x40]
    cmp r0, #0x2
    moveq r0, #0x16
    movne r0, #0x3
    str r0, [sl, #0x8c]
    str r4, [sl, #0x90]
    b .L_48c
.L_460:
    mov r0, #0x6
    str r0, [sl, #0x88]
    mov r0, #0x4
    str r0, [sl, #0x8c]
    str r4, [sl, #0x90]
    b .L_48c
.L_478:
    mov r0, #0x6
    str r0, [sl, #0x88]
    mov r0, #0x5
    str r0, [sl, #0x8c]
    str r4, [sl, #0x90]
.L_48c:
    add sp, sp, #0x8
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_498:
    cmp r8, #0x0
    bne .L_518
    cmp r1, #0x2
    beq .L_518
    ldr r0, _LIT0
    mov r2, r4
    mov r1, #0x3
    mov r3, #0x0
    bl func_ov006_021b6f10
    mov r5, r0
    ldr r0, _LIT0
    mov r2, r4
    mov r1, #0x1
    mov r3, #0x0
    bl func_ov006_021b6f10
    mov r6, r0
    ldr r0, _LIT0
    mov r1, #0x2
    mov r2, r4
    mov r3, #0x0
    bl func_ov006_021b6f10
    add r0, r6, r0
    add r0, r5, r0
    cmp r0, #0x3
    blt .L_518
    mov r0, #0x6
    str r0, [sl, #0x88]
    mov r0, #0x0
    str r0, [sl, #0x8c]
    add sp, sp, #0x8
    str r4, [sl, #0x90]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_518:
    mov r0, sl
    mov r1, r8
    bl func_ov006_021bd5b0
    add r2, sl, #0xa0
    mov r1, #0x24
    mla r6, r8, r1, r2
    mov r7, r0
    ldr r0, [r6, #0x20]
    cmp r8, #0x4
    moveq r2, #0x3
    mov r0, r0, lsl #0x1e
    movne r2, #0x4
    movs r0, r0, lsr #0x1f
    beq .L_56c
    ldr r0, [r6, #0x10]
    ldr r1, [r6, #0x8]
    sub r0, r0, r2
    cmp r1, r0
    movge r0, #0x1
    strge r0, [sp, #0x4]
    bge .L_574
.L_56c:
    mov r0, #0x0
    str r0, [sp, #0x4]
.L_574:
    ldr r0, [r6, #0x20]
    ldr r1, [sl, #0x50]
    mov r3, r0, lsl #0x1f
    ldr r0, _LIT0
    mov r2, r7
    mov r3, r3, lsr #0x1f
    ldr r5, [r6, #0xc]
    bl func_ov006_021b6cac
    mov r3, r4
    mov r4, r0
    mov r2, #0x1
    str r2, [sp]
    ldr r0, _LIT0
    mov r1, r9
    mov r2, r8
    bl func_ov006_021b74f0
    cmp r4, #0x1
    bne .L_6cc
    cmp r5, #0x1
    ble .L_6cc
    cmp r8, #0x0
    bne .L_5d8
    ldr r0, [sl, #0x40]
    cmp r0, #0x3
    bne .L_6cc
.L_5d8:
    ldr r0, [r6, #0x20]
    mov r1, r0, lsl #0x1f
    movs r1, r1, lsr #0x1f
    mov r0, r0, lsl #0x1e
    beq .L_688
    movs r0, r0, lsr #0x1f
    ldrne r0, [sp, #0x4]
    cmpne r0, #0x0
    beq .L_644
    ldr r2, _LIT1
    mov r0, r5, lsr #0x1f
    smull r1, r3, r2, r5
    add r3, r0, r3, asr #0x2
    mov r2, #0xa
    smull r0, r1, r2, r3
    sub r3, r5, r0
    cmp r3, #0x1
    bne .L_644
    ldr r1, [r6, #0x8]
    sub r0, r5, #0x1
    sub r1, r1, #0x1
    str r1, [r6, #0x8]
    cmp r7, r0
    ldrne r0, [r6, #0x4]
    mov fp, #0x1
    addne r0, r0, #0x1
    strne r0, [r6, #0x4]
.L_644:
    sub r0, r5, #0x1
    cmp r7, r0
    bne .L_6cc
    ldr r0, [r6]
    subs r0, r0, #0x1
    str r0, [r6]
    bpl .L_6cc
    mov r0, #0x9
    str r0, [r6]
    cmp fp, #0x0
    bne .L_6cc
    ldr r0, [r6, #0x4]
    subs r0, r0, #0x1
    str r0, [r6, #0x4]
    movmi r0, #0x0
    strmi r0, [r6, #0x4]
    b .L_6cc
.L_688:
    movs r0, r0, lsr #0x1f
    ldrne r0, [sp, #0x4]
    cmpne r0, #0x0
    beq .L_6a8
    ldr r0, [r6, #0x8]
    mov fp, #0x1
    sub r0, r0, #0x1
    str r0, [r6, #0x8]
.L_6a8:
    sub r0, r5, #0x1
    cmp r7, r0
    cmpeq fp, #0x0
    bne .L_6cc
    ldr r0, [r6, #0x4]
    subs r0, r0, #0x1
    str r0, [r6, #0x4]
    movmi r0, #0x0
    strmi r0, [r6, #0x4]
.L_6cc:
    ldr r0, [sl, #0x50]
    cmp r0, #0x0
    bne .L_6e8
    ldr r0, [sl, #0x40]
    cmp r0, #0x3
    movne r0, #0x1
    strne r0, [sl, #0x80]
.L_6e8:
    mov r0, #0x1
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov006_0224f328
_LIT1: .word 0x66666667
