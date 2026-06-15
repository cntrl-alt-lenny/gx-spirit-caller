; func_0202e42c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0202e42c
        .arm
func_0202e42c:
    ldr r3, _LIT0
    cmp r0, r3
    bgt .L_168
    bge .L_230
    ldr r2, _LIT1
    cmp r0, r2
    bgt .L_124
    bge .L_230
    sub r1, r2, #0x3b
    cmp r0, r1
    bgt .L_114
    bge .L_230
    sub r1, r2, #0xef
    cmp r0, r1
    beq .L_230
    b .L_238
.L_114:
    sub r1, r2, #0x2c
    cmp r0, r1
    beq .L_230
    b .L_238
.L_124:
    add r1, r2, #0x1d4
    cmp r0, r1
    bgt .L_144
    bge .L_230
    add r1, r2, #0x2b
    cmp r0, r1
    beq .L_230
    b .L_238
.L_144:
    sub r1, r3, #0x18c
    cmp r0, r1
    bgt .L_158
    beq .L_230
    b .L_238
.L_158:
    add r1, r2, #0x338
    cmp r0, r1
    beq .L_230
    b .L_238
.L_168:
    ldr r2, _LIT2
    cmp r0, r2
    bgt .L_1a8
    bge .L_230
    add r1, r3, #0x8c
    cmp r0, r1
    bgt .L_198
    bge .L_230
    add r1, r3, #0x76
    cmp r0, r1
    beq .L_230
    b .L_238
.L_198:
    sub r1, r2, #0x180
    cmp r0, r1
    beq .L_230
    b .L_238
.L_1a8:
    add r1, r2, #0x43
    cmp r0, r1
    bgt .L_210
    bge .L_230
    add r1, r2, #0x28
    sub r1, r0, r1
    cmp r1, #0x10
    addls pc, pc, r1, lsl #0x2
    b .L_238
    b .L_230
    b .L_238
    b .L_238
    b .L_238
    b .L_238
    b .L_238
    b .L_238
    b .L_238
    b .L_238
    b .L_238
    b .L_230
    b .L_230
    b .L_230
    b .L_230
    b .L_230
    b .L_230
    b .L_230
.L_210:
    ldr r1, _LIT3
    cmp r0, r1
    bgt .L_224
    beq .L_230
    b .L_238
.L_224:
    ldr r1, _LIT4
    cmp r0, r1
    bne .L_238
.L_230:
    mov r0, #0x1
    bx lr
.L_238:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x00001441
_LIT1: .word 0x000010ab
_LIT2: .word 0x0000165a
_LIT3: .word 0x000016a4
_LIT4: .word 0x00001911
