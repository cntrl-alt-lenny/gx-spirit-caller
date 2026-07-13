; func_ov003_021cc768 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103fcc
        .extern data_02104acc
        .extern data_02104c0c
        .extern data_ov003_021cf078
        .extern data_ov003_021cf580
        .extern func_02006190
        .extern func_02034734
        .extern func_020347f4
        .extern func_020371b8
        .extern func_ov003_021ceeb0
        .extern func_ov003_021cef28
        .global func_ov003_021cc768
        .arm
func_ov003_021cc768:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r1, _LIT0
    ldr r2, _LIT1
    ldr r1, [r1, #0xc3c]
    mov r5, r0
    ldr r0, [r2, r1, lsl #0x2]
    ldr r4, _LIT2
    cmp r0, #0x1
    bne .L_25d8
    bl func_020347f4
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    str r0, [r4, #0x44]
    str r0, [r5, #0x10]
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_25d8:
    bl func_02034734
    cmp r0, #0x2
    bne .L_2608
    ldr r0, [r5, #0xc]
    add r0, r0, #0x1
    str r0, [r5, #0xc]
    cmp r0, #0x258
    blt .L_2608
    ldr r1, [r5, #0x10]
    mov r0, #0x1
    str r1, [r4, #0x44]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_2608:
    ldr r0, _LIT3
    ldrh r1, [r0, #0x52]
    cmp r1, #0x0
    beq .L_26a4
    ldrh r1, [r0, #0x56]
    tst r1, #0x10
    beq .L_2654
    ldr r0, [r5, #0x10]
    mov r2, #0x0
    add r0, r0, #0x1
    str r0, [r5, #0x10]
    cmp r0, #0x2
    movgt r0, #0x0
    strgt r0, [r5, #0x10]
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r3, #0x1
    bl func_020371b8
    b .L_275c
.L_2654:
    tst r1, #0x20
    beq .L_2688
    ldr r0, [r5, #0x10]
    mov r2, #0x0
    subs r0, r0, #0x1
    str r0, [r5, #0x10]
    movmi r0, #0x2
    strmi r0, [r5, #0x10]
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r3, #0x1
    bl func_020371b8
    b .L_275c
.L_2688:
    ldrh r0, [r0, #0x54]
    tst r0, #0x1
    beq .L_275c
    ldr r1, [r5, #0x10]
    mov r0, #0x1
    str r1, [r4, #0x44]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_26a4:
    bl func_02006190
    cmp r0, #0x0
    beq .L_270c
    ldr r6, _LIT4
    mov r4, #0x0
.L_26b8:
    mov r0, r5
    mov r1, r6
    bl func_ov003_021ceeb0
    cmp r0, #0x0
    ldrne r0, [r5, #0x10]
    cmpne r0, r4
    beq .L_26f4
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    str r4, [r5, #0x10]
    bl func_020371b8
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_26f4:
    add r4, r4, #0x1
    cmp r4, #0x3
    add r6, r6, #0x6
    blt .L_26b8
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_270c:
    ldr r7, _LIT4
    mov r6, #0x0
.L_2714:
    mov r0, r5
    mov r1, r7
    bl func_ov003_021cef28
    cmp r0, #0x0
    beq .L_274c
    ldr r5, [r5, #0x10]
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    str r5, [r4, #0x44]
    bl func_020371b8
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_274c:
    add r6, r6, #0x1
    cmp r6, #0x3
    add r7, r7, #0x6
    blt .L_2714
.L_275c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_02103fcc
_LIT1: .word data_02104c0c
_LIT2: .word data_ov003_021cf580
_LIT3: .word data_02104acc
_LIT4: .word data_ov003_021cf078
