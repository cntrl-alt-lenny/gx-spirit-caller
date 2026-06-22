; func_02081e68 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02081e68
        .arm
func_02081e68:
    ldrh r0, [r0, #0x30]
    mov r0, r0, lsl #0x3
    bx lr
