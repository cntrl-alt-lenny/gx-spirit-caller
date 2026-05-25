; func_ov020_021abbe8 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern data_02104f1c
        .extern data_02104f4c
        .extern data_0210594c
        .extern data_ov020_021addc8
        .extern data_ov020_021ae060
        .extern data_ov020_021ae070
        .extern data_ov020_021ae084
        .extern data_ov020_021ae0a8
        .extern data_ov020_021ae0ac
        .extern data_ov020_021ae0e8
        .extern data_ov020_021ae504
        .extern data_ov020_021ae988
        .extern Fill32
        .extern Task_InvokeLocked
        .extern Task_PostLocked
        .extern func_02001a34
        .extern func_02001bc8
        .extern func_0200592c
        .extern func_02005bfc
        .extern func_0202adf8
        .extern func_0202ae1c
        .extern func_0207deb0
        .extern func_0207e8b8
        .extern func_0207f138
        .extern func_0207f420
        .extern func_0207f85c
        .extern func_0207f884
        .extern func_0208c8cc
        .extern func_0208cc90
        .extern func_0208d030
        .extern func_0208d0bc
        .extern func_0208d138
        .extern func_0208d1e4
        .extern func_0208d7ac
        .extern func_0208d8c0
        .extern func_0208da2c
        .extern func_020944a4
        .extern func_02094504
        .extern func_020a991c
        .extern func_020b3870
        .extern func_ov020_021aa6cc
        .extern func_ov020_021aa700
        .global func_ov020_021abbe8
        .arm
