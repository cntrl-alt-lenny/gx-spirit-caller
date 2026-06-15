; func_ov000_021acaf8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020bef80
        .extern func_0201e7e4
        .extern func_0201e7ec
        .extern func_0201e800
        .extern func_0207fd28
        .extern func_020b3870
        .global func_ov000_021acaf8
        .arm
func_ov000_021acaf8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    ldr r0, [sl, #0x98]
    mov r1, r0, lsl #0x3
    movs r1, r1, lsr #0x1f
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x1c
    mov r8, #0x0
    mov r5, #0x1
    add r1, sl, #0x8
    add r0, r0, r0, lsl #0x1
    add r9, r1, r0, lsl #0x2
    mov fp, r8
    mov r4, #0x1000
    mov r6, r8
    mov r7, r5
.L_44:
    mov r0, r7
    cmp r8, #0x1
    beq .L_64
    cmp r8, #0x2
    ldreq r0, [sl, #0x98]
    moveq r0, r0, lsl #0x6
    moveq r0, r0, lsr #0x1f
    b .L_70
.L_64:
    ldr r0, [sl, #0x98]
    mov r0, r0, lsl #0x5
    mov r0, r0, lsr #0x1f
.L_70:
    cmp r0, #0x0
    ldr r0, [r9]
    beq .L_b0
    bl func_0201e7e4
    cmp r0, #0x0
    ldr r0, [r9]
    bne .L_a4
    mov r1, r6
    bl func_0201e800
    ldr r0, [r9]
    mov r1, r5
    bl func_0201e7ec
    b .L_b8
.L_a4:
    mov r1, r4
    bl func_0207fd28
    b .L_b8
.L_b0:
    mov r1, fp
    bl func_0201e800
.L_b8:
    add r8, r8, #0x1
    cmp r8, #0x3
    add r9, r9, #0x4
    blt .L_44
    ldr r3, [sl, #0x9c]
    mov r0, r3, lsl #0x18
    mov r1, r3, lsl #0x10
    mov r0, r0, lsr #0x18
    cmp r0, r1, lsr #0x18
    mov r1, r1, lsr #0x18
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    add r0, r0, #0x1
    and r2, r0, #0xff
    bic r3, r3, #0xff
    orr r2, r3, r2
    mov r0, r0, lsl #0xe
    str r2, [sl, #0x9c]
    bl func_020b3870
    mov r1, r0, asr #0x4
    ldr r0, _LIT0
    mov r1, r1, lsl #0x2
    ldrsh r4, [r0, r1]
    ldr r0, [sl, #0x90]
    ldr r3, [sl, #0x88]
    smull r2, r1, r0, r4
    adds r2, r2, #0x800
    adc r0, r1, #0x0
    mov r1, r2, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    add r0, r3, r1
    str r0, [sl, #0x80]
    ldr r0, [sl, #0x94]
    ldr r3, [sl, #0x8c]
    smull r2, r1, r0, r4
    adds r2, r2, #0x800
    adc r0, r1, #0x0
    mov r1, r2, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    add r0, r3, r1
    str r0, [sl, #0x84]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_020bef80
