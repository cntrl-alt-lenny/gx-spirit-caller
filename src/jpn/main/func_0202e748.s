; func_0202e748 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0202e748
        .arm
func_0202e748:
    ldr r3, _LIT0
    cmp r0, r3
    bgt .L_58
    bge .L_b0
    sub r1, r3, #0x60
    cmp r0, r1
    bgt .L_30
    bge .L_b0
    sub r1, r3, #0x6d
    cmp r0, r1
    beq .L_b0
    b .L_b8
.L_30:
    sub r1, r3, #0x5
    cmp r0, r1
    bgt .L_b8
    sub r1, r3, #0x7
    cmp r0, r1
    blt .L_b8
    subne r1, r3, #0x5
    cmpne r0, r1
    beq .L_b0
    b .L_b8
.L_58:
    ldr r2, _LIT1
    cmp r0, r2
    bgt .L_90
    bge .L_b0
    add r1, r3, #0x5
    cmp r0, r1
    bgt .L_b8
    add r1, r3, #0x4
    cmp r0, r1
    blt .L_b8
    addne r1, r3, #0x5
    cmpne r0, r1
    beq .L_b0
    b .L_b8
.L_90:
    add r1, r2, #0x1
    cmp r0, r1
    bgt .L_a4
    beq .L_b0
    b .L_b8
.L_a4:
    add r1, r2, #0x2
    cmp r0, r1
    bne .L_b8
.L_b0:
    mov r0, #0x1
    bx lr
.L_b8:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x000014ab
_LIT1: .word 0x0000160d
