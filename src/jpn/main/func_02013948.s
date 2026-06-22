; func_02013948 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02013948
        .arm
func_02013948:
    cmp r0, #0x90
    movlt r0, #0x0
    bxlt lr
    cmp r0, #0xc0
    movlt r0, #0x1
    movge r0, #0x2
    bx lr
