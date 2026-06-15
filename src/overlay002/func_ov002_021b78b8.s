; func_ov002_021b78b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_021b78b8
        .arm
func_ov002_021b78b8:
    ldr r1, _LIT0
    cmp r0, r1
    bgt .L_33a4
    sub r2, r1, #0x2
    cmp r0, r2
    blt .L_3258
    cmpne r0, r1
    beq .L_34f8
    b .L_3510
.L_3258:
    ldr r3, _LIT1
    cmp r0, r3
    bgt .L_3300
    bge .L_34f8
    ldr r2, _LIT2
    cmp r0, r2
    bgt .L_32bc
    bge .L_3510
    ldr r2, _LIT3
    cmp r0, r2
    bgt .L_3298
    bge .L_3508
    sub r1, r2, #0x9
    cmp r0, r1
    beq .L_34f8
    b .L_3510
.L_3298:
    add r1, r2, #0x17
    cmp r0, r1
    bgt .L_32ac
    beq .L_34f8
    b .L_3510
.L_32ac:
    add r1, r2, #0x4a
    cmp r0, r1
    beq .L_34f8
    b .L_3510
.L_32bc:
    add r1, r2, #0x57
    cmp r0, r1
    bgt .L_32dc
    bge .L_34f8
    add r1, r2, #0x1d
    cmp r0, r1
    beq .L_34f8
    b .L_3510
.L_32dc:
    add r1, r2, #0xdf
    cmp r0, r1
    bgt .L_32f0
    beq .L_34f8
    b .L_3510
.L_32f0:
    add r1, r2, #0xe5
    cmp r0, r1
    beq .L_3508
    b .L_3510
.L_3300:
    sub r2, r1, #0xb5
    cmp r0, r2
    bgt .L_335c
    sub r1, r1, #0xb5
    cmp r0, r1
    bge .L_34f8
    add r1, r3, #0x62
    cmp r0, r1
    bgt .L_3338
    bge .L_3500
    add r1, r3, #0x1f
    cmp r0, r1
    beq .L_34f8
    b .L_3510
.L_3338:
    add r1, r3, #0xd2
    cmp r0, r1
    bgt .L_334c
    beq .L_34f8
    b .L_3510
.L_334c:
    add r1, r3, #0xe2
    cmp r0, r1
    beq .L_34f8
    b .L_3510
.L_335c:
    sub r2, r1, #0xa4
    cmp r0, r2
    bgt .L_3378
    bge .L_34f8
    sub r1, r1, #0xa9
    cmp r0, r1
    b .L_3510
.L_3378:
    sub r2, r1, #0x9d
    cmp r0, r2
    bgt .L_3394
    sub r1, r1, #0x9d
    cmp r0, r1
    beq .L_34f8
    b .L_3510
.L_3394:
    add r1, r3, #0x200
    cmp r0, r1
    beq .L_34f8
    b .L_3510
.L_33a4:
    add r2, r1, #0x1a4
    cmp r0, r2
    bgt .L_344c
    bge .L_3510
    add r2, r1, #0xcb
    cmp r0, r2
    bgt .L_3410
    bge .L_3510
    add r2, r1, #0x2f
    cmp r0, r2
    bgt .L_33e4
    bge .L_3510
    add r1, r1, #0x1a
    cmp r0, r1
    beq .L_34f8
    b .L_3510
.L_33e4:
    add r2, r1, #0x7d
    cmp r0, r2
    bgt .L_3400
    add r1, r1, #0x7d
    cmp r0, r1
    beq .L_3500
    b .L_3510
.L_3400:
    add r1, r1, #0x8b
    cmp r0, r1
    beq .L_3500
    b .L_3510
.L_3410:
    add r2, r1, #0xd8
    cmp r0, r2
    bgt .L_342c
    bge .L_3510
    add r1, r1, #0xd1
    cmp r0, r1
    b .L_3510
.L_342c:
    ldr r1, _LIT4
    cmp r0, r1
    bgt .L_3440
    beq .L_34f8
    b .L_3510
.L_3440:
    add r1, r1, #0x71
    cmp r0, r1
    b .L_3510
.L_344c:
    ldr r2, _LIT5
    cmp r0, r2
    bgt .L_34a0
    bge .L_34f8
    sub r1, r2, #0xec
    cmp r0, r1
    bgt .L_347c
    bge .L_34f8
    ldr r1, _LIT6
    cmp r0, r1
    beq .L_3500
    b .L_3510
.L_347c:
    sub r1, r2, #0xce
    cmp r0, r1
    bgt .L_3490
    beq .L_34f8
    b .L_3510
.L_3490:
    sub r1, r2, #0xa4
    cmp r0, r1
    beq .L_34f8
    b .L_3510
.L_34a0:
    add r1, r2, #0xcb
    cmp r0, r1
    bgt .L_34d4
    bge .L_34f8
    add r1, r2, #0xa9
    cmp r0, r1
    bgt .L_34c4
    beq .L_34f8
    b .L_3510
.L_34c4:
    add r1, r2, #0xc8
    cmp r0, r1
    beq .L_3508
    b .L_3510
.L_34d4:
    add r1, r2, #0xfe
    cmp r0, r1
    bgt .L_34e8
    beq .L_34f8
    b .L_3510
.L_34e8:
    add r1, r2, #0xff
    cmp r0, r1
    beq .L_3508
    b .L_3510
.L_34f8:
    mov r0, #0x1
    bx lr
.L_3500:
    mov r0, #0x2
    bx lr
.L_3508:
    mov r0, #0x3
    bx lr
.L_3510:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x00001776
_LIT1: .word 0x00001548
_LIT2: .word 0x00001403
_LIT3: .word 0x000012d5
_LIT4: .word 0x00001888
_LIT5: .word 0x00001a5b
_LIT6: .word 0x00001944
