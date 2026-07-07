; func_ov002_022812e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_022812e8
        .arm
func_ov002_022812e8:
    ldr r3, _LIT0
    cmp r0, r3
    bgt .L_7c
    sub r1, r3, #0x2
    cmp r0, r1
    blt .L_24
    cmpne r0, r3
    beq .L_d8
    b .L_e0
.L_24:
    ldr r2, _LIT1
    cmp r0, r2
    bgt .L_58
    bge .L_d8
    sub r1, r3, #0x2ec
    cmp r0, r1
    bgt .L_48
    beq .L_d8
    b .L_e0
.L_48:
    sub r1, r2, #0xa
    cmp r0, r1
    beq .L_d8
    b .L_e0
.L_58:
    add r1, r2, #0x3b
    cmp r0, r1
    bgt .L_6c
    beq .L_d8
    b .L_e0
.L_6c:
    add r1, r2, #0x6b
    cmp r0, r1
    beq .L_d8
    b .L_e0
.L_7c:
    ldr r2, _LIT2
    cmp r0, r2
    bgt .L_b0
    bge .L_d8
    sub r1, r2, #0x210
    cmp r0, r1
    bgt .L_a0
    beq .L_d8
    b .L_e0
.L_a0:
    sub r1, r2, #0xe5
    cmp r0, r1
    beq .L_d8
    b .L_e0
.L_b0:
    cmp r0, #0x1a00
    bgt .L_cc
    bge .L_d8
    ldr r1, _LIT3
    cmp r0, r1
    beq .L_d8
    b .L_e0
.L_cc:
    add r1, r2, #0x258
    cmp r0, r1
    bne .L_e0
.L_d8:
    mov r0, #0x1
    bx lr
.L_e0:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x00001598
_LIT1: .word 0x00001441
_LIT2: .word 0x00001855
_LIT3: .word 0x000019ff
