; func_0208dcb4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0208dcb4
        .arm
func_0208dcb4:
    ldr r1, _LIT0
    ldr r0, _LIT1
    ldr r1, [r1]
    ldrh r2, [r0]
    and r0, r1, #0x7
    cmp r0, #0x3
    blt .L_bc4
    cmp r0, #0x6
    bge .L_bd8
    ands r0, r2, #0x80
    bne .L_bd8
.L_bc4:
    and r0, r2, #0x3c
    mov r0, r0, lsr #0x2
    mov r0, r0, lsl #0xe
    add r0, r0, #0x6200000
    bx lr
.L_bd8:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x04001000
_LIT1: .word 0x0400100e
