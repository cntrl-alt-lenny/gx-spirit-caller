; func_ov002_022483a4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern data_ov002_022cf09c
        .extern func_0202df24
        .extern func_0202f5cc
        .extern func_ov002_021ca310
        .extern func_ov002_02253370
        .global func_ov002_022483a4
        .arm
func_ov002_022483a4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x8
    ldr r3, _LIT0
    add r6, sp, #0x0
    mov r5, #0x0
    mov r4, r0
    str r5, [r6]
    str r5, [r6, #0x4]
    cmp r1, r3
    bgt .L_19c
    bge .L_398
    sub r0, r3, #0x11c
    cmp r1, r0
    bgt .L_bc
    bge .L_2ec
    ldr r3, _LIT1
    cmp r1, r3
    bgt .L_84
    bge .L_2d4
    ldr r2, _LIT2
    cmp r1, r2
    bgt .L_70
    bge .L_2c0
    ldr r0, _LIT3
    cmp r1, r0
    ldreq r0, _LIT4
    streq r0, [sp]
    b .L_420
.L_70:
    sub r0, r3, #0xb7
    cmp r1, r0
    addeq r0, r2, #0x450
    streq r0, [sp]
    b .L_420
.L_84:
    add r0, r3, #0x7a
    cmp r1, r0
    bgt .L_a8
    bge .L_2e0
    add r0, r3, #0x62
    cmp r1, r0
    addeq r0, r3, #0x63
    streq r0, [sp]
    b .L_420
.L_a8:
    add r0, r3, #0x9e
    cmp r1, r0
    ldreq r0, _LIT5
    streq r0, [sp]
    b .L_420
.L_bc:
    sub r0, r3, #0x4b
    cmp r1, r0
    bgt .L_164
    bge .L_380
    sub r0, r3, #0x83
    cmp r1, r0
    bgt .L_154
    sub r0, r3, #0x98
    subs r0, r1, r0
    addpl pc, pc, r0, lsl #0x2
    b .L_140
    b .L_304
    b .L_420
    b .L_420
    b .L_420
    b .L_310
    b .L_420
    b .L_420
    b .L_420
    b .L_420
    b .L_420
    b .L_420
    b .L_420
    b .L_2f8
    b .L_31c
    b .L_328
    b .L_420
    b .L_334
    b .L_420
    b .L_340
    b .L_34c
    b .L_358
    b .L_364
.L_140:
    ldr r0, _LIT6
    cmp r1, r0
    subeq r0, r0, #0x27
    streq r0, [sp]
    b .L_420
.L_154:
    sub r0, r3, #0x68
    cmp r1, r0
    beq .L_370
    b .L_420
.L_164:
    sub r0, r3, #0x46
    cmp r1, r0
    bgt .L_188
    bge .L_38c
    sub r0, r3, #0x49
    cmp r1, r0
    subeq r0, r3, #0x47
    streq r0, [sp]
    b .L_420
.L_188:
    sub r0, r3, #0x3b
    cmp r1, r0
    addeq r0, r3, #0x1
    streq r0, [sp]
    b .L_420
.L_19c:
    ldr r0, _LIT7
    cmp r1, r0
    bgt .L_240
    bge .L_3f4
    add r5, r3, #0xaa
    cmp r1, r5
    bgt .L_204
    mov r2, r5
    cmp r1, r2
    bge .L_3b0
    add r2, r3, #0x21
    cmp r1, r2
    bgt .L_1f0
    mov r0, r2
    cmp r1, r0
    bge .L_3a4
    add r0, r3, #0x1
    cmp r1, r0
    addeq r0, r3, #0x52
    streq r0, [sp]
    b .L_420
.L_1f0:
    add r2, r3, #0x46
    cmp r1, r2
    subeq r0, r0, #0x168
    streq r0, [sp]
    b .L_420
.L_204:
    sub r3, r0, #0x57
    cmp r1, r3
    bgt .L_230
    mov r2, r3
    cmp r1, r2
    bge .L_3bc
    sub r2, r0, #0xf4
    cmp r1, r2
    subeq r0, r0, #0xf4
    streq r0, [sp]
    b .L_420
.L_230:
    sub r3, r0, #0x34
    cmp r1, r3
    beq .L_3c8
    b .L_420
.L_240:
    add r2, r0, #0xca
    cmp r1, r2
    bgt .L_288
    bge .L_40c
    add r2, r0, #0x60
    cmp r1, r2
    bgt .L_274
    bge .L_400
    add r2, r0, #0xe
    cmp r1, r2
    subeq r0, r0, #0x16
    streq r0, [sp]
    b .L_420
.L_274:
    add r2, r0, #0x6a
    cmp r1, r2
    addeq r0, r0, #0x64
    streq r0, [sp]
    b .L_420
.L_288:
    add r2, r0, #0xd0
    cmp r1, r2
    bgt .L_2ac
    bge .L_418
    add r2, r0, #0xcb
    cmp r1, r2
    addeq r0, r0, #0xcc
    streq r0, [sp]
    b .L_420
.L_2ac:
    add r2, r0, #0xd1
    cmp r1, r2
    addeq r0, r0, #0xd2
    streq r0, [sp]
    b .L_420
.L_2c0:
    sub r1, r2, #0x100
    sub r0, r2, #0xff
    str r1, [sp]
    str r0, [sp, #0x4]
    b .L_420
.L_2d4:
    ldr r0, _LIT8
    str r0, [sp]
    b .L_420
.L_2e0:
    add r0, r3, #0x64
    str r0, [sp]
    b .L_420
.L_2ec:
    sub r0, r3, #0x120
    str r0, [sp]
    b .L_420
.L_2f8:
    sub r0, r3, #0x3b
    str r0, [sp]
    b .L_420
.L_304:
    sub r0, r3, #0x98
    str r0, [sp]
    b .L_420
.L_310:
    sub r0, r3, #0x94
    str r0, [sp]
    b .L_420
.L_31c:
    sub r0, r3, #0x8a
    str r0, [sp]
    b .L_420
.L_328:
    sub r0, r3, #0x89
    str r0, [sp]
    b .L_420
.L_334:
    sub r0, r3, #0x87
    str r0, [sp]
    b .L_420
.L_340:
    sub r0, r3, #0x85
    str r0, [sp]
    b .L_420
.L_34c:
    sub r0, r3, #0x3a
    str r0, [sp]
    b .L_420
.L_358:
    sub r0, r3, #0x83
    str r0, [sp]
    b .L_420
.L_364:
    sub r0, r3, #0x82
    str r0, [sp]
    b .L_420
.L_370:
    mov r0, r2
    mov r1, r6
    bl func_0202f5cc
    b .L_420
.L_380:
    sub r0, r3, #0x49
    str r0, [sp]
    b .L_420
.L_38c:
    sub r0, r3, #0x43
    str r0, [sp]
    b .L_420
.L_398:
    sub r0, r3, #0x1
    str r0, [sp]
    b .L_420
.L_3a4:
    add r0, r3, #0xe
    str r0, [sp]
    b .L_420
.L_3b0:
    add r0, r3, #0xa9
    str r0, [sp]
    b .L_420
.L_3bc:
    sub r0, r0, #0x64
    str r0, [sp]
    b .L_420
.L_3c8:
    ldr r1, _LIT9
    cmp r2, r1
    beq .L_3e8
    sub r1, r0, #0xef
    cmp r2, r1
    subeq r0, r0, #0x3e
    streq r0, [sp]
    b .L_420
.L_3e8:
    sub r0, r0, #0x3f
    str r0, [sp]
    b .L_420
.L_3f4:
    sub r0, r0, #0x7
    str r0, [sp]
    b .L_420
.L_400:
    add r0, r0, #0x64
    str r0, [sp]
    b .L_420
.L_40c:
    add r0, r0, #0xcb
    str r0, [sp]
    b .L_420
.L_418:
    add r0, r0, #0xd1
    str r0, [sp]
.L_420:
    ldr r0, _LIT10
    and r1, r4, #0x1
    mul r8, r1, r0
    ldr r0, _LIT11
    mov r5, #0x0
    ldr r0, [r0, r8]
    cmp r0, #0x0
    bls .L_4bc
    ldr r0, _LIT12
    mov r9, #0xb
    add r7, r0, r8
    add r6, r7, #0x120
.L_450:
    ldr r1, [r6]
    ldr r0, [sp]
    mov r1, r1, lsl #0x13
    mov sl, r1, lsr #0x13
    mov r1, sl
    bl func_0202df24
    cmp r0, #0x0
    bne .L_484
    ldr r0, [sp, #0x4]
    mov r1, sl
    bl func_0202df24
    cmp r0, #0x0
    beq .L_4a8
.L_484:
    mov r0, r4
    mov r1, sl
    bl func_ov002_021ca310
    cmp r0, #0x0
    beq .L_4a8
    mov r0, r4
    mov r1, r9
    mov r2, r5
    bl func_ov002_02253370
.L_4a8:
    ldr r0, [r7, #0xc]
    add r5, r5, #0x1
    cmp r5, r0
    add r6, r6, #0x4
    bcc .L_450
.L_4bc:
    ldr r0, _LIT13
    mov r7, #0x0
    ldr r0, [r0, r8]
    cmp r0, #0x0
    addls sp, sp, #0x8
    ldmlsia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r0, _LIT12
    add r6, r0, r8
    add r5, r6, #0x260
    mov r8, #0xd
.L_4e4:
    ldr r1, [r5]
    ldr r0, [sp]
    mov r1, r1, lsl #0x13
    mov r9, r1, lsr #0x13
    mov r1, r9
    bl func_0202df24
    cmp r0, #0x0
    bne .L_518
    ldr r0, [sp, #0x4]
    mov r1, r9
    bl func_0202df24
    cmp r0, #0x0
    beq .L_53c
.L_518:
    mov r0, r4
    mov r1, r9
    bl func_ov002_021ca310
    cmp r0, #0x0
    beq .L_53c
    mov r0, r4
    mov r1, r8
    mov r2, r7
    bl func_ov002_02253370
.L_53c:
    ldr r0, [r6, #0x10]
    add r7, r7, #0x1
    cmp r7, r0
    add r5, r5, #0x4
    bcc .L_4e4
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0x0000185d
_LIT1: .word 0x000015e0
_LIT2: .word 0x000010e4
_LIT3: .word 0x00000fb6
_LIT4: .word 0x0000146e
_LIT5: .word 0x00000fc9
_LIT6: .word 0x000017af
_LIT7: .word 0x00001a0c
_LIT8: .word 0x00000fa7
_LIT9: .word 0x00001757
_LIT10: .word 0x00000868
_LIT11: .word data_ov002_022cf098
_LIT12: .word data_ov002_022cf08c
_LIT13: .word data_ov002_022cf09c
