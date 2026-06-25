; func_02067080 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02067080
        .arm
func_02067080:
    cmp r0, #0x1a
    addcc r0, r0, #0x41
    andcc r0, r0, #0xff
    bxcc lr
    cmp r0, #0x34
    addcc r0, r0, #0x47
    andcc r0, r0, #0xff
    bxcc lr
    cmp r0, #0x3e
    subcc r0, r0, #0x4
    andcc r0, r0, #0xff
    bxcc lr
    cmp r0, #0x3e
    moveq r0, #0x2b
    bxeq lr
    cmp r0, #0x3f
    moveq r0, #0x2f
    movne r0, #0x0
    bx lr
