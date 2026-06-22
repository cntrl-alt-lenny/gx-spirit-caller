; func_02087da8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02087da8
        .arm
func_02087da8:
    ldr r0, [r0]
    cmp r0, #0x0
    strneb r1, [r0, #0x40]
    bx lr
