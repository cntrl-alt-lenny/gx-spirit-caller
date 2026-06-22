; func_0208af58 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0208af58
        .arm
func_0208af58:
    ldr r1, [r0, #0x8]
    ldr r0, [r0, #0xc]
    cmp r1, r0
    movge r0, #0x1
    movlt r0, #0x0
    bx lr
