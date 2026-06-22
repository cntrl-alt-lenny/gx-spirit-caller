; func_020a5758 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020a5758
        .arm
func_020a5758:
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    movne r0, #0x1
    moveq r0, #0x0
    bx lr
