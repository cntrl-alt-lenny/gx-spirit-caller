; func_0207034c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a63d0
        .extern func_020704e8
        .global func_0207034c
        .arm
func_0207034c:
    stmdb sp!, {r4, lr}
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0xa4]
    cmp r4, #0x0
    ldmeqia sp!, {r4, lr}
    bxeq lr
    ldr r1, [r4, #0x60]
    cmp r1, #0x0
    ldmeqia sp!, {r4, lr}
    bxeq lr
    mov r2, #0x0
    ldr r0, [r4, #0x5c]
    mov r3, r2
    bl func_020704e8
    mov r0, #0x0
    str r0, [r4, #0x60]
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word data_021a63d0
