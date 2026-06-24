; func_02070ddc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern func_02070f54
        .extern func_020919a4
        .global func_02070ddc
        .arm
func_02070ddc:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    bl func_02070f54
    str r0, [r5, #0x28]
    mov r0, #0x1
    strb r0, [r5, #0x8]
    bl OS_DisableIrq
    mov r4, r0
    mov r1, #0x1
    mov r0, #0x0
    str r1, [r5, #0x4]
    bl func_020919a4
    mov r0, r4
    bl OS_RestoreIrq
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
