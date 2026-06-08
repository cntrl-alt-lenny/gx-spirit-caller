; func_ov009_021aa59c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov009_021aa59c
        .arm
func_ov009_021aa59c:
    ldr r3, _LIT0
    mov r0, #0x0
    ldr r2, [r3]
    ldr r1, [r3]
    and r2, r2, #0x1f00
    mov ip, r2, lsr #0x8
    bic r2, r1, #0x1f00
    bic r1, ip, #0x3
    orr r1, r2, r1, lsl #0x8
    str r1, [r3]
    str r0, [r3, #0x10]
    str r0, [r3, #0x14]
    mov r0, #0x1
    bx lr
_LIT0: .word 0x04001000
