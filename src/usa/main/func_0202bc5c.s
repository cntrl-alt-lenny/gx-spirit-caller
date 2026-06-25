; func_0202bc5c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0202bc5c
        .arm
func_0202bc5c:
    ldr r1, _LIT0
    cmp r0, r1
    bgt .L_b8
    bge .L_138
    sub r2, r1, #0x88
    cmp r0, r2
    bgt .L_6c
    bge .L_158
    sub r2, r1, #0x27c
    cmp r0, r2
    bgt .L_5c
    ldr r1, _LIT1
    cmp r0, r1
    blt .L_4c
    beq .L_128
    add r1, r1, #0x1
    cmp r0, r1
    ldreq r0, _LIT2
    bx lr
.L_4c:
    ldr r1, _LIT3
    cmp r0, r1
    addeq r0, r1, #0x1
    bx lr
.L_5c:
    sub r1, r1, #0x200
    cmp r0, r1
    moveq r0, #0xfe0
    bx lr
.L_6c:
    sub r2, r1, #0x66
    cmp r0, r2
    bgt .L_a8
    bge .L_130
    sub r2, r1, #0x86
    cmp r0, r2
    bxgt lr
    sub r2, r1, #0x87
    cmp r0, r2
    bxlt lr
    beq .L_160
    sub r2, r1, #0x86
    cmp r0, r2
    subeq r0, r1, #0x44
    bx lr
.L_a8:
    sub r1, r1, #0x2d
    cmp r0, r1
    ldreq r0, _LIT4
    bx lr
.L_b8:
    add r2, r1, #0x4b
    cmp r0, r2
    bgt .L_f8
    bge .L_140
    add r2, r1, #0x38
    cmp r0, r2
    bgt .L_e8
    bge .L_148
    add r1, r1, #0x4
    cmp r0, r1
    moveq r0, #0xfc0
    bx lr
.L_e8:
    add r1, r1, #0x39
    cmp r0, r1
    ldreq r0, _LIT5
    bx lr
.L_f8:
    ldr r2, _LIT6
    cmp r0, r2
    bgt .L_118
    bge .L_150
    sub r1, r2, #0x9e
    cmp r0, r1
    subeq r0, r2, #0xad
    bx lr
.L_118:
    ldr r2, _LIT7
    cmp r0, r2
    subeq r0, r1, #0x1fc
    bx lr
.L_128:
    ldr r0, _LIT8
    bx lr
.L_130:
    ldr r0, _LIT9
    bx lr
.L_138:
    sub r0, r1, #0x480
    bx lr
.L_140:
    ldr r0, _LIT10
    bx lr
.L_148:
    ldr r0, _LIT11
    bx lr
.L_150:
    ldr r0, _LIT12
    bx lr
.L_158:
    sub r0, r1, #0x77
    bx lr
.L_160:
    sub r0, r1, #0x45
    bx lr
_LIT0: .word 0x000016f8
_LIT1: .word 0x0000147b
_LIT2: .word 0x00000fcf
_LIT3: .word 0x00000fa6
_LIT4: .word 0x00001112
_LIT5: .word 0x0000154f
_LIT6: .word 0x000018b3
_LIT7: .word 0x000019ed
_LIT8: .word 0x00000fcc
_LIT9: .word 0x00000fbc
_LIT10: .word 0x0000130b
_LIT11: .word 0x000014f9
_LIT12: .word 0x000011a9
