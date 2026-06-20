; func_ov002_022bc2b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_022bc2b4
        .arm
func_ov002_022bc2b4:
    ldr r1, _LIT0
    cmp r0, r1
    bgt .L_f0
    bge .L_1f4
    ldr r3, _LIT1
    cmp r0, r3
    bgt .L_98
    bge .L_1bc
    sub r1, r3, #0x3
    cmp r0, r1
    bgt .L_74
    bge .L_1ac
    ldr r1, _LIT2
    cmp r0, r1
    bgt .L_64
    sub r1, r1, #0x5
    subs r1, r0, r1
    addpl pc, pc, r1, lsl #0x2
    b .L_224
    b .L_1ac
    b .L_1b4
    b .L_1bc
    b .L_1c4
    b .L_1cc
    b .L_1d4
.L_64:
    ldr r1, _LIT3
    cmp r0, r1
    beq .L_1ec
    b .L_224
.L_74:
    sub r1, r3, #0x2
    cmp r0, r1
    bgt .L_88
    beq .L_1cc
    b .L_224
.L_88:
    sub r1, r3, #0x1
    cmp r0, r1
    beq .L_1dc
    b .L_224
.L_98:
    ldr r2, _LIT4
    cmp r0, r2
    bgt .L_cc
    bge .L_1e4
    sub r1, r2, #0x154
    cmp r0, r1
    bgt .L_bc
    beq .L_20c
    b .L_224
.L_bc:
    add r1, r3, #0x2
    cmp r0, r1
    beq .L_1d4
    b .L_224
.L_cc:
    add r1, r2, #0x35
    cmp r0, r1
    bgt .L_e0
    beq .L_214
    b .L_224
.L_e0:
    add r1, r2, #0x6f
    cmp r0, r1
    beq .L_1cc
    b .L_224
.L_f0:
    ldr r2, _LIT5
    cmp r0, r2
    bgt .L_158
    bge .L_1b4
    ldr r2, _LIT6
    cmp r0, r2
    bgt .L_134
    bge .L_1bc
    sub r1, r2, #0x1a0
    cmp r0, r1
    bgt .L_124
    beq .L_1d4
    b .L_224
.L_124:
    sub r1, r2, #0xe1
    cmp r0, r1
    beq .L_1fc
    b .L_224
.L_134:
    add r1, r2, #0x40
    cmp r0, r1
    bgt .L_148
    beq .L_1e4
    b .L_224
.L_148:
    add r1, r2, #0xc0
    cmp r0, r1
    beq .L_21c
    b .L_224
.L_158:
    add r1, r2, #0x75
    cmp r0, r1
    bgt .L_18c
    bge .L_1f4
    add r1, r2, #0x1a
    cmp r0, r1
    bgt .L_17c
    beq .L_204
    b .L_224
.L_17c:
    add r1, r2, #0x74
    cmp r0, r1
    beq .L_21c
    b .L_224
.L_18c:
    add r1, r2, #0x85
    cmp r0, r1
    bgt .L_1a0
    beq .L_1e4
    b .L_224
.L_1a0:
    add r1, r2, #0xb5
    cmp r0, r1
    bne .L_224
.L_1ac:
    mov r0, #0x9c
    bx lr
.L_1b4:
    mov r0, #0x9d
    bx lr
.L_1bc:
    mov r0, #0x9e
    bx lr
.L_1c4:
    mov r0, #0x9f
    bx lr
.L_1cc:
    mov r0, #0xa0
    bx lr
.L_1d4:
    mov r0, #0xa1
    bx lr
.L_1dc:
    mov r0, #0xa2
    bx lr
.L_1e4:
    mov r0, #0xa3
    bx lr
.L_1ec:
    mov r0, #0xa4
    bx lr
.L_1f4:
    mov r0, #0xa5
    bx lr
.L_1fc:
    mov r0, #0xa6
    bx lr
.L_204:
    mov r0, #0xa7
    bx lr
.L_20c:
    mov r0, #0xa8
    bx lr
.L_214:
    mov r0, #0xa9
    bx lr
.L_21c:
    mov r0, #0xaa
    bx lr
.L_224:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x0000159d
_LIT1: .word 0x00001347
_LIT2: .word 0x000010f5
_LIT3: .word 0x00001323
_LIT4: .word 0x0000149c
_LIT5: .word 0x000019f2
_LIT6: .word 0x0000183f
