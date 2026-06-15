; func_02090114 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c3188
        .extern data_021a6340
        .extern data_021a6344
        .extern func_0208ced4
        .global func_02090114
        .arm
func_02090114:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    bl func_0208ced4
    mov r3, r0, asr #0x4
    ldr r2, _LIT0
    ldr r1, _LIT1
    mov r3, r3, lsl #0x1
    ldrh r3, [r1, r3]
    ldr r1, _LIT2
    str r0, [r2]
    mov r0, r3, lsl #0xc
    str r0, [r1]
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a6344
_LIT1: .word data_020c3188
_LIT2: .word data_021a6340
