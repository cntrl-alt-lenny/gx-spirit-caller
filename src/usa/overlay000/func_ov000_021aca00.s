; func_ov000_021aca00 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov000_021aca00
        .arm
func_ov000_021aca00:
    ldr r2, [r0, #0x98]
    mov r1, r1, lsl #0x1c
    bic r2, r2, #0xf00
    orr r1, r2, r1, lsr #0x14
    str r1, [r0, #0x98]
    bx lr
