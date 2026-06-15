; func_0208f1c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0210249c
        .extern data_021a6338
        .extern func_0208cfa4
        .extern func_02093dc8
        .global func_0208f1c4
        .arm
func_0208f1c4:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    mvn r1, #0x0
    ldr r0, [r0]
    cmp r0, r1
    beq .L_b38
    bl func_02093dc8
.L_b38:
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_0208cfa4
    ldr r0, _LIT1
    mov r1, #0x0
    str r1, [r0]
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_0210249c
_LIT1: .word data_021a6338
