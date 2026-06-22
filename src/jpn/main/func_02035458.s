; func_02035458 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02035458
        .arm
func_02035458:
    ldrb r3, [r0, #0x71]
    cmp r3, #0x0
    strneb r2, [r0, #0x71]
    strb r1, [r0, #0x70]
    bx lr
