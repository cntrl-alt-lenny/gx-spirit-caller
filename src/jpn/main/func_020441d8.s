; func_020441d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020441d8
        .arm
func_020441d8:
    ldrb r0, [r0]
    cmp r0, #0x7f
    moveq r0, #0x0
    bxeq lr
    cmp r0, #0x1
    movcc r0, #0x0
    bxcc lr
    cmp r0, #0xdf
    movls r0, #0x1
    movhi r0, #0x0
    bx lr
