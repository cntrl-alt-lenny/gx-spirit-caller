; func_ov002_021b7bb8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_021b7bb8
        .arm
func_ov002_021b7bb8:
    ldr r3, _LIT0
    cmp r0, r3
    bgt .L_d0
    bge .L_178
    ldr r2, _LIT1
    cmp r0, r2
    bgt .L_78
    sub r1, r2, #0x4
    cmp r0, r1
    blt .L_34
    cmpne r0, r2
    beq .L_178
    b .L_180
.L_34:
    sub r1, r2, #0x1dc
    cmp r0, r1
    bgt .L_54
    bge .L_178
    sub r1, r2, #0x248
    cmp r0, r1
    beq .L_178
    b .L_180
.L_54:
    sub r1, r2, #0x17
    cmp r0, r1
    bgt .L_68
    beq .L_178
    b .L_180
.L_68:
    sub r1, r2, #0x9
    cmp r0, r1
    beq .L_178
    b .L_180
.L_78:
    add r1, r2, #0xbf
    cmp r0, r1
    bgt .L_ac
    bge .L_178
    add r1, r2, #0x4b
    cmp r0, r1
    bgt .L_9c
    beq .L_178
    b .L_180
.L_9c:
    add r1, r2, #0x56
    cmp r0, r1
    beq .L_178
    b .L_180
.L_ac:
    add r1, r2, #0x250
    cmp r0, r1
    bgt .L_c0
    beq .L_178
    b .L_180
.L_c0:
    sub r1, r3, #0x59
    cmp r0, r1
    beq .L_178
    b .L_180
.L_d0:
    add r1, r3, #0x19c
    cmp r0, r1
    bgt .L_124
    bge .L_178
    add r1, r3, #0xd
    cmp r0, r1
    bgt .L_100
    bge .L_178
    add r1, r3, #0x9
    cmp r0, r1
    beq .L_178
    b .L_180
.L_100:
    add r1, r3, #0x81
    cmp r0, r1
    bgt .L_114
    beq .L_178
    b .L_180
.L_114:
    ldr r1, _LIT2
    cmp r0, r1
    beq .L_178
    b .L_180
.L_124:
    add r1, r3, #0x264
    cmp r0, r1
    bgt .L_158
    bge .L_178
    ldr r1, _LIT3
    cmp r0, r1
    bgt .L_148
    beq .L_178
    b .L_180
.L_148:
    add r1, r1, #0x41
    cmp r0, r1
    beq .L_178
    b .L_180
.L_158:
    ldr r1, _LIT4
    cmp r0, r1
    bgt .L_16c
    beq .L_178
    b .L_180
.L_16c:
    add r1, r1, #0x95
    cmp r0, r1
    bne .L_180
.L_178:
    mov r0, #0x1
    bx lr
.L_180:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x000017b9
_LIT1: .word 0x000014de
_LIT2: .word 0x00001936
_LIT3: .word 0x000019c6
_LIT4: .word 0x00001a24
