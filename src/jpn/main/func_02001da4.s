; func_02001da4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02001da4
        .arm
func_02001da4:
    ldr r2, [r0, #0x1c]
    and r1, r1, #0xff
    bic r2, r2, #0xff
    orr r1, r2, r1
    str r1, [r0, #0x1c]
    bx lr
