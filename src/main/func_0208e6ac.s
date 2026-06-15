; func_0208e6ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0208e6ac
        .arm
func_0208e6ac:
    cmp r0, #0x0
    ldreq r2, _LIT0
    ldreq r0, _LIT1
    ldreqh r1, [r2]
    andeq r0, r1, r0
    streqh r0, [r2]
    bxeq lr
    ldr r0, _LIT2
    ldr ip, _LIT0
    strh r3, [r0]
    mov r0, r2, lsl #0x8
    orr r0, r0, r1, lsl #0x6
    ldrh r3, [ip]
    orr r0, r0, #0x80
    bic r1, r3, #0x3f40
    orr r0, r1, r0
    strh r0, [ip]
    bx lr
_LIT0: .word 0x04000060
_LIT1: .word 0x0000cf7f
_LIT2: .word 0x0400035c
