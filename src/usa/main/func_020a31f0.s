; func_020a31f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a9770
        .global func_020a31f0
        .arm
func_020a31f0:
    ldr r0, _LIT0
    mov r1, #0x0
    strb r1, [r0, #0xd]
    strb r1, [r0, #0xe]
    strb r1, [r0, #0xf]
    strb r1, [r0, #0x10]
    strb r1, [r0, #0x11]
    bx lr
_LIT0: .word data_021a9770
