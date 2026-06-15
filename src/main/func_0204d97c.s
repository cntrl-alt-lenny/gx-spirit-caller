; func_0204d97c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dc84
        .extern func_020469b4
        .extern func_02046b3c
        .extern func_02049120
        .extern func_020498dc
        .extern func_020498f0
        .extern func_02049990
        .extern func_0204a9b0
        .extern func_0204aaf4
        .extern func_0204b0a8
        .extern func_0204b134
        .extern func_0204b280
        .extern func_0204b62c
        .extern func_0204bd8c
        .extern func_0204be40
        .extern func_0204bf00
        .extern func_0204bf44
        .extern func_0204c04c
        .extern func_0204c384
        .extern func_0204c40c
        .extern func_0204ca70
        .extern func_0204cb54
        .extern func_0204cc20
        .extern func_0204ce3c
        .extern func_0204ce90
        .extern func_0204cf7c
        .extern func_0204d438
        .extern func_0204d468
        .extern func_0204d4b4
        .extern func_0204d674
        .extern func_0204ead0
        .extern func_0204ed50
        .extern func_0204f0a8
        .extern func_02050054
        .extern func_02062510
        .extern func_02062530
        .extern func_02065788
        .extern func_020673dc
        .extern func_02068cc8
        .extern func_020930b0
        .extern func_020b3808
        .global func_0204d97c
        .arm
