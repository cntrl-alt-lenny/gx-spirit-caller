; func_02078de0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02078de0
        .arm
func_02078de0:
    ldrh r1, [r0]
    ldrh r0, [r0, #-2]
    mov r0, r0, lsl #0x10
    bx lr
