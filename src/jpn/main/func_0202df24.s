; func_0202df24 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0202df24
        .arm
func_0202df24:
    cmp r0, r1
    moveq r0, #0x1
    bxeq lr
    ldr ip, _LIT0
    cmp r0, ip
    bgt .L_c8
    bge .L_208
    ldr r3, _LIT1
    cmp r0, r3
    bgt .L_84
    bge .L_1a4
    sub r2, r3, #0x31c
    cmp r0, r2
    bgt .L_60
    bge .L_1c0
    ldr r3, _LIT2
    cmp r0, r3
    bgt .L_274
    sub r2, r3, #0x1
    cmp r0, r2
    blt .L_274
    cmpne r0, r3
    beq .L_18c
    b .L_274
.L_60:
    ldr r2, _LIT3
    cmp r0, r2
    bgt .L_74
    beq .L_1dc
    b .L_274
.L_74:
    add r2, r2, #0x110
    cmp r0, r2
    beq .L_208
    b .L_274
.L_84:
    add r2, r3, #0x148
    cmp r0, r2
    bgt .L_a4
    bge .L_1c0
    add r2, r3, #0x1e
    cmp r0, r2
    beq .L_1a4
    b .L_274
.L_a4:
    sub r2, ip, #0x94
    cmp r0, r2
    bgt .L_b8
    beq .L_1dc
    b .L_274
.L_b8:
    add r2, r3, #0x214
    cmp r0, r2
    beq .L_224
    b .L_274
.L_c8:
    ldr r3, _LIT4
    cmp r0, r3
    bgt .L_134
    bge .L_260
    add r2, ip, #0x46
    cmp r0, r2
    bgt .L_110
    add r2, ip, #0x45
    cmp r0, r2
    blt .L_100
    addne r2, ip, #0x46
    cmpne r0, r2
    beq .L_224
    b .L_274
.L_100:
    add r2, ip, #0x44
    cmp r0, r2
    beq .L_224
    b .L_274
.L_110:
    sub r2, r3, #0x2
    cmp r0, r2
    bgt .L_124
    beq .L_260
    b .L_274
.L_124:
    sub r2, r3, #0x1
    cmp r0, r2
    beq .L_260
    b .L_274
.L_134:
    add r2, r3, #0x1b8
    cmp r0, r2
    bgt .L_168
    bge .L_1dc
    add r2, r3, #0xbe
    cmp r0, r2
    bgt .L_158
    beq .L_248
    b .L_274
.L_158:
    add r2, r3, #0xbf
    cmp r0, r2
    beq .L_248
    b .L_274
.L_168:
    add r2, ip, #0x320
    cmp r0, r2
    bgt .L_17c
    beq .L_1dc
    b .L_274
.L_17c:
    ldr r2, _LIT5
    cmp r0, r2
    beq .L_1dc
    b .L_274
.L_18c:
    ldr r0, _LIT6
    add r0, r1, r0
    cmp r0, #0x1
    bhi .L_274
    mov r0, #0x1
    bx lr
.L_1a4:
    ldr r0, _LIT1
    cmp r1, r0
    addne r0, r0, #0x1e
    cmpne r1, r0
    bne .L_274
    mov r0, #0x1
    bx lr
.L_1c0:
    ldr r0, _LIT7
    cmp r1, r0
    ldrne r0, _LIT8
    cmpne r1, r0
    bne .L_274
    mov r0, #0x1
    bx lr
.L_1dc:
    ldr r0, _LIT3
    cmp r1, r0
    ldrne r0, _LIT9
    cmpne r1, r0
    beq .L_200
    ldr r0, _LIT10
    add r0, r1, r0
    cmp r0, #0x2
    bhi .L_274
.L_200:
    mov r0, #0x1
    bx lr
.L_208:
    ldr r0, _LIT11
    cmp r1, r0
    ldrne r0, _LIT0
    cmpne r1, r0
    bne .L_274
    mov r0, #0x1
    bx lr
.L_224:
    ldr r0, _LIT12
    cmp r1, r0
    beq .L_240
    ldr r0, _LIT13
    add r0, r1, r0
    cmp r0, #0x2
    bhi .L_274
.L_240:
    mov r0, #0x1
    bx lr
.L_248:
    ldr r0, _LIT14
    add r0, r1, r0
    cmp r0, #0x1
    bhi .L_274
    mov r0, #0x1
    bx lr
.L_260:
    ldr r0, _LIT15
    add r0, r1, r0
    cmp r0, #0x2
    movls r0, #0x1
    bxls lr
.L_274:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x0000150b
_LIT1: .word 0x000012e5
_LIT2: .word 0x00000fa7
_LIT3: .word 0x00000fe4
_LIT4: .word 0x00001672
_LIT5: .word 0x0000182c
_LIT6: .word 0xfffff05a
_LIT7: .word 0x00000fc9
_LIT8: .word 0x0000142d
_LIT9: .word 0x00001477
_LIT10: .word 0xffffe7d6
_LIT11: .word 0x000010f4
_LIT12: .word 0x000014f9
_LIT13: .word 0xffffeab1
_LIT14: .word 0xffffe8d0
_LIT15: .word 0xffffe990
