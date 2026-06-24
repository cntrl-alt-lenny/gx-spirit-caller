; func_ov002_0229d8e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_0229d8e8
        .arm
func_ov002_0229d8e8:
    ldr r0, [r0, #0xa8]
    cmp r1, r0
    movlt r0, #0x0
    bxlt lr
    add r0, r0, #0x8
    cmp r1, r0
    movlt r0, #0x1
    movge r0, #0x0
    bx lr
