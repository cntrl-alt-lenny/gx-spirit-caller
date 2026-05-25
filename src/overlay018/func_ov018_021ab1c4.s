; func_ov018_021ab1c4 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern data_021040ac
        .extern data_02104f1c
        .extern data_02104f4c
        .extern data_ov018_021ad860
        .extern data_ov018_021ad870
        .extern data_ov018_021ad884
        .extern data_ov018_021ad8a8
        .extern data_ov018_021adcd4
        .extern data_ov018_021ae0f0
        .extern data_ov018_021ae190
        .extern Fill32
        .extern func_02001a34
        .extern func_02005800
        .extern func_0200592c
        .extern func_02005bfc
        .extern func_02008598
        .extern func_0202adf8
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
        .extern func_0208da2c
        .extern func_02094504
        .extern func_ov018_021aa4a0
        .global func_ov018_021ab1c4
        .arm
func_ov018_021ab1c4:
    stmdb sp!, {r4, lr}
    mov r1, #0x4000000
    ldr r0, [r1, #0x0]
    ldr r4, .L_021ab430
    bic r0, r0, #0x1f00
    str r0, [r1, #0x0]
    add r3, r1, #0x1000
    ldr r0, [r3, #0x0]
    ldr r2, .L_021ab434
    bic ip, r0, #0x1f00
    mov r1, r4
    mov r0, #0x0
    str ip, [r3, #0x0]
    bl Fill32
    ldr r1, .L_021ab438
    ldr r0, .L_021ab43c
    ldr r1, [r1, #0x1c]
    mov r2, #0x4
    bl func_0207deb0
    bl func_0200592c
    ldr r0, .L_021ab440
    bl func_0208d1e4
    mov r0, #0x0
    mov r1, #0x6800000
    mov r2, #0xa4000
    bl func_02094504
    bl func_0208cc90
    ldr r0, .L_021ab444
    bl func_0207e8b8
    ldr r0, .L_021ab448
    bl func_0202adf8
    ldr r0, .L_021ab44c
    ldr r1, .L_021ab450
    ldr r2, [r0, #0x4]
    mov r0, #0xc
    mov r2, r2, lsl #0x1d
    mov r2, r2, lsr #0x1d
    str r2, [r1, #0x930]
    bl func_02001a34
    ldr r0, .L_021ab454
    bl func_0207f884
    ldr r0, .L_021ab458
    bl func_0207f85c
    ldr ip, .L_021ab45c
    mov r0, #0x200
    ldrh r3, [ip, #0x0]
    mov r1, #0x7000000
    mov r2, #0x400
    orr r3, r3, #0x8000
    strh r3, [ip, #0x0]
    bl func_02094504
    mov r0, #0x0
    mov r1, #0x5000000
    mov r2, #0x400
    bl func_02094504
    mov r0, #0x1
    bl func_0208da2c
    mov r2, #0x4000000
    ldr r1, [r2, #0x0]
    mov r0, #0x60
    bic r1, r1, #0x7000000
    str r1, [r2, #0x0]
    ldr r1, [r2, #0x0]
    bic r1, r1, #0x38000000
    str r1, [r2, #0x0]
    bl func_0208d7ac
    mov r0, #0x1
    mov r1, #0x0
    mov r2, r1
    bl func_0208c8cc
    ldr r3, .L_021ab460
    ldr r0, .L_021ab464
    ldrh r2, [r3, #0x0]
    add ip, r0, #0x208
    ldr r1, .L_021ab468
    and r0, r2, #0x43
    orr r0, r0, #0x1c80
    orr r0, r0, #0x4000
    strh r0, [r3, #0x0]
    ldrh lr, [r3, #0x2]
    mov r0, #0x200
    mov r2, #0x400
    and lr, lr, #0x43
    orr ip, lr, ip
    strh ip, [r3, #0x2]
    ldrh ip, [r3, #0x6]
    and ip, ip, #0x43
    orr ip, ip, #0xb90
    orr ip, ip, #0x1000
    strh ip, [r3, #0x6]
    bl func_02094504
    ldr r1, .L_021ab46c
    mov r0, #0x0
    mov r2, #0x400
    bl func_02094504
    mov r0, #0x4
    bl func_0208d138
    mov r0, #0x8
    bl func_0208d0bc
    mov r0, #0x80
    bl func_0208d030
    ldr r3, .L_021ab470
    ldr r0, .L_021ab474
    ldrh r2, [r3, #0x0]
    sub r1, r0, #0x3e80
    mov r0, #0x2
    and r2, r2, #0x43
    orr r2, r2, #0xc90
    orr r2, r2, #0x7000
    strh r2, [r3, #0x0]
    ldrh r2, [r3, #0x2]
    and r2, r2, #0x43
    orr r1, r2, r1
    strh r1, [r3, #0x2]
    ldrh r1, [r3, #0x6]
    and r1, r1, #0x43
    orr r1, r1, #0x1f80
    strh r1, [r3, #0x6]
    bl func_02005bfc
    ldr r2, .L_021ab478
    ldr r0, .L_021ab47c
    ldr r1, [r2, #0x0]
    and r0, r1, r0
    orr r0, r0, #0x10
    orr r0, r0, #0x200000
    str r0, [r2, #0x0]
    bl func_0207f420
    ldr r0, .L_021ab480
    mov r1, #0x0
    mov r2, #0x80
    mov r3, #0x1
    bl func_0207f138
    bl func_02008598
    cmp r0, #0x0
    add r0, r4, #0x900
    ldrh r2, [r0, #0xb4]
    bne .L_021ab3fc
    mov r1, #0x1
    str r1, [r4, #0x4]
    bic r1, r2, #0x1
    orr r1, r1, #0x1
    b .L_021ab408
.L_021ab3fc:
    mov r1, #0x0
    str r1, [r4, #0x4]
    bic r1, r2, #0x1
.L_021ab408:
    strh r1, [r0, #0xb4]
    ldr r1, .L_021ab484
    mov r2, #0x0
    ldr r0, .L_021ab488
    str r2, [r1, #0x3c]
    bl func_02005800
    mov r0, #0x0
    str r0, [r4, #0x0]
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_021ab430:
        .word   data_ov018_021ad8a8
.L_021ab434:
        .word   0x9b8
.L_021ab438:
        .word   data_02104f1c
.L_021ab43c:
        .word   data_ov018_021ad860
.L_021ab440:
        .word   0x1ff
.L_021ab444:
        .word   data_ov018_021ae0f0
.L_021ab448:
        .word   data_ov018_021ae190
.L_021ab44c:
        .word   data_02104f4c
.L_021ab450:
        .word   data_ov018_021ad860
.L_021ab454:
        .word   data_ov018_021ad884
.L_021ab458:
        .word   data_ov018_021ad870
.L_021ab45c:
        .word   0x4000304
.L_021ab460:
        .word   0x4000008
.L_021ab464:
        .word   0x5c80
.L_021ab468:
        .word   0x7000400
.L_021ab46c:
        .word   0x5000400
.L_021ab470:
        .word   0x4001008
.L_021ab474:
        .word   0x7c90
.L_021ab478:
        .word   0x4001000
.L_021ab47c:
        .word   0xffcfffef
.L_021ab480:
        .word   data_ov018_021adcd4
.L_021ab484:
        .word   data_021040ac
.L_021ab488:
        .word   func_ov018_021aa4a0
