; func_ov011_021d2188 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov011_021d2188
        .arm
func_ov011_021d2188:
    ldr r1, [r0, #0x40]
    mov r1, r1, lsl #0x17
    movs r1, r1, lsr #0x1f
    movne r0, #0x0
    addeq r0, r0, #0x8
    bx lr
