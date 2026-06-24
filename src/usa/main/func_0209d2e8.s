; func_0209d2e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a83e0
        .extern func_020919a4
        .global func_0209d2e8
        .arm
func_0209d2e8:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    ldr r5, _LIT0
    mov r6, #0x0
    add r7, r5, #0x44
.L_2a0:
    bl OS_DisableIrq
    ldr r1, [r5, #0x114]
    mov r4, r0
    ands r0, r1, #0x8
    bne .L_2cc
.L_2b4:
    mov r0, r6
    str r7, [r5, #0x104]
    bl func_020919a4
    ldr r0, [r5, #0x114]
    ands r0, r0, #0x8
    beq .L_2b4
.L_2cc:
    mov r0, r4
    bl OS_RestoreIrq
    ldr r1, [r5, #0x40]
    mov r0, r5
    blx r1
    b .L_2a0
_LIT0: .word data_021a83e0
