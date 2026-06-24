; func_020a3938 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a9818
        .extern func_020a39c0
        .extern func_020a39cc
        .extern func_020a5574
        .extern func_020a5784
        .global func_020a3938
        .arm
func_020a3938:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, #0x1
    bl OS_DisableIrq
    ldr r1, _LIT0
    mov r4, r0
    ldr r2, [r1]
    add r0, r2, #0x500
    ldrh r0, [r0, #0x26]
    cmp r0, #0x0
    bne .L_68
    mov r0, #0x0
    str r0, [r2, #0x5e4]
    ldr r0, [r1]
    mov r1, r5
    add r0, r0, #0x500
    strh r1, [r0, #0x26]
    bl func_020a5784
    cmp r0, #0x0
    beq .L_60
    ldr r0, _LIT1
    bl func_020a5574
    mov r5, #0x0
    b .L_68
.L_60:
    bl func_020a39cc
    mov r5, r0
.L_68:
    mov r0, r4
    bl OS_RestoreIrq
    mov r0, r5
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_021a9818
_LIT1: .word func_020a39c0
