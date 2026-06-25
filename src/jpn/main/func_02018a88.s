; func_02018a88 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02018a88
        .arm
func_02018a88:
    cmp r0, #0x3
    movlt r0, #0x1
    bxlt lr
    cmp r0, #0x7
    movlt r0, #0x2
    bxlt lr
    cmp r0, #0x12
    movlt r0, #0x3
    bxlt lr
    cmp r0, #0x18
    movlt r0, #0x4
    bxlt lr
    cmp r0, #0x22
    movlt r0, #0x5
    bxlt lr
    cmp r0, #0x28
    movlt r0, #0x6
    bxlt lr
    cmp r0, #0x2d
    movlt r0, #0x7
    movge r0, #0x8
    bx lr
