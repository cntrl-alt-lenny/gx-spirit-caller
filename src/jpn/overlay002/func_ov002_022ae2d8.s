; func_ov002_022ae2d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_022ae2d8
        .arm
func_ov002_022ae2d8:
    cmp r2, #0x0
    bxlt lr
    add r1, r0, r1, lsl #0x2
    ldr r0, [r1, #0x1c]
    cmp r2, r0
    strne r2, [r1, #0x1c]
    bx lr
