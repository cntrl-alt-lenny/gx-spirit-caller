; func_ov002_022347ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_022347ec
        .arm
func_ov002_022347ec:
    ldrh r2, [r1, #0x4]
    mov r0, #0x0
    orr r2, r2, #0x20
    strh r2, [r1, #0x4]
    bx lr
