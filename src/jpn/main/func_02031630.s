; func_02031630 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02031630
        .arm
func_02031630:
    ldr r2, _LIT0
    cmp r0, r2
    bgt .L_70
    sub r1, r2, #0x2
    cmp r0, r1
    blt .L_2c
    subne r1, r2, #0x1
    cmpne r0, r1
    cmpne r0, r2
    beq .L_c4
    b .L_cc
.L_2c:
    ldr r2, _LIT1
    cmp r0, r2
    bgt .L_4c
    bge .L_c4
    sub r1, r2, #0x11
    cmp r0, r1
    beq .L_c4
    b .L_cc
.L_4c:
    add r1, r2, #0x13
    cmp r0, r1
    bgt .L_60
    beq .L_c4
    b .L_cc
.L_60:
    add r1, r2, #0xb7
    cmp r0, r1
    beq .L_c4
    b .L_cc
.L_70:
    add r1, r2, #0xd9
    cmp r0, r1
    bgt .L_a4
    bge .L_c4
    add r1, r2, #0x39
    cmp r0, r1
    bgt .L_94
    beq .L_c4
    b .L_cc
.L_94:
    add r1, r2, #0x58
    cmp r0, r1
    beq .L_c4
    b .L_cc
.L_a4:
    ldr r1, _LIT2
    cmp r0, r1
    bgt .L_b8
    beq .L_c4
    b .L_cc
.L_b8:
    add r1, r1, #0x75
    cmp r0, r1
    bne .L_cc
.L_c4:
    mov r0, #0x0
    bx lr
.L_cc:
    mov r0, #0x1
    bx lr
_LIT0: .word 0x000018fd
_LIT1: .word 0x000014c7
_LIT2: .word 0x00001a53
