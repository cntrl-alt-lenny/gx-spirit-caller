; func_020a56bc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a9920
        .extern func_02091814
        .extern func_020919d8
        .extern func_02093bfc
        .extern func_020a5878
        .global func_020a56bc
        .arm
func_020a56bc:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x4
    ldr r4, _LIT0
    mov r9, r0
    mov r8, r1
    mov r7, r2
    mov r6, r3
    ldr r5, [r4]
    bl func_020a5878
    cmp r0, #0x0
    bne .L_84
    bl func_02093bfc
.L_84:
    ldr r0, [r9, #0x4]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    beq .L_98
    bl func_02093bfc
.L_98:
    cmp r6, #0x1f
    bls .L_e4
    mov r0, r5
    bl func_02091814
    cmp r6, #0x20
    bne .L_c0
    cmp r0, #0x0
    subne r6, r0, #0x1
    moveq r6, #0x0
    b .L_e4
.L_c0:
    cmp r6, #0x21
    bne .L_d8
    cmp r0, #0x1f
    addcc r6, r0, #0x1
    movcs r6, #0x1f
    b .L_e4
.L_d8:
    cmp r6, #0x22
    moveq r6, r0
    movne r6, #0x1f
.L_e4:
    bl OS_DisableIrq
    ldr r2, [r9, #0x4]
    bic r1, r6, #-2147483648
    bic r2, r2, #0x1
    orr r2, r2, #0x1
    str r2, [r9, #0x4]
    ldr r2, [r9, #0x4]
    mov r4, r0
    and r0, r2, #0x1
    orr r0, r0, r1, lsl #0x1
    str r0, [r9, #0x4]
    str r8, [r9, #0x8]
    str r7, [r9, #0xc]
    ldr r0, [r5, #0xc0]
    cmp r0, #0x0
    bne .L_148
    add r0, r5, #0xc4
    cmp r9, r0
    ldreq r0, _LIT0
    moveq r1, #0x0
    streq r1, [r0]
    mov r0, r5
    str r9, [r5, #0xc0]
    bl func_020919d8
    b .L_1cc
.L_148:
    add r0, r5, #0xc4
    cmp r9, r0
    ldr r2, [r5, #0xc0]
    bne .L_188
    ldr r0, [r2]
    cmp r0, #0x0
    beq .L_174
.L_164:
    mov r2, r0
    ldr r0, [r0]
    cmp r0, #0x0
    bne .L_164
.L_174:
    ldr r0, _LIT0
    str r9, [r2]
    mov r1, #0x0
    str r1, [r0]
    b .L_1cc
.L_188:
    ldr r0, [r2, #0x4]
    mov r0, r0, lsr #0x1
    cmp r0, r6
    bls .L_1a8
    str r9, [r5, #0xc0]
    str r2, [r9]
    b .L_1cc
.L_1a4:
    mov r2, r1
.L_1a8:
    ldr r1, [r2]
    cmp r1, #0x0
    beq .L_1c4
    ldr r0, [r1, #0x4]
    mov r0, r0, lsr #0x1
    cmp r0, r6
    bls .L_1a4
.L_1c4:
    str r1, [r9]
    str r9, [r2]
.L_1cc:
    mov r0, r4
    bl OS_RestoreIrq
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bx lr
_LIT0: .word data_021a9920
