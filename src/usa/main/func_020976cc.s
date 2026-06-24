; func_020976cc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a8228
        .extern func_02097c6c
        .global func_020976cc
        .arm
func_020976cc:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    bl func_02097c6c
    mov r5, r0
    bl OS_DisableIrq
    ldr r1, _LIT0
    ldr r4, [r1]
    b .L_58c
.L_588:
    ldr r4, [r4, #0x4]
.L_58c:
    cmp r4, #0x0
    beq .L_5a0
    ldr r1, [r4]
    cmp r1, r5
    bne .L_588
.L_5a0:
    bl OS_RestoreIrq
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_021a8228
