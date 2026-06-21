; func_02081f5c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02081f5c
        .arm
func_02081f5c:
    ldrh r0, [r0, #0x1c]
    mov r0, r0, lsl #0x3
    bx lr
