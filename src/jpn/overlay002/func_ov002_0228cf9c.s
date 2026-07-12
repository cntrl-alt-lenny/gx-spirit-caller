; func_ov002_0228cf9c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_0202b83c
        .extern func_0202b854
        .extern func_02030538
        .extern func_ov002_021afff0
        .extern func_ov002_021b2fcc
        .extern func_ov002_021b9dec
        .extern func_ov002_021c1008
        .extern func_ov002_0227afa0
        .extern func_ov002_02281494
        .extern func_ov002_0228c474
        .extern func_ov002_0228ca38
        .global func_ov002_0228cf9c
        .arm
func_ov002_0228cf9c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x68
    mov r7, r0
    mov r0, #0x0
    str r0, [sp, #0xc]
    mov r0, r7, lsl #0x4
    ldr r4, [sp, #0xc]
    str r1, [sp]
    str r2, [sp, #0x4]
    str r0, [sp, #0x8]
    mov r3, r4
    mov r5, r0
    add r1, sp, #0x3c
    mov r2, #0x1
.L_38:
    ldr r0, [sp]
    tst r0, r2, lsl r5
    strne r3, [r1, r4, lsl #0x2]
    add r3, r3, #0x1
    addne r4, r4, #0x1
    cmp r3, #0xa
    add r5, r5, #0x1
    ble .L_38
    sub r6, r4, #0x1
    cmp r6, #0x0
    ble .L_8c
    add r5, sp, #0x3c
.L_68:
    add r0, r6, #0x1
    bl func_ov002_021afff0
    ldr r2, [r5, r6, lsl #0x2]
    ldr r1, [r5, r0, lsl #0x2]
    str r1, [r5, r6, lsl #0x2]
    sub r6, r6, #0x1
    str r2, [r5, r0, lsl #0x2]
    cmp r6, #0x0
    bgt .L_68
.L_8c:
    cmp r4, #0x0
    mov r9, #0x0
    ble .L_d0
    add r6, sp, #0x3c
    mov r5, #0x1
.L_a0:
    ldr r8, [r6, r9, lsl #0x2]
    mov r0, r7
    mov r1, r8
    mov r2, r5
    bl func_ov002_021c1008
    cmp r7, r0
    addne sp, sp, #0x68
    movne r0, r8
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    add r9, r9, #0x1
    cmp r9, r4
    blt .L_a0
.L_d0:
    cmp r4, #0x0
    mov fp, #0x0
    ble .L_20c
    ldr r2, _LIT0
    ldr r0, _LIT1
    and r1, r7, #0x1
    mla r5, r1, r0, r2
.L_ec:
    add r1, sp, #0x3c
    ldr r9, [r1, fp, lsl #0x2]
    mov r0, #0x14
    mla r0, r9, r0, r5
    ldr r0, [r0, #0x40]
    mov r0, r0, lsr #0x6
    tst r0, #0x1
    bne .L_200
    mov r0, r7
    mov r1, r9
    bl func_ov002_021b9dec
    ldr r2, _LIT2
    cmp r0, r2
    bgt .L_160
    sub r1, r2, #0x1
    cmp r0, r1
    blt .L_13c
    cmpne r0, r2
    beq .L_180
    b .L_200
.L_13c:
    sub r1, r2, #0x2c8
    cmp r0, r1
    bgt .L_150
    beq .L_180
    b .L_200
.L_150:
    sub r1, r2, #0x51
    cmp r0, r1
    beq .L_180
    b .L_200
.L_160:
    add r1, r2, #0x8a
    cmp r0, r1
    bgt .L_174
    beq .L_180
    b .L_200
.L_174:
    add r1, r2, #0x8b
    cmp r0, r1
    bne .L_200
.L_180:
    ldr r0, [r5, #0xc]
    mov sl, #0x0
    cmp r0, #0x0
    bls .L_200
    add r6, r5, #0x120
.L_194:
    ldr r0, [r6]
    mov r0, r0, lsl #0x13
    mov r8, r0, lsr #0x13
    mov r0, r8
    bl func_0202b854
    cmp r0, #0x7
    blt .L_1ec
    mov r0, r8
    bl func_02030538
    cmp r0, #0x0
    bne .L_1ec
    mov r0, r8
    bl func_0202b83c
    mov r8, r0
    mov r0, r7
    mov r1, r9
    bl func_ov002_021b9dec
    bl func_0202b83c
    cmp r8, r0
    addeq sp, sp, #0x68
    moveq r0, r9
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1ec:
    ldr r0, [r5, #0xc]
    add sl, sl, #0x1
    cmp sl, r0
    add r6, r6, #0x4
    bcc .L_194
.L_200:
    add fp, fp, #0x1
    cmp fp, r4
    blt .L_ec
.L_20c:
    cmp r4, #0x0
    mov r3, #0x0
    ble .L_2c4
    ldr r2, _LIT0
    ldr r0, _LIT1
    and r1, r7, #0x1
    mla r2, r1, r0, r2
    ldr fp, _LIT3
    ldr r9, _LIT4
    add r5, fp, #0x14c
    ldr r8, _LIT5
    ldr lr, _LIT6
    add r1, sp, #0x3c
    mov r6, r5
    mov sl, #0x14
.L_248:
    ldr r0, [r1, r3, lsl #0x2]
    mla ip, r0, sl, r2
    ldr ip, [ip, #0x30]
    mov ip, ip, lsl #0x13
    cmp fp, ip, lsr #0x13
    mov ip, ip, lsr #0x13
    bcc .L_294
    cmp ip, fp
    addcs sp, sp, #0x68
    ldmcsia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    cmp ip, r9
    bhi .L_284
    addeq sp, sp, #0x68
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    b .L_2b8
.L_284:
    cmp ip, r8
    addeq sp, sp, #0x68
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    b .L_2b8
.L_294:
    cmp ip, r6
    bhi .L_2ac
    cmp ip, r5
    addeq sp, sp, #0x68
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    b .L_2b8
.L_2ac:
    cmp ip, lr
    addeq sp, sp, #0x68
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2b8:
    add r3, r3, #0x1
    cmp r3, r4
    blt .L_248
.L_2c4:
    cmp r4, #0x0
    mov sl, #0x0
    ble .L_36c
    ldr r6, _LIT7
    ldr r5, _LIT8
    add r8, sp, #0x3c
.L_2dc:
    ldr r9, [r8, sl, lsl #0x2]
    mov r0, r7
    mov r1, r9
    add r2, r5, #0xaa
    bl func_ov002_021b2fcc
    cmp r0, #0x0
    addne sp, sp, #0x68
    movne r0, r9
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r7
    mov r1, r9
    mov r2, r6
    bl func_ov002_021b2fcc
    cmp r0, #0x0
    addne sp, sp, #0x68
    movne r0, r9
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r7
    mov r1, r9
    mov r2, r5
    bl func_ov002_021b2fcc
    cmp r0, #0x0
    addne sp, sp, #0x68
    movne r0, r9
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r7
    mov r1, r9
    add r2, r5, #0xbf
    bl func_ov002_021b2fcc
    cmp r0, #0x0
    addne sp, sp, #0x68
    movne r0, r9
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    add sl, sl, #0x1
    cmp sl, r4
    blt .L_2dc
.L_36c:
    cmp r4, #0x0
    mov sl, #0x0
    ble .L_3d8
    ldr r2, _LIT0
    ldr r0, _LIT1
    and r1, r7, #0x1
    mla r9, r1, r0, r2
    mov r5, #0x1
    add r6, sp, #0x3c
    mov fp, #0x14
.L_394:
    ldr r8, [r6, sl, lsl #0x2]
    mov r1, #0x0
    mla r0, r8, fp, r9
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_ov002_02281494
    cmp r0, #0x0
    beq .L_3cc
    ldr r0, [sp, #0x8]
    add r1, r8, r0
    ldr r0, [sp, #0xc]
    orr r0, r0, r5, lsl r1
    str r0, [sp, #0xc]
.L_3cc:
    add sl, sl, #0x1
    cmp sl, r4
    blt .L_394
.L_3d8:
    ldr r4, [sp]
    ldr r1, [sp, #0xc]
    mvn r2, #0x0
    mov r0, r7
    mov r3, r2
    eor r1, r4, r1
    bl func_ov002_0228c474
    mov r4, r0
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_44c
    cmp r4, #0x0
    blt .L_440
    add r2, sp, #0x10
    mov r0, r7
    mov r1, r4
    bl func_ov002_0227afa0
    ldr r0, [sp, #0x28]
    ldr r1, [sp, #0x24]
    cmp r1, r0
    movle r1, r0
    ldr r0, _LIT9
    cmp r1, r0
    addle sp, sp, #0x68
    movle r0, r4
    ldmleia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_440:
    add sp, sp, #0x68
    mvn r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_44c:
    cmp r4, #0x0
    bge .L_464
    ldr r1, [sp]
    mov r0, r7
    bl func_ov002_0228ca38
    mov r4, r0
.L_464:
    mov r0, r4
    add sp, sp, #0x68
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
_LIT2: .word 0x000017e9
_LIT3: .word 0x000014f3
_LIT4: .word 0x00000fd6
_LIT5: .word 0x000011e4
_LIT6: .word 0x00001a8e
_LIT7: .word 0x00001286
_LIT8: .word 0x000013f3
_LIT9: .word 0x00000578
