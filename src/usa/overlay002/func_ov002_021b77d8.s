; func_ov002_021b77d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_021b77d8
        .arm
func_ov002_021b77d8:
    ldr r1, _LIT0
    cmp r0, r1
    bgt .L_1428
    sub r2, r1, #0x2
    cmp r0, r2
    blt .L_12dc
    cmpne r0, r1
    beq .L_157c
    b .L_1594
.L_12dc:
    ldr r3, _LIT1
    cmp r0, r3
    bgt .L_1384
    bge .L_157c
    ldr r2, _LIT2
    cmp r0, r2
    bgt .L_1340
    bge .L_1594
    ldr r2, _LIT3
    cmp r0, r2
    bgt .L_131c
    bge .L_158c
    sub r1, r2, #0x9
    cmp r0, r1
    beq .L_157c
    b .L_1594
.L_131c:
    add r1, r2, #0x17
    cmp r0, r1
    bgt .L_1330
    beq .L_157c
    b .L_1594
.L_1330:
    add r1, r2, #0x4a
    cmp r0, r1
    beq .L_157c
    b .L_1594
.L_1340:
    add r1, r2, #0x57
    cmp r0, r1
    bgt .L_1360
    bge .L_157c
    add r1, r2, #0x1d
    cmp r0, r1
    beq .L_157c
    b .L_1594
.L_1360:
    add r1, r2, #0xdf
    cmp r0, r1
    bgt .L_1374
    beq .L_157c
    b .L_1594
.L_1374:
    add r1, r2, #0xe5
    cmp r0, r1
    beq .L_158c
    b .L_1594
.L_1384:
    sub r2, r1, #0xb5
    cmp r0, r2
    bgt .L_13e0
    sub r1, r1, #0xb5
    cmp r0, r1
    bge .L_157c
    add r1, r3, #0x62
    cmp r0, r1
    bgt .L_13bc
    bge .L_1584
    add r1, r3, #0x1f
    cmp r0, r1
    beq .L_157c
    b .L_1594
.L_13bc:
    add r1, r3, #0xd2
    cmp r0, r1
    bgt .L_13d0
    beq .L_157c
    b .L_1594
.L_13d0:
    add r1, r3, #0xe2
    cmp r0, r1
    beq .L_157c
    b .L_1594
.L_13e0:
    sub r2, r1, #0xa4
    cmp r0, r2
    bgt .L_13fc
    bge .L_157c
    sub r1, r1, #0xa9
    cmp r0, r1
    b .L_1594
.L_13fc:
    sub r2, r1, #0x9d
    cmp r0, r2
    bgt .L_1418
    sub r1, r1, #0x9d
    cmp r0, r1
    beq .L_157c
    b .L_1594
.L_1418:
    add r1, r3, #0x200
    cmp r0, r1
    beq .L_157c
    b .L_1594
.L_1428:
    add r2, r1, #0x1a4
    cmp r0, r2
    bgt .L_14d0
    bge .L_1594
    add r2, r1, #0xcb
    cmp r0, r2
    bgt .L_1494
    bge .L_1594
    add r2, r1, #0x2f
    cmp r0, r2
    bgt .L_1468
    bge .L_1594
    add r1, r1, #0x1a
    cmp r0, r1
    beq .L_157c
    b .L_1594
.L_1468:
    add r2, r1, #0x7d
    cmp r0, r2
    bgt .L_1484
    add r1, r1, #0x7d
    cmp r0, r1
    beq .L_1584
    b .L_1594
.L_1484:
    add r1, r1, #0x8b
    cmp r0, r1
    beq .L_1584
    b .L_1594
.L_1494:
    add r2, r1, #0xd8
    cmp r0, r2
    bgt .L_14b0
    bge .L_1594
    add r1, r1, #0xd1
    cmp r0, r1
    b .L_1594
.L_14b0:
    ldr r1, _LIT4
    cmp r0, r1
    bgt .L_14c4
    beq .L_157c
    b .L_1594
.L_14c4:
    add r1, r1, #0x71
    cmp r0, r1
    b .L_1594
.L_14d0:
    ldr r2, _LIT5
    cmp r0, r2
    bgt .L_1524
    bge .L_157c
    sub r1, r2, #0xec
    cmp r0, r1
    bgt .L_1500
    bge .L_157c
    ldr r1, _LIT6
    cmp r0, r1
    beq .L_1584
    b .L_1594
.L_1500:
    sub r1, r2, #0xce
    cmp r0, r1
    bgt .L_1514
    beq .L_157c
    b .L_1594
.L_1514:
    sub r1, r2, #0xa4
    cmp r0, r1
    beq .L_157c
    b .L_1594
.L_1524:
    add r1, r2, #0xcb
    cmp r0, r1
    bgt .L_1558
    bge .L_157c
    add r1, r2, #0xa9
    cmp r0, r1
    bgt .L_1548
    beq .L_157c
    b .L_1594
.L_1548:
    add r1, r2, #0xc8
    cmp r0, r1
    beq .L_158c
    b .L_1594
.L_1558:
    add r1, r2, #0xfe
    cmp r0, r1
    bgt .L_156c
    beq .L_157c
    b .L_1594
.L_156c:
    add r1, r2, #0xff
    cmp r0, r1
    beq .L_158c
    b .L_1594
.L_157c:
    mov r0, #0x1
    bx lr
.L_1584:
    mov r0, #0x2
    bx lr
.L_158c:
    mov r0, #0x3
    bx lr
.L_1594:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x00001776
_LIT1: .word 0x00001548
_LIT2: .word 0x00001403
_LIT3: .word 0x000012d5
_LIT4: .word 0x00001888
_LIT5: .word 0x00001a5b
_LIT6: .word 0x00001944
