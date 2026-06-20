; func_ov002_0229d890 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021c988c
        .extern func_ov002_0229d184
        .global func_ov002_0229d890
        .arm
func_ov002_0229d890:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    ldr r0, [sl, #0xa4]
    sub r9, r0, #0x8
    cmp r1, r9
    movle r9, r1
    cmp r9, #0x0
    movle r9, #0x0
    cmp r2, #0x0
    beq .L_44
    mov r2, #0x0
    mov r1, r2
.L_30:
    add r0, sl, r2, lsl #0x2
    add r2, r2, #0x1
    str r1, [r0, #0xbc]
    cmp r2, #0x4
    blt .L_30
.L_44:
    mov r5, #0x0
    ldr fp, _LIT0
    mov r7, sl
    mov r4, r5
.L_54:
    ldr r0, [sl, #0xa4]
    add r8, r9, r5
    cmp r8, r0
    strgeb r4, [r7]
    bge .L_148
    ldr r0, [sl, #0xa0]
    ldr r2, _LIT1
    and r3, r0, #0x1
    mla r2, r3, r2, fp
    add r2, r2, r8, lsl #0x2
    ldr r3, [r2, #0x120]
    mov r1, #0xb
    mov r3, r3, lsl #0x13
    mov r2, r8
    mov r6, r3, lsr #0x13
    bl func_ov002_021c988c
    cmp r0, #0x0
    bne .L_b8
    mov r0, r8, lsr #0x5
    add r0, sl, r0, lsl #0x2
    ldr r1, [r0, #0xbc]
    and r0, r8, #0x1f
    mov r0, r1, lsr r0
    tst r0, #0x1
    beq .L_c0
.L_b8:
    mov r1, #0x1
    b .L_c4
.L_c0:
    mov r1, #0x0
.L_c4:
    mov r0, r8, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r8, r0, lsl #0x18
    mov r0, r1, lsl #0x10
    mov r1, r6
    ldr r6, [sl, #0xa0]
    ldrh r2, [sp]
    mov r6, r6, lsl #0x10
    mov r6, r6, lsr #0x10
    bic r2, r2, #0x1
    and r6, r6, #0x1
    orr r2, r2, r6
    strh r2, [sp]
    ldrh r6, [sp]
    mov r0, r0, lsr #0x10
    mov r3, r0, lsl #0x1f
    bic r6, r6, #0x3e
    orr r6, r6, #0x16
    strh r6, [sp]
    ldrh r6, [sp]
    mov r0, r7
    add r2, sp, #0x0
    bic r6, r6, #0x3fc0
    orr r6, r6, r8, lsr #0x12
    strh r6, [sp]
    ldrh r6, [sp]
    bic r6, r6, #0x4000
    orr r3, r6, r3, lsr #0x11
    strh r3, [sp]
    ldrh r3, [sp]
    bic r3, r3, #0x8000
    strh r3, [sp]
    bl func_ov002_0229d184
.L_148:
    add r5, r5, #0x1
    cmp r5, #0x8
    add r7, r7, #0x14
    blt .L_54
    str r9, [sl, #0xa8]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
