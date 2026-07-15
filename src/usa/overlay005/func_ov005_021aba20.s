; func_ov005_021aba20 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov005_021aba20
        .arm
func_ov005_021aba20:
    ldrh r1, [r0, #0x5c]
    mov r1, r1, lsl #0x1e
    mov r1, r1, lsr #0x1e
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    bx lr
    b .L_740
    b .L_770
    b .L_7a0
    b .L_7d0
.L_740:
    ldr r2, [r0, #0x34]
    ldrsh r1, [r0, #0xe]
    and r2, r2, #0xff
    ldr r3, [r0, #0x30]
    sub r1, r2, r1
    ldr r0, _LIT0
    and r2, r3, #0xff
    and r1, r0, r1, lsl #0x10
    ldr r0, _LIT1
    orr r1, r2, r1
    str r1, [r0]
    bx lr
.L_770:
    ldr r2, [r0, #0x34]
    ldrsh r1, [r0, #0xe]
    and r2, r2, #0xff
    ldr r3, [r0, #0x30]
    sub r1, r2, r1
    ldr r0, _LIT0
    and r2, r3, #0xff
    and r1, r0, r1, lsl #0x10
    ldr r0, _LIT2
    orr r1, r2, r1
    str r1, [r0]
    bx lr
.L_7a0:
    ldr r2, [r0, #0x34]
    ldrsh r1, [r0, #0xe]
    and r2, r2, #0xff
    ldr r3, [r0, #0x30]
    sub r1, r2, r1
    ldr r0, _LIT0
    and r2, r3, #0xff
    and r1, r0, r1, lsl #0x10
    ldr r0, _LIT3
    orr r1, r2, r1
    str r1, [r0]
    bx lr
.L_7d0:
    ldr r2, [r0, #0x34]
    ldrsh r1, [r0, #0xe]
    and r2, r2, #0xff
    ldr r3, [r0, #0x30]
    ldr r0, _LIT0
    sub r1, r2, r1
    and r2, r3, #0xff
    and r1, r0, r1, lsl #0x10
    ldr r0, _LIT4
    orr r1, r2, r1
    str r1, [r0]
    bx lr
_LIT0: .word 0x01ff0000
_LIT1: .word 0x04001010
_LIT2: .word 0x04001014
_LIT3: .word 0x04001018
_LIT4: .word 0x0400101c