func_ov020_021abbe8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x1c
    mov r1, #0x4000000
    ldr r0, [r1, #0x0]
    ldr r7, .L_021ac31c
    bic r0, r0, #0x1f00
    str r0, [r1, #0x0]
    add r3, r1, #0x1000
    ldr r0, [r3, #0x0]
    ldr r2, .L_021ac320
    bic r4, r0, #0x1f00
    mov r1, r7
    mov r0, #0x0
    str r4, [r3, #0x0]
    bl Fill32
    ldr r1, .L_021ac324
    ldr r0, .L_021ac328
    ldr r1, [r1, #0x1c]
    mov r2, #0x4
    bl func_0207deb0
    ldr r0, .L_021ac32c
    bl func_0207f884
    ldr r0, .L_021ac330
    bl func_0207f85c
    bl func_0200592c
    ldr r0, .L_021ac334
    bl func_0208d1e4
    mov r0, #0x0
    mov r1, #0x6800000
    mov r2, #0xa4000
    bl func_02094504
    bl func_0208cc90
    ldr r0, .L_021ac338
    bl func_0207e8b8
    mov r0, #0x200
    mov r1, #0x7000000
    mov r2, #0x400
    bl func_02094504
    mov r0, #0x200
    ldr r1, .L_021ac33c
    mov r2, #0x400
    bl func_02094504
    mov r0, #0x0
    mov r1, #0x5000000
    mov r2, #0x400
    bl func_02094504
    mov r0, #0x0
    ldr r1, .L_021ac340
    mov r2, #0x400
    bl func_02094504
    mov r0, #0x1
    bl func_0208da2c
    mov r0, #0x2
    bl func_0208d8c0
    mov r0, #0x4
    bl func_0208d138
    mov r0, #0x8
    bl func_0208d0bc
    mov r0, #0x40
    bl func_0208d7ac
    mov r0, #0x80
    bl func_0208d030
    ldr r1, .L_021ac344
    ldrh r0, [r1, #0x0]
    bic r0, r0, #0x8000
    strh r0, [r1, #0x0]
    mov r1, #0x0
    mov r2, r1
    mov r0, #0x1
    bl func_0208c8cc
    ldr r1, .L_021ac348
    ldr r0, .L_021ac34c
    ldrh r3, [r1, #0x0]
    add r2, r0, #0x304
    add r5, r1, #0x1000
    and r3, r3, #0x43
    orr r3, r3, #0x3e80
    strh r3, [r1, #0x0]
    ldrh r6, [r1, #0x2]
    mov r3, r2
    ldr r4, .L_021ac350
    and r0, r6, #0x43
    orr r0, r0, #0x104
    orr r0, r0, #0x3c00
    strh r0, [r1, #0x2]
    ldrh r6, [r1, #0x4]
    mov r0, #0xe
    and r6, r6, #0x43
    orr r6, r6, #0xc
    orr r6, r6, #0x1c00
    strh r6, [r1, #0x4]
    ldrh r6, [r1, #0x6]
    and r6, r6, #0x43
    orr r2, r6, r2
    strh r2, [r1, #0x6]
    ldrh r1, [r5, #0x0]
    and r1, r1, #0x43
    orr r1, r1, r3
    strh r1, [r5, #0x0]
    ldrh r1, [r4, #0x0]
    and r1, r1, #0x43
    orr r1, r1, #0x1e80
    strh r1, [r4, #0x0]
    bl func_02001a34
    ldr r0, .L_021ac354
    ldr r1, .L_021ac358
    ldr r2, .L_021ac35c
    bl func_02001bc8
    ldr r0, .L_021ac360
    ldr r1, .L_021ac364
    ldr r2, .L_021ac35c
    bl func_02001bc8
    ldr r0, .L_021ac368
    ldr r1, .L_021ac358
    ldr r2, .L_021ac35c
    bl func_02001bc8
    ldr r0, .L_021ac36c
    bl func_0202adf8
    ldr r0, .L_021ac370
    ldr r1, .L_021ac374
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    str r0, [r1, #0x4c]
    bl func_0202ae1c
    mov r0, #0x1
    bl func_02005bfc
    mov r0, #0x2
    bl func_02005bfc
    mov r3, #0x4000000
    ldr r1, [r3, #0x0]
    ldr r0, .L_021ac378
    add r2, r3, #0x1000
    and r1, r1, r0
    orr r1, r1, #0x10
    orr r1, r1, #0x200000
    str r1, [r3, #0x0]
    ldr r1, [r2, #0x0]
    and r0, r1, r0
    orr r0, r0, #0x10
    orr r0, r0, #0x200000
    str r0, [r2, #0x0]
    bl func_0207f420
    mov r1, #0x0
    ldr r0, .L_021ac37c
    mov r3, r1
    mov r2, #0x80
    bl func_0207f138
    ldr r0, .L_021ac380
    mov r1, #0x0
    mov r2, #0x80
    mov r3, #0x1
    bl func_0207f138
    ldr r0, .L_021ac370
    ldr r1, .L_021ac374
    ldr r0, [r0, #0xa64]
    mov r3, #0x0
    and r0, r0, #0x1f00000
    mov r0, r0, lsr #0x14
    str r3, [r1, #0x48]
    cmp r0, #0x8
    bne .L_021abe94
    ldr r0, .L_021ac384
    ldrh r0, [r0, #0xb8]
    cmp r0, #0x1
    beq .L_021abe90
    cmp r0, #0x2
    movne r3, #0x3
    moveq r3, #0xa
    b .L_021abe94
.L_021abe90:
    mov r3, #0x5
.L_021abe94:
    cmp r3, #0x0
    mov r2, #0x0
    ble .L_021abebc
    mov r1, #0x3
.L_021abea4:
    add r0, r7, r2, lsl #0x1
    add r0, r0, #0x800
    add r2, r2, #0x1
    strh r1, [r0, #0xcc]
    cmp r2, r3
    blt .L_021abea4
.L_021abebc:
    cmp r2, #0xa
    bge .L_021abee0
    mov r1, #0x4
.L_021abec8:
    add r0, r7, r2, lsl #0x1
    add r0, r0, #0x800
    add r2, r2, #0x1
    strh r1, [r0, #0xcc]
    cmp r2, #0xa
    blt .L_021abec8
.L_021abee0:
    mov r4, #0xa
    ldr r6, .L_021ac388
    mov r9, #0x0
    mov r5, r4
.L_021abef0:
    bl func_020a991c
    mov r1, r0, lsr #0x1f
    smull r2, r8, r6, r0
    add r8, r1, r8, asr #0x2
    smull r1, r2, r4, r8
    sub r8, r0, r1
    bl func_020a991c
    add r1, r7, r8, lsl #0x1
    add r3, r1, #0x800
    add r9, r9, #0x1
    mov r1, r0, lsr #0x1f
    smull r2, r8, r6, r0
    add r8, r1, r8, asr #0x2
    smull r1, r2, r5, r8
    sub r8, r0, r1
    add r0, r7, r8, lsl #0x1
    add r0, r0, #0x800
    ldrh r2, [r3, #0xcc]
    cmp r9, #0x64
    ldrh r1, [r0, #0xcc]
    strh r1, [r3, #0xcc]
    strh r2, [r0, #0xcc]
    blt .L_021abef0
    add r0, r7, #0x24c
    add r0, r0, #0x800
    bl func_ov020_021aa6cc
    add r3, sp, #0x10
    mov r2, #0x0
    mov r0, #0x20c
    mov r1, #0x4
    str r2, [r3, #0x0]
    str r2, [r3, #0x4]
    str r2, [r3, #0x8]
    bl Task_PostLocked
    mov r11, r0
    mov r4, #0x1
    ldr r0, .L_021ac370
    ldr r5, .L_021ac38c
    mov r3, r11
    mov r2, r4
.L_021abf90:
    cmp r4, #0x51
    and r1, r4, #0x1f
    blt .L_021abfd0
    cmp r4, #0x55
    bgt .L_021abfd0
    mov r6, r4, asr #0x5
    add r6, r0, r6, lsl #0x2
    add r6, r6, #0x1000
    mvn r8, r2, lsl r1
    ldr r1, [r6, #0xab8]
    and r1, r1, r8
    str r1, [r6, #0xab8]
    ldr r1, [r6, #0xae0]
    and r1, r1, r8
    str r1, [r6, #0xae0]
    b .L_021abff8
.L_021abfd0:
    mov r6, r4, asr #0x5
    add r6, r0, r6, lsl #0x2
    add r6, r6, #0x1000
    ldr r6, [r6, #0xab8]
    tst r6, r2, lsl r1
    bne .L_021abff8
    strh r4, [r3], #0x2
    ldr r1, [sp, #0x10]
    add r1, r1, #0x1
    str r1, [sp, #0x10]
.L_021abff8:
    add r4, r4, #0x1
    cmp r4, r5
    blt .L_021abf90
    ldr r0, [sp, #0x10]
    cmp r0, #0xa
    bge .L_021ac064
    mov r1, #0x1
    ldr r6, .L_021ac370
    ldr r2, .L_021ac38c
    mov r0, r1
.L_021ac020:
    mov r4, r1, asr #0x5
    add r4, r6, r4, lsl #0x2
    add r4, r4, #0x1000
    ldr r5, [r4, #0xab8]
    and r8, r1, #0x1f
    tst r5, r0, lsl r8
    beq .L_021ac058
    ldr r4, [r4, #0xae0]
    tst r4, r0, lsl r8
    bne .L_021ac058
    strh r1, [r3], #0x2
    ldr r4, [sp, #0x14]
    add r4, r4, #0x1
    str r4, [sp, #0x14]
.L_021ac058:
    add r1, r1, #0x1
    cmp r1, r2
    blt .L_021ac020
.L_021ac064:
    ldr r1, [sp, #0x10]
    ldr r0, [sp, #0x14]
    add r0, r1, r0
    cmp r0, #0xa
    bge .L_021ac0cc
    mov r1, #0x1
    ldr r6, .L_021ac370
    ldr r2, .L_021ac38c
    mov r0, r1
.L_021ac088:
    mov r4, r1, asr #0x5
    add r4, r6, r4, lsl #0x2
    add r4, r4, #0x1000
    ldr r5, [r4, #0xab8]
    and r8, r1, #0x1f
    tst r5, r0, lsl r8
    beq .L_021ac0c0
    ldr r4, [r4, #0xae0]
    tst r4, r0, lsl r8
    beq .L_021ac0c0
    strh r1, [r3], #0x2
    ldr r4, [sp, #0x18]
    add r4, r4, #0x1
    str r4, [sp, #0x18]
.L_021ac0c0:
    add r1, r1, #0x1
    cmp r1, r2
    blt .L_021ac088
.L_021ac0cc:
    mov r9, #0x0
    mov r10, r11
    add r6, sp, #0x10
    mov r5, r9
.L_021ac0dc:
    ldr r0, [r6, r9, lsl #0x2]
    cmp r0, #0x0
    beq .L_021ac130
    mov r8, r5
.L_021ac0ec:
    bl func_020a991c
    ldr r1, [r6, r9, lsl #0x2]
    bl func_020b3870
    mov r4, r1, lsl #0x1
    bl func_020a991c
    ldr r1, [r6, r9, lsl #0x2]
    bl func_020b3870
    mov r2, r1, lsl #0x1
    add r8, r8, #0x1
    cmp r8, #0x20c
    ldrh r1, [r10, r4]
    ldrh r0, [r10, r2]
    strh r0, [r10, r4]
    strh r1, [r10, r2]
    blt .L_021ac0ec
    ldr r0, [r6, r9, lsl #0x2]
    add r10, r10, r0, lsl #0x1
.L_021ac130:
    add r9, r9, #0x1
    cmp r9, #0x3
    blt .L_021ac0dc
    add r1, r7, #0x1d4
    mov r0, r11
    add r1, r1, #0x800
    mov r2, #0x14
    bl func_020944a4
    mov r4, #0xa
    ldr r6, .L_021ac388
    mov r8, #0x0
    mov r5, r4
.L_021ac160:
    bl func_020a991c
    mov r1, r0, lsr #0x1f
    smull r2, r3, r6, r0
    add r3, r1, r3, asr #0x2
    smull r1, r2, r4, r3
    sub r3, r0, r1
    mov r9, r3, lsl #0x10
    bl func_020a991c
    add r1, r7, r9, lsr #0xf
    add r3, r1, #0x900
    add r8, r8, #0x1
    mov r1, r0, lsr #0x1f
    smull r2, r9, r6, r0
    add r9, r1, r9, asr #0x2
    cmp r8, #0x64
    smull r1, r2, r5, r9
    sub r9, r0, r1
    mov r0, r9, lsl #0x10
    add r0, r7, r0, lsr #0xf
    add r0, r0, #0x900
    ldrh r2, [r3, #0xd4]
    ldrh r1, [r0, #0xd4]
    strh r1, [r3, #0xd4]
    strh r2, [r0, #0xd4]
    blt .L_021ac160
    ldr r0, .L_021ac390
    mov r6, #0x0
    ldrh r3, [r0, #0x0]
    ldrh r2, [r0, #0x2]
    ldrh r1, [r0, #0x4]
    ldrh r0, [r0, #0x6]
    strh r3, [sp, #0x0]
    strh r2, [sp, #0x2]
    strh r1, [sp, #0x4]
    strh r0, [sp, #0x6]
.L_021ac1ec:
    add r0, r7, r6, lsl #0x1
    add r0, r0, #0x900
    ldrh r0, [r0, #0xd4]
    mov r1, #0x2
    mov r2, #0x0
    bl func_ov020_021aa700
    cmp r0, #0x0
    beq .L_021ac224
    bl func_020a991c
    add r1, r7, r6, lsl #0x3
    and r2, r0, #0x1
    add r0, r1, #0x900
    strh r2, [r0, #0xe8]
    b .L_021ac234
.L_021ac224:
    add r0, r7, r6, lsl #0x3
    add r0, r0, #0x900
    mov r1, #0x0
    strh r1, [r0, #0xe8]
.L_021ac234:
    add r0, r7, r6, lsl #0x1
    add r0, r0, #0x900
    ldrh r0, [r0, #0xd4]
    mov r1, #0x6
    mov r2, #0x0
    bl func_ov020_021aa700
    cmp r0, #0x0
    beq .L_021ac2dc
    ldrh r3, [sp, #0x0]
    ldrh r2, [sp, #0x2]
    ldrh r1, [sp, #0x4]
    ldrh r0, [sp, #0x6]
    add r4, sp, #0x8
    strh r3, [sp, #0x8]
    strh r2, [sp, #0xa]
    strh r1, [sp, #0xc]
    strh r0, [sp, #0xe]
    mov r5, #0x0
.L_021ac27c:
    bl func_020a991c
    and r0, r0, #0x3
    mov r8, r0, lsl #0x10
    bl func_020a991c
    and r0, r0, #0x3
    mov r0, r0, lsl #0x10
    mov r3, r8, lsr #0xf
    mov r1, r0, lsr #0xf
    add r5, r5, #0x1
    ldrh r2, [r4, r3]
    ldrh r0, [r4, r1]
    cmp r5, #0x64
    strh r0, [r4, r3]
    strh r2, [r4, r1]
    blt .L_021ac27c
    ldrh r1, [sp, #0x8]
    add r0, r7, r6, lsl #0x3
    add r0, r0, #0x900
    ldrh r2, [sp, #0xa]
    strh r1, [r0, #0xea]
    ldrh r1, [sp, #0xc]
    strh r2, [r0, #0xec]
    strh r1, [r0, #0xee]
    b .L_021ac2fc
.L_021ac2dc:
    add r0, r7, r6, lsl #0x3
    add r0, r0, #0x900
    mov r1, #0x2
    strh r1, [r0, #0xea]
    mov r1, #0x3
    strh r1, [r0, #0xec]
    mov r1, #0x4
    strh r1, [r0, #0xee]
.L_021ac2fc:
    add r6, r6, #0x1
    cmp r6, #0xa
    blt .L_021ac1ec
    mov r0, r11
    bl Task_InvokeLocked
    mov r0, #0x1
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_021ac31c:
        .word   data_ov020_021ae0a8
.L_021ac320:
        .word   0xa54
.L_021ac324:
        .word   data_02104f1c
.L_021ac328:
        .word   data_ov020_021ae060
.L_021ac32c:
        .word   data_ov020_021ae084
.L_021ac330:
        .word   data_ov020_021ae070
.L_021ac334:
        .word   0x1ff
.L_021ac338:
        .word   data_ov020_021ae988
.L_021ac33c:
        .word   0x7000400
.L_021ac340:
        .word   0x5000400
.L_021ac344:
        .word   0x4000304
.L_021ac348:
        .word   0x4000008
.L_021ac34c:
        .word   0x1c0c
.L_021ac350:
        .word   0x400100e
.L_021ac354:
        .word   0x50001e0
.L_021ac358:
        .word   0x7fff
.L_021ac35c:
        .word   0x421
.L_021ac360:
        .word   0x50001c0
.L_021ac364:
        .word   0x3def
.L_021ac368:
        .word   0x50005e0
.L_021ac36c:
        .word   data_ov020_021ae0ac
.L_021ac370:
        .word   data_02104f4c
.L_021ac374:
        .word   data_ov020_021ae060
.L_021ac378:
        .word   0xffcfffef
.L_021ac37c:
        .word   data_ov020_021ae0e8
.L_021ac380:
        .word   data_ov020_021ae504
.L_021ac384:
        .word   data_0210594c
.L_021ac388:
        .word   0x66666667
.L_021ac38c:
        .word   0x106
.L_021ac390:
        .word   data_ov020_021addc8
