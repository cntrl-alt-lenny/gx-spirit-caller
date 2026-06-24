; func_0209002c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c3094
        .extern data_021a6260
        .extern data_021a6264
        .extern func_0208cdec
        .global func_0209002c
        .arm
func_0209002c:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    bl func_0208cdec
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
_LIT0: .word data_021a6264
_LIT1: .word data_020c3094
_LIT2: .word data_021a6260
