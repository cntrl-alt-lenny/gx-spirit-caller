; func_0206ee98 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ee54
        .extern data_0219ee5c
        .extern func_0206efe0
        .extern func_0206f04c
        .global func_0206ee98
        .arm
func_0206ee98:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    ldr r6, _LIT0
    mov r9, #0x0
    ldr fp, [r6, #0x8]
    ldr r2, [r6]
    ldr r1, [r6, #0x4]
    umull r5, r4, fp, r2
    mla r4, fp, r1, r4
    ldr sl, [r6, #0xc]
    ldr r3, [r6, #0x10]
    mla r4, sl, r2, r4
    adds r5, r3, r5
    ldr r1, [r6, #0x14]
    umull r8, r7, fp, r5
    adc r4, r1, r4
    mla r7, fp, r4, r7
    mla r7, sl, r5, r7
    mov r2, r9, lsl #0x10
    adds r8, r3, r8
    str r5, [r6]
    adc r5, r1, r7
    mov r3, r9, lsl #0x10
    orr r2, r2, r4, lsr #0x10
    str r4, [r6, #0x4]
    orr r3, r3, r5, lsr #0x10
    add r1, sp, #0x4
    mov sl, r0
    strh r2, [sp, #0x8]
    str r8, [r6]
    str r5, [r6, #0x4]
    strh r3, [sp, #0xa]
    bl func_0206f04c
    cmp r0, #0x0
    ldrne r0, [sp, #0x4]
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bxne lr
    mov r0, #0x1
    ldr r6, _LIT1
    strb r0, [sp]
    strb r0, [sp, #0x1]
    add r5, sp, #0x8
    mov r4, r9
    mov fp, r9
.L_b4:
    mov r8, fp
    add r7, sp, #0x0
.L_bc:
    ldrb r0, [r7]
    cmp r0, #0x0
    beq .L_100
    mov r0, r8, lsl #0x1
    ldrh r2, [r5, r0]
    ldr r1, [r6, r8, lsl #0x2]
    mov r0, sl
    bl func_0206efe0
    str r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_f4
    mvn r1, #0x0
    cmp r0, r1
    bne .L_11c
.L_f4:
    mvn r1, #0x0
    cmp r0, r1
    streqb r4, [r7]
.L_100:
    add r8, r8, #0x1
    cmp r8, #0x2
    add r7, r7, #0x1
    blt .L_bc
    add r9, r9, #0x1
    cmp r9, #0x3
    blt .L_b4
.L_11c:
    ldr r1, [sp, #0x4]
    mvn r0, #0x0
    cmp r1, r0
    moveq r0, #0x0
    streq r0, [sp, #0x4]
    ldr r0, [sp, #0x4]
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
_LIT0: .word data_0219ee5c
_LIT1: .word data_0219ee54
