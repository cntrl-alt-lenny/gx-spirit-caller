; func_ov002_0227d27c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_0227d27c
        .arm
func_ov002_0227d27c:
    ldr r2, _LIT0
    cmp r0, r2
    bgt .L_b4
    bge .L_160
    sub r1, r2, #0x224
    cmp r0, r1
    bgt .L_70
    bge .L_160
    ldr r2, _LIT1
    cmp r0, r2
    bgt .L_40
    bge .L_160
    sub r1, r2, #0x100
    cmp r0, r1
    beq .L_160
    b .L_168
.L_40:
    add r1, r2, #0xa
    cmp r0, r1
    bgt .L_168
    add r1, r2, #0x7
    cmp r0, r1
    blt .L_168
    addne r1, r2, #0x9
    cmpne r0, r1
    addne r1, r2, #0xa
    cmpne r0, r1
    beq .L_160
    b .L_168
.L_70:
    ldr r2, _LIT2
    cmp r0, r2
    bgt .L_90
    bge .L_160
    sub r1, r2, #0x11
    cmp r0, r1
    beq .L_160
    b .L_168
.L_90:
    add r1, r2, #0x5f
    cmp r0, r1
    bgt .L_a4
    beq .L_160
    b .L_168
.L_a4:
    add r1, r2, #0x184
    cmp r0, r1
    beq .L_160
    b .L_168
.L_b4:
    add r1, r2, #0xbc
    cmp r0, r1
    bgt .L_120
    bge .L_160
    add r1, r2, #0x2a
    cmp r0, r1
    bgt .L_e4
    bge .L_160
    add r1, r2, #0x28
    cmp r0, r1
    beq .L_160
    b .L_168
.L_e4:
    add r1, r2, #0x2e
    sub r1, r0, r1
    cmp r1, #0x9
    addls pc, pc, r1, lsl #0x2
    b .L_168
    b .L_160
    b .L_160
    b .L_160
    b .L_160
    b .L_168
    b .L_160
    b .L_160
    b .L_168
    b .L_168
    b .L_160
.L_120:
    ldr r2, _LIT3
    cmp r0, r2
    bgt .L_140
    bge .L_160
    sub r1, r2, #0x6
    cmp r0, r1
    beq .L_160
    b .L_168
.L_140:
    add r1, r2, #0x4c
    cmp r0, r1
    bgt .L_154
    beq .L_160
    b .L_168
.L_154:
    ldr r1, _LIT4
    cmp r0, r1
    bne .L_168
.L_160:
    mov r0, #0x1
    bx lr
.L_168:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x0000130b
_LIT1: .word 0x000010d6
_LIT2: .word 0x00001185
_LIT3: .word 0x000013e9
_LIT4: .word 0x000019fe
