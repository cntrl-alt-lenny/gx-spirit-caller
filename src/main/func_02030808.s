; func_02030808 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202e328
        .extern func_020300bc
        .global func_02030808
        .arm
func_02030808:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0202e328
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r0, _LIT0
    cmp r4, r0
    bgt .L_3e8
    sub r1, r0, #0x1
    cmp r4, r1
    blt .L_23c
    cmpne r4, r0
    beq .L_540
    b .L_548
.L_23c:
    sub r1, r0, #0xbf
    cmp r4, r1
    bgt .L_30c
    bge .L_540
    ldr r2, _LIT1
    cmp r4, r2
    bgt .L_2b8
    bge .L_540
    ldr r1, _LIT2
    cmp r4, r1
    bgt .L_294
    bge .L_540
    sub r0, r1, #0x7e
    cmp r4, r0
    bgt .L_548
    sub r0, r1, #0x7f
    cmp r4, r0
    blt .L_548
    subne r0, r1, #0x7e
    cmpne r4, r0
    beq .L_540
    b .L_548
.L_294:
    add r0, r1, #0xf0
    cmp r4, r0
    bgt .L_2a8
    beq .L_540
    b .L_548
.L_2a8:
    sub r0, r2, #0x4
    cmp r4, r0
    beq .L_540
    b .L_548
.L_2b8:
    add r1, r2, #0x93
    cmp r4, r1
    bgt .L_2e0
    mov r0, r1
    cmp r4, r0
    bge .L_540
    add r0, r2, #0x48
    cmp r4, r0
    beq .L_540
    b .L_548
.L_2e0:
    sub r1, r0, #0xdc
    cmp r4, r1
    bgt .L_2fc
    sub r0, r0, #0xdc
    cmp r4, r0
    beq .L_540
    b .L_548
.L_2fc:
    sub r0, r0, #0xdb
    cmp r4, r0
    beq .L_540
    b .L_548
.L_30c:
    sub r1, r0, #0x4c
    cmp r4, r1
    bgt .L_368
    bge .L_540
    sub r1, r0, #0xa7
    cmp r4, r1
    bgt .L_33c
    bge .L_540
    sub r0, r0, #0xbe
    cmp r4, r0
    beq .L_540
    b .L_548
.L_33c:
    sub r1, r0, #0x82
    cmp r4, r1
    bgt .L_358
    sub r0, r0, #0x82
    cmp r4, r0
    beq .L_540
    b .L_548
.L_358:
    sub r0, r0, #0x4f
    cmp r4, r0
    beq .L_540
    b .L_548
.L_368:
    sub r1, r0, #0x2f
    cmp r4, r1
    bgt .L_3bc
    sub r1, r0, #0x30
    cmp r4, r1
    blt .L_390
    subne r0, r0, #0x2f
    cmpne r4, r0
    beq .L_540
    b .L_548
.L_390:
    sub r1, r0, #0x44
    cmp r4, r1
    bgt .L_3ac
    sub r0, r0, #0x44
    cmp r4, r0
    beq .L_540
    b .L_548
.L_3ac:
    sub r0, r0, #0x31
    cmp r4, r0
    beq .L_540
    b .L_548
.L_3bc:
    sub r1, r0, #0x6
    cmp r4, r1
    bgt .L_3d8
    sub r0, r0, #0x6
    cmp r4, r0
    beq .L_540
    b .L_548
.L_3d8:
    sub r0, r0, #0x2
    cmp r4, r0
    beq .L_540
    b .L_548
.L_3e8:
    add r1, r0, #0x7a
    cmp r4, r1
    bgt .L_49c
    bge .L_540
    add r1, r0, #0x68
    cmp r4, r1
    bgt .L_454
    bge .L_540
    add r1, r0, #0x22
    cmp r4, r1
    bgt .L_428
    bge .L_540
    add r0, r0, #0x21
    cmp r4, r0
    beq .L_540
    b .L_548
.L_428:
    add r1, r0, #0x46
    cmp r4, r1
    bgt .L_444
    add r0, r0, #0x46
    cmp r4, r0
    beq .L_540
    b .L_548
.L_444:
    add r0, r0, #0x47
    cmp r4, r0
    beq .L_540
    b .L_548
.L_454:
    add r1, r0, #0x6d
    cmp r4, r1
    bgt .L_474
    bge .L_540
    add r0, r0, #0x6c
    cmp r4, r0
    beq .L_540
    b .L_548
.L_474:
    add r1, r0, #0x78
    cmp r4, r1
    bgt .L_490
    add r0, r0, #0x78
    cmp r4, r0
    beq .L_540
    b .L_548
.L_490:
    cmp r4, #0x1a00
    beq .L_540
    b .L_548
.L_49c:
    ldr r1, _LIT3
    cmp r4, r1
    bgt .L_4ec
    bge .L_540
    sub r0, r1, #0x63
    cmp r4, r0
    bgt .L_4c8
    bge .L_540
    cmp r4, #0x1a40
    beq .L_540
    b .L_548
.L_4c8:
    sub r0, r1, #0x59
    cmp r4, r0
    bgt .L_4dc
    beq .L_540
    b .L_548
.L_4dc:
    sub r0, r1, #0x4f
    cmp r4, r0
    beq .L_540
    b .L_548
.L_4ec:
    add r0, r1, #0x69
    cmp r4, r0
    bgt .L_520
    bge .L_540
    add r0, r1, #0x30
    cmp r4, r0
    bgt .L_510
    beq .L_540
    b .L_548
.L_510:
    add r0, r1, #0x37
    cmp r4, r0
    beq .L_540
    b .L_548
.L_520:
    add r0, r1, #0x7d
    cmp r4, r0
    bgt .L_534
    beq .L_540
    b .L_548
.L_534:
    add r0, r1, #0x7e
    cmp r4, r0
    bne .L_548
.L_540:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_548:
    mov r0, r4
    bl func_020300bc
    cmp r0, #0x2
    cmpne r0, #0x4
    bne .L_564
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_564:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00001987
_LIT1: .word 0x00001729
_LIT2: .word 0x000015fc
_LIT3: .word 0x00001ab1
