; func_ov004_021cb290 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern data_021040ac
        .extern data_02104cf8
        .extern data_ov000_021b343c
        .extern data_ov000_021b3fd8
        .extern data_ov000_021b4048
        .extern data_ov004_0220b500
        .extern data_ov004_02211490
        .extern data_ov007_021b343c
        .extern data_ov007_021b3fd8
        .extern data_ov007_021b4048
        .extern data_ov009_021b343c
        .extern data_ov009_021b3fd8
        .extern data_ov009_021b4048
        .extern data_ov021_021b343c
        .extern data_ov021_021b3fd8
        .extern data_ov021_021b4048
        .extern func_02000ef8
        .extern func_02001ba4
        .extern func_020057dc
        .extern func_02005c60
        .extern func_02006918
        .extern func_020071a4
        .extern func_0201261c
        .extern func_0201cfe0
        .extern func_0201d040
        .extern func_0201d060
        .extern func_0202af40
        .extern func_0202c1ac
        .extern func_02032624
        .extern func_0208c884
        .extern func_0208e2f4
        .extern func_ov004_021c9f94
        .global func_ov004_021cb290
        .arm
func_ov004_021cb290:
    stmdb sp!, {r3, r4, r5, lr}
    mov r1, #0x3f
    ldr r0, .L_021cb4e0
    sub r2, r1, #0x4f
    ldr r4, .L_021cb4e4
    bl func_0208e2f4
    mov r1, #0x3f
    ldr r0, .L_021cb4e8
    sub r2, r1, #0x4f
    bl func_0208e2f4
    ldr r0, .L_021cb4ec
    mov r1, #0x0
    bl func_0208c884
    ldr r0, .L_021cb4f0
    mov r1, #0x0
    bl func_0208c884
    ldr r0, .L_021cb4f4
    bl func_ov004_021c9f94
    mov r0, #0x1
    bl func_02005c60
    mov r0, #0x2
    bl func_02005c60
    bl func_02001ba4
    bl func_0202c1ac
    bl func_0202af40
    bl func_02006918
    ldr r0, .L_021cb4f8
    ldr r0, [r0, #0x4c]
    cmp r0, #0x8
    addls pc, pc, r0, lsl #0x2
    b .L_021cb4b8
.L_021cb30c: ; jump table
    b .L_021cb4b8 ; case 0
    b .L_021cb4b8 ; case 1
    b .L_021cb4b8 ; case 2
    b .L_021cb4b8 ; case 3
    b .L_021cb4b8 ; case 4
    b .L_021cb330 ; case 5
    b .L_021cb3fc ; case 6
    b .L_021cb43c ; case 7
    b .L_021cb40c ; case 8
.L_021cb330:
    bl func_0201d060
    cmp r0, #0x0
    beq .L_021cb4b8
    ldr r3, .L_021cb4fc
    ldr r0, .L_021cb500
    ldr r4, [r3, #0xc38]
    mov r2, #0x12
    umull r0, r1, r4, r0
    mov r1, r1, lsr #0x2
    umull r0, r1, r2, r1
    sub r1, r4, r0
    str r1, [r3, #0xb84]
    bl func_0201cfe0
    cmp r0, #0x0
    beq .L_021cb384
    ldr r0, .L_021cb4fc
    mov r1, #0x0
    str r1, [r0, #0xc3c]
    str r1, [r0, #0xc40]
    mov r1, #0x2
    b .L_021cb39c
.L_021cb384:
    ldr r0, .L_021cb4fc
    mov r1, #0x1
    str r1, [r0, #0xc3c]
    mov r1, #0x2
    str r1, [r0, #0xc40]
    mov r1, #0x0
.L_021cb39c:
    str r1, [r0, #0xc44]
    ldr r0, .L_021cb4fc
    mov r1, #0x0
    str r1, [r0, #0xbbc]
    str r1, [r0, #0xbc0]
    str r1, [r0, #0xbb0]
    sub r1, r1, #0x1
    str r1, [r0, #0xbb4]
    mov r1, #0x2
    str r1, [r0, #0xc48]
    bl func_0201d040
    cmp r0, #0x2
    ldreq r0, .L_021cb4fc
    moveq r1, #0x1
    ldrne r0, .L_021cb4fc
    movne r1, #0x0
    str r1, [r0, #0xb88]
    ldr r1, .L_021cb4fc
    mov r2, #0x0
    ldr r0, .L_021cb504
    str r2, [r1, #0xba0]
    bl func_020057dc
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_021cb3fc:
    ldr r0, .L_021cb504
    bl func_020057dc
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_021cb40c:
    bl func_0201d040
    cmp r0, #0x4
    mov r0, #0x5
    mov r1, #0x6
    bne .L_021cb42c
    ldr r2, .L_021cb508
    bl func_020071a4
    b .L_021cb434
.L_021cb42c:
    ldr r2, .L_021cb50c
    bl func_020071a4
.L_021cb434:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_021cb43c:
    mov lr, #0x0
    ldr r0, .L_021cb510
    mov r1, r4
    mov ip, lr
.L_021cb44c:
    add r2, r4, lr, lsl #0x2
    add r2, r2, #0x3000
    ldr r2, [r2, #0xc0c]
    mov r5, ip
    str r2, [r0, #0x0]
    cmp r2, #0x0
    bls .L_021cb48c
.L_021cb468:
    add r2, r1, r5, lsl #0x2
    add r2, r2, #0x3000
    ldr r3, [r2, #0xc14]
    add r2, r0, r5, lsl #0x1
    strh r3, [r2, #0xc]
    ldr r2, [r0, #0x0]
    add r5, r5, #0x1
    cmp r5, r2
    blo .L_021cb468
.L_021cb48c:
    add lr, lr, #0x1
    cmp lr, #0x2
    add r0, r0, #0x108
    add r1, r1, #0x28
    blt .L_021cb44c
    ldr r2, .L_021cb514
    mov r0, #0x5
    mov r1, #0x6
    bl func_020071a4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_021cb4b8:
    ldr r1, .L_021cb4fc
    mvn r2, #0x0
    mov r0, #0x0
    str r2, [r1, #0xbac]
    bl func_02032624
    bl func_02000ef8
    cmp r0, #0x0
    movne r0, #0x0
    moveq r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_021cb4e0:
        .word   0x4000050
.L_021cb4e4:
        .word   data_ov004_0220b500
.L_021cb4e8:
        .word   0x4001050
.L_021cb4ec:
        .word   0x400006c
.L_021cb4f0:
        .word   0x400106c
.L_021cb4f4:
        .word   data_ov004_02211490
.L_021cb4f8:
        .word   data_ov004_0220b500
.L_021cb4fc:
        .word   data_021040ac
.L_021cb500:
        .word   0x38e38e39
.L_021cb504:
        .word   func_0201261c
.L_021cb508:
        .word   data_ov000_021b3fd8 ; func_ov002_021b3fd8, func_ov006_021b3fd8, data_ov007_021b3fd8, data_ov009_021b3fd8, data_ov021_021b3fd8
.L_021cb50c:
        .word   data_ov000_021b4048 ; func_ov006_021b4048, data_ov007_021b4048, data_ov009_021b4048, data_ov021_021b4048
.L_021cb510:
        .word   data_02104cf8
.L_021cb514:
        .word   data_ov000_021b343c ; func_ov006_021b343c, data_ov007_021b343c, data_ov009_021b343c, data_ov021_021b343c
