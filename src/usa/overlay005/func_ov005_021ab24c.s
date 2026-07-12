; func_ov005_021ab24c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov005_021ab24c
        .arm
func_ov005_021ab24c:
    ldr ip, [r0, #0x10]
    mov r3, r1, lsl #0x1
    ldrh r1, [ip, r3]
    orr r1, r1, r2
    strh r1, [ip, r3]
    ldr r1, [r0, #0x18]
    bic r1, r1, #0x1
    orr r1, r1, #0x1
    str r1, [r0, #0x18]
    bx lr
