; func_ov000_021aae04 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0208bec0
        .global func_ov000_021aae04
        .arm
func_ov000_021aae04:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov sl, r0
    mov r9, r1
    cmp sl, r9
    movge r5, sl
    mov r8, r2
    movlt r5, r9
    cmp r8, r5
    movgt r5, r8
    ldr r2, _LIT0
    mov r7, r3
    smull r1, r3, r2, r5
    cmp sl, r9
    movle r4, sl
    movgt r4, r9
    cmp r8, r4
    movlt r4, r8
    mov r0, r5, lsr #0x1f
    add r3, r5, r3
    ldr r1, [sp, #0x24]
    add r3, r0, r3, asr #0x7
    cmp r5, #0x0
    ldr r6, [sp, #0x20]
    str r3, [r1]
    sub r4, r5, r4
    moveq r0, #0x0
    beq .L_78
    mov r0, r4
    mov r1, r5
    bl func_0208bec0
.L_78:
    str r0, [r6]
    ldr r0, [r6]
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [r6]
    streq r0, [r7]
    cmp sl, r5
    bne .L_bc
    cmp r4, #0x0
    moveq r0, #0x0
    streq r0, [r7]
    beq .L_118
    mov r1, r4
    sub r0, r9, r8
    bl func_0208bec0
    str r0, [r7]
    b .L_118
.L_bc:
    cmp r9, r5
    bne .L_ec
    cmp r4, #0x0
    moveq r0, #0x2000
    streq r0, [r7]
    beq .L_118
    mov r1, r4
    sub r0, r8, sl
    bl func_0208bec0
    add r0, r0, #0x2000
    str r0, [r7]
    b .L_118
.L_ec:
    cmp r8, r5
    bne .L_118
    cmp r4, #0x0
    moveq r0, #0x4000
    streq r0, [r7]
    beq .L_118
    mov r1, r4
    sub r0, sl, r9
    bl func_0208bec0
    add r0, r0, #0x4000
    str r0, [r7]
.L_118:
    ldr r1, [r7]
    mov r0, #0x3c
    muls r0, r1, r0
    str r0, [r7]
    addmi r0, r0, #0x168000
    strmi r0, [r7]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0x80808081
