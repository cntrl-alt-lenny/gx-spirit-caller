; func_0202f620 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0202f620
        .arm
func_0202f620:
    sub sp, sp, #0x8
    ldr r2, _LIT0
    cmp r1, #0x0
    addeq r1, sp, #0x0
    cmp r0, r2
    bgt .L_13c
    bge .L_33c
    sub r3, r2, #0x98
    cmp r0, r3
    bgt .L_f4
    bge .L_2e4
    sub r3, r2, #0x9d
    cmp r0, r3
    bgt .L_d0
    bge .L_2ac
    sub r3, r2, #0xde
    sub r3, r0, r3
    cmp r3, #0xa
    addls pc, pc, r3, lsl #0x2
    b .L_3fc
    b .L_1d0
    b .L_1e4
    b .L_1f8
    b .L_20c
    b .L_220
    b .L_234
    b .L_248
    b .L_25c
    b .L_270
    b .L_284
    b .L_298
.L_d0:
    ldr r3, _LIT1
    cmp r0, r3
    bgt .L_e4
    beq .L_2c0
    b .L_3fc
.L_e4:
    add r2, r3, #0x2
    cmp r0, r2
    beq .L_2d4
    b .L_3fc
.L_f4:
    sub r3, r2, #0x8d
    cmp r0, r3
    bgt .L_114
    bge .L_30c
    sub r3, r2, #0x95
    cmp r0, r3
    beq .L_2f8
    b .L_3fc
.L_114:
    sub r3, r2, #0x8c
    cmp r0, r3
    bgt .L_12c
    mov r1, r3
    cmp r0, r1
    b .L_3fc
.L_12c:
    sub r3, r2, #0x51
    cmp r0, r3
    beq .L_328
    b .L_3fc
.L_13c:
    add r3, r2, #0x228
    cmp r0, r3
    bgt .L_18c
    bge .L_38c
    add r3, r2, #0xdd
    cmp r0, r3
    bgt .L_168
    bge .L_350
    add r1, r2, #0x57
    cmp r0, r1
    b .L_3fc
.L_168:
    ldr r3, _LIT2
    cmp r0, r3
    bgt .L_17c
    beq .L_364
    b .L_3fc
.L_17c:
    add r2, r3, #0x6a
    cmp r0, r2
    beq .L_378
    b .L_3fc
.L_18c:
    ldr r3, _LIT3
    cmp r0, r3
    bgt .L_1ac
    bge .L_3bc
    sub r2, r3, #0x4
    cmp r0, r2
    beq .L_3a8
    b .L_3fc
.L_1ac:
    add r2, r3, #0x1
    cmp r0, r2
    bgt .L_1c0
    beq .L_3d0
    b .L_3fc
.L_1c0:
    add r2, r3, #0x2
    cmp r0, r2
    beq .L_3e8
    b .L_3fc
.L_1d0:
    sub r0, r2, #0x8d
    str r0, [r1]
    mov r0, #0x1
    add sp, sp, #0x8
    bx lr
.L_1e4:
    sub r0, r2, #0xdc
    str r0, [r1]
    mov r0, #0x1
    add sp, sp, #0x8
    bx lr
.L_1f8:
    sub r0, r2, #0xdb
    str r0, [r1]
    mov r0, #0x1
    add sp, sp, #0x8
    bx lr
.L_20c:
    sub r0, r2, #0xdc
    str r0, [r1]
    mov r0, #0x1
    add sp, sp, #0x8
    bx lr
.L_220:
    sub r0, r2, #0xd9
    str r0, [r1]
    mov r0, #0x1
    add sp, sp, #0x8
    bx lr
.L_234:
    sub r0, r2, #0xda
    str r0, [r1]
    mov r0, #0x1
    add sp, sp, #0x8
    bx lr
.L_248:
    sub r0, r2, #0xd7
    str r0, [r1]
    mov r0, #0x1
    add sp, sp, #0x8
    bx lr
.L_25c:
    sub r0, r2, #0x8c
    str r0, [r1]
    mov r0, #0x1
    add sp, sp, #0x8
    bx lr
.L_270:
    sub r0, r2, #0xd5
    str r0, [r1]
    mov r0, #0x1
    add sp, sp, #0x8
    bx lr
.L_284:
    sub r0, r2, #0xd4
    str r0, [r1]
    mov r0, #0x1
    add sp, sp, #0x8
    bx lr
.L_298:
    sub r0, r2, #0xd5
    str r0, [r1]
    mov r0, #0x1
    add sp, sp, #0x8
    bx lr
.L_2ac:
    sub r0, r2, #0x9b
    str r0, [r1]
    mov r0, #0x1
    add sp, sp, #0x8
    bx lr
.L_2c0:
    add r0, r3, #0x2
    str r0, [r1]
    mov r0, #0x1
    add sp, sp, #0x8
    bx lr
.L_2d4:
    str r3, [r1]
    mov r0, #0x1
    add sp, sp, #0x8
    bx lr
.L_2e4:
    sub r0, r2, #0x95
    str r0, [r1]
    mov r0, #0x1
    add sp, sp, #0x8
    bx lr
.L_2f8:
    sub r0, r2, #0x98
    str r0, [r1]
    mov r0, #0x1
    add sp, sp, #0x8
    bx lr
.L_30c:
    sub r0, r2, #0xde
    str r0, [r1]
    sub r0, r2, #0x51
    str r0, [r1, #0x4]
    mov r0, #0x2
    add sp, sp, #0x8
    bx lr
.L_328:
    sub r0, r2, #0x8d
    stmia r1, {r0, r2}
    mov r0, #0x2
    add sp, sp, #0x8
    bx lr
.L_33c:
    sub r0, r2, #0x51
    str r0, [r1]
    mov r0, #0x1
    add sp, sp, #0x8
    bx lr
.L_350:
    sub r0, r2, #0xd4
    str r0, [r1]
    mov r0, #0x1
    add sp, sp, #0x8
    bx lr
.L_364:
    add r0, r3, #0x4
    str r0, [r1]
    mov r0, #0x1
    add sp, sp, #0x8
    bx lr
.L_378:
    add r0, r3, #0x6b
    str r0, [r1]
    mov r0, #0x1
    add sp, sp, #0x8
    bx lr
.L_38c:
    ldr r2, _LIT4
    mov r0, #0x2
    str r2, [r1]
    add r2, r2, #0x2
    str r2, [r1, #0x4]
    add sp, sp, #0x8
    bx lr
.L_3a8:
    sub r0, r3, #0x5
    str r0, [r1]
    mov r0, #0x1
    add sp, sp, #0x8
    bx lr
.L_3bc:
    add r0, r3, #0x1
    str r0, [r1]
    mov r0, #0x1
    add sp, sp, #0x8
    bx lr
.L_3d0:
    str r3, [r1]
    add r0, r3, #0x2
    str r0, [r1, #0x4]
    mov r0, #0x2
    add sp, sp, #0x8
    bx lr
.L_3e8:
    add r0, r3, #0x1
    str r0, [r1]
    mov r0, #0x1
    add sp, sp, #0x8
    bx lr
.L_3fc:
    mov r0, #0x0
    add sp, sp, #0x8
    bx lr
_LIT0: .word 0x000018af
_LIT1: .word 0x00001814
_LIT2: .word 0x00001a6c
_LIT3: .word 0x00001adc
_LIT4: .word 0x00001ad6
