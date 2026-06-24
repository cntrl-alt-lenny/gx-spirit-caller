; func_0202f5cc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0202f5cc
        .arm
func_0202f5cc:
    sub sp, sp, #0x8
    ldr r2, _LIT0
    cmp r1, #0x0
    addeq r1, sp, #0x0
    cmp r0, r2
    bgt .L_e8
    bge .L_2e8
    sub r3, r2, #0x98
    cmp r0, r3
    bgt .L_a0
    bge .L_290
    sub r3, r2, #0x9d
    cmp r0, r3
    bgt .L_7c
    bge .L_258
    sub r3, r2, #0xde
    sub r3, r0, r3
    cmp r3, #0xa
    addls pc, pc, r3, lsl #0x2
    b .L_3a8
    b .L_17c
    b .L_190
    b .L_1a4
    b .L_1b8
    b .L_1cc
    b .L_1e0
    b .L_1f4
    b .L_208
    b .L_21c
    b .L_230
    b .L_244
.L_7c:
    ldr r3, _LIT1
    cmp r0, r3
    bgt .L_90
    beq .L_26c
    b .L_3a8
.L_90:
    add r2, r3, #0x2
    cmp r0, r2
    beq .L_280
    b .L_3a8
.L_a0:
    sub r3, r2, #0x8d
    cmp r0, r3
    bgt .L_c0
    bge .L_2b8
    sub r3, r2, #0x95
    cmp r0, r3
    beq .L_2a4
    b .L_3a8
.L_c0:
    sub r3, r2, #0x8c
    cmp r0, r3
    bgt .L_d8
    mov r1, r3
    cmp r0, r1
    b .L_3a8
.L_d8:
    sub r3, r2, #0x51
    cmp r0, r3
    beq .L_2d4
    b .L_3a8
.L_e8:
    add r3, r2, #0x228
    cmp r0, r3
    bgt .L_138
    bge .L_338
    add r3, r2, #0xdd
    cmp r0, r3
    bgt .L_114
    bge .L_2fc
    add r1, r2, #0x57
    cmp r0, r1
    b .L_3a8
.L_114:
    ldr r3, _LIT2
    cmp r0, r3
    bgt .L_128
    beq .L_310
    b .L_3a8
.L_128:
    add r2, r3, #0x6a
    cmp r0, r2
    beq .L_324
    b .L_3a8
.L_138:
    ldr r3, _LIT3
    cmp r0, r3
    bgt .L_158
    bge .L_368
    sub r2, r3, #0x4
    cmp r0, r2
    beq .L_354
    b .L_3a8
.L_158:
    add r2, r3, #0x1
    cmp r0, r2
    bgt .L_16c
    beq .L_37c
    b .L_3a8
.L_16c:
    add r2, r3, #0x2
    cmp r0, r2
    beq .L_394
    b .L_3a8
.L_17c:
    sub r0, r2, #0x8d
    str r0, [r1]
    mov r0, #0x1
    add sp, sp, #0x8
    bx lr
.L_190:
    sub r0, r2, #0xdc
    str r0, [r1]
    mov r0, #0x1
    add sp, sp, #0x8
    bx lr
.L_1a4:
    sub r0, r2, #0xdb
    str r0, [r1]
    mov r0, #0x1
    add sp, sp, #0x8
    bx lr
.L_1b8:
    sub r0, r2, #0xdc
    str r0, [r1]
    mov r0, #0x1
    add sp, sp, #0x8
    bx lr
.L_1cc:
    sub r0, r2, #0xd9
    str r0, [r1]
    mov r0, #0x1
    add sp, sp, #0x8
    bx lr
.L_1e0:
    sub r0, r2, #0xda
    str r0, [r1]
    mov r0, #0x1
    add sp, sp, #0x8
    bx lr
.L_1f4:
    sub r0, r2, #0xd7
    str r0, [r1]
    mov r0, #0x1
    add sp, sp, #0x8
    bx lr
.L_208:
    sub r0, r2, #0x8c
    str r0, [r1]
    mov r0, #0x1
    add sp, sp, #0x8
    bx lr
.L_21c:
    sub r0, r2, #0xd5
    str r0, [r1]
    mov r0, #0x1
    add sp, sp, #0x8
    bx lr
.L_230:
    sub r0, r2, #0xd4
    str r0, [r1]
    mov r0, #0x1
    add sp, sp, #0x8
    bx lr
.L_244:
    sub r0, r2, #0xd5
    str r0, [r1]
    mov r0, #0x1
    add sp, sp, #0x8
    bx lr
.L_258:
    sub r0, r2, #0x9b
    str r0, [r1]
    mov r0, #0x1
    add sp, sp, #0x8
    bx lr
.L_26c:
    add r0, r3, #0x2
    str r0, [r1]
    mov r0, #0x1
    add sp, sp, #0x8
    bx lr
.L_280:
    str r3, [r1]
    mov r0, #0x1
    add sp, sp, #0x8
    bx lr
.L_290:
    sub r0, r2, #0x95
    str r0, [r1]
    mov r0, #0x1
    add sp, sp, #0x8
    bx lr
.L_2a4:
    sub r0, r2, #0x98
    str r0, [r1]
    mov r0, #0x1
    add sp, sp, #0x8
    bx lr
.L_2b8:
    sub r0, r2, #0xde
    str r0, [r1]
    sub r0, r2, #0x51
    str r0, [r1, #0x4]
    mov r0, #0x2
    add sp, sp, #0x8
    bx lr
.L_2d4:
    sub r0, r2, #0x8d
    stmia r1, {r0, r2}
    mov r0, #0x2
    add sp, sp, #0x8
    bx lr
.L_2e8:
    sub r0, r2, #0x51
    str r0, [r1]
    mov r0, #0x1
    add sp, sp, #0x8
    bx lr
.L_2fc:
    sub r0, r2, #0xd4
    str r0, [r1]
    mov r0, #0x1
    add sp, sp, #0x8
    bx lr
.L_310:
    add r0, r3, #0x4
    str r0, [r1]
    mov r0, #0x1
    add sp, sp, #0x8
    bx lr
.L_324:
    add r0, r3, #0x6b
    str r0, [r1]
    mov r0, #0x1
    add sp, sp, #0x8
    bx lr
.L_338:
    ldr r2, _LIT4
    mov r0, #0x2
    str r2, [r1]
    add r2, r2, #0x2
    str r2, [r1, #0x4]
    add sp, sp, #0x8
    bx lr
.L_354:
    sub r0, r3, #0x5
    str r0, [r1]
    mov r0, #0x1
    add sp, sp, #0x8
    bx lr
.L_368:
    add r0, r3, #0x1
    str r0, [r1]
    mov r0, #0x1
    add sp, sp, #0x8
    bx lr
.L_37c:
    str r3, [r1]
    add r0, r3, #0x2
    str r0, [r1, #0x4]
    mov r0, #0x2
    add sp, sp, #0x8
    bx lr
.L_394:
    add r0, r3, #0x1
    str r0, [r1]
    mov r0, #0x1
    add sp, sp, #0x8
    bx lr
.L_3a8:
    mov r0, #0x0
    add sp, sp, #0x8
    bx lr
_LIT0: .word 0x000018af
_LIT1: .word 0x00001814
_LIT2: .word 0x00001a6c
_LIT3: .word 0x00001adc
_LIT4: .word 0x00001ad6
