; func_020324c8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern func_02094688
        .global func_020324c8
        .arm
func_020324c8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    movs r7, r0
    mov r6, r1
    mov r5, r2
    mov r4, r3
    mvneq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    cmp r5, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    add r0, r4, #0x3
    bic r1, r0, #0x3
    ldr r0, [r7, #0x8]
    add sl, r1, #0x4
    cmp r0, sl, lsl #0x1
    mvnls r0, #0x0
    ldmlsia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    bl OS_DisableIrq
    ldmib r7, {r1, r3}
    add r2, r1, sl
    mov r8, r0
    cmp r2, r3
    mov r9, #0x0
    bls .L_98
    add r0, r1, #0x4
    cmp r0, r3
    bhi .L_84
    ldr r2, [r7, #0xc]
    mov r0, #0x1
    strb r9, [r2, r1]
    add r1, r2, r1
    strb r0, [r1, #0x1]
    strh r9, [r1, #0x2]
.L_84:
    ldr r0, [r7]
    mov r1, #0x0
    cmp sl, r0
    subhi r9, r1, #0x1
    bhi .L_f8
.L_98:
    ldr r0, [r7]
    add sl, r1, sl
    cmp r1, r0
    bcs .L_b4
    cmp sl, r0
    mvnhi r9, #0x0
    bhi .L_f8
.L_b4:
    ldr r2, [r7, #0xc]
    mov r0, #0x0
    add r3, r2, r1
    strb r6, [r2, r1]
    strb r0, [r3, #0x1]
    mov r0, r5
    mov r2, r4
    strh r4, [r3, #0x2]
    add r1, r3, #0x4
    bl func_02094688
    str sl, [r7, #0x4]
    ldr r0, [r7, #0x8]
    cmp sl, r0
    moveq r0, #0x0
    streq r0, [r7, #0x4]
    beq .L_f8
    mvneq r9, #0x0
.L_f8:
    mov r0, r8
    bl OS_RestoreIrq
    mov r0, r9
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
