; func_0208bdf0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0208bdf0
        .arm
func_0208bdf0:
    ldr r1, _LIT0
.L_40:
    ldrh r0, [r1]
    ands r0, r0, #0x8000
    bne .L_40
    ldr r1, _LIT1
    mov r0, #0x80000
    ldr r2, [r1]
    ldr r1, [r1, #0x4]
    adds r0, r2, r0
    adc r1, r1, #0x0
    mov r0, r0, lsr #0x14
    orr r0, r0, r1, lsl #0xc
    bx lr
_LIT0: .word 0x04000280
_LIT1: .word 0x040002a0
