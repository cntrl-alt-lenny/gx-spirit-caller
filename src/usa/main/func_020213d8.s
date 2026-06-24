; func_020213d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02194260
        .global func_020213d8
        .arm
func_020213d8:
    ldr r1, _LIT0
    ldr r3, _LIT1
    ldr r1, [r1]
    cmp r1, #0x1
    movne r0, #0x1
    bxne lr
    ldr r1, [r0, #0x4]
    cmp r1, #0x0
    moveq r0, #0x0
    bxeq lr
    ldr r2, [r0]
    mov r1, #0x2
    bic r2, r2, #0x1
    orr r2, r2, #0x1
    str r2, [r0]
    str r1, [r3]
    mov r0, #0x1
    bx lr
_LIT0: .word data_02194260
_LIT1: .word data_02194260
