; func_0201d56c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02191d50
        .global func_0201d56c
        .arm
func_0201d56c:
    cmp r0, #0x4
    beq .L_1b0
    cmp r0, #0x9
    ldreq r0, _LIT0
    streq r1, [r0, #0x4]
    bx lr
.L_1b0:
    ldr r0, _LIT0
    str r1, [r0]
    bx lr
_LIT0: .word data_02191d50
