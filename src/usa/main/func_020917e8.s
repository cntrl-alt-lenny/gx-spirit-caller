; func_020917e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a62f0
        .extern func_02091ea0
        .global func_020917e8
        .arm
func_020917e8:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r0, _LIT0
    mov r7, #0x0
    mov r6, r7
    mov r5, r7
    ldr r8, [r0, #0x4]
    bl OS_DisableIrq
    ldr r1, _LIT0
    mov r4, r0
    ldr r2, [r1, #0x8]
    mov r0, r7
    cmp r2, #0x0
    beq .L_60
    ldr r1, [r8, #0x70]
.L_38:
    cmp r2, r8
    moveq r7, r0
    ldr r0, [r2, #0x70]
    cmp r1, r0
    moveq r6, r2
    mov r0, r2
    ldr r2, [r2, #0x68]
    addeq r5, r5, #0x1
    cmp r2, #0x0
    bne .L_38
.L_60:
    cmp r5, #0x1
    ble .L_70
    cmp r6, r8
    bne .L_80
.L_70:
    mov r0, r4
    bl OS_RestoreIrq
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
.L_80:
    cmp r7, #0x0
    ldreq r1, [r8, #0x68]
    ldreq r0, _LIT0
    streq r1, [r0, #0x8]
    ldrne r0, [r8, #0x68]
    strne r0, [r7, #0x68]
    ldr r0, [r6, #0x68]
    str r0, [r8, #0x68]
    str r8, [r6, #0x68]
    bl func_02091ea0
    mov r0, r4
    bl OS_RestoreIrq
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
_LIT0: .word data_021a62f0
