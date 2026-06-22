; func_02078df0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02078df0
        .arm
func_02078df0:
    ldrh r1, [r0]
    ldrh r2, [r0, #-2]
    ldrh r3, [r0, #-4]
    orr r0, r3, r2, lsl #0x10
    bx lr
