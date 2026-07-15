; func_ov005_021ab2a4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov005_021ab2a4
        .arm
func_ov005_021ab2a4:
    ldr r3, [r0, #0x10]
    mov r0, r1, lsl #0x1
    ldrh r0, [r3, r0]
    and r0, r0, r2
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bx lr
