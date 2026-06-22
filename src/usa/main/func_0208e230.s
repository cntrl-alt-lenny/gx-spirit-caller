; func_0208e230 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0208e230
        .arm
func_0208e230:
    ldr ip, [sp]
    orr r1, r1, #0x40
    orr r2, r1, r2, lsl #0x8
    orr r1, r3, ip, lsl #0x8
    orr r1, r2, r1, lsl #0x10
    str r1, [r0]
    bx lr
