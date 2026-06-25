; func_0208c858 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021023b8
        .extern data_021a6220
        .global func_0208c858
        .arm
func_0208c858:
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldrh r2, [r0]
    mov r0, #0x1
    strh r0, [r1]
    cmp r2, #0x0
    moveq r1, #0x4000000
    ldreq r0, [r1]
    orreq r0, r0, #0x10000
    streq r0, [r1]
    bxeq lr
    mov r1, #0x4000000
    ldr r0, [r1]
    bic r0, r0, #0x30000
    orr r0, r0, r2, lsl #0x10
    str r0, [r1]
    bx lr
_LIT0: .word data_021a6220
_LIT1: .word data_021023b8
