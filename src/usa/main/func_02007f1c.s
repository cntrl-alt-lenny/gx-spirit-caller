; func_02007f1c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104e5c
        .global func_02007f1c
        .arm
func_02007f1c:
    mov r0, #0x0
    orr r0, r0, #0x21
    orr r1, r0, #0x8400
    ldr r0, _LIT0
    orr r1, r1, #0x52000000
    str r1, [r0, #0xa74]
    bx lr
_LIT0: .word data_02104e5c
