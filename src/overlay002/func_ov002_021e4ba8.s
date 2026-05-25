; func_ov002_021e4ba8 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern data_ov002_022cd73c
        .extern data_ov002_022ce288
        .extern data_ov002_022ce588
        .extern data_ov002_022ce58a
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a2
        .extern data_ov002_022cf1a4
        .extern data_ov002_022cf1ac
        .extern data_ov002_022d016c
        .extern data_ov002_022d0250
        .extern data_ov002_022d0e6c
        .extern func_0202b878
        .extern func_0202b8c0
        .extern func_0202e234
        .extern func_0202e42c
        .extern func_020310d8
        .extern func_ov002_021b04c8
        .extern func_ov002_021b0c54
        .extern func_ov002_021b1458
        .extern func_ov002_021b1570
        .extern func_ov002_021b30ac
        .extern func_ov002_021b3774
        .extern func_ov002_021b3864
        .extern func_ov002_021b3ecc
        .extern func_ov002_021b3fd8
        .extern func_ov002_021b9144
        .extern func_ov002_021b9bd4
        .extern func_ov002_021b9e00
        .extern func_ov002_021b9ecc
        .extern func_ov002_021bae7c
        .extern func_ov002_021bb068
        .extern func_ov002_021bb444
        .extern func_ov002_021bd710
        .extern func_ov002_021c3ae4
        .extern func_ov002_021c3b60
        .extern func_ov002_021c8940
        .extern func_ov002_021d479c
        .extern func_ov002_021d59cc
        .extern func_ov002_021d5b80
        .extern func_ov002_021d6434
        .extern func_ov002_021d6870
        .extern func_ov002_021d8904
        .extern func_ov002_021d91e0
        .extern func_ov002_021de480
        .extern func_ov002_021de598
        .extern func_ov002_021dec2c
        .extern func_ov002_021df62c
        .extern func_ov002_021df680
        .extern func_ov002_021df6d4
        .extern func_ov002_021df938
        .extern func_ov002_021e05fc
        .extern func_ov002_021e2b1c
        .extern func_ov002_021e2d94
        .extern func_ov002_021e2e38
        .extern func_ov002_021e30b4
        .extern func_ov002_021e381c
        .extern func_ov002_021fd928
        .extern func_ov002_021feb08
        .extern func_ov002_0223de94
        .extern func_ov002_0223df38
        .extern func_ov002_0223e080
        .extern func_ov002_02256f38
        .extern func_ov002_0225702c
        .extern func_ov002_0225764c
        .extern func_ov002_02257cfc
        .extern func_ov002_0226b258
        .global func_ov002_021e4ba8
        .arm
