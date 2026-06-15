; func_0208f38c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0210249c
        .extern data_021a6324
        .extern data_021a6328
        .extern func_0208d6f4
        .extern func_02093dc8
        .global func_0208f38c
        .arm
func_0208f38c:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    mvn r1, #0x0
    ldr r0, [r0]
    cmp r0, r1
    beq .L_20
    bl func_02093dc8
.L_20:
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_0208d6f4
    ldr r1, _LIT1
    mov r2, #0x0
    ldr r0, _LIT2
    str r2, [r1]
    str r2, [r0]
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_0210249c
_LIT1: .word data_021a6328
_LIT2: .word data_021a6324
