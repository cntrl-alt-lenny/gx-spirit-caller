; func_020918d0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a63d0
        .extern func_02091f88
        .global func_020918d0
        .arm
func_020918d0:
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
    beq .L_114
    ldr r1, [r8, #0x70]
.L_ec:
    cmp r2, r8
    moveq r7, r0
    ldr r0, [r2, #0x70]
    cmp r1, r0
    moveq r6, r2
    mov r0, r2
    ldr r2, [r2, #0x68]
    addeq r5, r5, #0x1
    cmp r2, #0x0
    bne .L_ec
.L_114:
    cmp r5, #0x1
    ble .L_124
    cmp r6, r8
    bne .L_134
.L_124:
    mov r0, r4
    bl OS_RestoreIrq
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
.L_134:
    cmp r7, #0x0
    ldreq r1, [r8, #0x68]
    ldreq r0, _LIT0
    streq r1, [r0, #0x8]
    ldrne r0, [r8, #0x68]
    strne r0, [r7, #0x68]
    ldr r0, [r6, #0x68]
    str r0, [r8, #0x68]
    str r8, [r6, #0x68]
    bl func_02091f88
    mov r0, r4
    bl OS_RestoreIrq
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
_LIT0: .word data_021a63d0