func_ov002_021e4ba8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0xe8
    ldr r0, .L_021e5628
    ldr r2, .L_021e562c
    ldr r3, [r0, #0x480]
    mov r1, #0x18
    sub r0, r3, #0x1
    mla r4, r0, r1, r2
    cmp r3, #0x1
    subgt r1, r4, #0x18
    strgt r1, [sp, #0x8]
    movle r1, #0x0
    strle r1, [sp, #0x8]
    ldr r1, .L_021e5628
    ldr r2, [r1, #0x5a4]
    cmp r2, #0x65
    bgt .L_021e4c30
    bge .L_021e6e9c
    cmp r2, #0x7
    bgt .L_021e4c24
    cmp r2, #0x0
    addge pc, pc, r2, lsl #0x2
    b .L_021e718c
.L_021e4c04: ; jump table
    b .L_021e4c4c ; case 0
    b .L_021e4d74 ; case 1
    b .L_021e4de0 ; case 2
    b .L_021e4e24 ; case 3
    b .L_021e4ed4 ; case 4
    b .L_021e62a4 ; case 5
    b .L_021e63b0 ; case 6
    b .L_021e63f8 ; case 7
.L_021e4c24:
    cmp r2, #0x64
    beq .L_021e6dfc
    b .L_021e718c
.L_021e4c30:
    cmp r2, #0x66
    bgt .L_021e4c40
    beq .L_021e6ecc
    b .L_021e718c
.L_021e4c40:
    cmp r2, #0x67
    beq .L_021e7154
    b .L_021e718c
.L_021e4c4c:
    mov r0, #0x0
    str r0, [r1, #0x5d4]
    str r0, [r1, #0x688]
    ldr r0, [r1, #0x480]
    cmp r0, #0x2
    bge .L_021e4c78
    add r0, r2, #0x2
    str r0, [r1, #0x5a4]
    add sp, sp, #0xe8
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_021e4c78:
    mov r0, #0x1e
    bl func_ov002_021e2b1c
    ldr r0, .L_021e5628
    ldr r0, [r0, #0x480]
    cmp r0, #0x3
    blt .L_021e4d58
    mov r7, #0x0
    ldr r6, .L_021e5630
    mov r5, r7
    mov r11, #0x3
.L_021e4ca0:
    ldr r1, .L_021e5634
    ldr r0, .L_021e5638
    and r2, r7, #0x1
    mla r10, r2, r1, r0
    ldr r0, .L_021e563c
    mov r8, #0x0
    add r9, r10, #0x30
    sub r4, r0, #0x1
.L_021e4cc0:
    ldr r0, [r9, #0x0]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    ldrneh r0, [r10, #0x38]
    cmpne r0, #0x0
    beq .L_021e4d38
    ldr r1, [r10, #0x40]
    mov r0, r1, lsr #0x2
    orr r0, r0, r1, lsr #0x1
    tst r0, #0x1
    bne .L_021e4d38
    mov r0, r7
    mov r1, r8
    bl func_ov002_021b9ecc
    cmp r0, r4
    ldrne r1, .L_021e563c
    cmpne r0, r1
    bne .L_021e4d38
    mov r0, r7
    mov r1, r8
    mov r2, r6
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    bne .L_021e4d38
    mov r0, r7
    mov r1, r8
    mov r2, r6
    str r5, [sp, #0x0]
    mov r3, r11
    bl func_ov002_021d59cc
.L_021e4d38:
    add r8, r8, #0x1
    cmp r8, #0x5
    add r9, r9, #0x14
    add r10, r10, #0x14
    blt .L_021e4cc0
    add r7, r7, #0x1
    cmp r7, #0x2
    blt .L_021e4ca0
.L_021e4d58:
    ldr r1, .L_021e5628
    add sp, sp, #0xe8
    ldr r2, [r1, #0x5a4]
    mov r0, #0x1
    add r2, r2, #0x1
    str r2, [r1, #0x5a4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_021e4d74:
    mov r1, #0x18
    mul r1, r0, r1
    ldr r2, .L_021e5640
    ldrh r1, [r2, r1]
    mov r2, r1, lsl #0x1a
    mov r1, r1, lsl #0x1f
    movs r1, r1, lsr #0x1f
    movne r1, #0x8000
    moveq r1, #0x0
    mov r3, r2, lsr #0x1b
    add r2, r0, #0x1
    orr r1, r1, #0x13
    mov r0, r1, lsl #0x10
    mov r1, r3, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r3, #0x0
    bl func_ov002_021d479c
    ldr r1, .L_021e5628
    add sp, sp, #0xe8
    ldr r2, [r1, #0x5a4]
    mov r0, #0x1
    add r2, r2, #0x1
    str r2, [r1, #0x5a4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_021e4de0:
    ldr r1, .L_021e5644
    ldr r1, [r1, #0xd0c]
    cmp r1, #0x0
    beq .L_021e4e08
    mov r0, r0, lsl #0x10
    mov r2, #0x0
    mov r3, r2
    mov r1, r0, lsr #0x10
    mov r0, #0x13
    bl func_ov002_021b1458
.L_021e4e08:
    ldr r0, .L_021e5628
    ldr r1, [r0, #0x480]
    sub r1, r1, #0x1
    str r1, [r0, #0x484]
    ldr r1, [r0, #0x5a4]
    add r1, r1, #0x1
    str r1, [r0, #0x5a4]
.L_021e4e24:
    ldrh r0, [r4, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1f
    bne .L_021e4e70
    mov r0, r4
    bl func_ov002_021feb08
    cmp r0, #0x0
    beq .L_021e4e70
    ldrh r0, [r4, #0x4]
    orr r1, r0, #0x4
    strh r1, [r4, #0x4]
    ldrh r0, [r4, #0x2]
    mov r2, r1, lsl #0x11
    mov r2, r2, lsr #0x17
    mov r1, r0, lsl #0x1a
    mov r3, r0, lsl #0x1f
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021d8904
.L_021e4e70:
    ldr r1, .L_021e5628
    mov r5, #0x0
    ldr r2, [r1, #0x5a4]
    ldr r0, .L_021e5648
    add r2, r2, #0x1
    str r2, [r1, #0x5a4]
    str r5, [r1, #0x5ac]
    str r5, [r1, #0x5b0]
    strh r5, [r0, #0xb0]
    ldrh r0, [r4, #0x6]
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    cmp r0, #0x0
    ble .L_021e4ec8
.L_021e4ea8:
    mov r0, r4
    mov r1, r5
    bl func_ov002_0223e080
    ldrh r0, [r4, #0x6]
    add r5, r5, #0x1
    mov r0, r0, lsl #0x18
    cmp r5, r0, lsr #0x18
    blt .L_021e4ea8
.L_021e4ec8:
    add sp, sp, #0xe8
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_021e4ed4:
    ldrh r0, [r4, #0x4]
    mov r1, r0, lsl #0x1e
    movs r1, r1, lsr #0x1f
    bne .L_021e4ef0
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1f
    beq .L_021e4f78
.L_021e4ef0:
    ldrh r2, [r4, #0x2]
    mov r0, r2, lsl #0x12
    mov r0, r0, lsr #0x1e
    cmp r0, #0x2
    beq .L_021e4f5c
    mov r0, r2, lsl #0x1f
    mov r1, r0, lsr #0x1f
    mov r2, r2, lsl #0x1a
    ldr r3, .L_021e5638
    ldr r0, .L_021e5634
    and r1, r1, #0x1
    mla r5, r1, r0, r3
    ldrh r1, [r4, #0x4]
    mov r3, r2, lsr #0x1b
    mov r0, #0x14
    mov r2, r1, lsl #0x11
    mul r0, r3, r0
    add r1, r5, #0x30
    ldr r1, [r1, r0]
    mov r2, r2, lsr #0x17
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    cmp r2, r0
    beq .L_021e4f78
.L_021e4f5c:
    ldr r1, .L_021e5628
    add sp, sp, #0xe8
    ldr r2, [r1, #0x5a4]
    mov r0, #0x1
    add r2, r2, #0x1
    str r2, [r1, #0x5a4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_021e4f78:
    ldr r0, .L_021e5628
    ldrh r2, [r4, #0x6]
    ldr r1, [r0, #0x5ac]
    mov r0, r2, lsl #0x18
    cmp r1, r0, lsr #0x18
    bge .L_021e6288
    ldr r0, .L_021e564c
    mvn r10, #0x0
    sub r0, r0, #0x1bc
    str r0, [sp, #0x2c]
    ldr r0, .L_021e564c
    ldr r6, .L_021e5638
    rsb r0, r0, #0x31c0
    str r0, [sp, #0x30]
    ldr r0, .L_021e5650
    ldr r5, .L_021e5634
    sub r0, r0, #0x3c4
    str r0, [sp, #0x4c]
    ldr r0, .L_021e5650
    sub r0, r0, #0x3c4
    str r0, [sp, #0x50]
    ldr r0, .L_021e564c
    sub r0, r0, #0x540
    str r0, [sp, #0x60]
    ldr r0, .L_021e5654
    sub r0, r0, #0x6
    str r0, [sp, #0x5c]
    ldr r0, .L_021e5658
    sub r0, r0, #0x3e8
    str r0, [sp, #0x48]
    ldr r0, .L_021e5658
    add r0, r0, #0x1fc
    str r0, [sp, #0x94]
    ldr r0, .L_021e5654
    add r0, r0, #0x10
    str r0, [sp, #0x6c]
    ldr r0, .L_021e5658
    sub r0, r0, #0x394
    str r0, [sp, #0x68]
    ldr r0, .L_021e5658
    sub r0, r0, #0x3e8
    str r0, [sp, #0x44]
    ldr r0, .L_021e5658
    sub r0, r0, #0x394
    str r0, [sp, #0x64]
    ldr r0, .L_021e5654
    add r0, r0, #0x6a
    str r0, [sp, #0x70]
    ldr r0, .L_021e5650
    sub r0, r0, #0x4c
    str r0, [sp, #0x40]
    ldr r0, .L_021e5654
    add r0, r0, #0x264
    str r0, [sp, #0x88]
    ldr r0, .L_021e5658
    add r0, r0, #0x160
    str r0, [sp, #0x8c]
    ldr r0, .L_021e5658
    add r0, r0, #0x160
    str r0, [sp, #0x90]
    add r0, r10, #0x10000
    str r0, [sp, #0x38]
    ldr r0, .L_021e5650
    sub r0, r0, #0x4c
    str r0, [sp, #0x3c]
    ldr r0, .L_021e5658
    sub r0, r0, #0xab
    str r0, [sp, #0x74]
    ldr r0, .L_021e5658
    sub r0, r0, #0xab
    str r0, [sp, #0x78]
    ldr r0, .L_021e5654
    add r0, r0, #0x1c8
    str r0, [sp, #0x7c]
    ldr r0, .L_021e5658
    sub r0, r0, #0x230
    str r0, [sp, #0x80]
    ldr r0, .L_021e5650
    add r0, r0, #0x2c
    str r0, [sp, #0x84]
    ldr r0, .L_021e564c
    add r0, r0, #0x28
    str r0, [sp, #0x98]
    ldr r0, .L_021e5654
    sub r0, r0, #0x6
    str r0, [sp, #0x58]
    ldr r0, .L_021e564c
    sub r0, r0, #0x540
    str r0, [sp, #0x54]
.L_021e50dc:
    mov r0, r4
    bl func_ov002_0223de94
    str r0, [sp, #0xcc]
    and r7, r0, #0xff
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    and r8, r0, #0xff
    ldr r0, .L_021e5628
    cmp r8, #0x4
    ldr r1, [r0, #0x5ac]
    bgt .L_021e61fc
    mov r0, r4
    add r2, sp, #0xcc
    bl func_ov002_0223df38
    cmp r0, #0x0
    beq .L_021e61fc
    mov r0, r7
    mov r1, r8
    bl func_ov002_021b9ecc
    mov r9, r0
    mov r0, r4
    mov r1, r7
    mov r2, r8
    bl func_ov002_0225764c
    cmp r0, #0x0
    beq .L_021e625c
    ldr r0, .L_021e5628
    ldr r0, [r0, #0x5b0]
    cmp r0, #0x0
    bne .L_021e6100
    ldrh r0, [r4, #0x0]
    bl func_0202b878
    cmp r0, #0x16
    bne .L_021e5258
    ldr r2, .L_021e5650
    mov r0, r7
    mov r1, r8
    bl func_ov002_021b30ac
    cmp r0, #0x0
    beq .L_021e5258
    ldr r2, .L_021e5650
    mov r0, r7
    mov r1, r8
    mov r3, #0x1
    bl func_ov002_021b3774
    mov r1, r0, lsl #0x10
    and r0, r0, #0xff
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    ldr r6, .L_021e5638
    ldr r2, .L_021e5634
    and r5, r0, #0x1
    mla r6, r5, r2, r6
    and r1, r1, #0xff
    mov r3, #0x14
    smulbb r2, r1, r3
    add r3, r6, #0x30
    ldr r3, [r3, r2]
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    add r2, r2, r3, lsr #0x1f
    bl func_ov002_021df62c
    ldrh r0, [r4, #0x4]
    orr r1, r0, #0x4
    strh r1, [r4, #0x4]
    ldrh r0, [r4, #0x2]
    mov r2, r1, lsl #0x11
    mov r2, r2, lsr #0x17
    mov r1, r0, lsl #0x1a
    mov r3, r0, lsl #0x1f
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021d8904
    ldrh r0, [r4, #0x2]
    mov r1, r0, lsl #0x1a
    mov r1, r1, lsr #0x1b
    cmp r1, #0xa
    bhi .L_021e523c
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r7
    movne r2, #0x1
    ldr r3, .L_021e5650
    moveq r2, #0x0
    bl func_ov002_021de480
.L_021e523c:
    ldr r1, .L_021e5628
    add sp, sp, #0xe8
    ldr r2, [r1, #0x5a4]
    mov r0, #0x1
    add r2, r2, #0x1
    str r2, [r1, #0x5a4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_021e5258:
    ldrh r0, [r4, #0x0]
    bl func_0202b878
    cmp r0, #0x16
    bne .L_021e5334
    and r0, r7, #0x1
    mla r1, r0, r5, r6
    mov r0, #0x14
    mla r0, r8, r0, r1
    ldrh r0, [r0, #0x38]
    cmp r0, #0x0
    beq .L_021e5334
    mov r0, r7
    mov r1, r8
    bl func_ov002_021c8940
    cmp r0, #0xf
    bne .L_021e5334
    ldr r1, .L_021e5654
    mov r0, r7
    mov r2, r10
    bl func_ov002_021bae7c
    cmp r0, #0x0
    beq .L_021e5334
    ldr r1, .L_021e5654
    mov r0, r7
    bl func_ov002_021df680
    ldrh r0, [r4, #0x4]
    orr r1, r0, #0x4
    strh r1, [r4, #0x4]
    ldrh r0, [r4, #0x2]
    mov r2, r1, lsl #0x11
    mov r2, r2, lsr #0x17
    mov r1, r0, lsl #0x1a
    mov r3, r0, lsl #0x1f
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021d8904
    ldrh r0, [r4, #0x2]
    mov r1, r0, lsl #0x1a
    mov r1, r1, lsr #0x1b
    cmp r1, #0xa
    bhi .L_021e5318
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r7
    movne r2, #0x1
    ldr r3, .L_021e5650
    moveq r2, #0x0
    bl func_ov002_021de480
.L_021e5318:
    ldr r1, .L_021e5628
    add sp, sp, #0xe8
    ldr r2, [r1, #0x5a4]
    mov r0, #0x1
    add r2, r2, #0x1
    str r2, [r1, #0x5a4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_021e5334:
    ldrh r0, [r4, #0x0]
    bl func_0202e234
    cmp r0, #0x0
    bne .L_021e53d8
    ldrh r0, [r4, #0x6]
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    cmp r0, #0x1
    bne .L_021e53d8
    and r0, r7, #0x1
    mla r1, r0, r5, r6
    mov r0, #0x14
    mla r0, r8, r0, r1
    ldrh r0, [r0, #0x38]
    cmp r0, #0x0
    beq .L_021e53d8
    mov r0, r7
    mov r1, r8
    bl func_ov002_021c8940
    cmp r0, #0x7
    bne .L_021e53d8
    ldr r1, .L_021e564c
    mov r0, r7
    bl func_ov002_021bb444
    cmp r0, #0x0
    beq .L_021e53d8
    ldrh r0, [r4, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1f
    bne .L_021e53d8
    ldrh r0, [r4, #0x4]
    orr r0, r0, #0x4
    strh r0, [r4, #0x4]
    ldrh r1, [r4, #0x2]
    mov r0, r0, lsl #0x11
    mov r2, r0, lsr #0x17
    mov r0, r1, lsl #0x1f
    mov r1, r1, lsl #0x1a
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021d8904
.L_021e53d8:
    ldrh r0, [r4, #0x0]
    bl func_0202b878
    cmp r0, #0x16
    bne .L_021e54d0
    ldr r2, [sp, #0x2c]
    mov r0, r7
    mov r1, r8
    mov r3, #0x0
    bl func_ov002_021b3864
    ldr r1, [sp, #0x38]
    cmp r0, r1
    beq .L_021e54d0
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    and r0, r0, #0xff
    mov r1, r1, asr #0x8
    str r0, [sp, #0x14]
    and r0, r0, #0x1
    and r11, r1, #0xff
    mla r1, r0, r5, r6
    mov r0, #0x14
    smulbb r0, r11, r0
    add r1, r1, #0x30
    ldr r3, [r1, r0]
    ldr r0, [sp, #0x14]
    mov r2, r3, lsl #0x12
    mov r3, r3, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r3, r3, lsl #0x1
    mov r1, r11
    add r2, r3, r2, lsr #0x1f
    bl func_ov002_021df62c
    ldrh r0, [r4, #0x4]
    orr r0, r0, #0x4
    strh r0, [r4, #0x4]
    mov r0, r0, lsl #0x11
    ldrh r1, [r4, #0x2]
    mov r2, r0, lsr #0x17
    mov r0, r1, lsl #0x1f
    mov r1, r1, lsl #0x1a
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021d8904
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1a
    mov r1, r0, lsr #0x1b
    cmp r1, #0xa
    bhi .L_021e54bc
    mov r0, #0x0
    str r0, [sp, #0x0]
    ldrh r0, [r4, #0x2]
    ldr r2, .L_021e5654
    mov r3, #0x5
    mov r0, r0, lsl #0x1f
    add r2, r2, #0x2f8
    mov r0, r0, lsr #0x1f
    bl func_ov002_021d59cc
.L_021e54bc:
    ldr r0, [sp, #0x14]
    mov r1, r11
    mov r2, #0x5
    mov r3, #0x1
    bl func_ov002_021e2d94
.L_021e54d0:
    ldr r0, [sp, #0x3c]
    cmp r9, r0
    bgt .L_021e5584
    ldr r0, [sp, #0x40]
    cmp r9, r0
    bge .L_021e5b9c
    ldr r0, [sp, #0x44]
    cmp r9, r0
    bgt .L_021e554c
    ldr r0, [sp, #0x48]
    cmp r9, r0
    bge .L_021e58e4
    ldr r0, [sp, #0x4c]
    cmp r9, r0
    bgt .L_021e551c
    ldr r0, [sp, #0x50]
    cmp r9, r0
    beq .L_021e5664
    b .L_021e607c
.L_021e551c:
    ldr r0, [sp, #0x54]
    cmp r9, r0
    bgt .L_021e607c
    ldr r0, [sp, #0x58]
    cmp r9, r0
    blt .L_021e607c
    ldr r0, [sp, #0x5c]
    cmp r9, r0
    ldrne r0, [sp, #0x60]
    cmpne r9, r0
    beq .L_021e57f0
    b .L_021e607c
.L_021e554c:
    ldr r0, [sp, #0x64]
    cmp r9, r0
    bgt .L_021e5574
    ldr r0, [sp, #0x68]
    cmp r9, r0
    bge .L_021e59d8
    ldr r0, [sp, #0x6c]
    cmp r9, r0
    beq .L_021e58e4
    b .L_021e607c
.L_021e5574:
    ldr r0, [sp, #0x70]
    cmp r9, r0
    beq .L_021e59ec
    b .L_021e607c
.L_021e5584:
    ldr r0, [sp, #0x74]
    cmp r9, r0
    bgt .L_021e55f0
    ldr r0, [sp, #0x78]
    cmp r9, r0
    bge .L_021e5d74
    ldr r0, [sp, #0x7c]
    cmp r9, r0
    bgt .L_021e55e0
    ldr r0, [sp, #0x80]
    subs r0, r9, r0
    addpl pc, pc, r0, lsl #0x2
    b .L_021e55d0
    b .L_021e5f40
    b .L_021e607c
    b .L_021e5f40
    b .L_021e5f40
    b .L_021e5f40
    b .L_021e5f40
.L_021e55d0:
    ldr r0, [sp, #0x84]
    cmp r9, r0
    beq .L_021e5f40
    b .L_021e607c
.L_021e55e0:
    ldr r0, [sp, #0x88]
    cmp r9, r0
    beq .L_021e5c88
    b .L_021e607c
.L_021e55f0:
    ldr r0, [sp, #0x8c]
    cmp r9, r0
    bgt .L_021e5618
    ldr r0, [sp, #0x90]
    cmp r9, r0
    bge .L_021e5e44
    ldr r0, .L_021e5658
    cmp r9, r0
    beq .L_021e5664
    b .L_021e607c
.L_021e5618:
    ldr r0, [sp, #0x94]
    cmp r9, r0
    beq .L_021e58e4
    b .L_021e607c
.L_021e5628:
        .word   data_ov002_022ce288
.L_021e562c:
        .word   data_ov002_022ce588
.L_021e5630:
        .word   0x1ae0
.L_021e5634:
        .word   0x868
.L_021e5638:
        .word   data_ov002_022cf16c
.L_021e563c:
        .word   0x1aea
.L_021e5640:
        .word   data_ov002_022ce58a
.L_021e5644:
        .word   data_ov002_022d016c
.L_021e5648:
        .word   data_ov002_022d0e6c
.L_021e564c:
        .word   0x1a07
.L_021e5650:
        .word   0x1660
.L_021e5654:
        .word   0x14ca
.L_021e5658:
        .word   0x18bd
.L_021e565c:
        .word   data_ov002_022cf1a2
.L_021e5660:
        .word   0xffff803f
.L_021e5664:
    ldrh r0, [r4, #0x0]
    bl func_0202b878
    cmp r0, #0x16
    bne .L_021e607c
    ldrh r0, [r4, #0x6]
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    cmp r0, #0x1
    bne .L_021e607c
    and r1, r7, #0x1
    mul r0, r1, r5
    str r0, [sp, #0xc]
    mov r0, #0x14
    mul r11, r8, r0
    ldr r0, [sp, #0xc]
    add r0, r6, r0
    add r0, r0, r11
    str r0, [sp, #0x10]
    ldrh r0, [r0, #0x38]
    cmp r0, #0x0
    bne .L_021e607c
    mov r0, r7
    mov r1, r8
    bl func_ov002_021bd710
    cmp r0, #0x0
    bne .L_021e607c
    ldr r0, [sp, #0x10]
    ldrh r0, [r0, #0x36]
    cmp r0, #0x0
    beq .L_021e56f4
    mov r0, #0x0
    mov r1, #0xb
    add r2, r10, #0x12c0
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    bne .L_021e607c
.L_021e56f4:
    ldr r1, .L_021e565c
    ldr r0, [sp, #0xc]
    add r0, r1, r0
    ldrh r0, [r11, r0]
    cmp r0, #0x0
    bne .L_021e5728
    mov r2, #0x0
    str r9, [sp, #0x0]
    mov r0, r7
    mov r1, r8
    mov r3, r2
    str r2, [sp, #0x4]
    bl func_ov002_021d6870
.L_021e5728:
    mov r2, #0x0
    mov r0, r7
    mov r1, r8
    mov r3, r2
    str r2, [sp, #0x0]
    bl func_ov002_021d6434
    ldrh r1, [r4, #0x4]
    ldr r3, .L_021e5638
    mov r0, r7
    orr r1, r1, #0x2
    mov r2, r1, lsl #0x1e
    mov r5, r2, lsr #0x1f
    ldr r2, [sp, #0xc]
    bic r6, r1, #0x4
    mov r5, r5, lsl #0x1f
    orr r1, r6, r5, lsr #0x1d
    strh r1, [r4, #0x4]
    add r2, r3, r2
    ldrh r5, [r4, #0x4]
    add r2, r2, #0x30
    ldr r3, [r2, r11]
    mov r1, r5, lsl #0x1d
    mov r2, r3, lsl #0x2
    mov r1, r1, lsr #0x1f
    mov r2, r2, lsr #0x18
    bic r5, r5, #0x8
    mov r1, r1, lsl #0x1f
    orr r5, r5, r1, lsr #0x1c
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    mov r1, r8
    strh r5, [r4, #0x4]
    add r2, r2, r3, lsr #0x1f
    bl func_ov002_021df62c
    ldrh r1, [r4, #0x2]
    ldrh r0, [r4, #0x4]
    mov r3, r1, lsl #0x1f
    mov r2, r0, lsl #0x11
    mov r1, r1, lsl #0x1a
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r2, r2, lsr #0x17
    bl func_ov002_021d8904
    ldr r1, .L_021e5628
    add sp, sp, #0xe8
    ldr r2, [r1, #0x5a4]
    mov r0, #0x1
    add r2, r2, #0x1
    str r2, [r1, #0x5a4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_021e57f0:
    ldrh r0, [r4, #0x0]
    bl func_0202b878
    cmp r0, #0x16
    bne .L_021e607c
    and r0, r7, #0x1
    mla r3, r0, r5, r6
    mov r0, #0x14
    mul r2, r8, r0
    add r0, r3, r2
    ldr r1, [r0, #0x40]
    ldrh r0, [r0, #0x38]
    mov r11, r1, lsr #0x6
    and r11, r11, #0x1
    mvn r11, r11
    and r0, r0, r11
    mov r11, r1, lsr #0x2
    orr r1, r11, r1, lsr #0x1
    and r1, r1, #0x1
    mvn r1, r1
    tst r0, r1
    beq .L_021e607c
    add r0, r3, #0x30
    ldr r2, [r0, r2]
    mov r0, r7
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r3, r2, lsl #0x12
    mov r2, r1, lsl #0x1
    mov r1, r8
    add r2, r2, r3, lsr #0x1f
    bl func_ov002_021df62c
    ldrh r0, [r4, #0x4]
    orr r1, r0, #0x4
    strh r1, [r4, #0x4]
    ldrh r0, [r4, #0x2]
    mov r2, r1, lsl #0x11
    mov r2, r2, lsr #0x17
    mov r1, r0, lsl #0x1a
    mov r3, r0, lsl #0x1f
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021d8904
    ldrh r0, [r4, #0x2]
    mov r1, r0, lsl #0x1a
    mov r1, r1, lsr #0x1b
    cmp r1, #0xa
    bhi .L_021e58c8
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r7
    movne r2, #0x1
    ldr r3, .L_021e5650
    moveq r2, #0x0
    bl func_ov002_021de480
.L_021e58c8:
    ldr r1, .L_021e5628
    add sp, sp, #0xe8
    ldr r2, [r1, #0x5a4]
    mov r0, #0x1
    add r2, r2, #0x1
    str r2, [r1, #0x5a4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_021e58e4:
    ldrh r0, [r4, #0x0]
    bl func_0202b878
    cmp r0, #0x17
    bne .L_021e607c
    and r0, r7, #0x1
    mla r3, r0, r5, r6
    mov r0, #0x14
    mul r2, r8, r0
    add r0, r3, r2
    ldr r1, [r0, #0x40]
    ldrh r0, [r0, #0x38]
    mov r11, r1, lsr #0x6
    and r11, r11, #0x1
    mvn r11, r11
    and r0, r0, r11
    mov r11, r1, lsr #0x2
    orr r1, r11, r1, lsr #0x1
    and r1, r1, #0x1
    mvn r1, r1
    tst r0, r1
    beq .L_021e607c
    add r0, r3, #0x30
    ldr r2, [r0, r2]
    mov r0, r7
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r3, r2, lsl #0x12
    mov r2, r1, lsl #0x1
    mov r1, r8
    add r2, r2, r3, lsr #0x1f
    bl func_ov002_021df62c
    ldrh r0, [r4, #0x4]
    orr r1, r0, #0x4
    strh r1, [r4, #0x4]
    ldrh r0, [r4, #0x2]
    mov r2, r1, lsl #0x11
    mov r2, r2, lsr #0x17
    mov r1, r0, lsl #0x1a
    mov r3, r0, lsl #0x1f
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021d8904
    ldrh r0, [r4, #0x2]
    mov r1, r0, lsl #0x1a
    mov r1, r1, lsr #0x1b
    cmp r1, #0xa
    bhi .L_021e59bc
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r7
    movne r2, #0x1
    ldr r3, .L_021e5650
    moveq r2, #0x0
    bl func_ov002_021de480
.L_021e59bc:
    ldr r1, .L_021e5628
    add sp, sp, #0xe8
    ldr r2, [r1, #0x5a4]
    mov r0, #0x1
    add r2, r2, #0x1
    str r2, [r1, #0x5a4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_021e59d8:
    mov r0, r7
    mov r1, r8
    bl func_ov002_021b9bd4
    cmp r0, #0x0
    beq .L_021e607c
.L_021e59ec:
    ldrh r0, [r4, #0x0]
    bl func_0202e234
    cmp r0, #0x0
    bne .L_021e607c
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x12
    movs r0, r0, lsr #0x1e
    bne .L_021e607c
    and r0, r7, #0x1
    mla r1, r0, r5, r6
    mov r0, #0x14
    mul r0, r8, r0
    add r2, r1, r0
    ldr r3, [r2, #0x40]
    ldrh r2, [r2, #0x38]
    mov r11, r3, lsr #0x6
    and r11, r11, #0x1
    mvn r11, r11
    and r2, r2, r11
    mov r11, r3, lsr #0x2
    orr r3, r11, r3, lsr #0x1
    and r3, r3, #0x1
    mvn r3, r3
    tst r2, r3
    beq .L_021e607c
    add r5, sp, #0xd0
    mov r3, #0x0
    str r3, [r5, #0x0]
    ldrh r2, [sp, #0xd2]
    add r1, r1, #0x30
    ldr r6, [r1, r0]
    bic r0, r2, #0x3000
    orr r0, r0, #0x1000
    strh r0, [sp, #0xd2]
    ldrh r1, [sp, #0xd2]
    mov r2, r6, lsl #0x2
    mov r0, r7, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r2, r2, lsr #0x18
    str r3, [r5, #0x4]
    bic r1, r1, #0x1
    and r0, r0, #0x1
    orr r0, r1, r0
    strh r0, [sp, #0xd2]
    ldrh r1, [sp, #0xd2]
    mov r0, r8, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r6, r6, lsl #0x12
    mov r2, r2, lsl #0x1
    add r2, r2, r6, lsr #0x1f
    mov r6, r2, lsl #0x10
    mov r10, r6, lsr #0x10
    ldrh r11, [sp, #0xd4]
    ldr r6, .L_021e5660
    mov r10, r10, lsl #0x17
    and r6, r11, r6
    orr r6, r6, r10, lsr #0x11
    bic r1, r1, #0x3e
    mov r0, r0, lsl #0x1b
    orr r10, r1, r0, lsr #0x1a
    mov r0, r7
    mov r1, r8
    str r3, [r5, #0x8]
    str r3, [r5, #0xc]
    str r3, [r5, #0x10]
    str r3, [r5, #0x14]
    strh r9, [sp, #0xd0]
    strh r6, [sp, #0xd4]
    strh r10, [sp, #0xd2]
    bl func_ov002_021df62c
    ldrh r0, [r4, #0x4]
    orr r2, r0, #0x2
    mov r0, r2, lsl #0x1e
    mov r0, r0, lsr #0x1f
    bic r1, r2, #0x4
    mov r0, r0, lsl #0x1f
    orr r0, r1, r0, lsr #0x1d
    strh r0, [r4, #0x4]
    ldrh r1, [r4, #0x4]
    mov r0, r1, lsl #0x1d
    mov r0, r0, lsr #0x1f
    bic r1, r1, #0x8
    mov r0, r0, lsl #0x1f
    orr r0, r1, r0, lsr #0x1c
    strh r0, [r4, #0x4]
    ldrh r1, [r4, #0x2]
    ldrh r0, [r4, #0x4]
    mov r3, r1, lsl #0x1f
    mov r2, r0, lsl #0x11
    mov r1, r1, lsl #0x1a
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r2, r2, lsr #0x17
    bl func_ov002_021d8904
    ldrh r1, [r4, #0x2]
    mov r0, r5
    mov r2, r1, lsl #0x1a
    mov r3, r1, lsl #0x1f
    mov r1, r3, lsr #0x1f
    mov r2, r2, lsr #0x1b
    bl func_ov002_021de598
    ldr r1, .L_021e5628
    add sp, sp, #0xe8
    ldr r2, [r1, #0x5a4]
    mov r0, #0x1
    add r2, r2, #0x1
    str r2, [r1, #0x5a4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_021e5b9c:
    ldrh r0, [r4, #0x0]
    bl func_0202e234
    cmp r0, #0x0
    beq .L_021e607c
    ldrh r0, [r4, #0x6]
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    cmp r0, #0x1
    bne .L_021e607c
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1a
    mov r0, r0, lsr #0x1b
    cmp r0, #0x4
    bls .L_021e5bdc
    cmp r0, #0xa
    bls .L_021e607c
.L_021e5bdc:
    and r0, r7, #0x1
    mla r3, r0, r5, r6
    mov r0, #0x14
    mul r2, r8, r0
    add r0, r3, r2
    ldr r1, [r0, #0x40]
    ldrh r0, [r0, #0x38]
    mov r11, r1, lsr #0x6
    and r11, r11, #0x1
    mvn r11, r11
    and r0, r0, r11
    mov r11, r1, lsr #0x2
    orr r1, r11, r1, lsr #0x1
    and r1, r1, #0x1
    mvn r1, r1
    tst r0, r1
    beq .L_021e607c
    ldrh r0, [r4, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1f
    bne .L_021e607c
    add r0, r3, #0x30
    ldr r3, [r0, r2]
    mov r0, r7
    mov r2, r3, lsl #0x12
    mov r3, r3, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r3, r3, lsl #0x1
    mov r1, r8
    add r2, r3, r2, lsr #0x1f
    bl func_ov002_021df62c
    ldrh r0, [r4, #0x4]
    orr r0, r0, #0x4
    strh r0, [r4, #0x4]
    mov r0, r0, lsl #0x11
    ldrh r1, [r4, #0x2]
    mov r2, r0, lsr #0x17
    mov r0, r1, lsl #0x1f
    mov r1, r1, lsl #0x1a
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021d8904
    b .L_021e607c
.L_021e5c88:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r7
    beq .L_021e607c
    ldrh r0, [r4, #0x0]
    bl func_0202e234
    cmp r0, #0x0
    beq .L_021e5cc8
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1a
    mov r0, r0, lsr #0x1b
    cmp r0, #0x5
    blo .L_021e607c
    cmp r0, #0xa
    bhs .L_021e607c
.L_021e5cc8:
    and r0, r7, #0x1
    mla r3, r0, r5, r6
    mov r0, #0x14
    mul r2, r8, r0
    add r0, r3, r2
    ldr r1, [r0, #0x40]
    ldrh r0, [r0, #0x38]
    mov r11, r1, lsr #0x6
    and r11, r11, #0x1
    mvn r11, r11
    and r0, r0, r11
    mov r11, r1, lsr #0x2
    orr r1, r11, r1, lsr #0x1
    and r1, r1, #0x1
    mvn r1, r1
    tst r0, r1
    beq .L_021e607c
    ldrh r0, [r4, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1f
    bne .L_021e607c
    add r0, r3, #0x30
    ldr r3, [r0, r2]
    mov r0, r7
    mov r2, r3, lsl #0x12
    mov r3, r3, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r3, r3, lsl #0x1
    mov r1, r8
    add r2, r3, r2, lsr #0x1f
    bl func_ov002_021df62c
    ldrh r0, [r4, #0x4]
    orr r0, r0, #0x4
    strh r0, [r4, #0x4]
    mov r0, r0, lsl #0x11
    ldrh r1, [r4, #0x2]
    mov r2, r0, lsr #0x17
    mov r0, r1, lsl #0x1f
    mov r1, r1, lsl #0x1a
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021d8904
    b .L_021e607c
.L_021e5d74:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r7
    beq .L_021e607c
    ldrh r0, [r4, #0x0]
    bl func_0202b878
    cmp r0, #0x16
    bne .L_021e607c
    and r0, r7, #0x1
    mla r3, r0, r5, r6
    mov r0, #0x14
    mul r2, r8, r0
    add r0, r3, r2
    ldr r1, [r0, #0x40]
    ldrh r0, [r0, #0x38]
    mov r11, r1, lsr #0x6
    and r11, r11, #0x1
    mvn r11, r11
    and r0, r0, r11
    mov r11, r1, lsr #0x2
    orr r1, r11, r1, lsr #0x1
    and r1, r1, #0x1
    mvn r1, r1
    tst r0, r1
    beq .L_021e607c
    ldrh r0, [r4, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1f
    bne .L_021e607c
    add r0, r3, #0x30
    ldr r3, [r0, r2]
    mov r0, r7
    mov r2, r3, lsl #0x12
    mov r3, r3, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r3, r3, lsl #0x1
    mov r1, r8
    add r2, r3, r2, lsr #0x1f
    bl func_ov002_021df62c
    ldrh r0, [r4, #0x4]
    orr r0, r0, #0x4
    strh r0, [r4, #0x4]
    mov r0, r0, lsl #0x11
    ldrh r1, [r4, #0x2]
    mov r2, r0, lsr #0x17
    mov r0, r1, lsl #0x1f
    mov r1, r1, lsl #0x1a
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021d8904
    b .L_021e607c
.L_021e5e44:
    ldrh r0, [r4, #0x6]
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    cmp r0, #0x1
    bne .L_021e607c
    ldrh r0, [r4, #0x0]
    bl func_0202e234
    cmp r0, #0x0
    beq .L_021e5e84
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1a
    mov r0, r0, lsr #0x1b
    cmp r0, #0x5
    blo .L_021e607c
    cmp r0, #0xa
    bhs .L_021e607c
.L_021e5e84:
    and r0, r7, #0x1
    mla r1, r0, r5, r6
    mov r0, #0x14
    mul r0, r8, r0
    add r2, r1, r0
    ldr r11, [r2, #0x3c]
    ldr r3, [sp, #0x98]
    cmp r11, r3
    bne .L_021e607c
    ldr r3, [r2, #0x40]
    ldrh r2, [r2, #0x38]
    mov r11, r3, lsr #0x6
    and r11, r11, #0x1
    mvn r11, r11
    and r2, r2, r11
    mov r11, r3, lsr #0x2
    orr r3, r11, r3, lsr #0x1
    and r3, r3, #0x1
    mvn r3, r3
    tst r2, r3
    beq .L_021e607c
    ldrh r2, [r4, #0x4]
    mov r2, r2, lsl #0x1d
    movs r2, r2, lsr #0x1f
    bne .L_021e607c
    add r1, r1, #0x30
    ldr r3, [r1, r0]
    mov r0, r7
    mov r2, r3, lsl #0x12
    mov r3, r3, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r3, r3, lsl #0x1
    mov r1, r8
    add r2, r3, r2, lsr #0x1f
    bl func_ov002_021df62c
    ldrh r0, [r4, #0x4]
    orr r0, r0, #0x4
    strh r0, [r4, #0x4]
    mov r0, r0, lsl #0x11
    ldrh r1, [r4, #0x2]
    mov r2, r0, lsr #0x17
    mov r0, r1, lsl #0x1f
    mov r1, r1, lsl #0x1a
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021d8904
    b .L_021e607c
.L_021e5f40:
    and r0, r7, #0x1
    mla r2, r0, r5, r6
    mov r0, #0x14
    mul r0, r8, r0
    add r1, r2, r0
    ldr r3, [r1, #0x40]
    ldrh r1, [r1, #0x38]
    mov r11, r3, lsr #0x6
    and r11, r11, #0x1
    mvn r11, r11
    and r1, r1, r11
    mov r11, r3, lsr #0x2
    orr r3, r11, r3, lsr #0x1
    and r3, r3, #0x1
    mvn r3, r3
    tst r1, r3
    beq .L_021e607c
    ldrh r1, [r4, #0x2]
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    cmp r1, r7
    beq .L_021e607c
    ldr r1, .L_021e5648
    ldrh r1, [r1, #0xb0]
    cmp r1, #0x0
    bne .L_021e5fe8
    add r1, r2, #0x30
    ldr r2, [r1, r0]
    mov r0, r7
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r3, r2, lsl #0x12
    mov r2, r1, lsl #0x1
    mov r1, r8
    add r2, r2, r3, lsr #0x1f
    bl func_ov002_021df62c
    mov r0, r7
    mov r1, r8
    bl func_ov002_0226b258
    add sp, sp, #0xe8
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_021e5fe8:
    mov r0, r9
    bl func_ov002_021b9144
    cmp r0, #0x0
    beq .L_021e6070
    ldrh r0, [r4, #0x4]
    orr r1, r0, #0x4
    strh r1, [r4, #0x4]
    ldrh r0, [r4, #0x2]
    mov r2, r1, lsl #0x11
    mov r2, r2, lsr #0x17
    mov r1, r0, lsl #0x1a
    mov r3, r0, lsl #0x1f
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021d8904
    ldrh r0, [r4, #0x2]
    mov r1, r0, lsl #0x1a
    mov r1, r1, lsr #0x1b
    cmp r1, #0xa
    bhi .L_021e6054
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r7
    movne r2, #0x1
    moveq r2, #0x0
    mov r3, r9
    bl func_ov002_021de480
.L_021e6054:
    ldr r1, .L_021e5628
    add sp, sp, #0xe8
    ldr r2, [r1, #0x5a4]
    mov r0, #0x1
    add r2, r2, #0x1
    str r2, [r1, #0x5a4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_021e6070:
    ldr r0, .L_021e5648
    mov r1, #0x0
    strh r1, [r0, #0xb0]
.L_021e607c:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r7
    beq .L_021e625c
    mov r0, r9
    bl func_0202e42c
    cmp r0, #0x0
    beq .L_021e625c
    and r0, r7, #0x1
    mla r1, r0, r5, r6
    mov r0, #0x14
    mla r0, r8, r0, r1
    ldrh r0, [r0, #0x38]
    cmp r0, #0x0
    beq .L_021e625c
    ldr r1, .L_021e5654
    mov r0, r7
    add r1, r1, #0x1c4
    mov r2, r10
    bl func_ov002_021bae7c
    cmp r0, #0x0
    beq .L_021e625c
    mov r0, r7
    mov r1, r9
    bl func_ov002_021df6d4
    ldr r1, .L_021e5628
    add sp, sp, #0xe8
    ldr r2, [r1, #0x5b0]
    mov r0, #0x1
    add r2, r2, #0x1
    str r2, [r1, #0x5b0]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_021e6100:
    ldr r1, .L_021e5654
    mov r0, r7
    add r1, r1, #0x1c4
    mov r2, r10
    bl func_ov002_021bae7c
    ldr r1, .L_021e5628
    ldr r1, [r1, #0x5b0]
    cmp r1, r0
    bgt .L_021e625c
    ldr r0, .L_021e5648
    ldrh r1, [r0, #0xb0]
    cmp r1, #0x0
    bne .L_021e614c
    mov r0, r7
    mov r1, r8
    bl func_ov002_0226b258
    add sp, sp, #0xe8
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_021e614c:
    ldr r0, .L_021e6d5c
    bl func_ov002_021b9144
    cmp r0, #0x0
    beq .L_021e61d4
    ldrh r0, [r4, #0x4]
    orr r1, r0, #0x4
    strh r1, [r4, #0x4]
    ldrh r0, [r4, #0x2]
    mov r2, r1, lsl #0x11
    mov r2, r2, lsr #0x17
    mov r1, r0, lsl #0x1a
    mov r3, r0, lsl #0x1f
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021d8904
    ldrh r0, [r4, #0x2]
    mov r1, r0, lsl #0x1a
    mov r1, r1, lsr #0x1b
    cmp r1, #0xa
    bhi .L_021e61b8
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r7
    movne r2, #0x1
    moveq r2, #0x0
    mov r3, r9
    bl func_ov002_021de480
.L_021e61b8:
    ldr r1, .L_021e5628
    add sp, sp, #0xe8
    ldr r2, [r1, #0x5a4]
    mov r0, #0x1
    add r2, r2, #0x1
    str r2, [r1, #0x5a4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_021e61d4:
    ldr r0, .L_021e5648
    mov r2, #0x0
    strh r2, [r0, #0xb0]
    ldr r1, .L_021e5628
    add sp, sp, #0xe8
    ldr r2, [r1, #0x5b0]
    mov r0, #0x1
    add r2, r2, #0x1
    str r2, [r1, #0x5b0]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_021e61fc:
    cmp r8, #0xe
    bne .L_021e625c
    ldrh r0, [r4, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1f
    bne .L_021e625c
    ldr r0, [sp, #0x30]
    bl func_ov002_021bb068
    cmp r0, #0x0
    beq .L_021e625c
    ldr r1, [sp, #0x30]
    mov r0, r10
    bl func_ov002_021df680
    ldrh r0, [r4, #0x4]
    orr r0, r0, #0x4
    strh r0, [r4, #0x4]
    mov r0, r0, lsl #0x11
    ldrh r1, [r4, #0x2]
    mov r2, r0, lsr #0x17
    mov r0, r1, lsl #0x1f
    mov r1, r1, lsl #0x1a
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021d8904
.L_021e625c:
    ldr r0, .L_021e5628
    mov r2, #0x0
    ldr r0, [r0, #0x5ac]
    add r1, r0, #0x1
    ldr r0, .L_021e5628
    str r1, [r0, #0x5ac]
    str r2, [r0, #0x5b0]
    ldrh r0, [r4, #0x6]
    mov r0, r0, lsl #0x18
    cmp r1, r0, lsr #0x18
    blt .L_021e50dc
.L_021e6288:
    ldr r1, .L_021e5628
    add sp, sp, #0xe8
    ldr r2, [r1, #0x5a4]
    mov r0, #0x1
    add r2, r2, #0x1
    str r2, [r1, #0x5a4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_021e62a4:
    str r4, [r1, #0x48c]
    mov r0, #0x80
    str r0, [r1, #0x5a8]
    mov r2, #0x0
    str r2, [r1, #0x5ac]
    mov r0, r4
    str r2, [r1, #0x5b0]
    bl func_ov002_021e2e38
    cmp r0, #0x0
    beq .L_021e62ec
    ldr r1, .L_021e5628
    mov r0, #0x18
    ldr r1, [r1, #0x480]
    mov r2, r4
    mov r3, r0
    sub r1, r1, #0x1
    bl func_ov002_021b1570
    b .L_021e6394
.L_021e62ec:
    ldrh r0, [r4, #0x4]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    bne .L_021e6364
    ldrh r0, [r4, #0x0]
    bl func_0202e234
    cmp r0, #0x0
    bne .L_021e6350
    ldrh r2, [r4, #0x2]
    ldr r0, .L_021e6d60
    mov r1, r2, lsl #0x11
    mov r2, r2, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r3, [r0, #0x4]
    eor r0, r1, r2, lsr #0x1f
    cmp r3, r0
    bne .L_021e6350
    ldrh r0, [r4, #0x4]
    ldr r2, .L_021e6d64
    mov r0, r0, lsl #0x11
    mov r0, r0, lsr #0x17
    mov r1, r0, lsl #0x2
    ldrh r0, [r2, r1]
    orr r0, r0, #0x8000
    strh r0, [r2, r1]
.L_021e6350:
    ldr r1, .L_021e5628
    mov r0, r4
    ldr r1, [r1, #0x480]
    sub r1, r1, #0x1
    bl func_ov002_021b0c54
.L_021e6364:
    mov r0, r4
    bl func_ov002_021fd928
    cmp r0, #0x0
    bne .L_021e6394
    ldr r0, .L_021e5628
    mov r1, #0x0
    str r1, [r0, #0x5a8]
    mov r1, #0x7
    str r1, [r0, #0x5a4]
    add sp, sp, #0xe8
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_021e6394:
    ldr r1, .L_021e5628
    add sp, sp, #0xe8
    ldr r2, [r1, #0x5a4]
    mov r0, #0x1
    add r2, r2, #0x1
    str r2, [r1, #0x5a4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_021e63b0:
    mov r0, r4
    bl func_ov002_021e2e38
    cmp r0, #0x0
    bne .L_021e63d4
    ldr r1, [sp, #0x8]
    mov r0, r4
    bl func_ov002_02257cfc
    ldr r1, .L_021e5628
    str r0, [r1, #0x5a8]
.L_021e63d4:
    ldr r0, .L_021e5628
    add sp, sp, #0xe8
    ldr r1, [r0, #0x5a8]
    cmp r1, #0x0
    ldreq r1, [r0, #0x5a4]
    addeq r1, r1, #0x1
    streq r1, [r0, #0x5a4]
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_021e63f8:
    ldrh r0, [r4, #0x2]
    mov r1, r0, lsl #0x1a
    mov r3, r1, lsr #0x1b
    cmp r3, #0xa
    bhi .L_021e64a0
    mov r0, r0, lsl #0x1f
    mov r1, r0, lsr #0x1f
    ldr r0, .L_021e5634
    and r2, r1, #0x1
    mov r1, #0x14
    mul r0, r2, r0
    ldr r2, .L_021e5638
    mul r1, r3, r1
    add r2, r2, r0
    add r2, r2, #0x30
    ldr r3, [r2, r1]
    ldrh r5, [r4, #0x4]
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    mov r5, r5, lsl #0x11
    add r2, r2, r3, lsr #0x1f
    cmp r2, r5, lsr #0x17
    bne .L_021e64a0
    ldr r2, .L_021e6d68
    add r0, r2, r0
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    beq .L_021e64a0
    mov r0, r4
    bl func_ov002_021e381c
    cmp r0, #0x0
    beq .L_021e64a0
    ldrh r0, [r4, #0x2]
    mov r2, #0x3
    mov r3, #0x1
    mov r5, r0, lsl #0x1f
    mov r1, r0, lsl #0x1a
    mov r0, r5, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021e2d94
.L_021e64a0:
    ldrh r0, [r4, #0x4]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    bne .L_021e69a4
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x12
    movs r0, r0, lsr #0x1e
    bne .L_021e69a4
    mov r0, #0x0
    str r0, [sp, #0x28]
.L_021e64c8:
    ldr r0, .L_021e5644
    ldr r2, .L_021e5638
    ldr r3, [r0, #0xcec]
    ldr r0, [sp, #0x28]
    ldr r1, .L_021e5634
    eor r5, r3, r0
    and r0, r5, #0x1
    mla r8, r0, r1, r2
    mov r0, r5, lsl #0x1f
    and r0, r0, #0x80000000
    str r0, [sp, #0x1c]
    orr r0, r0, #0x200000
    str r0, [sp, #0x18]
    ldr r0, .L_021e6d6c
    add r9, r8, #0x30
    sub r0, r0, #0xc4
    str r0, [sp, #0x34]
    ldr r0, .L_021e6d6c
    rsb r10, r5, #0x1
    sub r0, r0, #0xe0
    str r0, [sp, #0xa0]
    ldr r0, .L_021e6d6c
    mov r6, #0x0
    sub r0, r0, #0x23
    str r0, [sp, #0xa8]
    ldr r0, .L_021e6d70
    add r0, r0, #0xde
    str r0, [sp, #0x9c]
    ldr r0, .L_021e6d74
    sub r0, r0, #0x194
    str r0, [sp, #0xa4]
    ldr r0, .L_021e6d6c
    add r0, r0, #0x3f
    str r0, [sp, #0xac]
    ldr r0, .L_021e6d6c
    add r0, r0, #0x2a4
    str r0, [sp, #0xb4]
    ldr r0, .L_021e6d78
    add r0, r0, #0xbe
    str r0, [sp, #0xc0]
    ldr r0, .L_021e6d78
    add r0, r0, #0xc2
    str r0, [sp, #0xc4]
    ldr r0, .L_021e6d78
    add r0, r0, #0x1e
    str r0, [sp, #0xb0]
    ldr r0, .L_021e6d78
    add r0, r0, #0xc2
    str r0, [sp, #0xb8]
    ldr r0, .L_021e6d78
    add r0, r0, #0xd3
    str r0, [sp, #0xc8]
    ldr r0, .L_021e6d78
    add r0, r0, #0xbe
    str r0, [sp, #0xbc]
.L_021e65a4:
    mov r0, r5
    mov r1, r6
    bl func_ov002_021b9ecc
    movs r7, r0
    beq .L_021e697c
    ldr r0, [r8, #0x40]
    ldrh r2, [r8, #0x38]
    mov r1, r0, lsr #0x6
    and r1, r1, #0x1
    mvn r1, r1
    and r2, r2, r1
    mov r1, r0, lsr #0x2
    orr r0, r1, r0, lsr #0x1
    and r0, r0, #0x1
    mvn r0, r0
    tst r2, r0
    beq .L_021e697c
    ldrh r3, [r4, #0x4]
    ldr r2, [sp, #0x34]
    mov r0, r5
    mov r3, r3, lsl #0x11
    mov r1, r6
    mov r3, r3, lsr #0x17
    bl func_ov002_021b3fd8
    cmp r0, #0x0
    beq .L_021e697c
    mov r0, r7
    bl func_0202e234
    cmp r0, #0x0
    beq .L_021e6628
    cmp r6, #0x5
    bge .L_021e697c
    b .L_021e6630
.L_021e6628:
    cmp r6, #0x4
    ble .L_021e697c
.L_021e6630:
    ldr r0, .L_021e6d74
    cmp r7, r0
    bgt .L_021e6694
    bge .L_021e6778
    ldr r0, [sp, #0x9c]
    cmp r7, r0
    bgt .L_021e6668
    ldr r0, [sp, #0xa0]
    cmp r7, r0
    bge .L_021e66fc
    ldr r0, .L_021e6d70
    cmp r7, r0
    beq .L_021e6730
    b .L_021e68f8
.L_021e6668:
    ldr r0, [sp, #0xa4]
    cmp r7, r0
    bgt .L_021e6684
    ldr r0, [sp, #0xa8]
    cmp r7, r0
    beq .L_021e684c
    b .L_021e68f8
.L_021e6684:
    ldr r0, [sp, #0xac]
    cmp r7, r0
    beq .L_021e6778
    b .L_021e68f8
.L_021e6694:
    ldr r0, [sp, #0xb0]
    cmp r7, r0
    bgt .L_021e66bc
    ldr r0, [sp, #0xb4]
    cmp r7, r0
    bge .L_021e6810
    ldr r0, .L_021e6d78
    cmp r7, r0
    beq .L_021e67c4
    b .L_021e68f8
.L_021e66bc:
    ldr r0, [sp, #0xb8]
    cmp r7, r0
    bgt .L_021e66ec
    ldr r0, [sp, #0xbc]
    cmp r7, r0
    blt .L_021e68f8
    ldr r0, [sp, #0xc0]
    cmp r7, r0
    ldrne r0, [sp, #0xc4]
    cmpne r7, r0
    beq .L_021e68b4
    b .L_021e68f8
.L_021e66ec:
    ldr r0, [sp, #0xc8]
    cmp r7, r0
    beq .L_021e68b4
    b .L_021e68f8
.L_021e66fc:
    ldr r2, [r9, #0x0]
    mov r0, r5
    mov r3, r2, lsl #0x12
    mov r2, r2, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r2, r2, lsl #0x1
    mov r1, r6
    add r2, r2, r3, lsr #0x1f
    bl func_ov002_021df62c
    mov r0, r5
    mov r1, #0x1f4
    bl func_ov002_021e05fc
    b .L_021e697c
.L_021e6730:
    ldr r3, [r9, #0x0]
    mov r0, r5
    mov r2, r3, lsl #0x12
    mov r3, r3, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r3, r3, lsl #0x1
    mov r1, r6
    add r2, r3, r2, lsr #0x1f
    bl func_ov002_021df62c
    mov r0, r7, lsl #0x10
    mov r2, r0, lsr #0x10
    mov r0, #0xc8
    str r0, [sp, #0x0]
    mov r0, r5
    mov r1, r6
    mov r3, #0x2
    bl func_ov002_021d59cc
    b .L_021e697c
.L_021e6778:
    ldr r3, [r9, #0x0]
    mov r0, r5
    mov r2, r3, lsl #0x12
    mov r3, r3, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r3, r3, lsl #0x1
    mov r1, r6
    add r2, r3, r2, lsr #0x1f
    bl func_ov002_021df62c
    ldrh r0, [r4, #0x2]
    mov r3, r7
    mov r1, #0x3e8
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r5
    movne r2, #0x1
    moveq r2, #0x0
    bl func_ov002_021df938
    b .L_021e697c
.L_021e67c4:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    cmp r5, r0, lsr #0x1f
    bne .L_021e697c
    ldr r3, [r9, #0x0]
    mov r0, r5
    mov r2, r3, lsl #0x12
    mov r3, r3, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r3, r3, lsl #0x1
    mov r1, r6
    add r2, r3, r2, lsr #0x1f
    bl func_ov002_021df62c
    mov r3, r7
    mov r0, r10
    mov r1, #0x190
    mov r2, #0x1
    bl func_ov002_021df938
    b .L_021e697c
.L_021e6810:
    ldr r3, [r9, #0x0]
    mov r0, r5
    mov r2, r3, lsl #0x12
    mov r3, r3, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r3, r3, lsl #0x1
    mov r1, r6
    add r2, r3, r2, lsr #0x1f
    bl func_ov002_021df62c
    mov r3, r7
    mov r0, r10
    mov r1, #0x3e8
    mov r2, #0x1
    bl func_ov002_021df938
    b .L_021e697c
.L_021e684c:
    ldrh r0, [r4, #0x2]
    mov r1, r7, lsl #0x10
    mov r0, r0, lsl #0x1f
    cmp r5, r0, lsr #0x1f
    movne r0, #0x1
    moveq r0, #0x0
    mov r0, r0, lsl #0x18
    and r2, r0, #0x1000000
    ldr r0, [sp, #0x1c]
    orr r0, r0, r2
    mov r2, r6, lsl #0x10
    orr r0, r0, #0x200000
    and r2, r2, #0x1f0000
    orr r0, r2, r0
    orr r0, r0, r1, lsr #0x10
    ldr r1, [r9, #0x0]
    mov r2, #0x0
    mov r3, r1, lsl #0x12
    mov r1, r1, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r1, r1, lsl #0x1
    add r1, r1, r3, lsr #0x1f
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021e30b4
    b .L_021e697c
.L_021e68b4:
    mov r0, r6, lsl #0x10
    and r2, r0, #0x1f0000
    ldr r0, [sp, #0x18]
    mov r1, r7, lsl #0x10
    orr r0, r0, r2
    orr r0, r0, r1, lsr #0x10
    ldr r1, [r9, #0x0]
    mov r2, #0x0
    mov r3, r1, lsl #0x12
    mov r1, r1, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r1, r1, lsl #0x1
    add r1, r1, r3, lsr #0x1f
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021e30b4
    b .L_021e697c
.L_021e68f8:
    mov r0, r5
    mov r1, r6
    bl func_ov002_021b9e00
    mov r11, r0
    mov r0, r7
    bl func_020310d8
    cmp r11, r0
    bge .L_021e697c
    mov r0, r5
    mov r1, r6
    mov r2, #0x1
    bl func_ov002_021d91e0
    mov r0, r5
    mov r1, r6
    bl func_ov002_021b9ecc
    ldr r1, .L_021e6d6c
    cmp r0, r1
    bne .L_021e697c
    mov r0, r5
    mov r1, r6
    bl func_ov002_021b9e00
    add r0, r0, #0x1
    cmp r0, #0x4
    bne .L_021e697c
    ldrh r2, [r4, #0x2]
    mov r0, r5
    mov r1, r6
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    str r2, [sp, #0x0]
    ldr r2, .L_021e6d6c
    mov r3, #0x3
    bl func_ov002_021d59cc
.L_021e697c:
    add r8, r8, #0x14
    add r9, r9, #0x14
    add r6, r6, #0x1
    cmp r6, #0xa
    ble .L_021e65a4
    ldr r0, [sp, #0x28]
    add r0, r0, #0x1
    str r0, [sp, #0x28]
    cmp r0, #0x2
    blt .L_021e64c8
.L_021e69a4:
    ldrh r0, [r4, #0x4]
    mov r1, r0, lsl #0x1e
    movs r1, r1, lsr #0x1f
    bne .L_021e6abc
    mov r0, r0, lsl #0x1a
    movs r0, r0, lsr #0x1f
    beq .L_021e69d0
    ldrh r1, [r4, #0x18]
    ldr r0, .L_021e6d7c
    cmp r1, r0
    beq .L_021e6abc
.L_021e69d0:
    ldrh r0, [r4, #0x6]
    mov r0, r0, lsl #0x18
    movs r0, r0, lsr #0x18
    beq .L_021e6abc
    mov r0, #0x0
    str r0, [sp, #0x24]
.L_021e69e8:
    ldr r0, .L_021e6d80
    mov r8, #0x0
    ldr r2, [r0, #0xcec]
    ldr r0, [sp, #0x24]
    ldr r1, .L_021e6d84
    eor r7, r2, r0
    ldr r5, .L_021e6d88
    and r0, r7, #0x1
    mla r10, r0, r5, r1
    ldr r11, .L_021e6d8c
    add r9, r10, #0x30
    mov r6, r8
.L_021e6a18:
    ldr r0, [r9, #0x0]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_021e6a94
    ldr r1, [r10, #0x40]
    ldrh r2, [r10, #0x38]
    mov r0, r1, lsr #0x6
    and r0, r0, #0x1
    mvn r0, r0
    and r0, r2, r0
    mov r2, r1, lsr #0x2
    orr r1, r2, r1, lsr #0x1
    and r1, r1, #0x1
    mvn r1, r1
    tst r0, r1
    beq .L_021e6a94
    ldrh r2, [r4, #0x4]
    mov r0, r7
    mov r1, r8
    mov r2, r2, lsl #0x11
    mov r3, r2, lsr #0x17
    mov r2, r11
    bl func_ov002_021b3fd8
    cmp r0, #0x0
    beq .L_021e6a94
    mov r0, r7
    mov r1, r8
    mov r3, #0x2
    add r2, r5, #0xd30
    str r6, [sp, #0x0]
    bl func_ov002_021d59cc
.L_021e6a94:
    add r8, r8, #0x1
    cmp r8, #0x4
    add r9, r9, #0x14
    add r10, r10, #0x14
    ble .L_021e6a18
    ldr r0, [sp, #0x24]
    add r0, r0, #0x1
    str r0, [sp, #0x24]
    cmp r0, #0x2
    blt .L_021e69e8
.L_021e6abc:
    ldrh r2, [r4, #0x4]
    mov r0, r2, lsl #0x1e
    movs r0, r0, lsr #0x1f
    bne .L_021e6b40
    ldrh r1, [r4, #0x2]
    mov r0, r1, lsl #0x1a
    mov r0, r0, lsr #0x1b
    cmp r0, #0xa
    bhi .L_021e6b40
    mov r0, r1, lsl #0x12
    movs r0, r0, lsr #0x1e
    bne .L_021e6b40
    mov r0, r1, lsl #0x1f
    mov r1, r2, lsl #0x11
    ldr r2, .L_021e6d90
    mov r0, r0, lsr #0x1f
    mov r3, r1, lsr #0x17
    mov r1, #0xb
    bl func_ov002_021b3fd8
    cmp r0, #0x0
    beq .L_021e6b40
    ldrh r0, [r4, #0x2]
    ldr r1, .L_021e6d90
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021df6d4
    ldrh r0, [r4, #0x2]
    ldr r3, .L_021e6d90
    mov r1, #0x7d0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r2, #0x0
    bl func_ov002_021df938
.L_021e6b40:
    ldrh r0, [r4, #0x0]
    bl func_ov002_02256f38
    ldrh r0, [r4, #0x0]
    bl func_0202b8c0
    cmp r0, #0x1
    bne .L_021e6c38
    ldr r0, [sp, #0x8]
    cmp r0, #0x0
    beq .L_021e6c38
    ldrh r0, [r0, #0x2]
    ldrh r1, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r1, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r1, lsr #0x1f
    mov r0, r1, lsr #0x1f
    beq .L_021e6c38
    ldr r1, [sp, #0x8]
    ldrh r1, [r1, #0x4]
    mov r1, r1, lsl #0x1e
    movs r1, r1, lsr #0x1f
    beq .L_021e6c38
    ldr r1, .L_021e6d80
    ldr r1, [r1, #0xd0]
    tst r1, #0x1
    bne .L_021e6c38
    ldr r1, .L_021e6d94
    bl func_ov002_021c3ae4
    cmp r0, #0x0
    beq .L_021e6c38
    ldrh r0, [r4, #0x2]
    ldr r1, .L_021e6d94
    mov r0, r0, lsl #0x1f
    mov r6, r0, lsr #0x1f
    mov r0, r6
    bl func_ov002_021c3b60
    mov r5, r0
    ldr r1, .L_021e6d94
    mov r0, r6
    bl func_ov002_021c3b60
    ldr r1, .L_021e6d88
    ldr r2, .L_021e6d84
    and r3, r6, #0x1
    mla r1, r3, r1, r2
    add r0, r1, r0, lsl #0x2
    ldr r0, [r0, #0x120]
    add r1, r1, r5, lsl #0x2
    mov r0, r0, lsl #0x2
    ldr r1, [r1, #0x120]
    mov r0, r0, lsr #0x18
    mov r3, r6, lsl #0x1f
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    mov r1, r0, lsl #0x10
    ldr r0, [sp, #0x8]
    and r3, r3, #0x80000000
    ldrh r2, [r0, #0x0]
    ldr r0, .L_021e6d98
    mov r1, r1, lsr #0x10
    orr r0, r3, r0
    bl func_ov002_021e30b4
.L_021e6c38:
    ldrh r0, [r4, #0x0]
    bl func_0202b8c0
    cmp r0, #0x1
    bne .L_021e6d00
    ldrh r0, [r4, #0x4]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    bne .L_021e6d00
    ldr r0, .L_021e6d80
    ldr r0, [r0, #0xd0]
    tst r0, #0x1
    bne .L_021e6d00
    ldrh r0, [r4, #0x2]
    ldr r1, .L_021e6d9c
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c3ae4
    cmp r0, #0x0
    beq .L_021e6d00
    ldrh r0, [r4, #0x2]
    ldr r1, .L_021e6d9c
    mov r0, r0, lsl #0x1f
    mov r6, r0, lsr #0x1f
    mov r0, r6
    bl func_ov002_021c3b60
    mov r5, r0
    ldr r1, .L_021e6d9c
    mov r0, r6
    bl func_ov002_021c3b60
    ldr r1, .L_021e6d88
    ldr r2, .L_021e6d84
    and r3, r6, #0x1
    mla r1, r3, r1, r2
    add r0, r1, r0, lsl #0x2
    ldr r0, [r0, #0x120]
    add r1, r1, r5, lsl #0x2
    mov r0, r0, lsl #0x2
    ldr r1, [r1, #0x120]
    mov r0, r0, lsr #0x18
    mov r2, r6, lsl #0x1f
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    mov r1, r0, lsl #0x10
    ldr r0, .L_021e6da0
    and r2, r2, #0x80000000
    orr r0, r2, r0
    mov r1, r1, lsr #0x10
    mov r2, #0x0
    bl func_ov002_021e30b4
.L_021e6d00:
    ldrh r0, [r4, #0x4]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    beq .L_021e6de4
    ldrh r2, [r4, #0x0]
    ldr r0, .L_021e6da4
    cmp r2, r0
    bgt .L_021e6d48
    bge .L_021e6dcc
    ldr r0, .L_021e6da8
    cmp r2, r0
    bgt .L_021e6d38
    beq .L_021e6dcc
    b .L_021e6de4
.L_021e6d38:
    add r0, r0, #0xc
    cmp r2, r0
    beq .L_021e6dcc
    b .L_021e6de4
.L_021e6d48:
    ldr r0, .L_021e6dac
    cmp r2, r0
    bgt .L_021e6dc0
    beq .L_021e6dcc
    b .L_021e6de4
.L_021e6d5c:
        .word   0x168e
.L_021e6d60:
        .word   data_ov002_022cd73c
.L_021e6d64:
        .word   data_ov002_022d0250
.L_021e6d68:
        .word   data_ov002_022cf1a4
.L_021e6d6c:
        .word   0x16de
.L_021e6d70:
        .word   0x1520
.L_021e6d74:
        .word   0x184f
.L_021e6d78:
        .word   0x1964
.L_021e6d7c:
        .word   0x1975
.L_021e6d80:
        .word   data_ov002_022d016c
.L_021e6d84:
        .word   data_ov002_022cf16c
.L_021e6d88:
        .word   0x868
.L_021e6d8c:
        .word   0x1596
.L_021e6d90:
        .word   0x1379
.L_021e6d94:
        .word   0x190a
.L_021e6d98:
        .word   0x50190a
.L_021e6d9c:
        .word   0x1a28
.L_021e6da0:
        .word   0x501a28
.L_021e6da4:
        .word   0x1710
.L_021e6da8:
        .word   0x12d2
.L_021e6dac:
        .word   0x1973
.L_021e6db0:
        .word   data_ov002_022ce288
.L_021e6db4:
        .word   data_ov002_022cf1ac
.L_021e6db8:
        .word   data_ov002_022ce588
.L_021e6dbc:
        .word   0x1ae0
.L_021e6dc0:
    add r0, r0, #0x184
    cmp r2, r0
    bne .L_021e6de4
.L_021e6dcc:
    ldrh r0, [r4, #0x2]
    mov r1, #0xb
    mov r3, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021d5b80
.L_021e6de4:
    ldr r0, .L_021e6db0
    mov r1, #0x64
    str r1, [r0, #0x5a4]
    add sp, sp, #0xe8
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_021e6dfc:
    ldrh r0, [r4, #0x2]
    mov r1, r0, lsl #0x1a
    mov r1, r1, lsr #0x1b
    cmp r1, #0xa
    bhi .L_021e6e70
    mov r0, r0, lsl #0x1f
    mov r5, r0, lsr #0x1f
    mov r2, #0x14
    ldr r0, .L_021e6d88
    ldr r3, .L_021e6db4
    and r4, r5, #0x1
    mul r2, r1, r2
    mla r0, r4, r0, r3
    ldr r0, [r2, r0]
    mov r0, r0, lsr #0x1
    tst r0, #0x1
    beq .L_021e6e70
    cmp r5, #0x0
    movne r0, #0x8000
    moveq r0, #0x0
    orr r0, r0, #0x39
    mov r0, r0, lsl #0x10
    mov r2, #0x0
    mov r3, r2
    mov r0, r0, lsr #0x10
    bl func_ov002_021d479c
    add sp, sp, #0xe8
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_021e6e70:
    bl func_ov002_0225702c
    cmp r0, #0x0
    addne sp, sp, #0xe8
    mov r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    ldr r1, .L_021e6db0
    add sp, sp, #0xe8
    ldr r2, [r1, #0x5a4]
    add r2, r2, #0x1
    str r2, [r1, #0x5a4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_021e6e9c:
    bl func_ov002_021b04c8
    ldr r1, .L_021e6db0
    ldr r0, [r1, #0x480]
    subs r0, r0, #0x1
    str r0, [r1, #0x480]
    movne r0, #0x1
    strne r0, [r1, #0x5a4]
    addne sp, sp, #0xe8
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    ldr r0, [r1, #0x5a4]
    add r0, r0, #0x1
    str r0, [r1, #0x5a4]
.L_021e6ecc:
    ldr r0, .L_021e6db0
    mov r1, #0x1
    str r1, [r0, #0x5d8]
    ldr r0, [r0, #0x488]
    subs r6, r0, #0x1
    bmi .L_021e6f68
    ldr r1, .L_021e6db8
    mov r0, #0x18
    mla r5, r6, r0, r1
    ldr r4, .L_021e6d84
    ldr r8, .L_021e6d88
    mov r9, #0x0
    mov r7, #0x14
.L_021e6f00:
    ldrh r0, [r5, #0x2]
    mov r1, r0, lsl #0x1a
    mov r1, r1, lsr #0x1b
    cmp r1, #0xa
    bhi .L_021e6f5c
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r2, r0, #0x1
    mla r3, r2, r8, r4
    mla r3, r1, r7, r3
    ldr r2, [r3, #0x30]
    mov r2, r2, lsl #0x13
    movs r2, r2, lsr #0x13
    ldrneh r2, [r3, #0x38]
    cmpne r2, #0x0
    beq .L_021e6f5c
    ldr r2, [r3, #0x40]
    mov r2, r2, lsr #0x3
    tst r2, #0x1
    beq .L_021e6f5c
    mov r2, r9
    mov r3, r9
    bl func_ov002_021dec2c
.L_021e6f5c:
    sub r5, r5, #0x18
    subs r6, r6, #0x1
    bpl .L_021e6f00
.L_021e6f68:
    mov r0, #0x0
    str r0, [sp, #0x20]
.L_021e6f70:
    ldr r0, .L_021e6d80
    ldr r11, .L_021e6dbc
    ldr r3, [r0, #0xcec]
    ldr r0, [sp, #0x20]
    ldr r2, .L_021e6d84
    eor r6, r3, r0
    ldr r1, .L_021e6d88
    and r0, r6, #0x1
    mla r9, r0, r1, r2
    mov r0, r6, lsl #0x1f
    and r0, r0, #0x80000000
    add r8, r9, #0x30
    orr r10, r0, #0x200000
    mov r7, #0x0
    add r4, r11, #0xa
    add r5, r11, #0x9
.L_021e6fb0:
    ldr r0, [r8, #0x0]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    ldrneh r0, [r9, #0x38]
    cmpne r0, #0x0
    beq .L_021e704c
    ldr r1, [r9, #0x40]
    mov r0, r1, lsr #0x2
    orr r0, r0, r1, lsr #0x1
    tst r0, #0x1
    bne .L_021e704c
    mov r0, r6
    mov r1, r7
    mov r2, r11
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_021e704c
    mov r0, r6
    mov r1, r7
    bl func_ov002_021b9ecc
    cmp r0, r11
    cmpne r0, r5
    cmpne r0, r4
    bne .L_021e704c
    ldr r1, [r8, #0x0]
    mov r2, r7, lsl #0x10
    mov r3, r1, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r3, r3, lsl #0x1
    and r2, r2, #0x1f0000
    add r1, r3, r1, lsr #0x1f
    mov r1, r1, lsl #0x10
    orr r2, r10, r2
    mov r0, r0, lsl #0x10
    orr r0, r2, r0, lsr #0x10
    mov r2, #0x0
    mov r1, r1, lsr #0x10
    bl func_ov002_021e30b4
.L_021e704c:
    add r7, r7, #0x1
    cmp r7, #0x5
    add r8, r8, #0x14
    add r9, r9, #0x14
    blt .L_021e6fb0
    ldr r0, [sp, #0x20]
    add r0, r0, #0x1
    str r0, [sp, #0x20]
    cmp r0, #0x2
    blt .L_021e6f70
    ldr r7, .L_021e6d8c
    mov r6, #0x1
    mov r9, #0x0
    sub r5, r7, #0x7e
    add r4, r7, #0x2
    mov r11, r6
.L_021e708c:
    ldr r1, .L_021e6d88
    ldr r0, .L_021e6d84
    and r2, r9, #0x1
    mla r0, r2, r1, r0
    mov r10, #0x0
    add r8, r0, #0x30
.L_021e70a4:
    ldr r0, [r8, #0x0]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_021e711c
    mov r0, r9
    mov r1, r10
    bl func_ov002_021b9ecc
    cmp r0, r7
    cmpne r0, r4
    bne .L_021e70e0
    mov r0, r9
    mov r1, r10
    mov r2, r7
    mov r3, r6
    bl func_ov002_021d5b80
.L_021e70e0:
    mov r0, r9
    mov r1, r10
    add r2, r7, #0x84
    mov r3, r11
    bl func_ov002_021d5b80
    mov r0, r9
    mov r1, r10
    mov r2, r5
    mov r3, #0x1
    bl func_ov002_021d5b80
    ldr r2, .L_021e6dbc
    mov r0, r9
    mov r1, r10
    mov r3, #0x1
    bl func_ov002_021d5b80
.L_021e711c:
    add r8, r8, #0x14
    add r10, r10, #0x1
    cmp r10, #0xa
    ble .L_021e70a4
    add r9, r9, #0x1
    cmp r9, #0x2
    blt .L_021e708c
    ldr r1, .L_021e6db0
    add sp, sp, #0xe8
    ldr r2, [r1, #0x5a4]
    mov r0, #0x1
    add r2, r2, #0x1
    str r2, [r1, #0x5a4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_021e7154:
    bl func_ov002_0225702c
    cmp r0, #0x0
    addne sp, sp, #0xe8
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    ldr r1, .L_021e6db0
    mov r0, #0x0
    str r0, [r1, #0x5d8]
    ldr r2, [r1, #0x5a4]
    add sp, sp, #0xe8
    add r2, r2, #0x1
    str r2, [r1, #0x5a4]
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_021e718c:
    ldr r0, .L_021e6db0
    mov r1, #0x0
    str r1, [r0, #0x5a0]
    mov r0, #0x1
    add sp, sp, #0xe8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
