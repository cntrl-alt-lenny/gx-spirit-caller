; func_02097700 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a8308
        .extern data_021a830c
        .extern func_020977c0
        .extern func_02097d60
        .global func_02097700
        .arm
func_02097700:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r6, r1
    mov r5, r2
    mov r7, r0
    mov r8, #0x0
    bl OS_DisableIrq
    mov r4, r0
    mov r0, r6
    mov r1, r5
    bl func_020977c0
    cmp r0, #0x0
    bne .L_54c
    ldr r1, _LIT0
    ldr r2, [r1]
    cmp r2, #0x0
    bne .L_508
    ldr r0, _LIT1
    mov r2, r8
    str r7, [r1]
    str r7, [r0]
    str r2, [r0, #0x8]
    strh r2, [r0, #0x6]
    strh r2, [r0, #0x4]
    b .L_52c
.L_508:
    ldr r0, [r2, #0x4]
    cmp r0, #0x0
    beq .L_524
.L_514:
    mov r2, r0
    ldr r0, [r0, #0x4]
    cmp r0, #0x0
    bne .L_514
.L_524:
    str r7, [r2, #0x4]
    str r2, [r7, #0x8]
.L_52c:
    mov r0, r6
    mov r1, r5
    bl func_02097d60
    str r0, [r7]
    ldr r0, [r7, #0x1c]
    mov r8, #0x1
    orr r0, r0, #0x1
    str r0, [r7, #0x1c]
.L_54c:
    mov r0, r4
    bl OS_RestoreIrq
    mov r0, r8
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
_LIT0: .word data_021a8308
_LIT1: .word data_021a830c
