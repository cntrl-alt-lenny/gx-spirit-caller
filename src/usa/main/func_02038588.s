; func_02038588 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02038588
        .arm
func_02038588:
    mov r1, r1, lsl #0x8
    strh r1, [r0, #0x2]
    ldrsh r2, [r0, #0x2]
    mov r1, #0x0
    strh r2, [r0]
    strh r1, [r0, #0x6]
    strh r1, [r0, #0x4]
    bx lr
