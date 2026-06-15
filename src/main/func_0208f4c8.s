; func_0208f4c8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0210249c
        .extern data_021a632c
        .extern data_021a6330
        .extern data_021a6334
        .extern func_0208d7ac
        .extern func_02093dc8
        .global func_0208f4c8
        .arm
func_0208f4c8:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    mvn r1, #0x0
    ldr r0, [r0]
    cmp r0, r1
    beq .L_15c
    bl func_02093dc8
.L_15c:
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_0208d7ac
    ldr r2, _LIT1
    mov r3, #0x0
    ldr r1, _LIT2
    ldr r0, _LIT3
    str r3, [r2]
    str r3, [r1]
    str r3, [r0]
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_0210249c
_LIT1: .word data_021a6334
_LIT2: .word data_021a6330
_LIT3: .word data_021a632c