func_0204d97c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x118
    mov r9, r0
    mov r8, r1
    mov r7, r2
    mov sl, r3
    ldr r6, [sp, #0x138]
    ldr r5, [sp, #0x13c]
    mov r4, #0x0
    bl func_020498f0
    cmp r0, #0x0
    beq .L_554
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0x0
    bne .L_560
.L_554:
    add sp, sp, #0x118
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_560:
    bl func_020469b4
    cmp r0, #0x5
    bne .L_590
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0x1
    bne .L_590
    bl func_020498f0
    ldr r0, [r0, #0xf4]
    cmp r8, r0
    bne .L_590
    bl func_0204b0a8
.L_590:
    cmp r9, #0x40
    bgt .L_630
    cmp r9, #0x40
    bge .L_1378
    cmp r9, #0x20
    addls pc, pc, r9, lsl #0x2
    b .L_13ec
    b .L_13ec
    b .L_638
    b .L_804
    b .L_9dc
    b .L_a3c
    b .L_b5c
    b .L_bd8
    b .L_ce8
    b .L_e00
    b .L_f80
    b .L_fd4
    b .L_638
    b .L_107c
    b .L_10f0
    b .L_10f0
    b .L_10f0
    b .L_1114
    b .L_1164
    b .L_1208
    b .L_1264
    b .L_13ec
    b .L_13ec
    b .L_13ec
    b .L_13ec
    b .L_13ec
    b .L_13ec
    b .L_13ec
    b .L_13ec
    b .L_13ec
    b .L_13ec
    b .L_13ec
    b .L_13ec
    b .L_127c
.L_630:
    cmp r9, #0x41
    b .L_13ec
.L_638:
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x0
    ldrne r0, [r6, #0x8]
    ldrne r7, [r6, #0x4]
    movne r0, r0, lsl #0x10
    movne sl, r0, lsr #0x10
    cmp r9, #0xb
    moveq r0, #0x1
    movne r0, #0x0
    str r0, [sp]
    ldr r3, [r6]
    mov r0, r8
    mov r1, r7
    mov r2, sl
    bl func_0204d674
    mov r5, r0
    cmp r5, #0x2
    bne .L_778
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x1dc]
    mov r0, r8
    mov r1, r7
    mov r2, sl
    bl func_0204d4b4
    bl func_0204d438
    cmp r0, #0x0
    addne sp, sp, #0x118
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x2
    bne .L_6fc
    bl func_020498f0
    ldr r0, [r0, #0x46c]
    cmp r0, #0x0
    beq .L_6fc
    bl func_020498f0
    mov r6, r0
    mov r0, r8
    bl func_02049120
    mov r4, r0
    bl func_020498f0
    ldr r1, [r0, #0x470]
    ldr r2, [r6, #0x46c]
    mov r0, r4
    blx r2
.L_6fc:
    bl func_020498f0
    ldrb r0, [r0, #0x14]
    mov r4, #0x1
    str r0, [sp, #0x14]
    bl func_020498f0
    ldrb r0, [r0, #0x14]
    cmp r0, #0x1
    blt .L_744
    add r6, sp, #0x14
.L_720:
    bl func_020498f0
    add r0, r0, r4, lsl #0x2
    ldr r0, [r0, #0xf4]
    str r0, [r6, r4, lsl #0x2]
    add r4, r4, #0x1
    bl func_020498f0
    ldrb r0, [r0, #0x14]
    cmp r4, r0
    ble .L_720
.L_744:
    bl func_020498f0
    ldr r1, [r0, #0x1c]
    add r0, sp, #0x14
    str r1, [r0, r4, lsl #0x2]
    bl func_020498f0
    ldrh r2, [r0, #0x1a]
    add r3, r4, #0x1
    add r1, sp, #0x14
    mov r0, #0xb
    str r2, [r1, r3, lsl #0x2]
    add r4, r4, #0x2
    bl func_020498dc
    b .L_7c4
.L_778:
    cmp r5, #0x3
    bne .L_7c4
    bl func_020498f0
    ldrb r0, [r0, #0x16]
    cmp r0, #0x0
    beq .L_7c4
    bl func_020498f0
    mov r6, r0
    bl func_020498f0
    ldrb r1, [r6, #0x14]
    ldrb r0, [r0, #0x16]
    cmp r1, r0
    bne .L_7c4
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x2
    moveq r0, #0x10
    streq r0, [sp, #0x14]
    moveq r4, #0x1
.L_7c4:
    cmp r5, #0xff
    beq .L_13ec
    add r1, sp, #0x14
    str r1, [sp]
    mov r0, r5
    mov r1, r8
    mov r2, r7
    mov r3, sl
    str r4, [sp, #0x4]
    bl func_0204ead0
    bl func_0204d438
    cmp r0, #0x0
    beq .L_13ec
    add sp, sp, #0x118
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_804:
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0x4
    bne .L_13ec
    bl func_020498f0
    ldr r0, [r0, #0x204]
    cmp r8, r0
    bne .L_13ec
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x208]
    bl func_020498f0
    mov r1, #0x0
    strb r1, [r0, #0x1a7]
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x1c8]
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x1bc]
    bl func_020498f0
    ldr r1, [r6]
    add r1, r6, r1, lsl #0x2
    ldr r1, [r1, #0x4]
    str r1, [r0, #0x24]
    bl func_020498f0
    ldr r1, [r6]
    add r1, r6, r1, lsl #0x2
    ldr r1, [r1, #0x8]
    strh r1, [r0, #0xa4]
    bl func_020498f0
    ldr r1, [r6]
    add r1, r6, r1, lsl #0x2
    ldr r1, [r1, #0x4]
    str r1, [r0, #0x1b8]
    bl func_020498f0
    ldr r1, [r6]
    add r0, r0, #0x100
    add r1, r6, r1, lsl #0x2
    ldr r1, [r1, #0x8]
    strh r1, [r0, #0xb4]
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x1
    bne .L_930
    ldr r1, [r6]
    add r0, r6, #0x4
    bl func_0204c384
    cmp r0, #0x0
    beq .L_8ec
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    cmp r0, #0x0
    beq .L_930
    mov r0, r8
    mov r1, r6
    bl func_0204d468
    b .L_930
.L_8ec:
    mov r0, r8
    bl func_0204ce3c
    bl func_0204d438
    cmp r0, #0x0
    addne sp, sp, #0x118
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    mov r0, #0x0
    mov r1, r0
    mov r2, r8
    bl func_0204cf7c
    bl func_0204d438
    cmp r0, #0x0
    beq .L_13ec
    add sp, sp, #0x118
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_930:
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x0
    bne .L_9b4
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    cmp r0, #0x0
    beq .L_974
    mov r0, r8
    mov r1, r6
    bl func_0204d468
    bl func_0204ca70
    bl func_0204d438
    cmp r0, #0x0
    addne sp, sp, #0x118
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_974:
    mov r0, #0x6
    bl func_020498dc
    bl func_020498f0
    ldr r0, [r0, #0xe4]
    mov r1, #0x0
    bl func_02068cc8
    mov r2, r0
    mov r0, #0x0
    mov r1, r0
    bl func_0204ed50
    bl func_0204a9b0
    cmp r0, #0x0
    beq .L_13ec
    add sp, sp, #0x118
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_9b4:
    mov r0, #0x5
    bl func_020498dc
    mov r0, r8
    bl func_0204f0a8
    bl func_0204aaf4
    cmp r0, #0x0
    beq .L_13ec
    add sp, sp, #0x118
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_9dc:
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0x4
    bne .L_13ec
    bl func_020498f0
    ldr r0, [r0, #0x204]
    cmp r8, r0
    bne .L_13ec
    cmp r5, #0x0
    ble .L_a28
    ldr r0, [r6]
    cmp r0, #0x10
    bne .L_a28
    mov r0, #0xd
    mov r1, #0x0
    bl func_02050054
    add sp, sp, #0x118
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_a28:
    bl func_020498f0
    ldr r0, [r0, #0x204]
    bl func_0204ce90
    add sp, sp, #0x118
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_a3c:
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0x4
    bne .L_13ec
    bl func_020498f0
    ldr r0, [r0, #0x204]
    cmp r8, r0
    bne .L_13ec
    bl func_020498f0
    mov r4, r0
    bl func_020930b0
    str r0, [r4, #0x1cc]
    str r1, [r4, #0x1d0]
    bl func_020498f0
    ldr r0, [r0, #0x208]
    cmp r0, #0x0
    beq .L_a90
    bl func_020498f0
    ldrb r0, [r0, #0x1a7]
    cmp r0, #0x10
    bcc .L_aa0
.L_a90:
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x3
    bne .L_ae4
.L_aa0:
    bl func_020498f0
    mov r1, #0x1
    str r1, [r0, #0x1bc]
    bl func_020498f0
    mov r4, r0
    bl func_020930b0
    str r0, [r4, #0x1c0]
    str r1, [r4, #0x1c4]
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x3
    beq .L_13ec
    bl func_020498f0
    ldrb r1, [r0, #0x1a7]
    add r1, r1, #0x1
    strb r1, [r0, #0x1a7]
    b .L_13ec
.L_ae4:
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x208]
    bl func_020498f0
    mov r1, #0x0
    strb r1, [r0, #0x1a7]
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x0
    bne .L_b38
    mov r0, #0x3
    bl func_020498dc
    bl func_020498f0
    mov r1, #0x1
    str r1, [r0, #0xe8]
    bl func_020498f0
    mov r4, r0
    bl func_020930b0
    str r0, [r4, #0xec]
    str r1, [r4, #0xf0]
    b .L_13ec
.L_b38:
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x1
    bne .L_13ec
    mov r1, #0x0
    mov r2, r1
    mov r0, #0x1
    bl func_0204cf7c
    b .L_13ec
.L_b5c:
    bl func_020498f0
    ldrb r0, [r0, #0x17]
    cmp r0, #0x0
    beq .L_13ec
    bl func_020498f0
    ldr r0, [r0, #0x20]
    cmp r8, r0
    bne .L_13ec
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x2
    bne .L_bbc
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    cmp r0, #0x1
    bne .L_bbc
    bl func_020498f0
    ldr r0, [r0, #0xf8]
    cmp r8, r0
    bne .L_bbc
    bl func_020498f0
    ldr r0, [r0, #0x4]
    ldr r0, [r0]
    bl func_02062530
.L_bbc:
    mov r0, r8
    bl func_0204cc20
    cmp r0, #0x0
    bne .L_13ec
    add sp, sp, #0x118
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_bd8:
    ldr r0, [r6, #0x4]
    ldr r4, [r6]
    mov r0, r0, lsl #0x10
    mov r5, r0, lsr #0x10
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0x1
    bne .L_c04
    mov r0, #0x6
    bl func_020498dc
    b .L_c34
.L_c04:
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0x6
    beq .L_c24
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0xb
    bne .L_13ec
.L_c24:
    bl func_020498f0
    ldr r0, [r0, #0x20]
    cmp r8, r0
    bne .L_13ec
.L_c34:
    bl func_020498f0
    mov r1, #0xff
    strb r1, [r0, #0x3cc]
    bl func_020498f0
    mov r6, r0
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    add r0, r0, #0x1
    add r0, r6, r0, lsl #0x2
    ldr r0, [r0, #0xf4]
    cmp r8, r0
    beq .L_c80
    bl func_020498f0
    mov r6, r0
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    add r0, r0, #0x1
    add r0, r6, r0, lsl #0x2
    str r8, [r0, #0xf4]
.L_c80:
    mov r1, r5, asr #0x8
    mov r0, r5, lsl #0x8
    and r1, r1, #0xff
    and r0, r0, #0xff00
    orr r0, r1, r0
    str r4, [sp, #0x10]
    strh r0, [sp, #0xe]
    bl func_020498f0
    mov r1, #0x1
    strb r1, [r0, #0x194]
    bl func_020498f0
    ldr r0, [r0, #0x4]
    ldr r0, [r0]
    bl func_02062510
    mov r4, r0
    bl func_020498f0
    add r3, r0, #0x194
    mov r1, r4
    mov r0, #0x0
    add r2, sp, #0xc
    bl func_02049990
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x18c]
    str r1, [r0, #0x190]
    b .L_13ec
.L_ce8:
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0x1
    bne .L_13ec
    bl func_020498f0
    ldr r0, [r0, #0xf4]
    cmp r8, r0
    bne .L_13ec
    ldr r0, [r6]
    str r0, [sp, #0x8]
    ldr r0, [r6, #0x4]
    and r4, r0, #0xff
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x1
    bne .L_d7c
    bl func_020498f0
    ldrb r0, [r0, #0x1a6]
    cmp r0, #0x0
    bne .L_d7c
    ldr r0, [sp, #0x8]
    bl func_0204b280
    str r0, [sp, #0x14]
    add r0, sp, #0x14
    str r0, [sp]
    mov r5, #0x1
    mov r1, r8
    mov r2, r7
    mov r3, sl
    mov r0, #0x20
    str r5, [sp, #0x4]
    bl func_0204ead0
    bl func_0204d438
    cmp r0, #0x0
    addne sp, sp, #0x118
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_d7c:
    bl func_020498f0
    mov r5, r0
    bl func_020498f0
    ldrb r0, [r0, #0x14]
    ldr r1, [sp, #0x8]
    add r0, r0, #0x1
    add r0, r5, r0, lsl #0x2
    str r1, [r0, #0xf4]
    bl func_020498f0
    mov r5, r0
    bl func_020498f0
    ldrb r0, [r0, #0x14]
    add r0, r0, #0x1
    add r0, r5, r0
    strb r4, [r0, #0x2d0]
    bl func_020498f0
    ldr r0, [r0, #0x10]
    bl func_020673dc
    bl func_020498f0
    ldr r0, [r0, #0x46c]
    cmp r0, #0x0
    beq .L_13ec
    bl func_020498f0
    mov r5, r0
    ldr r0, [sp, #0x8]
    bl func_02049120
    mov r4, r0
    bl func_020498f0
    ldr r1, [r0, #0x470]
    ldr r2, [r5, #0x46c]
    mov r0, r4
    blx r2
    b .L_13ec
.L_e00:
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0x1
    bne .L_13ec
    bl func_020498f0
    ldr r0, [r0, #0xf4]
    cmp r8, r0
    bne .L_13ec
    ldr r0, [r6]
    str r0, [sp, #0x8]
    cmp r0, #0x0
    bne .L_e68
    ldr r5, [r6, #0x4]
    ldr r4, [r6, #0x8]
    bl func_020498f0
    add r0, r5, r0
    strb r4, [r0, #0x2d0]
    bl func_020498f0
    mov r4, r0
    bl func_020498f0
    ldr r2, [r0, #0x200]
    add r1, r4, r5, lsl #0x2
    mov r0, #0x3
    str r2, [r1, #0xf4]
    bl func_0204c40c
    b .L_13ec
.L_e68:
    ldr r0, [r6, #0x8]
    ldr r4, [r6, #0x4]
    and r5, r0, #0xff
    bl func_020498f0
    add r0, r0, r4, lsl #0x2
    ldr r1, [sp, #0x8]
    ldr r0, [r0, #0xf4]
    cmp r1, r0
    bne .L_ee8
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    sub r0, r0, #0x1
    cmp r4, r0
    bne .L_ee8
    bl func_020498f0
    mov r4, r0
    bl func_020498f0
    add r1, sp, #0x8
    str r1, [sp]
    mov r1, #0x1
    str r1, [sp, #0x4]
    ldrh r3, [r0, #0xa4]
    ldr r2, [r4, #0x24]
    mov r1, r8
    mov r0, #0x9
    bl func_0204ead0
    bl func_0204d438
    cmp r0, #0x0
    beq .L_13ec
    add sp, sp, #0x118
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_ee8:
    bl func_020498f0
    ldr r1, [sp, #0x8]
    add r0, r0, r4, lsl #0x2
    str r1, [r0, #0xf4]
    bl func_020498f0
    add r0, r4, r0
    strb r5, [r0, #0x2d0]
    bl func_020498f0
    ldr r1, [r6, #0xc]
    add r0, r0, r4, lsl #0x2
    str r1, [r0, #0x24]
    bl func_020498f0
    ldr r1, [r6, #0x10]
    add r0, r0, r4, lsl #0x1
    strh r1, [r0, #0xa4]
    bl func_020498f0
    ldr r1, [r6, #0xc]
    str r1, [r0, #0x1b8]
    bl func_020498f0
    add r1, r0, #0x100
    ldr r2, [r6, #0x10]
    mov r0, #0x5
    strh r2, [r1, #0xb4]
    bl func_020498dc
    ldr r0, [sp, #0x8]
    bl func_0204f0a8
    bl func_0204aaf4
    cmp r0, #0x0
    addne sp, sp, #0x118
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x1c8]
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x1bc]
    b .L_13ec
.L_f80:
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0xd
    bne .L_13ec
    bl func_020498f0
    mov r4, r0
    bl func_020498f0
    ldrb r0, [r0, #0x1a4]
    ldr r1, [r6]
    add r0, r0, #0x1
    add r0, r4, r0, lsl #0x2
    ldr r0, [r0, #0xf4]
    cmp r1, r0
    bne .L_13ec
    bl func_020498f0
    ldrb r1, [r0, #0x1a4]
    add r1, r1, #0x1
    strb r1, [r0, #0x1a4]
    mov r0, #0x0
    bl func_0204c40c
    b .L_13ec
.L_fd4:
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0x1
    beq .L_ff4
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0x12
    bne .L_13ec
.L_ff4:
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x0
    beq .L_1018
    ldr r1, [r6]
    add r0, r6, #0x4
    bl func_0204c384
    cmp r0, #0x0
    beq .L_1034
.L_1018:
    bl func_020498f0
    ldr r1, [r6, #0x4]
    str r1, [r0, #0x208]
    bl func_020498f0
    mov r1, #0x0
    strb r1, [r0, #0x1a7]
    b .L_1040
.L_1034:
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x208]
.L_1040:
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    cmp r0, #0x0
    beq .L_1064
    bl func_020498f0
    ldr r0, [r0, #0x4]
    ldr r0, [r0]
    bl func_02062530
    b .L_13ec
.L_1064:
    bl func_0204be40
    cmp r0, #0x0
    beq .L_13ec
    add sp, sp, #0x118
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_107c:
    bl func_020498f0
    ldr r0, [r0, #0xf4]
    cmp r8, r0
    bne .L_13ec
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x0
    beq .L_10ac
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x1
    bne .L_10c8
.L_10ac:
    mov r0, r8
    bl func_0204cb54
    cmp r0, #0x0
    bne .L_13ec
    add sp, sp, #0x118
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_10c8:
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x3
    bne .L_13ec
    bl func_020498f0
    str r8, [r0, #0x20c]
    bl func_0204bd8c
    mov r0, #0x0
    bl func_0204bf44
    b .L_13ec
.L_10f0:
    ldr r2, [r6]
    mov r0, r8
    mov r1, r9
    bl func_0204b62c
    cmp r0, #0x0
    bne .L_13ec
    add sp, sp, #0x118
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_1114:
    bl func_020498f0
    ldr r0, [r0, #0xf4]
    cmp r8, r0
    addne sp, sp, #0x118
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    cmp r5, #0x0
    mov r7, #0x0
    ble .L_13ec
    mov r4, r7
.L_113c:
    ldr r0, [r6, r7, lsl #0x2]
    mov r1, r4
    bl func_0204b134
    cmp r0, #0xff
    beq .L_1154
    bl func_02046b3c
.L_1154:
    add r7, r7, #0x1
    cmp r7, r5
    blt .L_113c
    b .L_13ec
.L_1164:
    ldr r0, _LIT0
    ldr r4, [r0]
    cmp r4, #0x0
    beq .L_11c4
    ldrb r0, [r4]
    cmp r0, #0x0
    beq .L_11c4
    bl func_020930b0
    ldr r3, [r4, #0x10]
    ldr r2, [r4, #0x14]
    subs r3, r0, r3
    sbc r0, r1, r2
    mov r1, r0, lsl #0x6
    ldr r2, _LIT1
    orr r1, r1, r3, lsr #0x1a
    mov r0, r3, lsl #0x6
    mov r3, #0x0
    bl func_020b3808
    ldr r2, [r4, #0x4]
    cmp r1, #0x0
    cmpeq r0, r2
    movcs r0, #0x1
    strcs r0, [sp, #0x14]
    bcs .L_11cc
.L_11c4:
    mov r0, #0x0
    str r0, [sp, #0x14]
.L_11cc:
    add r0, sp, #0x14
    str r0, [sp]
    mov r4, #0x1
    mov r1, r8
    mov r2, r7
    mov r3, sl
    mov r0, #0x12
    str r4, [sp, #0x4]
    bl func_0204ead0
    bl func_0204d438
    cmp r0, #0x0
    beq .L_13ec
    add sp, sp, #0x118
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_1208:
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0x13
    bne .L_13ec
    mov r0, r8
    mov r1, #0x0
    bl func_0204b134
    cmp r0, #0xff
    beq .L_13ec
    ldr r1, _LIT0
    mov r4, #0x1
    ldr r3, [r1]
    mov r5, r4, lsl r0
    ldr r2, [r3, #0x8]
    orr r0, r2, r4, lsl r0
    str r0, [r3, #0x8]
    ldr r0, [r6]
    cmp r0, #0x0
    ldrne r1, [r1]
    ldrne r0, [r1, #0xc]
    orrne r0, r0, r5
    strne r0, [r1, #0xc]
    b .L_13ec
.L_1264:
    mov r0, #0xc
    mov r1, #0x0
    bl func_02050054
    add sp, sp, #0x118
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_127c:
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x1
    bne .L_13ec
    bl func_020498f0
    ldrb r0, [r0, #0x1a6]
    cmp r0, #0x0
    bne .L_13ec
    mov r4, #0x1
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    cmp r0, #0x1
    blt .L_13ec
.L_12b0:
    bl func_020498f0
    add r0, r0, r4, lsl #0x2
    ldr r0, [r0, #0xf4]
    cmp r8, r0
    bne .L_1360
    ldr r0, [r6]
    cmp r0, #0x0
    bne .L_1338
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0xb
    beq .L_12f0
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0xc
    bne .L_1308
.L_12f0:
    bl func_0204c04c
    bl func_0204d438
    cmp r0, #0x0
    addne sp, sp, #0x118
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_1308:
    bl func_020498f0
    ldr r0, [r0, #0x19c]
    cmp r0, #0x0
    beq .L_1330
    bl func_020498f0
    ldr r0, [r0, #0x19c]
    bl func_02065788
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x19c]
.L_1330:
    bl func_0204bf00
    b .L_13ec
.L_1338:
    bl func_020498f0
    mov r4, r0
    mov r0, r8
    mov r1, #0x0
    bl func_0204b134
    ldr r2, [r4, #0x1dc]
    mov r1, #0x1
    orr r0, r2, r1, lsl r0
    str r0, [r4, #0x1dc]
    b .L_13ec
.L_1360:
    add r4, r4, #0x1
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    cmp r4, r0
    ble .L_12b0
    b .L_13ec
.L_1378:
    mov r4, #0x1
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    cmp r0, #0x1
    blt .L_13ec
.L_138c:
    bl func_020498f0
    add r0, r0, r4, lsl #0x2
    ldr r0, [r0, #0xf4]
    cmp r8, r0
    bne .L_13d8
    mov r4, #0x0
    str r4, [sp]
    mov r1, r8
    mov r2, r7
    mov r3, sl
    mov r0, #0x41
    str r4, [sp, #0x4]
    bl func_0204ead0
    bl func_0204d438
    cmp r0, #0x0
    beq .L_13ec
    add sp, sp, #0x118
    mov r0, r4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_13d8:
    add r4, r4, #0x1
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    cmp r4, r0
    ble .L_138c
.L_13ec:
    mov r0, #0x1
    add sp, sp, #0x118
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_0219dc84
_LIT1: .word 0x000082ea
