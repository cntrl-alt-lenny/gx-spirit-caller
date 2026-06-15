; func_0208e0a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0208e0a0
        .arm
func_0208e0a0:
    ldr r1, _LIT0
    ldr r0, _LIT1
    ldr r1, [r1]
    ldrh r2, [r0]
    and r3, r1, #0x7
    cmp r3, #0x6
    and r0, r2, #0x1f00
    mov r1, r0, lsr #0x8
    addls pc, pc, r3, lsl #0x2
    b .L_1b0
    b .L_184
    b .L_184
    b .L_184
    b .L_184
    b .L_184
    b .L_190
    b .L_1a8
.L_184:
    mov r0, r1, lsl #0xb
    add r0, r0, #0x6200000
    bx lr
.L_190:
    ands r0, r2, #0x80
    movne r0, r1, lsl #0xe
    addne r0, r0, #0x6200000
    moveq r0, r1, lsl #0xb
    addeq r0, r0, #0x6200000
    bx lr
.L_1a8:
    mov r0, #0x0
    bx lr
.L_1b0:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x04001000
_LIT1: .word 0x0400100c
