; func_ov011_021d2028 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov011_021d2028
        .arm
func_ov011_021d2028:
    ldr r3, [r0, #0xc]
    mov r3, r3, lsr #0x10
    str r3, [r1]
    ldr r0, [r0, #0x10]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [r2]
    bx lr
