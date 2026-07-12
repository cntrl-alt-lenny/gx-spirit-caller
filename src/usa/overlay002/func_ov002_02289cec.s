; func_ov002_02289cec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern data_ov002_022cf0c2
        .extern func_0202b89c
        .extern func_0202ed3c
        .extern func_ov002_021b9dec
        .extern func_ov002_021bbb78
        .extern func_ov002_021bc14c
        .extern func_ov002_021be2a4
        .extern func_ov002_021c317c
        .extern func_ov002_021c8390
        .extern func_ov002_021c83c8
        .extern func_ov002_021c83e4
        .extern func_ov002_022574e0
        .extern func_ov002_0227d18c
        .extern func_ov002_02291138
        .global func_ov002_02289cec
        .arm
func_ov002_02289cec:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x14
    mov sl, r0
    ldrh r0, [sl, #0x2]
    mov r2, r0, lsl #0x14
    mov r2, r2, lsr #0x1a
    cmp r2, #0x14
    bne .L_1c00
    ldr r2, _LIT0
    mov r0, r0, lsl #0x1f
    mov r7, r0, lsr #0x1f
    ldr r0, [r2]
    ldr fp, [r2, #0x20]
    str r0, [sp, #0x10]
    ldr r0, [r2, #0x1c]
    mov r9, #0x0
    str r0, [sp, #0xc]
    ldr r0, [r2, #0x4]
    cmp fp, #0x5
    str r0, [sp, #0x8]
    movge r0, #0x1
    strge r0, [sp]
    movlt r0, #0x0
    strlt r0, [sp]
    ldrh r2, [sl]
    ldr r0, _LIT1
    mov r8, r9
    cmp r2, r0
    bgt .L_14b8
    bge .L_15bc
    ldr r0, _LIT2
    cmp r2, r0
    bgt .L_1450
    bge .L_15a0
    sub r1, r0, #0x39
    cmp r2, r1
    bgt .L_1424
    bge .L_1598
    sub r1, r0, #0x5a
    cmp r2, r1
    bgt .L_1938
    sub r1, r0, #0x5b
    cmp r2, r1
    blt .L_1938
    beq .L_158c
    sub r0, r0, #0x5a
    cmp r2, r0
    subeq r9, r9, #0x190
    moveq r8, r9
    b .L_1938
.L_1424:
    sub r1, r0, #0x38
    cmp r2, r1
    bgt .L_1440
    sub r0, r0, #0x38
    cmp r2, r0
    moveq r8, #0x1f4
    b .L_1938
.L_1440:
    sub r0, r0, #0x1
    cmp r2, r0
    moveq r9, #0x2bc
    b .L_1938
.L_1450:
    add r1, r0, #0xdf
    cmp r2, r1
    bgt .L_148c
    bge .L_16e4
    add r1, r0, #0x6
    cmp r2, r1
    bgt .L_147c
    add r0, r0, #0x6
    cmp r2, r0
    subeq r8, r9, #0x1f4
    b .L_1938
.L_147c:
    add r0, r0, #0xc4
    cmp r2, r0
    subeq r9, r9, #0x2bc
    b .L_1938
.L_148c:
    add r1, r0, #0x168
    cmp r2, r1
    bgt .L_14a8
    add r0, r0, #0x168
    cmp r2, r0
    beq .L_15a8
    b .L_1938
.L_14a8:
    add r0, r0, #0x194
    cmp r2, r0
    beq .L_15f8
    b .L_1938
.L_14b8:
    add r3, r0, #0x278
    cmp r2, r3
    bgt .L_1534
    bge .L_16dc
    add r3, r0, #0xbb
    cmp r2, r3
    bgt .L_1508
    bge .L_1674
    add r1, r0, #0x29
    cmp r2, r1
    bgt .L_14f4
    add r0, r0, #0x29
    cmp r2, r0
    moveq r9, #0x1f4
    b .L_1938
.L_14f4:
    add r0, r0, #0x52
    cmp r2, r0
    moveq r9, #0xc8
    moveq r8, #0x1f4
    b .L_1938
.L_1508:
    add r1, r0, #0x190
    cmp r2, r1
    bgt .L_1524
    add r0, r0, #0x190
    cmp r2, r0
    beq .L_1868
    b .L_1938
.L_1524:
    add r0, r0, #0x1f8
    cmp r2, r0
    beq .L_16b4
    b .L_1938
.L_1534:
    ldr r1, _LIT3
    cmp r2, r1
    bgt .L_1568
    bge .L_16ac
    sub r0, r1, #0xda
    cmp r2, r0
    bgt .L_1558
    beq .L_18b0
    b .L_1938
.L_1558:
    sub r0, r1, #0xab
    cmp r2, r0
    beq .L_1694
    b .L_1938
.L_1568:
    ldr r0, _LIT4
    cmp r2, r0
    bgt .L_157c
    beq .L_18f4
    b .L_1938
.L_157c:
    add r0, r0, #0x9
    cmp r2, r0
    moveq r9, #0x1f4
    b .L_1938
.L_158c:
    mov r9, #0x190
    mov r8, r9
    b .L_1938
.L_1598:
    mov r9, #0x1f4
    b .L_1938
.L_15a0:
    mov r8, #0x2bc
    b .L_1938
.L_15a8:
    mov r0, r7
    bl func_ov002_021c317c
    mov r1, #0x64
    mul r9, r0, r1
    b .L_1938
.L_15bc:
    ldr r0, [sp, #0x8]
    ldr r1, _LIT5
    ldr r2, _LIT6
    and r0, r0, #0x1
    mla r1, r0, r1, r2
    mov r0, #0x14
    mla r0, fp, r0, r1
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b89c
    rsb r0, r0, #0x0
    add r0, r0, r0, lsr #0x1f
    mov r9, r0, asr #0x1
    b .L_1938
.L_15f8:
    ldr r0, [sp, #0x8]
    ldr r1, _LIT5
    and r2, r0, #0x1
    mov r0, #0x14
    mul r5, r2, r1
    and r3, r7, #0x1
    mul r4, fp, r0
    ldr r2, _LIT6
    mul r1, r3, r1
    add r0, r2, r5
    add r0, r0, r4
    ldr r0, [r0, #0x30]
    ldr r1, [r2, r1]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    rsb r9, r1, #0x0
    bl func_ov002_0227d18c
    cmp r0, #0x0
    addne sp, sp, #0x14
    movne r0, r8
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT7
    add r0, r0, r5
    ldrh r0, [r4, r0]
    cmp r0, #0x0
    beq .L_1938
    mov r0, #0x320
    rsb r0, r0, #0x0
    cmp r9, r0
    movle r9, r0
    b .L_1938
.L_1674:
    mov r0, sl
    bl func_ov002_02291138
    cmp r0, #0x0
    addeq sp, sp, #0x14
    moveq r0, r9
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r9, #0x1f4
    b .L_1938
.L_1694:
    mov r0, r7
    mov r1, #0xb
    bl func_ov002_021bbb78
    mov r1, #0xc8
    mul r9, r0, r1
    b .L_1938
.L_16ac:
    ldr r9, _LIT8
    b .L_1938
.L_16b4:
    rsb r1, r7, #0x1
    ldr r0, _LIT5
    and r1, r1, #0x1
    mul r2, r1, r0
    ldr r1, _LIT9
    mov r0, #0xc8
    ldr r1, [r1, r2]
    mul r8, r1, r0
    mov r9, r8
    b .L_1938
.L_16dc:
    sub r8, r9, #0xfa0
    b .L_1938
.L_16e4:
    ldr r1, [sp, #0x10]
    ldr r0, [sp, #0x8]
    cmp r1, r0
    beq .L_1938
    mov r0, r1
    cmp r0, r7
    ldr r1, _LIT5
    mov r2, #0x14
    bne .L_17e4
    and r4, r0, #0x1
    ldr r0, [sp, #0xc]
    ldr r3, _LIT7
    mul r2, r0, r2
    mla r0, r4, r1, r3
    ldrh r0, [r2, r0]
    str r9, [sp, #0x4]
    cmp r0, #0x0
    bne .L_1938
    ldr r1, [sp, #0x10]
    ldr r2, [sp, #0xc]
    mov r0, sl
    bl func_ov002_022574e0
    cmp r0, #0x0
    beq .L_1938
    ldr r2, _LIT6
    ldr r0, _LIT5
    and r1, r7, #0x1
    mla r5, r1, r0, r2
    add r6, r5, #0x30
    mov r4, r9
.L_175c:
    mov r0, sl
    mov r1, r7
    mov r2, r4
    bl func_ov002_022574e0
    cmp r0, #0x0
    beq .L_17a8
    ldrh r0, [r5, #0x36]
    cmp r0, #0x0
    bne .L_17a8
    ldr r0, [r6]
    mov r1, r0, lsl #0x13
    ldr r0, _LIT10
    cmp r0, r1, lsr #0x13
    moveq r0, #0x1
    movne r0, #0x0
    add r1, r0, #0x1
    ldr r0, [sp, #0x4]
    add r0, r0, r1
    str r0, [sp, #0x4]
.L_17a8:
    add r5, r5, #0x14
    add r6, r6, #0x14
    add r4, r4, #0x1
    cmp r4, #0x4
    ble .L_175c
    rsb r0, r7, #0x1
    mov r1, #0x1
    bl func_ov002_021bc14c
    add r1, r0, #0x1
    ldr r0, [sp, #0x4]
    cmp r1, r0
    bge .L_1938
    add sp, sp, #0x14
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_17e4:
    ldr r0, [sp, #0x8]
    ldr r3, _LIT7
    and r4, r0, #0x1
    mul r2, fp, r2
    mla r0, r4, r1, r3
    ldrh r0, [r2, r0]
    cmp r0, #0x0
    bne .L_1938
    ldr r1, [sp, #0x10]
    ldr r2, [sp, #0xc]
    mov r0, sl
    bl func_ov002_022574e0
    cmp r0, #0x0
    beq .L_1938
    ldr r0, [sp, #0x8]
    mov r1, fp
    bl func_ov002_021c8390
    mov r4, r0
    ldr r0, [sp, #0x10]
    ldr r1, [sp, #0xc]
    bl func_ov002_021c8390
    rsb r1, r7, #0x1
    rsb r3, r0, r4, lsl #0x1
    ldr r0, _LIT5
    and r1, r1, #0x1
    mul r2, r1, r0
    ldr r0, _LIT6
    ldr r0, [r0, r2]
    cmp r3, r0
    blt .L_1938
    add sp, sp, #0x14
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1868:
    ldr r2, _LIT6
    ldr r0, _LIT5
    and r1, r7, #0x1
    mla r4, r1, r0, r2
    mov r5, r9
.L_187c:
    cmp r5, fp
    ldrneh r0, [r4, #0x38]
    cmpne r0, #0x0
    beq .L_189c
    mov r0, r7
    mov r1, r5
    bl func_ov002_021c83e4
    add r8, r8, r0
.L_189c:
    add r5, r5, #0x1
    cmp r5, #0x4
    add r4, r4, #0x14
    ble .L_187c
    b .L_1938
.L_18b0:
    mov r4, r9
.L_18b4:
    mov r0, sl
    mov r1, r7
    mov r2, r4
    bl func_ov002_022574e0
    cmp r0, #0x0
    beq .L_18e4
    mov r0, r7
    mov r1, r4
    bl func_ov002_021c8390
    cmp r0, r9
    movle r0, r9
    mov r9, r0
.L_18e4:
    add r4, r4, #0x1
    cmp r4, #0x4
    ble .L_18b4
    b .L_1938
.L_18f4:
    ldr r0, [sp, #0x8]
    cmp r7, r0
    bne .L_1914
    mov r1, fp
    bl func_ov002_021b9dec
    bl func_0202ed3c
    cmp r0, #0x0
    movne r9, #0x320
.L_1914:
    ldr r0, [sp, #0x8]
    cmp r7, r0
    beq .L_1938
    ldr r0, [sp, #0x10]
    ldr r1, [sp, #0xc]
    bl func_ov002_021b9dec
    bl func_0202ed3c
    cmp r0, #0x0
    movne r9, #0x320
.L_1938:
    ldr r0, [sp]
    cmp r0, #0x0
    beq .L_1a24
    mov r5, #0x0
    mov r6, r5
    mov r4, #0x1
.L_1950:
    ldr r0, [sp, #0x10]
    mov r1, r6
    mov r2, r4
    bl func_ov002_021be2a4
    add r6, r6, #0x1
    cmp r6, #0x4
    add r5, r5, r0
    ble .L_1950
    cmp r5, #0x1
    ble .L_19d8
    ldrh r1, [sl]
    ldr r0, _LIT11
    cmp r1, r0
    beq .L_1998
    add r0, r0, #0x1
    cmp r1, r0
    beq .L_19b8
    b .L_19d8
.L_1998:
    ldrh r0, [sl, #0x2]
    mov r1, r0, lsl #0x1f
    ldr r0, [sp, #0x10]
    add sp, sp, #0x14
    cmp r0, r1, lsr #0x1f
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_19b8:
    ldrh r0, [sl, #0x2]
    mov r1, r0, lsl #0x1f
    ldr r0, [sp, #0x8]
    add sp, sp, #0x14
    cmp r0, r1, lsr #0x1f
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_19d8:
    ldr r0, [sp, #0x10]
    cmp r7, r0
    bne .L_1c00
    cmp r9, #0x0
    beq .L_1c00
    ldr r1, [sp, #0xc]
    bl func_ov002_021c8390
    rsb r2, r7, #0x1
    ldr r1, _LIT5
    and r2, r2, #0x1
    mul r3, r2, r1
    ldr r1, _LIT6
    add r2, r9, r0
    ldr r0, [r1, r3]
    cmp r2, r0
    blt .L_1c00
    add sp, sp, #0x14
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1a24:
    ldr r1, [sp, #0x10]
    ldr r0, [sp, #0x8]
    cmp r1, r0
    beq .L_1c00
    orrs r0, r9, r8
    beq .L_1c00
    ldr r0, [sp, #0x8]
    mov r1, #0x14
    cmp r7, r0
    ldr r0, _LIT5
    bne .L_1b38
    ldr r2, _LIT7
    and r3, r7, #0x1
    mul r1, fp, r1
    mla r0, r3, r0, r2
    ldrh r6, [r1, r0]
    rsb r5, r7, #0x1
    ldr r1, [sp, #0xc]
    mov r0, r5
    bl func_ov002_021c8390
    mov r4, r0
    cmp r6, #0x0
    mov r0, r7
    mov r1, fp
    beq .L_1a90
    bl func_ov002_021c83c8
    b .L_1a94
.L_1a90:
    bl func_ov002_021c8390
.L_1a94:
    cmp r6, #0x0
    beq .L_1ab4
    cmp r8, #0x0
    movlt r8, #0x0
    rsbs r1, r9, #0x0
    movmi r1, #0x0
    add r1, r1, r8
    b .L_1acc
.L_1ab4:
    cmp r9, #0x0
    movlt r1, #0x0
    movge r1, r9
    rsbs r2, r9, #0x0
    movmi r2, #0x0
    add r1, r2, r1
.L_1acc:
    add r1, r0, r1
    cmp r4, r1
    bgt .L_1bf4
    cmp r4, r0
    sub r4, r1, r4
    addgt sp, sp, #0x14
    movgt r0, #0x1
    ldmgtia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r7
    mov r1, fp
    bl func_ov002_021b9dec
    ldr r1, _LIT12
    cmp r0, r1
    bne .L_1b10
    add sp, sp, #0x14
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1b10:
    ldr r0, _LIT5
    and r1, r5, #0x1
    mul r2, r1, r0
    ldr r0, _LIT6
    ldr r0, [r0, r2]
    cmp r4, r0
    blt .L_1bf4
    add sp, sp, #0x14
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1b38:
    rsb r4, r7, #0x1
    and r2, r4, #0x1
    mul r5, r2, r0
    ldr r0, _LIT7
    mul r1, fp, r1
    add r0, r0, r5
    ldrh r6, [r1, r0]
    ldr r1, [sp, #0xc]
    mov r0, r7
    bl func_ov002_021c8390
    mov r7, r0
    cmp r6, #0x0
    mov r0, r4
    mov r1, fp
    beq .L_1b7c
    bl func_ov002_021c83c8
    b .L_1b80
.L_1b7c:
    bl func_ov002_021c8390
.L_1b80:
    cmp r6, #0x0
    beq .L_1b90
    rsbs r1, r8, #0x0
    b .L_1b94
.L_1b90:
    rsbs r1, r9, #0x0
.L_1b94:
    movmi r1, #0x0
    cmp r9, #0x0
    movlt r9, #0x0
    add r3, r9, r1
    cmp r7, r0
    bgt .L_1bc0
    add r1, r7, r3
    cmp r1, r0
    addgt sp, sp, #0x14
    movgt r0, #0x1
    ldmgtia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1bc0:
    cmp r6, #0x0
    bne .L_1bf4
    ldr r2, _LIT6
    sub r1, r7, r0
    ldr r2, [r2, r5]
    cmp r1, r2
    bge .L_1bf4
    add r1, r7, r3
    sub r0, r1, r0
    cmp r0, r2
    addge sp, sp, #0x14
    movge r0, #0x1
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1bf4:
    add sp, sp, #0x14
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1c00:
    mov r0, #0x0
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cd314
_LIT1: .word 0x000014eb
_LIT2: .word 0x0000132a
_LIT3: .word 0x0000192d
_LIT4: .word 0x00001a60
_LIT5: .word 0x00000868
_LIT6: .word data_ov002_022cf08c
_LIT7: .word data_ov002_022cf0c2
_LIT8: .word 0x000005dc
_LIT9: .word data_ov002_022cf098
_LIT10: .word 0x000018fc
_LIT11: .word 0x000012cf
_LIT12: .word 0x00001292
