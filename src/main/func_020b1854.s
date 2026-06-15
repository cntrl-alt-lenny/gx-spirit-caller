; func_020b1854 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020b1854
        .arm
func_020b1854:
    stmdb sp!, {r0, r1, r2, r3}
    ldr r2, [sp, #0x4]
    ldr r0, _LIT0
    ands r1, r2, r0
    beq .L_3c
    cmp r1, r0
    bne .L_5c
    ldr r0, _LIT1
    tst r2, r0
    ldreq r0, [sp]
    add sp, sp, #0x10
    cmpeq r0, #0x0
    movne r0, #0x1
    moveq r0, #0x2
    bx lr
.L_3c:
    ldr r0, _LIT1
    tst r2, r0
    ldreq r0, [sp]
    add sp, sp, #0x10
    cmpeq r0, #0x0
    movne r0, #0x5
    moveq r0, #0x3
    bx lr
.L_5c:
    mov r0, #0x4
    add sp, sp, #0x10
    bx lr
_LIT0: .word 0x7ff00000
_LIT1: .word 0x000fffff
