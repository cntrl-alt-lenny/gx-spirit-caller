; func_020307b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202e2d4
        .extern func_02030068
        .global func_020307b4
        .arm
func_020307b4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0202e2d4
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r0, _LIT0
    cmp r4, r0
    bgt .L_1e8
    sub r1, r0, #0x1
    cmp r4, r1
    blt .L_3c
    cmpne r4, r0
    beq .L_340
    b .L_348
.L_3c:
    sub r1, r0, #0xbf
    cmp r4, r1
    bgt .L_10c
    bge .L_340
    ldr r2, _LIT1
    cmp r4, r2
    bgt .L_b8
    bge .L_340
    ldr r1, _LIT2
    cmp r4, r1
    bgt .L_94
    bge .L_340
    sub r0, r1, #0x7e
    cmp r4, r0
    bgt .L_348
    sub r0, r1, #0x7f
    cmp r4, r0
    blt .L_348
    subne r0, r1, #0x7e
    cmpne r4, r0
    beq .L_340
    b .L_348
.L_94:
    add r0, r1, #0xf0
    cmp r4, r0
    bgt .L_a8
    beq .L_340
    b .L_348
.L_a8:
    sub r0, r2, #0x4
    cmp r4, r0
    beq .L_340
    b .L_348
.L_b8:
    add r1, r2, #0x93
    cmp r4, r1
    bgt .L_e0
    mov r0, r1
    cmp r4, r0
    bge .L_340
    add r0, r2, #0x48
    cmp r4, r0
    beq .L_340
    b .L_348
.L_e0:
    sub r1, r0, #0xdc
    cmp r4, r1
    bgt .L_fc
    sub r0, r0, #0xdc
    cmp r4, r0
    beq .L_340
    b .L_348
.L_fc:
    sub r0, r0, #0xdb
    cmp r4, r0
    beq .L_340
    b .L_348
.L_10c:
    sub r1, r0, #0x4c
    cmp r4, r1
    bgt .L_168
    bge .L_340
    sub r1, r0, #0xa7
    cmp r4, r1
    bgt .L_13c
    bge .L_340
    sub r0, r0, #0xbe
    cmp r4, r0
    beq .L_340
    b .L_348
.L_13c:
    sub r1, r0, #0x82
    cmp r4, r1
    bgt .L_158
    sub r0, r0, #0x82
    cmp r4, r0
    beq .L_340
    b .L_348
.L_158:
    sub r0, r0, #0x4f
    cmp r4, r0
    beq .L_340
    b .L_348
.L_168:
    sub r1, r0, #0x2f
    cmp r4, r1
    bgt .L_1bc
    sub r1, r0, #0x30
    cmp r4, r1
    blt .L_190
    subne r0, r0, #0x2f
    cmpne r4, r0
    beq .L_340
    b .L_348
.L_190:
    sub r1, r0, #0x44
    cmp r4, r1
    bgt .L_1ac
    sub r0, r0, #0x44
    cmp r4, r0
    beq .L_340
    b .L_348
.L_1ac:
    sub r0, r0, #0x31
    cmp r4, r0
    beq .L_340
    b .L_348
.L_1bc:
    sub r1, r0, #0x6
    cmp r4, r1
    bgt .L_1d8
    sub r0, r0, #0x6
    cmp r4, r0
    beq .L_340
    b .L_348
.L_1d8:
    sub r0, r0, #0x2
    cmp r4, r0
    beq .L_340
    b .L_348
.L_1e8:
    add r1, r0, #0x7a
    cmp r4, r1
    bgt .L_29c
    bge .L_340
    add r1, r0, #0x68
    cmp r4, r1
    bgt .L_254
    bge .L_340
    add r1, r0, #0x22
    cmp r4, r1
    bgt .L_228
    bge .L_340
    add r0, r0, #0x21
    cmp r4, r0
    beq .L_340
    b .L_348
.L_228:
    add r1, r0, #0x46
    cmp r4, r1
    bgt .L_244
    add r0, r0, #0x46
    cmp r4, r0
    beq .L_340
    b .L_348
.L_244:
    add r0, r0, #0x47
    cmp r4, r0
    beq .L_340
    b .L_348
.L_254:
    add r1, r0, #0x6d
    cmp r4, r1
    bgt .L_274
    bge .L_340
    add r0, r0, #0x6c
    cmp r4, r0
    beq .L_340
    b .L_348
.L_274:
    add r1, r0, #0x78
    cmp r4, r1
    bgt .L_290
    add r0, r0, #0x78
    cmp r4, r0
    beq .L_340
    b .L_348
.L_290:
    cmp r4, #0x1a00
    beq .L_340
    b .L_348
.L_29c:
    ldr r1, _LIT3
    cmp r4, r1
    bgt .L_2ec
    bge .L_340
    sub r0, r1, #0x63
    cmp r4, r0
    bgt .L_2c8
    bge .L_340
    cmp r4, #0x1a40
    beq .L_340
    b .L_348
.L_2c8:
    sub r0, r1, #0x59
    cmp r4, r0
    bgt .L_2dc
    beq .L_340
    b .L_348
.L_2dc:
    sub r0, r1, #0x4f
    cmp r4, r0
    beq .L_340
    b .L_348
.L_2ec:
    add r0, r1, #0x69
    cmp r4, r0
    bgt .L_320
    bge .L_340
    add r0, r1, #0x30
    cmp r4, r0
    bgt .L_310
    beq .L_340
    b .L_348
.L_310:
    add r0, r1, #0x37
    cmp r4, r0
    beq .L_340
    b .L_348
.L_320:
    add r0, r1, #0x7d
    cmp r4, r0
    bgt .L_334
    beq .L_340
    b .L_348
.L_334:
    add r0, r1, #0x7e
    cmp r4, r0
    bne .L_348
.L_340:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_348:
    mov r0, r4
    bl func_02030068
    cmp r0, #0x2
    cmpne r0, #0x4
    bne .L_364
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_364:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00001987
_LIT1: .word 0x00001729
_LIT2: .word 0x000015fc
_LIT3: .word 0x00001ab1
