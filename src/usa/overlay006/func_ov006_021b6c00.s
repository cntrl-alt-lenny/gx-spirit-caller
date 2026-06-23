; func_ov006_021b6c00 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov006_021b6c00
        .arm
func_ov006_021b6c00:
    add r0, r0, r1, lsl #0x1
    cmp r2, #0x0
    addne r0, r0, #0xc600
    ldrneh r0, [r0, #0x6c]
    addeq r0, r0, #0xc600
    ldreqh r0, [r0, #0x62]
    bx lr
