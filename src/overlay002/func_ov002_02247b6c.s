; func_ov002_02247b6c — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern data_ov002_022cacc0
        .extern data_ov002_022cd73c
        .extern data_ov002_022cd744
        .extern data_ov002_022ce288
        .extern data_ov002_022ce720
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern data_ov002_022d016c
        .extern func_0202e2f8
        .extern func_ov002_021ae400
        .extern func_ov002_021ae78c
        .extern func_ov002_021b0c04
        .extern func_ov002_021b947c
        .extern func_ov002_021bb068
        .extern func_ov002_021c38c4
        .extern func_ov002_021c3b60
        .extern func_ov002_021c84e0
        .extern func_ov002_021d7a64
        .extern func_ov002_021dec10
        .extern func_ov002_021e286c
        .extern func_ov002_022476e8
        .extern func_ov002_022477a0
        .extern func_ov002_02247ad8
        .extern func_ov002_02259324
        .extern func_ov002_022593f4
        .extern func_ov002_0227adb8
        .extern func_ov002_02290500
        .extern func_ov002_0229ade0
        .global func_ov002_02247b6c
        .arm
func_ov002_02247b6c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r5, r0
    ldrh r1, [r5, #0x4]
    mov r1, r1, lsl #0x1d
    movs r1, r1, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r7, .L_02248290
    ldr r1, [r7, #0x5a8]
    cmp r1, #0x7c
    bgt .L_02247bc4
    bge .L_02247eac
    cmp r1, #0x64
    bgt .L_02248288
    cmp r1, #0x62
    blt .L_02248288
    beq .L_0224822c
    cmp r1, #0x63
    beq .L_022481a8
    cmp r1, #0x64
    beq .L_0224810c
    b .L_02248288
.L_02247bc4:
    cmp r1, #0x7d
    bgt .L_02247bd4
    beq .L_02247e70
    b .L_02248288
.L_02247bd4:
    cmp r1, #0x80
    bgt .L_02248288
    cmp r1, #0x7e
    blt .L_02248288
    beq .L_02247e1c
    cmp r1, #0x7f
    beq .L_02247d8c
    cmp r1, #0x80
    bne .L_02248288
    mov r1, #0x0
    str r1, [r7, #0x5ac]
    strh r1, [r5, #0xc]
    bl func_ov002_02247ad8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldrh r0, [r5, #0x0]
    ldr r1, .L_02248294
    cmp r0, r1
    addne r1, r1, #0x7e
    cmpne r0, r1
    ldrne r1, .L_02248298
    cmpne r0, r1
    bne .L_02247d40
    ldrh r0, [r5, #0x2]
    ldr r1, .L_0224829c
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, [r1, r0, lsl #0x2]
    cmp r1, #0x1
    bne .L_02247d28
    ldr r7, .L_022482a0
    and r1, r0, #0x1
    mul r2, r1, r7
    ldr r1, .L_022482a4
    mov r6, #0x0
    ldr r1, [r1, r2]
    cmp r1, #0x0
    bls .L_02247d38
    ldr r8, .L_022482a8
    mov r4, #0xb
.L_02247c78:
    mov r1, r4
    mov r2, r6
    bl func_ov002_022476e8
    cmp r0, #0x0
    beq .L_02247d00
    ldrh r2, [r5, #0x2]
    ldr r1, .L_022482ac
    ldr r0, .L_022482a0
    mov r2, r2, lsl #0x1f
    mov r3, r2, lsr #0x1f
    ldr r2, .L_022482a8
    and r3, r3, #0x1
    mla r0, r3, r0, r2
    add r0, r0, r6, lsl #0x2
    ldr r2, [r0, #0x120]
    ldr r0, [r1, #0x0]
    mov r1, r2, lsl #0x13
    mov r0, r0, lsl #0x13
    mov r3, r1, lsr #0x13
    movs r0, r0, lsr #0x13
    mov r1, #0x0
    beq .L_02247cf8
    ldr r2, .L_022482b0
.L_02247cd4:
    ldr r0, [r2, #0x0]
    mov r0, r0, lsl #0x13
    cmp r3, r0, lsr #0x13
    streqh r1, [r5, #0x8]
    ldr r0, [r2, #0x4]!
    add r1, r1, #0x1
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    bne .L_02247cd4
.L_02247cf8:
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_02247d00:
    ldrh r0, [r5, #0x2]
    add r6, r6, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r2, r0, #0x1
    mla r1, r2, r7, r8
    ldr r1, [r1, #0xc]
    cmp r6, r1
    blo .L_02247c78
    b .L_02247d38
.L_02247d28:
    ldr r1, .L_022482b4
    bl func_ov002_021ae400
    ldr r0, .L_022482b8
    bl func_ov002_02259324
.L_02247d38:
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_02247d40:
    ldr r1, .L_022482ac
    mov r3, #0x0
    ldr r1, [r1, #0x0]
    mov r1, r1, lsl #0x6
    movs r1, r1, lsr #0x13
    beq .L_02247d84
    ldr r2, .L_022482b0
.L_02247d5c:
    ldr r1, [r2, #0x0]
    mov r1, r1, lsl #0x6
    cmp r0, r1, lsr #0x13
    streqh r3, [r5, #0x8]
    beq .L_02247d84
    ldr r1, [r2, #0x4]!
    add r3, r3, #0x1
    mov r1, r1, lsl #0x6
    movs r1, r1, lsr #0x13
    bne .L_02247d5c
.L_02247d84:
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_02247d8c:
    bl func_ov002_022593f4
    cmp r0, #0x0
    beq .L_02247e14
    ldrh r0, [r5, #0x2]
    ldr r2, .L_022482bc
    ldr r1, .L_022482ac
    mov r0, r0, lsl #0x1f
    mov r4, r0, lsr #0x1f
    ldr r0, .L_022482a0
    ldr r3, .L_022482a8
    and r4, r4, #0x1
    mla r3, r4, r0, r3
    ldr r2, [r2, #0xd78]
    ldr r0, [r1, #0x0]
    add r1, r3, r2, lsl #0x2
    ldr r1, [r1, #0x120]
    mov r0, r0, lsl #0x13
    mov r1, r1, lsl #0x13
    mov r2, r1, lsr #0x13
    movs r0, r0, lsr #0x13
    mov r3, #0x0
    beq .L_02247e0c
    ldr r1, .L_022482b0
.L_02247de8:
    ldr r0, [r1, #0x0]
    mov r0, r0, lsl #0x13
    cmp r2, r0, lsr #0x13
    streqh r3, [r5, #0x8]
    ldr r0, [r1, #0x4]!
    add r3, r3, #0x1
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    bne .L_02247de8
.L_02247e0c:
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_02247e14:
    mov r0, #0x80
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_02247e1c:
    ldrh r2, [r5, #0x8]
    ldr r0, .L_022482b0
    mov r1, #0xff
    ldr r2, [r0, r2, lsl #0x2]
    mov r0, #0x0
    mov r2, r2, lsr #0x1a
    str r2, [r7, #0x5ac]
    str r1, [r7, #0x5b0]
    strh r0, [r5, #0xa]
    ldrh r1, [r5, #0x2]
    ldr r0, .L_0224829c
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x0
    bne .L_02247e68
    ldr r1, [r7, #0x5ac]
    mov r0, #0xcf
    bl func_ov002_021ae78c
.L_02247e68:
    mov r0, #0x7d
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_02247e70:
    ldrh r0, [r5, #0x2]
    ldr r1, .L_0224829c
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, [r1, r0, lsl #0x2]
    cmp r1, #0x1
    bne .L_02247e9c
    ldrh r1, [r5, #0x0]
    ldr r2, .L_022482c0
    bl func_ov002_02290500
    b .L_02247ea4
.L_02247e9c:
    ldr r0, .L_022482c0
    bl func_ov002_02259324
.L_02247ea4:
    mov r0, #0x7c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_02247eac:
    bl func_ov002_022593f4
    cmp r0, #0x0
    beq .L_022480c8
    ldr r2, .L_022482bc
    ldr r1, [r2, #0xd74]
    cmp r1, #0xb
    bne .L_02247fb0
    ldrh r0, [r5, #0x2]
    ldr r4, .L_022482a8
    ldr r1, .L_022482a0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r3, r0, #0x1
    mla r1, r3, r1, r4
    ldr r7, [r2, #0xd78]
    add r1, r1, #0x120
    ldr r3, [r1, r7, lsl #0x2]
    ldr r8, [r2, #0xd70]
    mov r1, r3, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r3, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    bl func_ov002_021c38c4
    mov r3, r4
    ldr r1, .L_022482a0
    and r2, r8, #0x1
    mla r1, r2, r1, r3
    add r6, r1, #0x120
    ldr r1, [r6, r7, lsl #0x2]
    mov r4, r0
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r2, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r3, r0, r2, lsr #0x1f
    mov r1, r8
    mov r0, #0x28
    mov r2, #0xb
    bl func_ov002_0229ade0
    ldr r3, [r6, r7, lsl #0x2]
    ldr r0, .L_02248290
    mov r1, r3, lsl #0x2
    mov r2, r1, lsr #0x18
    ldrh r1, [r5, #0xa]
    ldr r0, [r0, #0x494]
    mov r3, r3, lsl #0x12
    add r0, r0, r1
    mov r1, r0, lsl #0x19
    mov r2, r2, lsl #0x1
    ldr r0, .L_022482c4
    add r2, r2, r3, lsr #0x1f
    mov r1, r1, lsr #0x18
    strh r2, [r0, r1]
    ldrh r0, [r5, #0xa]
    mov r1, #0x1
    add r0, r0, #0x1
    strh r0, [r5, #0xa]
    ldr r0, [r6, r7, lsl #0x2]
    ldrh r2, [r5, #0xc]
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1f
    orr r0, r2, r1, lsl r0
    strh r0, [r5, #0xc]
    b .L_02248088
.L_02247fb0:
    ldr r0, [r2, #0xd78]
    ldr r8, [r2, #0xd70]
    add r9, r1, r0
    mov r0, r8
    mov r1, r9
    bl func_ov002_021c84e0
    mov r2, #0x14
    ldr r4, .L_022482a8
    ldr r1, .L_022482a0
    and r3, r8, #0x1
    mla r1, r3, r1, r4
    mov r4, r0
    mul r6, r9, r2
    add r7, r1, #0x30
    ldr r2, [r7, r6]
    mov r1, r8
    mov r0, r2, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r3, r2, lsl #0x12
    mov r0, r0, lsl #0x1
    mov r2, r9
    add r3, r0, r3, lsr #0x1f
    mov r0, #0x28
    bl func_ov002_0229ade0
    ldr r3, [r7, r6]
    ldr r0, .L_02248290
    mov r1, r3, lsl #0x2
    mov r2, r1, lsr #0x18
    ldrh r1, [r5, #0xa]
    ldr r0, [r0, #0x494]
    mov r3, r3, lsl #0x12
    add r0, r0, r1
    mov r2, r2, lsl #0x1
    mov r1, r0, lsl #0x19
    ldr r0, .L_022482c4
    add r2, r2, r3, lsr #0x1f
    mov r1, r1, lsr #0x18
    strh r2, [r0, r1]
    ldrh r0, [r5, #0xa]
    add r0, r0, #0x1
    strh r0, [r5, #0xa]
    ldr r0, [r7, r6]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e2f8
    cmp r0, #0x0
    bne .L_02248088
    ldr r0, [r7, r6]
    ldrh r2, [r5, #0xc]
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1f
    mov r1, #0x1
    orr r0, r2, r1, lsl r0
    strh r0, [r5, #0xc]
.L_02248088:
    ldr r0, .L_02248290
    ldr r0, [r0, #0x5ac]
    subs r1, r0, r4
    ldr r0, .L_02248290
    movmi r1, #0x0
    str r1, [r0, #0x5ac]
    ldr r0, [r0, #0x5b0]
    cmp r4, r0
    movge r4, r0
    ldr r0, .L_02248290
    str r4, [r0, #0x5b0]
    ldr r0, [r0, #0x5ac]
    cmp r0, #0x0
    moveq r0, #0x64
    movne r0, #0x7d
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_022480c8:
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    mov r0, #0x29
    bl func_ov002_0229ade0
    ldrh r2, [r5, #0x8]
    ldr r1, .L_022482b0
    mov r0, r7
    ldr r2, [r1, r2, lsl #0x2]
    mov r1, #0xff
    mov r2, r2, lsr #0x1a
    str r2, [r0, #0x5ac]
    str r1, [r0, #0x5b0]
    mov r0, #0x0
    strh r0, [r5, #0xa]
    mov r0, #0x7d
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_0224810c:
    ldrh r0, [r5, #0xa]
    mov r8, #0x0
    mov r9, r8
    cmp r0, #0x0
    ble .L_02248194
    mov r4, #0x1
    mov r6, r4
.L_02248128:
    ldr r0, [r7, #0x494]
    add r0, r0, r9
    mov r0, r0, lsl #0x19
    add r0, r7, r0, lsr #0x18
    add r0, r0, #0x400
    ldrh r0, [r0, #0x98]
    bl func_ov002_021b947c
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r1, r1, #0xff
    cmp r1, #0xa
    bhi .L_0224816c
    and r0, r0, #0xff
    add r0, r1, r0, lsl #0x4
    orr r8, r8, r6, lsl r0
    b .L_02248184
.L_0224816c:
    mov r1, r0, lsr #0x10
    mov r1, r1, lsl #0x10
    mov r2, r4
    and r0, r0, #0xff
    mov r1, r1, lsr #0x10
    bl func_ov002_021d7a64
.L_02248184:
    ldrh r0, [r5, #0xa]
    add r9, r9, #0x1
    cmp r9, r0
    blt .L_02248128
.L_02248194:
    mov r0, r5
    mov r1, r8
    bl func_ov002_021dec10
    mov r0, #0x63
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_022481a8:
    ldrh r1, [r5, #0x8]
    ldr r0, .L_022482b0
    ldrh r2, [r5, #0x2]
    ldr r0, [r0, r1, lsl #0x2]
    mov r2, r2, lsl #0x1f
    mov r1, r0, lsl #0x13
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x13
    bl func_ov002_021c3b60
    ldrh r1, [r5, #0x2]
    mov r4, r0
    ldr r3, .L_022482a8
    mov r0, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, .L_022482a0
    and r2, r0, #0x1
    mla r1, r2, r1, r3
    add r1, r1, #0x120
    mov r2, #0x1
    mov r3, r2
    add r1, r1, r4, lsl #0x2
    bl func_ov002_0227adb8
    ldrh r1, [r5, #0x2]
    ldr r0, .L_022482c8
    ldr r0, [r0, #0x4]
    mov r1, r1, lsl #0x1f
    cmp r0, r1, lsr #0x1f
    bne .L_02248224
    mov r0, #0x24
    mov r1, #0x1
    bl func_ov002_021b0c04
.L_02248224:
    mov r0, #0x62
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_0224822c:
    ldr r0, .L_022482cc
    bl func_ov002_021bb068
    cmp r0, #0x0
    beq .L_02248280
    ldrh r0, [r5, #0x2]
    ldrh r2, [r5, #0xc]
    mov r1, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    tst r2, r1, lsl r0
    beq .L_0224825c
    bl func_ov002_021e286c
.L_0224825c:
    ldrh r0, [r5, #0x2]
    ldrh r2, [r5, #0xc]
    mov r1, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    tst r2, r1, lsl r0
    beq .L_02248280
    bl func_ov002_021e286c
.L_02248280:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_02248288:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_02248290:
        .word   data_ov002_022ce288
.L_02248294:
        .word   0x1698
.L_02248298:
        .word   0x19d9
.L_0224829c:
        .word   data_ov002_022cd744
.L_022482a0:
        .word   0x868
.L_022482a4:
        .word   data_ov002_022cf178
.L_022482a8:
        .word   data_ov002_022cf16c
.L_022482ac:
        .word   data_ov002_022cacc0
.L_022482b0:
        .word   data_ov002_022cacc0
.L_022482b4:
        .word   0x11e
.L_022482b8:
        .word   func_ov002_022476e8
.L_022482bc:
        .word   data_ov002_022d016c
.L_022482c0:
        .word   func_ov002_022477a0
.L_022482c4:
        .word   data_ov002_022ce720
.L_022482c8:
        .word   data_ov002_022cd73c
.L_022482cc:
        .word   0x19da
