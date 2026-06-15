; func_02093720 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a66dc
        .extern data_021a66e0
        .extern data_021a66e4
        .extern data_021a66e8
        .extern func_020905dc
        .global func_02093720
        .arm
func_02093720:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r2, _LIT0
    ldrh r0, [r2]
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmnefd sp!, {lr}
    bxne lr
    ldr r1, _LIT1
    mov r3, #0x0
    mov ip, #0x1
    mov r0, #0x4
    strh ip, [r2]
    str r3, [r1]
    str r3, [r1, #0x4]
    bl func_020905dc
    ldr r1, _LIT2
    mov r2, #0x0
    ldr r0, _LIT3
    str r2, [r1]
    str r2, [r0]
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a66dc
_LIT1: .word data_021a66e8
_LIT2: .word data_021a66e4
_LIT3: .word data_021a66e0
