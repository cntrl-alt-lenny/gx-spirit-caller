; func_0202147c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02194340
        .global func_0202147c
        .arm
func_0202147c:
    ldr r1, [r0, #0x4]
    ldr r2, _LIT0
    cmp r1, #0x0
    moveq r0, #0x0
    bxeq lr
    ldr r1, [r0]
    bic r1, r1, #0x1
    str r1, [r0]
    mov r0, #0x1
    str r0, [r2]
    bx lr
_LIT0: .word data_02194340
