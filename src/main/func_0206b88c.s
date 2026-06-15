; func_0206b88c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101df8
        .extern data_0219ecd4
        .extern func_02068ab4
        .extern func_020b1958
        .global func_0206b88c
        .arm
func_0206b88c:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    ldr r2, _LIT0
    mov r5, r1
    ldr r1, [r2]
    ldr r0, [r0]
    ldr r1, [r1, #0x498]
    ldr r2, _LIT1
    bl func_02068ab4
    ldr r1, _LIT0
    mov r4, r0
    ldr r1, [r1]
    ldr r0, [r5]
    ldr r1, [r1, #0x498]
    ldr r2, _LIT1
    bl func_02068ab4
    mov r1, r0
    mov r0, r4
    bl func_020b1958
    ldr r1, _LIT0
    ldr r1, [r1]
    ldr r1, [r1, #0x49c]
    cmp r1, #0x0
    rsbeq r0, r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_0219ecd4
_LIT1: .word data_02101df8
