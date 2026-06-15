; func_020a60fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern CpuSet
        .extern data_021a9938
        .extern func_02090868
        .global func_020a60fc
        .arm
func_020a60fc:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    mov r3, #0x0
    ldr r2, _LIT1
    add r0, sp, #0x0
    str r3, [sp]
    bl CpuSet
    bl func_02090868
    ldr r1, _LIT0
    strh r0, [r1, #0x2]
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a9938
_LIT1: .word 0x05000001
