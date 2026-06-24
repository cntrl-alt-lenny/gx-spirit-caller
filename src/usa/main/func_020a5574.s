; func_020a5574 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a9840
        .extern func_020a55c8
        .extern func_020a5784
        .global func_020a5574
        .arm
func_020a5574:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    bl OS_DisableIrq
    mov r4, r0
    bl func_020a5784
    cmp r0, #0x0
    beq .L_3c
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r0, [r0]
    mov r2, r5
    mov r3, r1
    add r0, r0, #0xc4
    bl func_020a55c8
.L_3c:
    mov r0, r4
    bl OS_RestoreIrq
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_021a9840
