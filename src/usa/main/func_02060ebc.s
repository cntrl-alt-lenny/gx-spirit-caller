; func_02060ebc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101274
        .global func_02060ebc
        .arm
func_02060ebc:
    ldr r1, _LIT0
    mvn r0, #0x0
    ldr r1, [r1]
    cmp r1, r0
    movne r0, #0x1
    moveq r0, #0x0
    bx lr
_LIT0: .word data_02101274
