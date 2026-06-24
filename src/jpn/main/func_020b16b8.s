; func_020b16b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020b16b8
        .arm
func_020b16b8:
    mov r3, r0, lsr #0x1
    ldr r2, _LIT0
    orr r3, r3, r1, lsl #0x1f
    and r3, r3, r2
    subs ip, r0, r3
    and r2, r2, r1, lsr #0x1
    ldr r0, _LIT1
    sbc r3, r1, r2
    mov r1, ip, lsr #0x2
    orr r1, r1, r3, lsl #0x1e
    and r2, ip, r0
    and r1, r1, r0
    adds r2, r2, r1
    and r1, r3, r0
    and r0, r0, r3, lsr #0x2
    adc r1, r1, r0
    mov r0, r2, lsr #0x4
    orr r0, r0, r1, lsl #0x1c
    adds r2, r2, r0
    ldr r0, _LIT2
    adc r1, r1, r1, lsr #0x4
    and r3, r2, r0
    and r2, r1, r0
    mov r0, r3, lsr #0x8
    orr r0, r0, r2, lsl #0x18
    adds r1, r3, r0
    adc r2, r2, r2, lsr #0x8
    mov r0, r1, lsr #0x10
    orr r0, r0, r2, lsl #0x10
    adds r1, r1, r0
    adc r0, r2, r2, lsr #0x10
    adds r0, r1, r0
    and r0, r0, #0xff
    bx lr
_LIT0: .word 0x55555555
_LIT1: .word 0x33333333
_LIT2: .word 0x0f0f0f0f
