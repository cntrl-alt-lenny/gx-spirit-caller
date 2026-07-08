; func_ov002_0227d18c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_0227d18c
        .arm
func_ov002_0227d18c:
    ldr r2, _LIT0
    cmp r0, r2
    bgt .L_cb8
    bge .L_d64
    sub r1, r2, #0x224
    cmp r0, r1
    bgt .L_c74
    bge .L_d64
    ldr r2, _LIT1
    cmp r0, r2
    bgt .L_c44
    bge .L_d64
    sub r1, r2, #0x100
    cmp r0, r1
    beq .L_d64
    b .L_d6c
.L_c44:
    add r1, r2, #0xa
    cmp r0, r1
    bgt .L_d6c
    add r1, r2, #0x7
    cmp r0, r1
    blt .L_d6c
    addne r1, r2, #0x9
    cmpne r0, r1
    addne r1, r2, #0xa
    cmpne r0, r1
    beq .L_d64
    b .L_d6c
.L_c74:
    ldr r2, _LIT2
    cmp r0, r2
    bgt .L_c94
    bge .L_d64
    sub r1, r2, #0x11
    cmp r0, r1
    beq .L_d64
    b .L_d6c
.L_c94:
    add r1, r2, #0x5f
    cmp r0, r1
    bgt .L_ca8
    beq .L_d64
    b .L_d6c
.L_ca8:
    add r1, r2, #0x184
    cmp r0, r1
    beq .L_d64
    b .L_d6c
.L_cb8:
    add r1, r2, #0xbc
    cmp r0, r1
    bgt .L_d24
    bge .L_d64
    add r1, r2, #0x2a
    cmp r0, r1
    bgt .L_ce8
    bge .L_d64
    add r1, r2, #0x28
    cmp r0, r1
    beq .L_d64
    b .L_d6c
.L_ce8:
    add r1, r2, #0x2e
    sub r1, r0, r1
    cmp r1, #0x9
    addls pc, pc, r1, lsl #0x2
    b .L_d6c
    b .L_d64
    b .L_d64
    b .L_d64
    b .L_d64
    b .L_d6c
    b .L_d64
    b .L_d64
    b .L_d6c
    b .L_d6c
    b .L_d64
.L_d24:
    ldr r2, _LIT3
    cmp r0, r2
    bgt .L_d44
    bge .L_d64
    sub r1, r2, #0x6
    cmp r0, r1
    beq .L_d64
    b .L_d6c
.L_d44:
    add r1, r2, #0x4c
    cmp r0, r1
    bgt .L_d58
    beq .L_d64
    b .L_d6c
.L_d58:
    ldr r1, _LIT4
    cmp r0, r1
    bne .L_d6c
.L_d64:
    mov r0, #0x1
    bx lr
.L_d6c:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x0000130b
_LIT1: .word 0x000010d6
_LIT2: .word 0x00001185
_LIT3: .word 0x000013e9
_LIT4: .word 0x000019fe
