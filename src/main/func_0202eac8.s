; func_0202eac8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0202eac8
        .arm
func_0202eac8:
    ldr r1, _LIT0
    cmp r0, r1
    bgt .L_128
    bge .L_21c
    sub r2, r1, #0xa1
    cmp r0, r2
    bgt .L_a4
    sub r1, r1, #0xa1
    cmp r0, r1
    bge .L_21c
    ldr r2, _LIT1
    cmp r0, r2
    bgt .L_74
    bge .L_21c
    sub r1, r2, #0x20
    cmp r0, r1
    bgt .L_64
    sub r1, r2, #0x23
    subs r1, r0, r1
    addpl pc, pc, r1, lsl #0x2
    b .L_224
    b .L_21c
    b .L_21c
    b .L_21c
    b .L_21c
.L_64:
    ldr r1, _LIT2
    cmp r0, r1
    beq .L_21c
    b .L_224
.L_74:
    add r1, r2, #0x7a
    cmp r0, r1
    bgt .L_94
    bge .L_21c
    add r1, r2, #0x30
    cmp r0, r1
    beq .L_21c
    b .L_224
.L_94:
    add r1, r2, #0x84
    cmp r0, r1
    beq .L_21c
    b .L_224
.L_a4:
    sub r2, r1, #0x70
    cmp r0, r2
    bgt .L_f8
    bge .L_21c
    sub r2, r1, #0x99
    cmp r0, r2
    bgt .L_d0
    sub r1, r1, #0x99
    cmp r0, r1
    beq .L_21c
    b .L_224
.L_d0:
    sub r2, r1, #0x97
    cmp r0, r2
    bgt .L_224
    sub r2, r1, #0x98
    cmp r0, r2
    blt .L_224
    subne r1, r1, #0x97
    cmpne r0, r1
    beq .L_21c
    b .L_224
.L_f8:
    sub r2, r1, #0x68
    cmp r0, r2
    bgt .L_118
    bge .L_21c
    sub r1, r1, #0x6e
    cmp r0, r1
    beq .L_21c
    b .L_224
.L_118:
    sub r1, r1, #0x49
    cmp r0, r1
    beq .L_21c
    b .L_224
.L_128:
    add r2, r1, #0x7e
    cmp r0, r2
    bgt .L_1b8
    bge .L_21c
    add r2, r1, #0xe
    cmp r0, r2
    bgt .L_174
    bge .L_21c
    add r2, r1, #0x4
    cmp r0, r2
    bgt .L_164
    add r1, r1, #0x4
    cmp r0, r1
    beq .L_21c
    b .L_224
.L_164:
    add r1, r1, #0x5
    cmp r0, r1
    beq .L_21c
    b .L_224
.L_174:
    add r2, r1, #0x12
    cmp r0, r2
    bgt .L_1a8
    cmp r0, #0x1a00
    blt .L_198
    addne r1, r1, #0x12
    cmpne r0, r1
    beq .L_21c
    b .L_224
.L_198:
    add r1, r1, #0x10
    cmp r0, r1
    beq .L_21c
    b .L_224
.L_1a8:
    add r1, r1, #0x5e
    cmp r0, r1
    beq .L_21c
    b .L_224
.L_1b8:
    cmp r0, #0x1a80
    bgt .L_1f0
    bge .L_21c
    add r2, r1, #0x7f
    cmp r0, r2
    bgt .L_1e0
    add r1, r1, #0x7f
    cmp r0, r1
    beq .L_21c
    b .L_224
.L_1e0:
    add r1, r1, #0x80
    cmp r0, r1
    beq .L_21c
    b .L_224
.L_1f0:
    ldr r1, _LIT3
    cmp r0, r1
    bgt .L_210
    bge .L_21c
    sub r1, r1, #0x1
    cmp r0, r1
    beq .L_21c
    b .L_224
.L_210:
    add r1, r1, #0x1
    cmp r0, r1
    bne .L_224
.L_21c:
    mov r0, #0x1
    bx lr
.L_224:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x000019ef
_LIT1: .word 0x000018c9
_LIT2: .word 0x000018c8
_LIT3: .word 0x00001b4d
