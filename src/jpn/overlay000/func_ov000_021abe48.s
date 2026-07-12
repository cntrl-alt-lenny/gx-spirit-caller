; func_ov000_021abe48 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov000_021abe48
        .arm
func_ov000_021abe48:
    ldr r2, [r0]
    and r1, r1, #0x1
    bic r2, r2, #0x1
    orr r1, r2, r1
    str r1, [r0]
    bx lr
