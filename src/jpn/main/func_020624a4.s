; func_020624a4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020624a4
        .arm
func_020624a4:
    ldr r1, [r0, #0x54]
    ldr r0, [r0, #0x58]
    sub r0, r1, r0
    bx lr
