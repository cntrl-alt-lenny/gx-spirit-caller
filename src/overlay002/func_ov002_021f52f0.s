; func_ov002_021f52f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern func_0202b100
        .extern func_0202b8f0
        .extern func_ov002_021ae400
        .extern func_ov002_021b9ecc
        .extern func_ov002_021c8470
        .extern func_ov002_021c848c
        .extern func_ov002_021c84e0
        .extern func_ov002_021deb28
        .extern func_ov002_021e276c
        .extern func_ov002_021ea390
        .extern func_ov002_021f4a4c
        .extern func_ov002_022575c8
        .extern func_ov002_02257878
        .extern func_ov002_0225935c
        .extern func_ov002_022593f4
        .extern func_ov002_0229ce5c
        .global func_ov002_021f52f0
        .arm
func_ov002_021f52f0:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x200
    mov r7, r0
    ldrh r0, [r7, #0x2]
    mov r6, r1
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x23
    addeq sp, sp, #0x200
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, _LIT0
    ldr r0, [r0, #0x5b4]
    cmp r0, #0x0
    beq .L_48
    cmp r0, #0x1
    beq .L_194
    b .L_4b4
.L_48:
    ldrh r3, [r7]
    ldr r0, _LIT1
    mov r5, #0x0
    cmp r3, r0
    ldr r4, _LIT2
    bgt .L_94
    cmp r3, r0
    bge .L_e4
    ldr r0, _LIT3
    cmp r3, r0
    bgt .L_84
    bge .L_dc
    cmp r3, #0xfe0
    moveq r5, #0xfe0
    b .L_f8
.L_84:
    add r0, r0, #0x96
    cmp r3, r0
    ldreq r5, _LIT4
    b .L_f8
.L_94:
    ldr r2, _LIT5
    cmp r3, r2
    bgt .L_b4
    bge .L_ec
    sub r0, r2, #0x8b
    cmp r3, r0
    ldreq r4, _LIT6
    b .L_f8
.L_b4:
    ldr r1, _LIT7
    cmp r3, r1
    bgt .L_f8
    sub r0, r1, #0x1
    cmp r3, r0
    blt .L_f8
    beq .L_f4
    cmp r3, r1
    subeq r5, r1, #0x178
    b .L_f8
.L_dc:
    ldr r5, _LIT4
    b .L_f8
.L_e4:
    ldr r5, _LIT8
    b .L_f8
.L_ec:
    sub r5, r2, #0xbf
    b .L_f8
.L_f4:
    sub r5, r2, #0x68
.L_f8:
    mov r0, r7
    mov r1, r4
    bl func_ov002_02257878
    cmp r0, #0x0
    addeq sp, sp, #0x200
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    cmp r5, #0x0
    beq .L_14c
    mov r0, r5
    bl func_0202b100
    mov r2, r0
    add r0, sp, #0x0
    mov r1, #0x13
    bl func_ov002_0229ce5c
    ldrh r0, [r7, #0x2]
    add r1, sp, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    b .L_160
.L_14c:
    ldrh r0, [r7, #0x2]
    mov r1, #0x12
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
.L_160:
    ldrh r0, [r7, #0x2]
    ldrh r1, [r7]
    mov r2, r4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0225935c
    ldr r1, _LIT0
    add sp, sp, #0x200
    ldr r2, [r1, #0x5b4]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_194:
    bl func_ov002_022593f4
    cmp r0, #0x0
    beq .L_498
    ldr r1, _LIT9
    ldrh r0, [r7]
    ldr r3, _LIT10
    ldr r4, [r1, #0xd74]
    ldr r2, [r1, #0xd78]
    cmp r0, r3
    add r5, r4, r2
    ldr r4, [r1, #0xd70]
    bgt .L_230
    cmp r0, r3
    bge .L_3e8
    ldr r2, _LIT11
    cmp r0, r2
    bgt .L_200
    bge .L_2f4
    ldr r1, _LIT12
    cmp r0, r1
    bgt .L_1f0
    beq .L_2d8
    b .L_480
.L_1f0:
    sub r1, r2, #0xd9
    cmp r0, r1
    beq .L_330
    b .L_480
.L_200:
    add r1, r2, #0x224
    cmp r0, r1
    bgt .L_220
    bge .L_384
    add r1, r2, #0xbf
    cmp r0, r1
    beq .L_330
    b .L_480
.L_220:
    add r1, r2, #0x284
    cmp r0, r1
    beq .L_344
    b .L_480
.L_230:
    ldr r2, _LIT13
    cmp r0, r2
    bgt .L_2a8
    sub r1, r2, #0x2
    cmp r0, r1
    blt .L_25c
    subne r1, r2, #0x1
    cmpne r0, r1
    cmpne r0, r2
    beq .L_408
    b .L_480
.L_25c:
    sub r1, r2, #0x89
    cmp r0, r1
    bgt .L_298
    bge .L_3e8
    add r1, r3, #0xd4
    cmp r0, r1
    bgt .L_480
    add r1, r3, #0xd2
    cmp r0, r1
    blt .L_480
    beq .L_398
    add r1, r3, #0xd4
    cmp r0, r1
    beq .L_3d4
    b .L_480
.L_298:
    sub r1, r2, #0x3
    cmp r0, r1
    beq .L_408
    b .L_480
.L_2a8:
    add r1, r2, #0x72
    cmp r0, r1
    bgt .L_2c8
    bge .L_408
    add r1, r2, #0x33
    cmp r0, r1
    beq .L_408
    b .L_480
.L_2c8:
    add r1, r2, #0xc9
    cmp r0, r1
    beq .L_418
    b .L_480
.L_2d8:
    mov r0, r4
    mov r1, r5
    bl func_ov002_021c8470
    add r0, r0, #0x1
    mov r0, r0, asr #0x1
    strh r0, [r7, #0x8]
    b .L_480
.L_2f4:
    mov r0, r4
    mov r1, r5
    bl func_ov002_021c8470
    strh r0, [r7, #0x8]
    ldrh r1, [r7, #0x6]
    mov r0, r1, lsl #0x10
    mov r0, r0, lsr #0x18
    add r0, r0, #0x1
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0xff00
    mov r0, r0, lsl #0x18
    orr r0, r1, r0, lsr #0x10
    strh r0, [r7, #0x6]
    b .L_480
.L_330:
    mov r0, r4
    mov r1, r5
    bl func_ov002_021c84e0
    strh r0, [r7, #0x8]
    b .L_480
.L_344:
    mov r0, r4
    mov r1, r5
    bl func_ov002_021c84e0
    add r0, r0, #0x3
    strh r0, [r7, #0x8]
    ldrh r1, [r7, #0x6]
    mov r0, r1, lsl #0x10
    mov r0, r0, lsr #0x18
    add r0, r0, #0x1
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0xff00
    mov r0, r0, lsl #0x18
    orr r0, r1, r0, lsr #0x10
    strh r0, [r7, #0x6]
    b .L_480
.L_384:
    mov r0, r4
    mov r1, r5
    bl func_ov002_021b9ecc
    strh r0, [r7, #0xa]
    b .L_480
.L_398:
    ldr r2, _LIT14
    ldr r0, _LIT15
    and r1, r4, #0x1
    mla r2, r1, r0, r2
    mov r0, #0x14
    mul r0, r5, r0
    add r1, r2, #0x30
    ldr r1, [r1, r0]
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    strh r0, [r7, #0xa]
    b .L_480
.L_3d4:
    mov r0, r4
    mov r1, r5
    bl func_ov002_021c848c
    strh r0, [r7, #0x8]
    b .L_480
.L_3e8:
    mov r0, r4
    mov r1, r5
    bl func_ov002_021c848c
    strh r0, [r7, #0x8]
    mov r0, r7
    mov r1, r6
    bl func_ov002_021f4a4c
    b .L_480
.L_408:
    mov r0, r7
    mov r1, r6
    bl func_ov002_021f4a4c
    b .L_480
.L_418:
    ldr r0, _LIT15
    ldr r1, _LIT14
    and r2, r4, #0x1
    mla r1, r2, r0, r1
    mov r0, #0x14
    mla r0, r5, r0, r1
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b8f0
    add r0, r0, #0x1
    mov r0, r0, asr #0x1
    strh r0, [r7, #0x8]
    ldrh r1, [r7, #0x2]
    mov r0, r1, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x23
    beq .L_480
    ldrh r0, [r7, #0x4]
    mov r3, r1, lsl #0x1f
    ldrh r1, [r7]
    mov r2, r0, lsl #0x11
    mov r0, r3, lsr #0x1f
    mov r3, r2, lsr #0x17
    mov r2, #0x1
    bl func_ov002_021e276c
.L_480:
    mov r0, r4
    mov r1, r5
    bl func_ov002_021deb28
    add sp, sp, #0x200
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_498:
    ldr r1, _LIT0
    add sp, sp, #0x200
    ldr r2, [r1, #0x5b4]
    mov r0, #0x0
    sub r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_4b4:
    mov r0, #0x0
    add sp, sp, #0x200
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x0000187e
_LIT2: .word func_ov002_022575c8
_LIT3: .word 0x0000167d
_LIT4: .word 0x00000fc9
_LIT5: .word 0x000019b5
_LIT6: .word func_ov002_021ea390
_LIT7: .word 0x00001b1f
_LIT8: .word 0x000013c3
_LIT9: .word data_ov002_022d016c
_LIT10: .word 0x00001855
_LIT11: .word 0x000014e4
_LIT12: .word 0x00000fff
_LIT13: .word 0x00001a2e
_LIT14: .word data_ov002_022cf16c
_LIT15: .word 0x00000868
