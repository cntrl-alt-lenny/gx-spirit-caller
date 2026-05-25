; func_ov002_021c4c9c — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern data_ov002_022cf188
        .extern data_ov002_022cf1a4
        .extern data_ov002_022cf1a6
        .extern data_ov002_022cf1a8
        .extern data_ov002_022cf1ac
        .extern data_ov002_022d016c
        .extern data_ov002_022d0650
        .extern func_0202b878
        .extern func_0202b8c0
        .extern func_0202b8f0
        .extern func_0202b920
        .extern func_0202e79c
        .extern func_0202eac8
        .extern func_0202ed90
        .extern func_0202f4cc
        .extern func_0202f500
        .extern func_0202f5cc
        .extern func_ov002_021b314c
        .extern func_ov002_021b3314
        .extern func_ov002_021b34f4
        .extern func_ov002_021b3618
        .extern func_ov002_021b3ecc
        .extern func_ov002_021b8fcc
        .extern func_ov002_021b9bd4
        .extern func_ov002_021b9e00
        .extern func_ov002_021b9ecc
        .extern func_ov002_021baca8
        .extern func_ov002_021bae7c
        .extern func_ov002_021bb068
        .extern func_ov002_021bb90c
        .extern func_ov002_021bb91c
        .extern func_ov002_021bbbc0
        .extern func_ov002_021bbc58
        .extern func_ov002_021bbc68
        .extern func_ov002_021bbd04
        .extern func_ov002_021bbf50
        .extern func_ov002_021bbf98
        .extern func_ov002_021bc000
        .extern func_ov002_021bc07c
        .extern func_ov002_021bc0d4
        .extern func_ov002_021bcf00
        .extern func_ov002_021bcf18
        .extern func_ov002_021bd274
        .extern func_ov002_021bd364
        .extern func_ov002_021bd4ec
        .extern func_ov002_021bd5f4
        .extern func_ov002_021c1ad0
        .extern func_ov002_021c1d4c
        .extern func_ov002_021c2f24
        .extern func_ov002_021c2f90
        .extern func_ov002_021c325c
        .extern func_ov002_021c32d4
        .extern func_ov002_021c3350
        .extern func_ov002_021c3e40
        .extern func_ov002_021c4158
        .extern func_ov002_021c46a8
        .extern func_ov002_021c848c
        .extern func_ov002_021c84e0
        .extern func_ov002_021c8940
        .extern func_ov002_021c8950
        .extern func_ov002_021c8e38
        .extern func_ov002_021c92fc
        .global func_ov002_021c4c9c
        .arm
func_ov002_021c4c9c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0xb0
    mov r4, #0x0
    mov r9, r2
    str r4, [r9, #0x4]
    str r4, [r9, #0x8]
    str r4, [r9, #0x10]
    str r4, [r9, #0x1c]
    str r4, [r9, #0x14]
    str r4, [r9, #0x20]
    str r4, [r9, #0x18]
    str r4, [r9, #0x24]
    mov r10, r0
    str r1, [sp, #0x4]
    mov r5, r4
    mov r6, r4
    str r4, [sp, #0x58]
    mov r7, r4
    str r4, [sp, #0x54]
    str r4, [sp, #0x44]
    str r4, [r9, #0x28]
    bl func_ov002_021b9ecc
    cmp r0, #0x0
    addeq sp, sp, #0xb0
    str r0, [r9, #0x0]
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    ldr r0, [sp, #0x4]
    cmp r0, #0x5
    addge sp, sp, #0xb0
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    ldr r1, [sp, #0x4]
    mov r0, r10
    bl func_ov002_021c8940
    str r0, [r9, #0x4]
    ldr r1, [sp, #0x4]
    add r2, sp, #0x80
    mov r0, r10
    bl func_ov002_021c8e38
    str r0, [r9, #0x8]
    ldr r1, [sp, #0x4]
    mov r0, r10
    bl func_ov002_021c84e0
    str r0, [r9, #0x10]
    ldr r0, [r9, #0x8]
    mov r2, #0x1
    mov r0, r2, lsl r0
    str r0, [r9, #0xc]
    ldr r0, [sp, #0x4]
    mov r1, #0x14
    mul r1, r0, r1
    str r1, [sp, #0x18]
    ldr r0, .L_021c5d24
    and r2, r10, #0x1
    mul r0, r2, r0
    ldr r1, .L_021c5d28
    str r0, [sp, #0x1c]
    add r8, r1, r0
    ldr r0, [sp, #0x18]
    ldr r3, .L_021c5d2c
    ldr r1, [r8, r0]
    ldr r0, [sp, #0x1c]
    mov r2, r1, lsr #0x6
    add r0, r3, r0
    str r0, [sp, #0x5c]
    and r0, r2, #0x1
    ldr r3, [sp, #0x5c]
    ldr r2, [sp, #0x18]
    mvn r0, r0
    ldrh r3, [r3, r2]
    mov r2, r1, lsr #0x2
    orr r1, r2, r1, lsr #0x1
    and r2, r3, r0
    and r0, r1, #0x1
    mvn r0, r0
    and r11, r2, r0
    ldr r0, [sp, #0x80]
    cmp r0, #0x0
    bne .L_021c4dfc
    ldr r1, [r9, #0x0]
    ldr r0, .L_021c5d30
    cmp r1, r0
    addne r0, r0, #0x128
    cmpne r1, r0
    bne .L_021c4dfc
    cmp r11, #0x0
    ldrne r0, [r9, #0xc]
    orrne r0, r0, #0x78
    strne r0, [r9, #0xc]
.L_021c4dfc:
    ldr r1, [sp, #0x4]
    mov r0, r10
    mov r2, r9
    bl func_ov002_021c46a8
    ldr r0, [r9, #0x1c]
    ldr r1, [sp, #0x5c]
    str r0, [r9, #0x14]
    ldr r0, [r9, #0x20]
    str r0, [r9, #0x18]
    ldr r0, [sp, #0x18]
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    addeq sp, sp, #0xb0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    ldr r1, [sp, #0x4]
    mov r0, r10
    bl func_ov002_021c1ad0
    str r0, [r9, #0x24]
    ldr r1, [sp, #0x4]
    mov r0, r10
    bl func_ov002_021c1d4c
    str r0, [r9, #0x28]
    ldr r2, .L_021c5d34
    mov r0, #0x0
    mov r1, #0xb
    bl func_ov002_021b3ecc
    cmp r11, #0x0
    str r0, [sp, #0x48]
    beq .L_021c601c
    ldr r0, [r9, #0x0]
    ldr r3, .L_021c5d38
    cmp r0, r3
    bgt .L_021c5108
    bge .L_021c58f8
    ldr r2, .L_021c5d3c
    cmp r0, r2
    bgt .L_021c4ff0
    bge .L_021c5720
    ldr r1, .L_021c5d40
    cmp r0, r1
    bgt .L_021c4f38
    bge .L_021c54bc
    sub r3, r1, #0xba
    cmp r0, r3
    bgt .L_021c4eec
    bge .L_021c53ec
    sub r3, r2, #0x3a4
    cmp r0, r3
    bgt .L_021c4edc
    sub r2, r2, #0x3a4
    cmp r0, r2
    bge .L_021c53c4
    ldr r2, .L_021c5d44
    cmp r0, r2
    beq .L_021c53b0
    b .L_021c601c
.L_021c4edc:
    sub r1, r2, #0x31c
    cmp r0, r1
    beq .L_021c5400
    b .L_021c601c
.L_021c4eec:
    sub r2, r1, #0x93
    cmp r0, r2
    bgt .L_021c4f0c
    bge .L_021c5450
    sub r2, r1, #0xa8
    cmp r0, r2
    beq .L_021c542c
    b .L_021c601c
.L_021c4f0c:
    sub r2, r1, #0x3d
    cmp r0, r2
    bgt .L_021c4f28
    sub r1, r1, #0x3d
    cmp r0, r1
    beq .L_021c547c
    b .L_021c601c
.L_021c4f28:
    sub r1, r1, #0x26
    cmp r0, r1
    beq .L_021c5494
    b .L_021c601c
.L_021c4f38:
    sub r3, r2, #0x70
    cmp r0, r3
    bgt .L_021c4f9c
    bge .L_021c564c
    add r3, r1, #0xeb
    cmp r0, r3
    bgt .L_021c4f8c
    mov r2, r3
    cmp r0, r2
    bge .L_021c557c
    add r2, r1, #0xd0
    cmp r0, r2
    bgt .L_021c601c
    add r2, r1, #0xce
    cmp r0, r2
    blt .L_021c601c
    beq .L_021c54d4
    add r1, r1, #0xd0
    cmp r0, r1
    beq .L_021c5550
    b .L_021c601c
.L_021c4f8c:
    sub r1, r2, #0x77
    cmp r0, r1
    beq .L_021c5624
    b .L_021c601c
.L_021c4f9c:
    sub r3, r2, #0x26
    cmp r0, r3
    bgt .L_021c4fc4
    mov r1, r3
    cmp r0, r1
    bge .L_021c5660
    sub r1, r2, #0x36
    cmp r0, r1
    beq .L_021c55b8
    b .L_021c601c
.L_021c4fc4:
    add r3, r1, #0x1b8
    cmp r0, r3
    bgt .L_021c4fe0
    add r1, r1, #0x1b8
    cmp r0, r1
    beq .L_021c5680
    b .L_021c601c
.L_021c4fe0:
    sub r1, r2, #0x4
    cmp r0, r1
    beq .L_021c56f8
    b .L_021c601c
.L_021c4ff0:
    add r1, r2, #0x1d0
    cmp r0, r1
    bgt .L_021c5084
    bge .L_021c584c
    add r1, r2, #0xd9
    cmp r0, r1
    bgt .L_021c5040
    bge .L_021c57ac
    add r1, r2, #0x8a
    cmp r0, r1
    bgt .L_021c5030
    bge .L_021c5760
    add r1, r2, #0x3b
    cmp r0, r1
    beq .L_021c5748
    b .L_021c601c
.L_021c5030:
    add r1, r2, #0xd7
    cmp r0, r1
    beq .L_021c5790
    b .L_021c601c
.L_021c5040:
    sub r1, r3, #0x1b0
    cmp r0, r1
    bgt .L_021c5060
    bge .L_021c57e4
    sub r1, r3, #0x1c0
    cmp r0, r1
    beq .L_021c57cc
    b .L_021c601c
.L_021c5060:
    ldr r1, .L_021c5d48
    cmp r0, r1
    bgt .L_021c5074
    beq .L_021c54d4
    b .L_021c601c
.L_021c5074:
    add r1, r1, #0x26
    cmp r0, r1
    beq .L_021c5834
    b .L_021c601c
.L_021c5084:
    add r1, r2, #0x268
    cmp r0, r1
    bgt .L_021c50c4
    bge .L_021c5898
    add r1, r2, #0x260
    cmp r0, r1
    bgt .L_021c50b4
    bge .L_021c5868
    sub r1, r3, #0xb0
    cmp r0, r1
    beq .L_021c55e8
    b .L_021c601c
.L_021c50b4:
    sub r1, r3, #0x9d
    cmp r0, r1
    beq .L_021c5880
    b .L_021c601c
.L_021c50c4:
    add r1, r2, #0x2a4
    cmp r0, r1
    bgt .L_021c50e4
    bge .L_021c58c8
    sub r1, r3, #0x95
    cmp r0, r1
    beq .L_021c58b0
    b .L_021c601c
.L_021c50e4:
    sub r1, r3, #0x58
    cmp r0, r1
    bgt .L_021c50f8
    beq .L_021c58dc
    b .L_021c601c
.L_021c50f8:
    sub r1, r3, #0x24
    cmp r0, r1
    beq .L_021c58dc
    b .L_021c601c
.L_021c5108:
    add r1, r3, #0x2a0
    cmp r0, r1
    bgt .L_021c5240
    bge .L_021c5c18
    ldr r1, .L_021c5d4c
    cmp r0, r1
    bgt .L_021c51b4
    bge .L_021c5a94
    sub r2, r1, #0x96
    cmp r0, r2
    bgt .L_021c5168
    bge .L_021c59c0
    add r2, r3, #0x1e
    cmp r0, r2
    bgt .L_021c5158
    bge .L_021c5940
    sub r1, r1, #0x128
    cmp r0, r1
    beq .L_021c5928
    b .L_021c601c
.L_021c5158:
    sub r2, r1, #0xa9
    cmp r0, r2
    beq .L_021c596c
    b .L_021c601c
.L_021c5168:
    sub r2, r1, #0x29
    cmp r0, r2
    bgt .L_021c5188
    bge .L_021c5b2c
    sub r1, r1, #0x62
    cmp r0, r1
    beq .L_021c59f8
    b .L_021c601c
.L_021c5188:
    sub r2, r1, #0xa
    cmp r0, r2
    bgt .L_021c51a4
    sub r1, r1, #0xa
    cmp r0, r1
    beq .L_021c5a30
    b .L_021c601c
.L_021c51a4:
    sub r1, r1, #0x8
    cmp r0, r1
    beq .L_021c5a64
    b .L_021c601c
.L_021c51b4:
    add r2, r1, #0x75
    cmp r0, r2
    bgt .L_021c51f4
    bge .L_021c5a64
    add r2, r1, #0x2c
    cmp r0, r2
    bgt .L_021c51e4
    bge .L_021c5b14
    add r1, r1, #0x1e
    cmp r0, r1
    beq .L_021c5abc
    b .L_021c601c
.L_021c51e4:
    add r1, r1, #0x3c
    cmp r0, r1
    beq .L_021c5a64
    b .L_021c601c
.L_021c51f4:
    add r2, r1, #0xd8
    cmp r0, r2
    bgt .L_021c5214
    bge .L_021c5b44
    add r1, r1, #0xa9
    cmp r0, r1
    beq .L_021c5b2c
    b .L_021c601c
.L_021c5214:
    add r2, r1, #0x124
    cmp r0, r2
    bgt .L_021c5230
    add r1, r1, #0x124
    cmp r0, r1
    beq .L_021c5be8
    b .L_021c601c
.L_021c5230:
    add r1, r1, #0x158
    cmp r0, r1
    beq .L_021c5c00
    b .L_021c601c
.L_021c5240:
    ldr r1, .L_021c5d50
    cmp r0, r1
    bgt .L_021c52ec
    bge .L_021c5e3c
    sub r2, r1, #0x31
    cmp r0, r2
    bgt .L_021c5290
    bge .L_021c5ca8
    sub r2, r1, #0x52
    cmp r0, r2
    bgt .L_021c5280
    bge .L_021c5c5c
    sub r1, r1, #0x72
    cmp r0, r1
    beq .L_021c5c44
    b .L_021c601c
.L_021c5280:
    sub r1, r1, #0x37
    cmp r0, r1
    beq .L_021c5c74
    b .L_021c601c
.L_021c5290:
    sub r2, r1, #0x24
    cmp r0, r2
    bgt .L_021c52b0
    bge .L_021c5cec
    sub r2, r1, #0x29
    cmp r0, r2
    beq .L_021c5cd4
    b .L_021c601c
.L_021c52b0:
    sub r2, r1, #0x1f
    cmp r0, r2
    bgt .L_021c52dc
    sub r2, r1, #0x22
    cmp r0, r2
    blt .L_021c601c
    beq .L_021c5d04
    sub r2, r1, #0x1f
    cmp r0, r2
    beq .L_021c5d94
    b .L_021c601c
.L_021c52dc:
    sub r1, r1, #0x6
    cmp r0, r1
    beq .L_021c5dac
    b .L_021c601c
.L_021c52ec:
    add r2, r1, #0x80
    cmp r0, r2
    bgt .L_021c536c
    bge .L_021c5f9c
    cmp r0, #0x1a00
    bgt .L_021c5340
    bge .L_021c5c00
    add r2, r1, #0x3
    cmp r0, r2
    bgt .L_021c601c
    add r2, r1, #0x1
    cmp r0, r2
    blt .L_021c601c
    beq .L_021c5e58
    add r2, r1, #0x2
    cmp r0, r2
    beq .L_021c5e84
    add r1, r1, #0x3
    cmp r0, r1
    beq .L_021c5eb0
    b .L_021c601c
.L_021c5340:
    add r2, r1, #0x10
    cmp r0, r2
    bgt .L_021c535c
    add r1, r1, #0x10
    cmp r0, r1
    beq .L_021c5edc
    b .L_021c601c
.L_021c535c:
    add r1, r1, #0x7a
    cmp r0, r1
    beq .L_021c5f78
    b .L_021c601c
.L_021c536c:
    ldr r2, .L_021c5d54
    cmp r0, r2
    bgt .L_021c538c
    bge .L_021c5fc4
    sub r1, r2, #0x65
    cmp r0, r1
    beq .L_021c5fb0
    b .L_021c601c
.L_021c538c:
    add r1, r2, #0x37
    cmp r0, r1
    bgt .L_021c53a0
    beq .L_021c5fdc
    b .L_021c601c
.L_021c53a0:
    add r1, r2, #0x68
    cmp r0, r1
    beq .L_021c6008
    b .L_021c601c
.L_021c53b0:
    mov r0, r10
    bl func_ov002_021bb90c
    mov r1, #0x1f4
    mla r6, r0, r1, r6
    b .L_021c601c
.L_021c53c4:
    ldr r0, [sp, #0x18]
    ldr r0, [r8, r0]
    mov r0, r0, lsr #0x5
    tst r0, #0x1
    beq .L_021c601c
    ldr r0, [sp, #0x58]
    add r6, r6, #0x64
    add r0, r0, #0x64
    str r0, [sp, #0x58]
    b .L_021c601c
.L_021c53ec:
    mov r0, r10
    bl func_ov002_021c325c
    mov r1, #0x64
    mla r6, r0, r1, r6
    b .L_021c601c
.L_021c5400:
    mov r0, #0x0
    mov r1, #0xd
    bl func_ov002_021bbc58
    mov r1, #0x64
    mla r6, r0, r1, r6
    mov r0, #0x1
    mov r1, #0xd
    bl func_ov002_021bbc58
    mov r1, #0x64
    mla r6, r0, r1, r6
    b .L_021c601c
.L_021c542c:
    sub r0, r1, #0x1ec
    bl func_ov002_021bb91c
    mov r1, #0x12c
    mul r1, r0, r1
    ldr r0, [sp, #0x58]
    add r6, r6, r1
    add r0, r0, r1
    str r0, [sp, #0x58]
    b .L_021c601c
.L_021c5450:
    mov r0, #0x0
    mov r1, #0x7
    bl func_ov002_021bbc58
    mov r1, #0x64
    mla r6, r0, r1, r6
    mov r0, #0x1
    mov r1, #0x7
    bl func_ov002_021bbc58
    mov r1, #0x64
    mla r6, r0, r1, r6
    b .L_021c601c
.L_021c547c:
    ldr r1, [sp, #0x4]
    mov r0, r10
    bl func_ov002_021b3314
    mov r1, #0x1f4
    mla r6, r0, r1, r6
    b .L_021c601c
.L_021c5494:
    ldr r2, .L_021c5d58
    ldr r0, [sp, #0x1c]
    mov r1, #0x12c
    ldr r0, [r2, r0]
    mul r1, r0, r1
    ldr r0, [sp, #0x58]
    add r6, r6, r1
    add r0, r0, r1
    str r0, [sp, #0x58]
    b .L_021c601c
.L_021c54bc:
    ldr r1, .L_021c5d44
    mov r0, r10
    bl func_ov002_021bb90c
    mov r1, #0x1f4
    mla r6, r0, r1, r6
    b .L_021c601c
.L_021c54d4:
    ldr r0, .L_021c5d5c
    ldr ip, .L_021c5d60
    sub r2, r0, #0xa10
    ldr r1, .L_021c5d64
    mov lr, #0x0
    str r2, [sp, #0x70]
.L_021c54ec:
    ldr r8, [sp, #0x70]
    ldr r2, .L_021c5d68
    and r11, lr, #0x1
    mla r8, r11, r8, r2
    ldr r2, [r8, #0x14]
    mov r3, #0x0
    cmp r2, #0x0
    bls .L_021c5540
    add r8, r8, #0x18
    add r8, r8, #0x400
.L_021c5514:
    ldr r11, [r8, #0x0]
    add r3, r3, #0x1
    mov r11, r11, lsl #0x13
    mov r11, r11, lsr #0x13
    cmp r11, r1
    cmpne r11, r0
    cmpne r11, ip
    addeq r6, r6, #0x12c
    add r8, r8, #0x4
    cmp r3, r2
    blo .L_021c5514
.L_021c5540:
    add lr, lr, #0x1
    cmp lr, #0x2
    blt .L_021c54ec
    b .L_021c601c
.L_021c5550:
    mov r0, #0x0
    mov r1, #0xa
    bl func_ov002_021bbc58
    mov r1, #0xc8
    mla r6, r0, r1, r6
    mov r0, #0x1
    mov r1, #0xa
    bl func_ov002_021bbc58
    mov r1, #0xc8
    mla r6, r0, r1, r6
    b .L_021c601c
.L_021c557c:
    ldr r1, .L_021c5d6c
    ldr r0, [sp, #0x1c]
    add r1, r1, r0
    ldr r0, [sp, #0x18]
    ldr r0, [r1, r0]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [r9, #0x14]
    ldr r0, [sp, #0x18]
    ldr r0, [r1, r0]
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [r9, #0x18]
    b .L_021c601c
.L_021c55b8:
    rsb r8, r10, #0x1
    mov r0, r8
    mov r1, #0x1
    bl func_ov002_021bd364
    mov r1, #0x1f4
    mla r6, r0, r1, r6
    mov r0, r8
    mov r1, #0x1
    bl func_ov002_021bbc58
    mov r1, #0x1f4
    mla r6, r0, r1, r6
    b .L_021c601c
.L_021c55e8:
    mov r8, #0x0
    mov r11, #0x1f4
.L_021c55f0:
    mov r0, r8
    mov r1, #0x1
    bl func_ov002_021bd364
    mov r1, #0x1f4
    mla r6, r0, r1, r6
    mov r0, r8
    mov r1, #0x1
    bl func_ov002_021bbc58
    add r8, r8, #0x1
    mla r6, r0, r11, r6
    cmp r8, #0x2
    blt .L_021c55f0
    b .L_021c601c
.L_021c5624:
    ldr r2, .L_021c5d58
    ldr r0, [sp, #0x1c]
    mov r1, #0x190
    ldr r0, [r2, r0]
    mul r1, r0, r1
    ldr r0, [sp, #0x58]
    sub r6, r6, r1
    sub r0, r0, r1
    str r0, [sp, #0x58]
    b .L_021c601c
.L_021c564c:
    rsb r0, r10, #0x1
    bl func_ov002_021bbf98
    cmp r0, #0x0
    subgt r6, r6, #0x3e8
    b .L_021c601c
.L_021c5660:
    ldr r2, .L_021c5d58
    ldr r0, [sp, #0x1c]
    mov r1, #0x3e8
    ldr r0, [r2, r0]
    mul r1, r0, r1
    str r1, [r9, #0x18]
    str r1, [r9, #0x14]
    b .L_021c601c
.L_021c5680:
    ldr r0, [sp, #0x18]
    ldr r0, [r8, r0]
    mov r0, r0, lsr #0x4
    tst r0, #0x1
    beq .L_021c56bc
    ldr r1, .L_021c5d6c
    ldr r0, [sp, #0x1c]
    add r1, r1, r0
    ldr r0, [sp, #0x18]
    ldr r1, [r0, r1]
    ldr r0, [sp, #0x58]
    add r6, r6, r1
    add r0, r0, r1
    str r0, [sp, #0x58]
    b .L_021c601c
.L_021c56bc:
    ldr r1, .L_021c5d6c
    ldr r0, [sp, #0x1c]
    add r1, r1, r0
    ldr r0, [sp, #0x18]
    ldr r0, [r1, r0]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [r9, #0x14]
    ldr r0, [sp, #0x18]
    ldr r0, [r1, r0]
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [r9, #0x18]
    b .L_021c601c
.L_021c56f8:
    ldr r2, [sp, #0x4]
    mov r0, r10
    mov r1, #0xa
    bl func_ov002_021bbbc0
    cmp r0, #0x0
    bne .L_021c601c
    mov r0, #0x3e8
    str r0, [r9, #0x14]
    str r0, [r9, #0x18]
    b .L_021c601c
.L_021c5720:
    ldr r0, [sp, #0x18]
    ldr r0, [r8, r0]
    mov r0, r0, lsr #0x5
    tst r0, #0x1
    beq .L_021c601c
    ldr r0, [sp, #0x58]
    add r6, r6, #0x1f4
    add r0, r0, #0x1f4
    str r0, [sp, #0x58]
    b .L_021c601c
.L_021c5748:
    rsb r0, r10, #0x1
    bl func_ov002_021bbf98
    mov r1, #0xc8
    mul r1, r0, r1
    sub r6, r6, r1
    b .L_021c601c
.L_021c5760:
    mov r0, #0x0
    bl func_ov002_021bd274
    cmp r0, #0x0
    bne .L_021c5780
    mov r0, #0x1
    bl func_ov002_021bd274
    cmp r0, #0x0
    beq .L_021c601c
.L_021c5780:
    ldr r0, .L_021c5d70
    str r0, [r9, #0x14]
    str r0, [r9, #0x18]
    b .L_021c601c
.L_021c5790:
    ldr r0, .L_021c5d74
    ldr r1, [r0, #0xcec]
    cmp r10, r1
    ldreq r0, [r0, #0xcf8]
    cmpeq r0, #0x3
    addeq r6, r6, #0x12c
    b .L_021c601c
.L_021c57ac:
    ldr r0, .L_021c5d74
    ldr r1, [r0, #0xcec]
    cmp r10, r1
    beq .L_021c601c
    ldr r0, [r0, #0xcf8]
    cmp r0, #0x3
    addeq r6, r6, #0x12c
    b .L_021c601c
.L_021c57cc:
    mov r0, r10
    mov r1, #0x11
    bl func_ov002_021bd364
    mov r1, #0xc8
    mla r6, r0, r1, r6
    b .L_021c601c
.L_021c57e4:
    ldr r1, [sp, #0x4]
    mov r0, r10
    bl func_ov002_021b3618
    ldr r1, .L_021c5d78
    cmp r0, r1
    beq .L_021c601c
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r0, r0, #0xff
    and r1, r1, #0xff
    add r2, sp, #0x84
    bl func_ov002_021c4c9c
    ldr r1, [sp, #0x98]
    mov r0, #0x1
    str r1, [r9, #0x14]
    str r0, [sp, #0x44]
    ldr r0, [sp, #0x9c]
    str r0, [r9, #0x18]
    b .L_021c601c
.L_021c5834:
    ldr r1, .L_021c5d58
    ldr r0, [sp, #0x1c]
    ldr r0, [r1, r0]
    cmp r0, #0x1
    addls r6, r6, #0x190
    b .L_021c601c
.L_021c584c:
    ldr r2, [sp, #0x4]
    mov r0, r10
    mov r1, #0x1
    bl func_ov002_021bbbc0
    mov r1, #0x1f4
    mla r6, r0, r1, r6
    b .L_021c601c
.L_021c5868:
    ldr r1, .L_021c5d7c
    mov r0, r10
    bl func_ov002_021bc000
    mov r1, #0x64
    mla r6, r0, r1, r6
    b .L_021c601c
.L_021c5880:
    ldr r1, .L_021c5d7c
    mov r0, r10
    bl func_ov002_021bc000
    mov r1, #0x190
    mla r6, r0, r1, r6
    b .L_021c601c
.L_021c5898:
    ldr r1, [sp, #0x4]
    mov r0, r10
    bl func_ov002_021b9e00
    mov r1, #0xc8
    mla r6, r0, r1, r6
    b .L_021c601c
.L_021c58b0:
    ldr r1, [sp, #0x4]
    mov r0, r10
    bl func_ov002_021b9e00
    mov r1, #0x12c
    mla r6, r0, r1, r6
    b .L_021c601c
.L_021c58c8:
    rsb r0, r10, #0x1
    bl func_ov002_021bbf98
    mov r1, #0x1f4
    mla r6, r0, r1, r6
    b .L_021c601c
.L_021c58dc:
    ldr r1, .L_021c5d6c
    ldr r0, [sp, #0x1c]
    add r1, r1, r0
    ldr r0, [sp, #0x18]
    ldr r0, [r0, r1]
    str r0, [r9, #0x14]
    b .L_021c601c
.L_021c58f8:
    ldr r2, [sp, #0x4]
    mov r0, r10
    mov r1, #0x7
    bl func_ov002_021bbbc0
    mov r1, #0x1f4
    mla r6, r0, r1, r6
    rsb r0, r10, #0x1
    mov r1, #0x7
    bl func_ov002_021bbc58
    mov r1, #0x1f4
    mla r6, r0, r1, r6
    b .L_021c601c
.L_021c5928:
    mov r0, r10
    bl func_ov002_021c325c
    mov r1, #0x12c
    mul r1, r0, r1
    str r1, [r9, #0x14]
    b .L_021c601c
.L_021c5940:
    ldr r3, .L_021c5d80
    ldr r0, [sp, #0x1c]
    mov r1, #0x190
    ldr r0, [r3, r0]
    mul r2, r0, r1
    ldr r0, [sp, #0x1c]
    str r2, [r9, #0x14]
    ldr r0, [r3, r0]
    mul r1, r0, r1
    str r1, [r9, #0x18]
    b .L_021c601c
.L_021c596c:
    sub r2, r1, #0x8d
    ldr r1, .L_021c5d68
    ldr r0, [sp, #0x1c]
    add r3, r1, r0
    ldr r0, [r3, #0xf8]
    mov r0, r0, lsl #0x13
    cmp r2, r0, lsr #0x13
    bne .L_021c601c
    rsb r2, r10, #0x1
    ldr r0, [r3, #0x0]
    and r3, r2, #0x1
    ldr r2, .L_021c5d24
    mul r2, r3, r2
    ldr r1, [r1, r2]
    subs r1, r0, r1
    movmi r1, #0x0
    ldr r0, [sp, #0x58]
    add r6, r6, r1
    add r0, r0, r1
    str r0, [sp, #0x58]
    b .L_021c601c
.L_021c59c0:
    rsb r0, r10, #0x1
    mov r1, #0x3
    bl func_ov002_021bbc58
    mov r8, r0
    ldr r2, [sp, #0x4]
    mov r0, r10
    mov r1, #0x3
    bl func_ov002_021bbbc0
    mov r1, #0x3e8
    mul r2, r0, r1
    mla r0, r8, r1, r2
    str r0, [r9, #0x14]
    str r0, [r9, #0x18]
    b .L_021c601c
.L_021c59f8:
    ldr r1, .L_021c5d58
    ldr r0, [sp, #0x1c]
    ldr r0, [r1, r0]
    cmp r0, #0x0
    bne .L_021c601c
    mov r1, #0x0
    mov r0, r10
    mov r2, r1
    mov r3, r1
    bl func_ov002_021bcf18
    cmp r0, #0x0
    addeq r0, r6, #0x1dc
    addeq r6, r0, #0x400
    b .L_021c601c
.L_021c5a30:
    rsb r0, r10, #0x1
    mov r1, #0x4
    bl func_ov002_021bbd04
    mov r8, r0
    ldr r2, [sp, #0x4]
    mov r0, r10
    mov r1, #0x4
    bl func_ov002_021bbc68
    mov r1, #0x3e8
    mul r2, r0, r1
    mla r0, r8, r1, r2
    add r6, r6, r0
    b .L_021c601c
.L_021c5a64:
    mov r0, r10
    mov r1, #0x4
    bl func_ov002_021bbd04
    cmp r0, #0x0
    bne .L_021c5a8c
    rsb r0, r10, #0x1
    mov r1, #0x4
    bl func_ov002_021bbd04
    cmp r0, #0x0
    beq .L_021c601c
.L_021c5a8c:
    add r6, r6, #0x1f4
    b .L_021c601c
.L_021c5a94:
    ldr r2, .L_021c5d58
    ldr r0, [sp, #0x1c]
    mov r1, #0x190
    ldr r0, [r2, r0]
    mul r1, r0, r1
    ldr r0, [sp, #0x58]
    add r6, r6, r1
    add r0, r0, r1
    str r0, [sp, #0x58]
    b .L_021c601c
.L_021c5abc:
    ldr r1, [sp, #0x4]
    mov r0, r10
    bl func_ov002_021b8fcc
    cmp r0, #0x0
    beq .L_021c601c
    ldr r1, .L_021c5d84
    mov r0, r10
    bl func_ov002_021bb90c
    cmp r0, #0x0
    beq .L_021c601c
    ldr r1, .L_021c5d88
    mov r0, r10
    bl func_ov002_021bb90c
    cmp r0, #0x0
    beq .L_021c601c
    ldr r1, .L_021c5d8c
    mov r0, r10
    bl func_ov002_021bb90c
    cmp r0, #0x0
    ldrne r0, .L_021c5d70
    strne r0, [r9, #0x14]
    b .L_021c601c
.L_021c5b14:
    ldr r1, [sp, #0x4]
    mov r0, r10
    bl func_ov002_021b9e00
    mov r1, #0x1f4
    mla r6, r0, r1, r6
    b .L_021c601c
.L_021c5b2c:
    mov r0, r10
    mov r1, #0x1
    bl func_ov002_021bd364
    mov r1, #0x12c
    mla r6, r0, r1, r6
    b .L_021c601c
.L_021c5b44:
    mov r11, #0x0
    add r0, sp, #0x78
    str r11, [r0, #0x0]
    str r11, [r0, #0x4]
    ldr r2, .L_021c5d68
    ldr r0, [sp, #0x1c]
    add r8, r2, r0
    add r0, r1, #0xd8
    str r0, [sp, #0x74]
.L_021c5b68:
    mov r0, r10
    mov r1, r11
    bl func_ov002_021b9ecc
    ldr r1, [sp, #0x74]
    cmp r0, r1
    bne .L_021c5ba4
    ldrh r0, [r8, #0x38]
    cmp r0, #0x0
    beq .L_021c5ba4
    ldrh r0, [r8, #0x36]
    add r1, sp, #0x78
    ldr r1, [r1, r0, lsl #0x2]
    add r2, r1, #0x1
    add r1, sp, #0x78
    str r2, [r1, r0, lsl #0x2]
.L_021c5ba4:
    add r8, r8, #0x14
    add r11, r11, #0x1
    cmp r11, #0x4
    ble .L_021c5b68
    ldr r0, [sp, #0x7c]
    cmp r0, #0x0
    ldreq r2, [sp, #0x78]
    moveq r1, #0x3e8
    mlaeq r6, r2, r1, r6
    ldr r1, [sp, #0x78]
    cmp r1, #0x0
    bne .L_021c601c
    ldr r1, [sp, #0x58]
    mov r2, #0x3e8
    mla r1, r0, r2, r1
    str r1, [sp, #0x58]
    b .L_021c601c
.L_021c5be8:
    ldr r1, .L_021c5d58
    ldr r0, [sp, #0x1c]
    ldr r0, [r1, r0]
    cmp r0, #0x0
    addeq r6, r6, #0x3e8
    b .L_021c601c
.L_021c5c00:
    ldr r1, .L_021c5d90
    mov r0, r10
    bl func_ov002_021c32d4
    mov r1, #0x12c
    mla r6, r0, r1, r6
    b .L_021c601c
.L_021c5c18:
    rsb r0, r10, #0x1
    bl func_ov002_021bbf50
    mov r1, #0xc8
    mla r6, r0, r1, r6
    mov r0, r10
    bl func_ov002_021bbf50
    sub r1, r0, #0x1
    mov r0, #0x1f4
    mul r0, r1, r0
    sub r6, r6, r0
    b .L_021c601c
.L_021c5c44:
    ldr r1, [sp, #0x4]
    mov r0, r10
    bl func_ov002_021b9e00
    mov r1, #0x1f4
    mla r6, r0, r1, r6
    b .L_021c601c
.L_021c5c5c:
    mov r0, r10
    mov r1, #0x4
    bl func_ov002_021bd4ec
    mov r1, #0x3e8
    mla r6, r0, r1, r6
    b .L_021c601c
.L_021c5c74:
    rsb r0, r10, #0x1
    mov r1, #0x7
    bl func_ov002_021bbc58
    mov r6, r0
    ldr r2, [sp, #0x4]
    mov r0, r10
    mov r1, #0x7
    bl func_ov002_021bbbc0
    add r1, r0, r6
    mov r0, #0x64
    mul r6, r1, r0
    str r6, [sp, #0x58]
    b .L_021c601c
.L_021c5ca8:
    mov r0, #0x1
    bl func_ov002_021bc07c
    mov r8, r0
    mov r0, #0x0
    bl func_ov002_021bc07c
    add r1, r0, r8
    mov r0, #0x1f4
    mul r0, r1, r0
    str r0, [r9, #0x18]
    str r0, [r9, #0x14]
    b .L_021c601c
.L_021c5cd4:
    sub r1, r1, #0xdc
    mov r0, r10
    bl func_ov002_021c2f24
    mov r1, #0x12c
    mla r6, r0, r1, r6
    b .L_021c601c
.L_021c5cec:
    mov r1, r0
    mov r0, r10
    bl func_ov002_021c2f24
    mov r1, #0x1f4
    mla r6, r0, r1, r6
    b .L_021c601c
.L_021c5d04:
    ldr r1, .L_021c5d6c
    ldr r0, [sp, #0x1c]
    add r1, r1, r0
    ldr r0, [sp, #0x18]
    ldr r0, [r0, r1]
    tst r0, #0x1
    addne r6, r6, #0x3e8
    b .L_021c601c
.L_021c5d24:
        .word   0x868
.L_021c5d28:
        .word   data_ov002_022cf1ac
.L_021c5d2c:
        .word   data_ov002_022cf1a4
.L_021c5d30:
        .word   0x18c7
.L_021c5d34:
        .word   0x1257
.L_021c5d38:
        .word   0x16ac
.L_021c5d3c:
        .word   0x13ad
.L_021c5d40:
        .word   0x11d0
.L_021c5d44:
        .word   0xfb2
.L_021c5d48:
        .word   0x154a
.L_021c5d4c:
        .word   0x17eb
.L_021c5d50:
        .word   0x19f5
.L_021c5d54:
        .word   0x1b16
.L_021c5d58:
        .word   data_ov002_022cf178
.L_021c5d5c:
        .word   0x1278
.L_021c5d60:
        .word   0x142d
.L_021c5d64:
        .word   0xfc9
.L_021c5d68:
        .word   data_ov002_022cf16c
.L_021c5d6c:
        .word   data_ov002_022cf1a8
.L_021c5d70:
        .word   0xbb8
.L_021c5d74:
        .word   data_ov002_022d016c
.L_021c5d78:
        .word   0xffff
.L_021c5d7c:
        .word   func_0202e79c
.L_021c5d80:
        .word   data_ov002_022cf188
.L_021c5d84:
        .word   0x1807
.L_021c5d88:
        .word   0x180b
.L_021c5d8c:
        .word   0x180c
.L_021c5d90:
        .word   func_0202eac8
.L_021c5d94:
    sub r1, r1, #0x2a
    mov r0, r10
    bl func_ov002_021c2f24
    mov r1, #0x1f4
    mla r6, r0, r1, r6
    b .L_021c601c
.L_021c5dac:
    rsb r0, r10, #0x1
    str r0, [sp, #0x2c]
    mov r0, #0x0
    str r0, [sp, #0x40]
    str r0, [sp, #0xc]
    ldr r0, [sp, #0x2c]
    ldr r2, .L_021c5d68
    and r1, r0, #0x1
    ldr r0, .L_021c5d24
    mla r8, r1, r0, r2
    add r11, r8, #0x30
.L_021c5dd8:
    ldr r0, [r11, #0x0]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    ldrneh r0, [r8, #0x38]
    cmpne r0, #0x0
    beq .L_021c5e10
    ldr r0, [sp, #0x2c]
    ldr r1, [sp, #0xc]
    bl func_ov002_021c92fc
    ldr r1, [r9, #0xc]
    tst r1, r0
    ldrne r0, [sp, #0x40]
    addne r0, r0, #0x1
    strne r0, [sp, #0x40]
.L_021c5e10:
    ldr r0, [sp, #0xc]
    add r11, r11, #0x14
    add r0, r0, #0x1
    add r8, r8, #0x14
    str r0, [sp, #0xc]
    cmp r0, #0x4
    ble .L_021c5dd8
    ldr r0, [sp, #0x40]
    mov r1, #0x12c
    mla r6, r0, r1, r6
    b .L_021c601c
.L_021c5e3c:
    ldr r2, .L_021c5d80
    ldr r0, [sp, #0x1c]
    mov r1, #0x12c
    ldr r0, [r2, r0]
    mul r6, r0, r1
    str r6, [sp, #0x58]
    b .L_021c601c
.L_021c5e58:
    mov r0, #0x1
    bl func_ov002_021c3350
    mov r8, r0
    mov r0, #0x0
    bl func_ov002_021c3350
    add r1, r0, r8
    mov r0, #0x64
    mul r0, r1, r0
    str r0, [r9, #0x18]
    str r0, [r9, #0x14]
    b .L_021c601c
.L_021c5e84:
    mov r0, #0x1
    bl func_ov002_021c3350
    mov r8, r0
    mov r0, #0x0
    bl func_ov002_021c3350
    add r1, r0, r8
    mov r0, #0xc8
    mul r0, r1, r0
    str r0, [r9, #0x18]
    str r0, [r9, #0x14]
    b .L_021c601c
.L_021c5eb0:
    mov r0, #0x1
    bl func_ov002_021c3350
    mov r8, r0
    mov r0, #0x0
    bl func_ov002_021c3350
    add r1, r0, r8
    mov r0, #0x12c
    mul r0, r1, r0
    str r0, [r9, #0x18]
    str r0, [r9, #0x14]
    b .L_021c601c
.L_021c5edc:
    ldr r1, .L_021c5d68
    ldr r0, [sp, #0x1c]
    mov r8, #0x0
    add r11, r1, r0
    add r0, r11, #0x30
    str r8, [r9, #0x14]
    str r0, [sp, #0x30]
.L_021c5ef8:
    ldr r0, [sp, #0x4]
    cmp r8, r0
    beq .L_021c5f50
    ldr r0, [sp, #0x30]
    ldr r0, [r0, #0x0]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    ldrneh r0, [r11, #0x38]
    cmpne r0, #0x0
    beq .L_021c5f50
    mov r0, r10
    mov r1, r8
    bl func_ov002_021b9ecc
    bl func_0202ed90
    cmp r0, #0x0
    beq .L_021c5f50
    mov r0, r10
    mov r1, r8
    bl func_ov002_021c848c
    ldr r1, [r9, #0x14]
    add r0, r1, r0
    str r0, [r9, #0x14]
.L_021c5f50:
    ldr r0, [sp, #0x30]
    add r8, r8, #0x1
    add r0, r0, #0x14
    str r0, [sp, #0x30]
    add r11, r11, #0x14
    cmp r8, #0x4
    ble .L_021c5ef8
    ldr r0, [r9, #0x14]
    str r0, [r9, #0x18]
    b .L_021c601c
.L_021c5f78:
    mov r0, #0x0
    bl func_ov002_021bcf00
    mov r6, r0
    mov r0, #0x1
    bl func_ov002_021bcf00
    add r1, r6, r0
    mov r0, #0x190
    mul r6, r1, r0
    b .L_021c601c
.L_021c5f9c:
    rsb r0, r10, #0x1
    bl func_ov002_021bcf00
    mov r1, #0x190
    mul r6, r0, r1
    b .L_021c601c
.L_021c5fb0:
    mov r0, r10
    bl func_ov002_021c325c
    mov r1, #0x64
    mul r6, r0, r1
    b .L_021c601c
.L_021c5fc4:
    ldr r1, .L_021c6f78
    mov r0, r10
    bl func_ov002_021bc000
    cmp r0, #0x0
    movne r6, #0x7d0
    b .L_021c601c
.L_021c5fdc:
    rsb r0, r10, #0x1
    and r2, r0, #0x1
    ldr r8, .L_021c5d68
    ldr r0, [sp, #0x1c]
    ldr r1, .L_021c5d24
    ldr r3, [r8, r0]
    mul r0, r2, r1
    ldr r0, [r8, r0]
    cmp r0, r3
    subgt r6, r0, r3
    b .L_021c601c
.L_021c6008:
    mov r0, r10
    mov r1, #0x6
    bl func_ov002_021bbd04
    mov r1, #0x1f4
    mul r6, r0, r1
.L_021c601c:
    ldr r1, [r9, #0x0]
    ldr r11, .L_021c6f7c
    cmp r1, r11
    beq .L_021c6040
    ldr r0, .L_021c6f80
    cmp r1, r0
    moveq r0, #0x1
    streq r0, [sp, #0x44]
    b .L_021c6094
.L_021c6040:
    ldr r0, [r9, #0x24]
    and r0, r0, #0x1
    cmp r0, #0x0
    bgt .L_021c6094
    mov r8, #0x5
.L_021c6054:
    mov r0, r10
    mov r1, r8
    add r2, r11, #0xc1
    bl func_ov002_021baca8
    cmp r0, #0x0
    beq .L_021c6088
    mov r0, r10
    mov r1, r8
    add r2, r11, #0xc1
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    ldrne r0, .L_021c5d70
    strne r0, [r9, #0x14]
.L_021c6088:
    add r8, r8, #0x1
    cmp r8, #0xa
    ble .L_021c6054
.L_021c6094:
    mov r0, #0x0
    str r0, [sp, #0x10]
.L_021c609c:
    mov r0, #0x0
    str r0, [sp, #0x8]
    ldr r0, [sp, #0x10]
    ldr r2, .L_021c5d68
    and r1, r0, #0x1
    ldr r0, .L_021c5d24
    mla r8, r1, r0, r2
    add r11, r8, #0x30
.L_021c60bc:
    ldr r0, [r11, #0x0]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_021c6144
    ldr r1, [r8, #0x40]
    ldrh r0, [r8, #0x38]
    mov r2, r1, lsr #0x6
    and r2, r2, #0x1
    mvn r2, r2
    and r0, r0, r2
    mov r2, r1, lsr #0x2
    orr r1, r2, r1, lsr #0x1
    and r1, r1, #0x1
    mvn r1, r1
    tst r0, r1
    beq .L_021c6144
    ldr r0, [sp, #0x4]
    ldr r1, [sp, #0x10]
    str r0, [sp, #0x0]
    ldr r2, [sp, #0x8]
    mov r0, r9
    mov r3, r10
    bl func_ov002_021c4158
    mov r1, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    add r7, r7, r1, asr #0x10
    mov r1, r0, lsl #0x10
    ldr r0, [sp, #0x54]
    add r0, r0, r1, asr #0x10
    str r0, [sp, #0x54]
.L_021c6144:
    ldr r0, [sp, #0x8]
    add r11, r11, #0x14
    add r0, r0, #0x1
    add r8, r8, #0x14
    str r0, [sp, #0x8]
    cmp r0, #0xa
    blt .L_021c60bc
    ldr r0, [sp, #0x10]
    add r0, r0, #0x1
    str r0, [sp, #0x10]
    cmp r0, #0x2
    blt .L_021c609c
    ldr r0, [r9, #0x0]
    bl func_0202f4cc
    cmp r0, #0x0
    beq .L_021c6198
    ldr r1, .L_021c6f84
    mov r0, r10
    bl func_ov002_021c2f90
    mov r1, #0x12c
    mla r7, r0, r1, r7
.L_021c6198:
    ldr r0, [r9, #0x0]
    bl func_0202f500
    cmp r0, #0x0
    beq .L_021c61d0
    ldr r1, .L_021c6f88
    mov r0, #0x0
    bl func_ov002_021c2f90
    mov r1, #0x12c
    mla r7, r0, r1, r7
    mov r0, #0x1
    ldr r1, .L_021c6f88
    bl func_ov002_021c2f90
    mov r1, #0x12c
    mla r7, r0, r1, r7
.L_021c61d0:
    mov r0, #0x0
    ldr r11, .L_021c5d68
    str r0, [sp, #0x4c]
    str r0, [sp, #0x50]
    mov r8, r0
.L_021c61e4:
    ldr r0, .L_021c5d24
    and r1, r8, #0x1
    mla r0, r1, r0, r11
    ldr r1, [r0, #0xf8]
    mov r1, r1, lsl #0x13
    movs r1, r1, lsr #0x13
    beq .L_021c62e4
    ldr r1, [r0, #0x108]
    add r0, r0, #0x100
    ldrh r0, [r0, #0x0]
    mov r2, r1, lsr #0x6
    and r2, r2, #0x1
    mvn r2, r2
    and r0, r0, r2
    mov r2, r1, lsr #0x2
    orr r1, r2, r1, lsr #0x1
    and r1, r1, #0x1
    mvn r1, r1
    tst r0, r1
    beq .L_021c62e4
    cmp r10, r8
    movne r0, #0x1
    moveq r0, #0x0
    ldr r1, [r9, #0x24]
    add r0, r0, #0x1
    and r0, r1, r0
    cmp r0, #0x0
    bgt .L_021c62e4
    ldr r0, [sp, #0x4]
    mov r1, r8
    str r0, [sp, #0x0]
    mov r0, r9
    mov r2, #0xa
    mov r3, r10
    bl func_ov002_021c3e40
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r2, r1, lsl #0x10
    ldr r1, [sp, #0x50]
    mov r0, r0, lsr #0x10
    add r1, r1, r2, asr #0x10
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r1, [sp, #0x50]
    mov r1, r0, lsl #0x10
    ldr r0, [sp, #0x4c]
    mov r2, r8
    add r0, r0, r1, asr #0x10
    str r0, [sp, #0x4c]
    ldr r1, [sp, #0x4]
    mov r0, r10
    mov r3, #0xa
    bl func_ov002_021b34f4
    cmp r0, #0x0
    bne .L_021c62e4
    ldr r0, [sp, #0x50]
    ldr r1, [sp, #0x54]
    add r7, r7, r0
    ldr r0, [sp, #0x4c]
    add r0, r1, r0
    str r0, [sp, #0x54]
    mov r0, #0x0
    str r0, [sp, #0x4c]
    str r0, [sp, #0x50]
.L_021c62e4:
    add r8, r8, #0x1
    cmp r8, #0x2
    blt .L_021c61e4
    ldr r1, .L_021c6f8c
    ldr r0, [sp, #0x1c]
    add r1, r1, r0
    ldr r0, [sp, #0x18]
    ldrh r0, [r0, r1]
    str r0, [sp, #0x14]
    cmp r0, #0x0
    beq .L_021c7d54
.L_021c6310:
    ldr r0, [sp, #0x14]
    ldr r3, .L_021c6f90
    mov r0, r0, lsl #0x3
    ldrh r2, [r3, r0]
    ldr r0, [sp, #0x14]
    add r0, r3, r0, lsl #0x3
    str r0, [sp, #0x3c]
    ldrh r1, [r0, #0x2]
    ldrh r0, [r0, #0x4]
    and r11, r2, #0xff
    str r0, [sp, #0x28]
    mov r0, r1, lsl #0x1c
    mov r0, r0, lsr #0x1c
    str r0, [sp, #0x38]
    cmp r0, #0xd
    mov r0, r2, asr #0x8
    and r0, r0, #0xff
    str r0, [sp, #0x34]
    ldr r0, [sp, #0x3c]
    ldrh r0, [r0, #0x6]
    str r0, [sp, #0x14]
    bhi .L_021c7d48
    ldr r0, [sp, #0x38]
    add pc, pc, r0, lsl #0x2
    mov r0, r0
    b .L_021c7d48
    b .L_021c63ac
    b .L_021c63ac
    b .L_021c63ac
    b .L_021c63ac
    b .L_021c700c
    b .L_021c7028
    b .L_021c7028
    b .L_021c7028
    b .L_021c7028
    b .L_021c738c
    b .L_021c738c
    b .L_021c7cec
    b .L_021c7b50
.L_021c63ac:
    ldr r1, .L_021c6f94
    cmp r2, r1
    bgt .L_021c67a4
    bge .L_021c6b88
    ldr r0, .L_021c6f98
    cmp r2, r0
    bgt .L_021c65c4
    bge .L_021c6ba8
    sub r3, r1, #0x360
    cmp r2, r3
    bgt .L_021c64bc
    mov r0, r3
    cmp r2, r0
    bge .L_021c6bd8
    sub r0, r1, #0x3e4
    cmp r2, r0
    bgt .L_021c644c
    bge .L_021c6b88
    ldr r1, .L_021c6f9c
    cmp r2, r1
    bgt .L_021c6428
    bge .L_021c6d1c
    sub r0, r1, #0xbd
    cmp r2, r0
    bgt .L_021c6418
    beq .L_021c6c00
    b .L_021c7d48
.L_021c6418:
    sub r0, r1, #0x1a
    cmp r2, r0
    beq .L_021c6b78
    b .L_021c7d48
.L_021c6428:
    add r0, r1, #0x8d
    cmp r2, r0
    bgt .L_021c643c
    beq .L_021c6d60
    b .L_021c7d48
.L_021c643c:
    add r0, r1, #0xbe
    cmp r2, r0
    beq .L_021c6b88
    b .L_021c7d48
.L_021c644c:
    ldr r1, .L_021c6fa0
    cmp r2, r1
    bgt .L_021c6498
    bge .L_021c6bb8
    sub r0, r1, #0x22
    cmp r2, r0
    bgt .L_021c6488
    sub r0, r1, #0x23
    cmp r2, r0
    blt .L_021c7d48
    beq .L_021c6be8
    sub r0, r1, #0x22
    cmp r2, r0
    beq .L_021c6c64
    b .L_021c7d48
.L_021c6488:
    sub r0, r1, #0x1
    cmp r2, r0
    beq .L_021c6b70
    b .L_021c7d48
.L_021c6498:
    add r0, r1, #0x37
    cmp r2, r0
    bgt .L_021c64ac
    beq .L_021c6b78
    b .L_021c7d48
.L_021c64ac:
    add r0, r1, #0x38
    cmp r2, r0
    beq .L_021c6bc8
    b .L_021c7d48
.L_021c64bc:
    sub r1, r0, #0xb2
    cmp r2, r1
    bgt .L_021c655c
    bge .L_021c6bb0
    sub r1, r0, #0xe6
    cmp r2, r1
    bgt .L_021c6508
    sub r0, r0, #0xe6
    cmp r2, r0
    bge .L_021c6b70
    ldr r0, .L_021c6fa4
    cmp r2, r0
    bgt .L_021c64f8
    beq .L_021c6db4
    b .L_021c7d48
.L_021c64f8:
    add r0, r0, #0x5a
    cmp r2, r0
    beq .L_021c6dd0
    b .L_021c7d48
.L_021c6508:
    sub r1, r0, #0xd0
    cmp r2, r1
    bgt .L_021c6524
    sub r0, r0, #0xd0
    cmp r2, r0
    beq .L_021c6ea0
    b .L_021c7d48
.L_021c6524:
    sub r1, r0, #0xc9
    cmp r2, r1
    bgt .L_021c7d48
    sub r1, r0, #0xcd
    cmp r2, r1
    blt .L_021c7d48
    beq .L_021c6ea0
    sub r1, r0, #0xcb
    cmp r2, r1
    beq .L_021c6ec0
    sub r0, r0, #0xc9
    cmp r2, r0
    beq .L_021c6ea0
    b .L_021c7d48
.L_021c655c:
    sub r1, r0, #0x38
    cmp r2, r1
    bgt .L_021c6598
    bge .L_021c6e10
    sub r1, r0, #0x8f
    cmp r2, r1
    bgt .L_021c6588
    sub r0, r0, #0x8f
    cmp r2, r0
    beq .L_021c6b9c
    b .L_021c7d48
.L_021c6588:
    sub r0, r0, #0x74
    cmp r2, r0
    beq .L_021c6e10
    b .L_021c7d48
.L_021c6598:
    sub r1, r0, #0x37
    cmp r2, r1
    bgt .L_021c65b4
    sub r0, r0, #0x37
    cmp r2, r0
    beq .L_021c6b9c
    b .L_021c7d48
.L_021c65b4:
    sub r0, r0, #0x3
    cmp r2, r0
    beq .L_021c6b70
    b .L_021c7d48
.L_021c65c4:
    add r3, r0, #0xaa
    cmp r2, r3
    bgt .L_021c66bc
    mov r1, r3
    cmp r2, r1
    bge .L_021c6c14
    add r1, r0, #0x41
    cmp r2, r1
    bgt .L_021c6654
    bge .L_021c6c64
    add r1, r0, #0x29
    cmp r2, r1
    bgt .L_021c6628
    bge .L_021c6b9c
    add r1, r0, #0x5
    cmp r2, r1
    bgt .L_021c6618
    add r0, r0, #0x5
    cmp r2, r0
    beq .L_021c6b5c
    b .L_021c7d48
.L_021c6618:
    add r0, r0, #0x15
    cmp r2, r0
    beq .L_021c6b5c
    b .L_021c7d48
.L_021c6628:
    add r1, r0, #0x2a
    cmp r2, r1
    bgt .L_021c6644
    add r0, r0, #0x2a
    cmp r2, r0
    beq .L_021c6b80
    b .L_021c7d48
.L_021c6644:
    add r0, r0, #0x3c
    cmp r2, r0
    beq .L_021c6c3c
    b .L_021c7d48
.L_021c6654:
    add r1, r0, #0x8a
    cmp r2, r1
    bgt .L_021c6690
    bge .L_021c6b88
    add r1, r0, #0x5a
    cmp r2, r1
    bgt .L_021c6680
    add r0, r0, #0x5a
    cmp r2, r0
    beq .L_021c6c50
    b .L_021c7d48
.L_021c6680:
    add r0, r0, #0x6e
    cmp r2, r0
    beq .L_021c6e3c
    b .L_021c7d48
.L_021c6690:
    add r1, r0, #0x8b
    cmp r2, r1
    bgt .L_021c66ac
    add r0, r0, #0x8b
    cmp r2, r0
    beq .L_021c6b88
    b .L_021c7d48
.L_021c66ac:
    add r0, r0, #0xa3
    cmp r2, r0
    beq .L_021c6b5c
    b .L_021c7d48
.L_021c66bc:
    sub r3, r1, #0x98
    cmp r2, r3
    bgt .L_021c673c
    bge .L_021c6e5c
    add r3, r0, #0xd0
    cmp r2, r3
    bgt .L_021c6710
    mov r1, r3
    cmp r2, r1
    bge .L_021c6b78
    add r1, r0, #0xc0
    cmp r2, r1
    bgt .L_021c6700
    add r0, r0, #0xc0
    cmp r2, r0
    beq .L_021c6ed0
    b .L_021c7d48
.L_021c6700:
    add r0, r0, #0xcf
    cmp r2, r0
    subeq r6, r6, #0x190
    b .L_021c7d48
.L_021c6710:
    add r3, r0, #0xfe
    cmp r2, r3
    bgt .L_021c672c
    add r0, r0, #0xfe
    cmp r2, r0
    subeq r6, r6, #0x320
    b .L_021c7d48
.L_021c672c:
    sub r0, r1, #0xea
    cmp r2, r0
    beq .L_021c6c7c
    b .L_021c7d48
.L_021c673c:
    add r3, r0, #0x1c8
    cmp r2, r3
    bgt .L_021c6778
    add r0, r0, #0x1c8
    cmp r2, r0
    bge .L_021c6b70
    sub r0, r1, #0x82
    cmp r2, r0
    bgt .L_021c6768
    beq .L_021c6bb0
    b .L_021c7d48
.L_021c6768:
    sub r0, r1, #0x4c
    cmp r2, r0
    beq .L_021c6bb0
    b .L_021c7d48
.L_021c6778:
    add r3, r0, #0x1d0
    cmp r2, r3
    bgt .L_021c6794
    add r0, r0, #0x1d0
    cmp r2, r0
    beq .L_021c6b88
    b .L_021c7d48
.L_021c6794:
    sub r0, r1, #0x15
    cmp r2, r0
    beq .L_021c6c90
    b .L_021c7d48
.L_021c67a4:
    ldr r0, .L_021c6fa8
    cmp r2, r0
    bgt .L_021c697c
    bge .L_021c6b70
    sub r3, r0, #0xe5
    cmp r2, r3
    bgt .L_021c68a0
    bge .L_021c6b90
    add r3, r1, #0xa7
    cmp r2, r3
    bgt .L_021c6834
    bge .L_021c6b5c
    add r3, r1, #0x53
    cmp r2, r3
    bgt .L_021c6810
    bge .L_021c6be8
    add r3, r1, #0x34
    cmp r2, r3
    bgt .L_021c6800
    mov r0, r3
    cmp r2, r0
    beq .L_021c6b5c
    b .L_021c7d48
.L_021c6800:
    sub r0, r0, #0x1e0
    cmp r2, r0
    beq .L_021c6b5c
    b .L_021c7d48
.L_021c6810:
    add r0, r1, #0x74
    cmp r2, r0
    bgt .L_021c6824
    beq .L_021c6b70
    b .L_021c7d48
.L_021c6824:
    add r0, r1, #0x9b
    cmp r2, r0
    beq .L_021c6b78
    b .L_021c7d48
.L_021c6834:
    add r3, r1, #0x11c
    cmp r2, r3
    bgt .L_021c6870
    mov r0, r3
    cmp r2, r0
    bge .L_021c6f3c
    add r0, r1, #0xd3
    cmp r2, r0
    bgt .L_021c6860
    beq .L_021c6c90
    b .L_021c7d48
.L_021c6860:
    ldr r0, .L_021c6fac
    cmp r2, r0
    beq .L_021c6f00
    b .L_021c7d48
.L_021c6870:
    sub r1, r0, #0xfb
    cmp r2, r1
    bgt .L_021c6890
    sub r0, r0, #0xfb
    cmp r2, r0
    moveq r0, #0x0
    streq r0, [r9, #0x18]
    b .L_021c7d48
.L_021c6890:
    sub r0, r0, #0xf2
    cmp r2, r0
    beq .L_021c6b5c
    b .L_021c7d48
.L_021c68a0:
    sub r1, r0, #0x4c
    cmp r2, r1
    bgt .L_021c6914
    bge .L_021c6b70
    sub r1, r0, #0x81
    cmp r2, r1
    bgt .L_021c68ec
    bge .L_021c6b88
    sub r1, r0, #0xc1
    cmp r2, r1
    bgt .L_021c68dc
    sub r0, r0, #0xc1
    cmp r2, r0
    beq .L_021c6b88
    b .L_021c7d48
.L_021c68dc:
    sub r0, r0, #0x95
    cmp r2, r0
    beq .L_021c6cac
    b .L_021c7d48
.L_021c68ec:
    sub r1, r0, #0x79
    cmp r2, r1
    bgt .L_021c6908
    sub r0, r0, #0x79
    cmp r2, r0
    beq .L_021c6b5c
    b .L_021c7d48
.L_021c6908:
    cmp r2, #0x1840
    beq .L_021c6cc8
    b .L_021c7d48
.L_021c6914:
    sub r1, r0, #0x2c
    cmp r2, r1
    bgt .L_021c6950
    bge .L_021c6b5c
    sub r1, r0, #0x4b
    cmp r2, r1
    bgt .L_021c6940
    sub r0, r0, #0x4b
    cmp r2, r0
    beq .L_021c6c90
    b .L_021c7d48
.L_021c6940:
    sub r0, r0, #0x39
    cmp r2, r0
    beq .L_021c6b70
    b .L_021c7d48
.L_021c6950:
    sub r1, r0, #0x1f
    cmp r2, r1
    bgt .L_021c696c
    sub r0, r0, #0x1f
    cmp r2, r0
    beq .L_021c6b70
    b .L_021c7d48
.L_021c696c:
    sub r0, r0, #0x1e
    cmp r2, r0
    beq .L_021c6fc0
    b .L_021c7d48
.L_021c697c:
    add r8, r1, #0x324
    cmp r2, r8
    bgt .L_021c6a78
    add r1, r1, #0x324
    cmp r2, r1
    bge .L_021c6b9c
    add r1, r0, #0x93
    cmp r2, r1
    bgt .L_021c6a10
    bge .L_021c6b70
    add r1, r0, #0x50
    cmp r2, r1
    bgt .L_021c69e0
    bge .L_021c6ff4
    add r1, r0, #0x1c
    cmp r2, r1
    bgt .L_021c69d0
    add r0, r0, #0x1c
    cmp r2, r0
    beq .L_021c6b5c
    b .L_021c7d48
.L_021c69d0:
    add r0, r0, #0x44
    cmp r2, r0
    beq .L_021c6fe4
    b .L_021c7d48
.L_021c69e0:
    add r1, r0, #0x60
    cmp r2, r1
    bgt .L_021c69fc
    add r0, r0, #0x60
    cmp r2, r0
    beq .L_021c6cd8
    b .L_021c7d48
.L_021c69fc:
    add r0, r0, #0x7f
    cmp r2, r0
    addeq r0, r6, #0x1dc
    addeq r6, r0, #0x400
    b .L_021c7d48
.L_021c6a10:
    add r1, r0, #0xe8
    cmp r2, r1
    bgt .L_021c6a4c
    bge .L_021c6b5c
    add r1, r0, #0x97
    cmp r2, r1
    bgt .L_021c6a3c
    add r0, r0, #0x97
    cmp r2, r0
    beq .L_021c6b5c
    b .L_021c7d48
.L_021c6a3c:
    add r0, r0, #0xa4
    cmp r2, r0
    beq .L_021c6b70
    b .L_021c7d48
.L_021c6a4c:
    add r1, r0, #0xf7
    cmp r2, r1
    bgt .L_021c6a68
    add r0, r0, #0xf7
    cmp r2, r0
    beq .L_021c6b5c
    b .L_021c7d48
.L_021c6a68:
    add r0, r0, #0xfd
    cmp r2, r0
    beq .L_021c6e7c
    b .L_021c7d48
.L_021c6a78:
    ldr r0, .L_021c6fb0
    cmp r2, r0
    bgt .L_021c6af0
    bge .L_021c6e7c
    sub r1, r0, #0x22
    cmp r2, r1
    bgt .L_021c6ac4
    bge .L_021c6b70
    sub r1, r0, #0x3a
    cmp r2, r1
    bgt .L_021c6ab4
    sub r0, r0, #0x3a
    cmp r2, r0
    beq .L_021c6c14
    b .L_021c7d48
.L_021c6ab4:
    sub r0, r0, #0x39
    cmp r2, r0
    beq .L_021c6c28
    b .L_021c7d48
.L_021c6ac4:
    sub r1, r0, #0x15
    cmp r2, r1
    bgt .L_021c6ae0
    sub r0, r0, #0x15
    cmp r2, r0
    beq .L_021c6b68
    b .L_021c7d48
.L_021c6ae0:
    sub r0, r0, #0x14
    cmp r2, r0
    beq .L_021c6b88
    b .L_021c7d48
.L_021c6af0:
    add r1, r0, #0x30
    cmp r2, r1
    bgt .L_021c6b2c
    bge .L_021c6b88
    add r1, r0, #0x1
    cmp r2, r1
    bgt .L_021c6b1c
    add r0, r0, #0x1
    cmp r2, r0
    beq .L_021c6b68
    b .L_021c7d48
.L_021c6b1c:
    add r0, r0, #0x2f
    cmp r2, r0
    beq .L_021c6b80
    b .L_021c7d48
.L_021c6b2c:
    add r1, r0, #0x99
    cmp r2, r1
    bgt .L_021c6b4c
    bge .L_021c6cf0
    add r0, r0, #0x49
    cmp r2, r0
    beq .L_021c6b5c
    b .L_021c7d48
.L_021c6b4c:
    add r0, r0, #0xbe
    cmp r2, r0
    beq .L_021c6b70
    b .L_021c7d48
.L_021c6b5c:
    ldr r0, [sp, #0x28]
    add r6, r6, r0
    b .L_021c7d48
.L_021c6b68:
    add r6, r6, #0x190
    b .L_021c7d48
.L_021c6b70:
    add r6, r6, #0x1f4
    b .L_021c7d48
.L_021c6b78:
    add r6, r6, #0x2bc
    b .L_021c7d48
.L_021c6b80:
    add r6, r6, #0x320
    b .L_021c7d48
.L_021c6b88:
    add r6, r6, #0x3e8
    b .L_021c7d48
.L_021c6b90:
    add r0, r6, #0x3b8
    add r6, r0, #0x800
    b .L_021c7d48
.L_021c6b9c:
    ldr r0, [sp, #0x28]
    sub r6, r6, r0
    b .L_021c7d48
.L_021c6ba8:
    sub r6, r6, #0xc8
    b .L_021c7d48
.L_021c6bb0:
    sub r6, r6, #0x1f4
    b .L_021c7d48
.L_021c6bb8:
    ldr r0, [sp, #0x58]
    add r0, r0, #0x1f4
    str r0, [sp, #0x58]
    b .L_021c7d48
.L_021c6bc8:
    ldr r0, [sp, #0x58]
    add r0, r0, #0x2bc
    str r0, [sp, #0x58]
    b .L_021c7d48
.L_021c6bd8:
    ldr r0, [sp, #0x58]
    sub r0, r0, #0x1f4
    str r0, [sp, #0x58]
    b .L_021c7d48
.L_021c6be8:
    ldr r0, [sp, #0x28]
    ldr r1, [sp, #0x58]
    add r6, r6, r0
    add r0, r1, r0
    str r0, [sp, #0x58]
    b .L_021c7d48
.L_021c6c00:
    ldr r0, [sp, #0x58]
    add r6, r6, #0x64
    add r0, r0, #0x64
    str r0, [sp, #0x58]
    b .L_021c7d48
.L_021c6c14:
    ldr r0, [sp, #0x58]
    add r6, r6, #0x12c
    add r0, r0, #0x12c
    str r0, [sp, #0x58]
    b .L_021c7d48
.L_021c6c28:
    ldr r0, [sp, #0x58]
    add r6, r6, #0x1f4
    add r0, r0, #0x1f4
    str r0, [sp, #0x58]
    b .L_021c7d48
.L_021c6c3c:
    ldr r0, [sp, #0x58]
    add r6, r6, #0x2bc
    add r0, r0, #0x2bc
    str r0, [sp, #0x58]
    b .L_021c7d48
.L_021c6c50:
    ldr r0, [sp, #0x58]
    add r6, r6, #0x3e8
    add r0, r0, #0x3e8
    str r0, [sp, #0x58]
    b .L_021c7d48
.L_021c6c64:
    ldr r0, [sp, #0x28]
    ldr r1, [sp, #0x58]
    sub r6, r6, r0
    sub r0, r1, r0
    str r0, [sp, #0x58]
    b .L_021c7d48
.L_021c6c7c:
    ldr r0, [sp, #0x58]
    sub r6, r6, #0x1f4
    sub r0, r0, #0x1f4
    str r0, [sp, #0x58]
    b .L_021c7d48
.L_021c6c90:
    ldr r0, [sp, #0x28]
    mov r5, #0x0
    str r0, [r9, #0x18]
    mov r0, r5
    str r5, [sp, #0x54]
    str r0, [sp, #0x58]
    b .L_021c7d48
.L_021c6cac:
    ldr r0, [sp, #0x28]
    cmp r0, #0x0
    beq .L_021c7d48
    ldr r0, .L_021c6fb4
    mov r6, #0x0
    str r0, [r9, #0x14]
    b .L_021c7d48
.L_021c6cc8:
    ldr r0, .L_021c6fb8
    mov r6, #0x0
    str r0, [r9, #0x14]
    b .L_021c7d48
.L_021c6cd8:
    mov r7, #0x0
    mov r0, #0x7d0
    mov r4, r7
    str r0, [r9, #0x14]
    mov r6, r7
    b .L_021c7d48
.L_021c6cf0:
    ldr r0, [sp, #0x28]
    mov r6, #0x0
    str r0, [r9, #0x14]
    ldr r0, [sp, #0x3c]
    ldrh r0, [r0, #0x6]
    add r1, r3, r0, lsl #0x3
    ldrh r0, [r1, #0x4]
    str r0, [r9, #0x18]
    ldrh r0, [r1, #0x6]
    str r0, [sp, #0x14]
    b .L_021c7d48
.L_021c6d1c:
    ldr r0, [sp, #0x44]
    cmp r0, #0x0
    bne .L_021c7d48
    ldr r1, [r9, #0x18]
    ldr r0, [sp, #0x58]
    add r0, r1, r0
    add r1, r5, r0
    ldr r0, [sp, #0x54]
    mov r5, #0x0
    add r0, r0, r1
    add r0, r0, #0x1
    mov r0, r0, asr #0x1
    str r0, [r9, #0x18]
    mov r0, r5
    str r5, [sp, #0x54]
    str r0, [sp, #0x58]
    b .L_021c7d48
.L_021c6d60:
    ldr r0, [sp, #0x44]
    cmp r0, #0x0
    bne .L_021c7d48
    ldr r0, [sp, #0x28]
    cmp r0, #0x0
    ldr r0, [r9, #0x14]
    add r0, r0, r6
    beq .L_021c6d90
    add r0, r4, r0
    add r0, r7, r0
    mov r0, r0, lsl #0x1
    b .L_021c6da0
.L_021c6d90:
    add r0, r4, r0
    add r0, r7, r0
    add r0, r0, #0x1
    mov r0, r0, asr #0x1
.L_021c6da0:
    mov r7, #0x0
    str r0, [r9, #0x14]
    mov r4, r7
    mov r6, r7
    b .L_021c7d48
.L_021c6db4:
    ldr r0, [sp, #0x44]
    cmp r0, #0x0
    bne .L_021c7d48
    ldr r0, [r9, #0x1c]
    mov r0, r0, lsl #0x1
    str r0, [r9, #0x14]
    b .L_021c7d48
.L_021c6dd0:
    ldr r0, [sp, #0x28]
    tst r0, #0x1
    add r0, r0, r0, lsr #0x1f
    mov r1, r0, asr #0x1
    mov r0, #0xa
    mul r2, r1, r0
    addne r6, r6, r2
    bne .L_021c7d48
    ldr r0, [sp, #0x44]
    cmp r0, #0x0
    bne .L_021c7d48
    mov r7, #0x0
    mov r4, r7
    str r2, [r9, #0x14]
    mov r6, r7
    b .L_021c7d48
.L_021c6e10:
    ldr r0, [sp, #0x44]
    cmp r0, #0x0
    bne .L_021c7d48
    ldr r0, [sp, #0x28]
    mov r1, #0xa
    mul r1, r0, r1
    mov r7, #0x0
    mov r4, r7
    str r1, [r9, #0x14]
    mov r6, r7
    b .L_021c7d48
.L_021c6e3c:
    ldr r0, [sp, #0x44]
    cmp r0, #0x0
    bne .L_021c7d48
    ldr r0, [r9, #0x1c]
    add r0, r0, #0x1
    mov r0, r0, asr #0x1
    str r0, [r9, #0x14]
    b .L_021c7d48
.L_021c6e5c:
    ldr r0, [sp, #0x44]
    cmp r0, #0x0
    bne .L_021c7d48
    ldr r0, [r9, #0x1c]
    add r0, r0, #0x1
    mov r0, r0, asr #0x1
    str r0, [r9, #0x14]
    b .L_021c7d48
.L_021c6e7c:
    ldr r0, [sp, #0x44]
    cmp r0, #0x0
    bne .L_021c7d48
    ldr r0, [sp, #0x28]
    mov r7, #0x0
    mov r4, r7
    str r0, [r9, #0x14]
    mov r6, r7
    b .L_021c7d48
.L_021c6ea0:
    ldr r0, [sp, #0x38]
    cmp r0, #0x3
    bne .L_021c7d48
    ldr r0, [sp, #0x58]
    sub r6, r6, #0x1f4
    sub r0, r0, #0x1f4
    str r0, [sp, #0x58]
    b .L_021c7d48
.L_021c6ec0:
    ldr r0, [sp, #0x38]
    cmp r0, #0x3
    addeq r6, r6, #0x3e8
    b .L_021c7d48
.L_021c6ed0:
    ldr r0, [sp, #0x28]
    cmp r0, #0x1
    beq .L_021c6ee8
    cmp r0, #0x2
    beq .L_021c6ef0
    b .L_021c7d48
.L_021c6ee8:
    add r6, r6, #0xc8
    b .L_021c7d48
.L_021c6ef0:
    ldr r0, [sp, #0x58]
    add r0, r0, #0x1f4
    str r0, [sp, #0x58]
    b .L_021c7d48
.L_021c6f00:
    ldr r0, [sp, #0x48]
    mov r1, #0x3e8
    cmp r0, #0x0
    ldr r0, [sp, #0x48]
    rsbne r1, r1, #0x0
    cmp r0, #0x0
    ldr r0, [r9, #0x14]
    add r0, r0, r1
    str r0, [r9, #0x14]
    mov r1, #0x3e8
    ldr r0, [r9, #0x18]
    rsbne r1, r1, #0x0
    add r0, r0, r1
    str r0, [r9, #0x18]
    b .L_021c7d48
.L_021c6f3c:
    ldr r0, [sp, #0x48]
    cmp r0, #0x0
    rsbne r1, r1, #0xec0
    ldr r0, [sp, #0x48]
    moveq r1, #0x7d0
    cmp r0, #0x0
    ldr r0, [r9, #0x14]
    add r0, r0, r1
    str r0, [r9, #0x14]
    mov r1, #0x7d0
    ldr r0, [r9, #0x18]
    rsbne r1, r1, #0x0
    add r0, r0, r1
    str r0, [r9, #0x18]
    b .L_021c7d48
.L_021c6f78:
        .word   func_0202f5cc
.L_021c6f7c:
        .word   0x1782
.L_021c6f80:
        .word   0x19ed
.L_021c6f84:
        .word   0x1aaa
.L_021c6f88:
        .word   0x1b2a
.L_021c6f8c:
        .word   data_ov002_022cf1a6
.L_021c6f90:
        .word   data_ov002_022d0650
.L_021c6f94:
        .word   0x1690
.L_021c6f98:
        .word   0x147d
.L_021c6f9c:
        .word   0x10c6
.L_021c6fa0:
        .word   0x12f2
.L_021c6fa4:
        .word   0x1337
.L_021c6fa8:
        .word   0x18ae
.L_021c6fac:
        .word   0x17ab
.L_021c6fb0:
        .word   0x1a31
.L_021c6fb4:
        .word   0xbb8
.L_021c6fb8:
        .word   0xa8c
.L_021c6fbc:
        .word   data_ov002_022d016c
.L_021c6fc0:
    ldr r0, [sp, #0x28]
    cmp r0, #0x1
    beq .L_021c7d48
    ldr r0, .L_021c6fbc
    ldr r0, [r0, #0xcf8]
    cmp r0, #0x3
    ldreq r0, [sp, #0x28]
    addeq r6, r6, r0
    b .L_021c7d48
.L_021c6fe4:
    ldr r0, [sp, #0x28]
    mov r0, r0, lsl #0x10
    add r6, r6, r0, asr #0x10
    b .L_021c7d48
.L_021c6ff4:
    ldr r0, [r9, #0x24]
    and r0, r0, #0x1
    cmp r0, #0x0
    ldrle r0, [r9, #0x1c]
    addle r6, r6, r0
    b .L_021c7d48
.L_021c700c:
    ldr r0, .L_021c7ee4
    cmp r2, r0
    bne .L_021c7d48
    mov r0, #0x3e8
    str r0, [r9, #0x14]
    str r0, [r9, #0x18]
    b .L_021c7d48
.L_021c7028:
    ldr r0, [sp, #0x34]
    mov r1, #0x14
    mul r1, r0, r1
    str r1, [sp, #0x60]
    ldr r0, .L_021c7ee8
    ldr r1, .L_021c7eec
    and r2, r11, #0x1
    mla r8, r2, r0, r1
    add r1, r8, #0x30
    ldr r0, [sp, #0x60]
    str r1, [sp, #0x64]
    ldr r0, [r1, r0]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_021c7d48
    ldr r0, [sp, #0x60]
    add r0, r8, r0
    ldr r0, [r0, #0x40]
    mov r0, r0, lsr #0x6
    tst r0, #0x1
    bne .L_021c7d48
    ldr r1, [sp, #0x34]
    mov r0, r11
    bl func_ov002_021b9ecc
    ldr r1, .L_021c7ef0
    cmp r0, r1
    bgt .L_021c70dc
    bge .L_021c7200
    ldr r1, .L_021c7ef4
    cmp r0, r1
    bgt .L_021c70b8
    bge .L_021c7148
    ldr r1, .L_021c7ef8
    cmp r0, r1
    beq .L_021c7128
    b .L_021c7344
.L_021c70b8:
    ldr r1, .L_021c7efc
    cmp r0, r1
    bgt .L_021c70cc
    beq .L_021c715c
    b .L_021c7344
.L_021c70cc:
    add r2, r1, #0x364
    cmp r0, r2
    beq .L_021c7180
    b .L_021c7344
.L_021c70dc:
    add r2, r1, #0x3c
    cmp r0, r2
    bgt .L_021c70fc
    bge .L_021c7270
    add r1, r1, #0x34
    cmp r0, r1
    beq .L_021c723c
    b .L_021c7344
.L_021c70fc:
    add r2, r1, #0xc4
    cmp r0, r2
    bgt .L_021c7118
    add r1, r1, #0xc4
    cmp r0, r1
    beq .L_021c7294
    b .L_021c7344
.L_021c7118:
    ldr r1, .L_021c7f00
    cmp r0, r1
    beq .L_021c730c
    b .L_021c7344
.L_021c7128:
    ldr r0, [r9, #0x4]
    cmp r0, #0x2
    bne .L_021c7344
    ldr r0, [sp, #0x54]
    add r7, r7, #0xc8
    add r0, r0, #0xc8
    str r0, [sp, #0x54]
    b .L_021c7344
.L_021c7148:
    ldr r0, [r9, #0x28]
    and r0, r0, #0x2
    cmp r0, #0x0
    suble r7, r7, #0x2bc
    b .L_021c7344
.L_021c715c:
    ldr r0, [r9, #0x28]
    and r0, r0, #0x2
    cmp r0, #0x0
    bgt .L_021c7344
    mov r7, #0x0
    str r7, [r9, #0x14]
    mov r4, r7
    mov r6, r7
    b .L_021c7344
.L_021c7180:
    ldr r0, [sp, #0x44]
    cmp r0, #0x0
    bne .L_021c7344
    ldr r0, [r9, #0x24]
    and r0, r0, #0x1
    cmp r0, #0x0
    bgt .L_021c7344
    ldr r0, [sp, #0x3c]
    add r3, r1, #0x364
    ldrh r2, [r0, #0x6]
    ldr r0, .L_021c6f90
    mov r8, r2, lsl #0x3
    add r2, r0, r2, lsl #0x3
    ldrh r8, [r0, r8]
    ldrh r11, [r2, #0x6]
    cmp r8, r3
    add r3, r0, r11, lsl #0x3
    addeq r0, r1, #0x364
    ldreqh r1, [r3, #0x0]
    cmpeq r1, r0
    bne .L_021c7344
    ldrh r0, [r2, #0x4]
    mov r7, #0x0
    mov r4, r7
    str r0, [r9, #0x14]
    ldrh r0, [r3, #0x4]
    mov r6, r7
    str r7, [sp, #0x54]
    str r0, [r9, #0x18]
    mov r5, r7
    str r7, [sp, #0x58]
    b .L_021c7344
.L_021c7200:
    cmp r10, r11
    movne r0, #0x1
    moveq r0, #0x0
    ldr r1, [r9, #0x28]
    add r0, r0, #0x1
    and r0, r1, r0
    cmp r0, #0x0
    bgt .L_021c7344
    ldr r1, [sp, #0x34]
    mov r0, r11
    bl func_ov002_021b9bd4
    mov r1, #0x1f4
    mul r1, r0, r1
    sub r7, r7, r1
    b .L_021c7344
.L_021c723c:
    cmp r10, r11
    bne .L_021c7344
    movne r0, #0x1
    moveq r0, #0x0
    ldr r1, [r9, #0x24]
    add r0, r0, #0x1
    and r0, r1, r0
    cmp r0, #0x0
    bgt .L_021c7344
    ldr r0, .L_021c6fb4
    mov r6, #0x0
    str r0, [r9, #0x14]
    b .L_021c7344
.L_021c7270:
    cmp r10, r11
    movne r0, #0x1
    moveq r0, #0x0
    ldr r1, [r9, #0x28]
    add r0, r0, #0x1
    and r0, r1, r0
    cmp r0, #0x0
    addle r7, r7, #0x1f4
    b .L_021c7344
.L_021c7294:
    ldr r0, [r9, #0x24]
    and r0, r0, #0x1
    cmp r0, #0x0
    bgt .L_021c7344
    mov r1, #0x0
    mov r2, #0x1
    mov r0, r1
    add r3, r8, #0x30
    mov ip, r1
.L_021c72b8:
    ldr r11, [r3, #0x0]
    mov r11, r11, lsl #0x13
    movs r11, r11, lsr #0x13
    beq .L_021c72d8
    ldrh r11, [r8, #0x36]
    add r1, r1, #0x1
    cmp r11, #0x0
    moveq r2, ip
.L_021c72d8:
    add r3, r3, #0x14
    add r8, r8, #0x14
    add r0, r0, #0x1
    cmp r0, #0x4
    ble .L_021c72b8
    cmp r1, #0x2
    blt .L_021c7344
    cmp r2, #0x0
    beq .L_021c7344
    ldr r0, [sp, #0x54]
    add r0, r0, #0x2bc
    str r0, [sp, #0x54]
    b .L_021c7344
.L_021c730c:
    cmp r10, r11
    movne r0, #0x1
    moveq r0, #0x0
    ldr r1, [r9, #0x24]
    add r0, r0, #0x1
    and r0, r1, r0
    cmp r0, #0x0
    bgt .L_021c7344
    ldr r0, [sp, #0x3c]
    ldrh r0, [r0, #0x2]
    mov r0, r0, lsl #0x18
    movs r0, r0, lsr #0x1c
    ldrne r0, [sp, #0x28]
    addne r7, r7, r0
.L_021c7344:
    ldr r1, [sp, #0x64]
    ldr r0, [sp, #0x60]
    ldr r0, [r1, r0]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b8c0
    cmp r0, #0x2
    bne .L_021c7d48
    ldr r0, [sp, #0x50]
    ldr r1, [sp, #0x54]
    add r7, r7, r0
    ldr r0, [sp, #0x4c]
    add r0, r1, r0
    str r0, [sp, #0x54]
    mov r0, #0x0
    str r0, [sp, #0x4c]
    str r0, [sp, #0x50]
    b .L_021c7d48
.L_021c738c:
    ldr r0, [sp, #0x34]
    mov r1, #0x14
    mul r1, r0, r1
    str r1, [sp, #0x68]
    ldr r2, .L_021c7eec
    ldr r0, .L_021c7ee8
    and r1, r11, #0x1
    mla r0, r1, r0, r2
    add r1, r0, #0x30
    str r0, [sp, #0x24]
    ldr r0, [sp, #0x68]
    str r1, [sp, #0x6c]
    ldr r0, [r1, r0]
    mov r0, r0, lsl #0x13
    movs r8, r0, lsr #0x13
    beq .L_021c7b10
    ldr r1, [sp, #0x24]
    ldr r0, [sp, #0x68]
    add r0, r1, r0
    str r0, [sp, #0x20]
    ldrh r0, [r0, #0x38]
    cmp r0, #0x0
    beq .L_021c7b10
    ldr r0, [sp, #0x20]
    ldr r0, [r0, #0x40]
    mov r0, r0, lsr #0x6
    tst r0, #0x1
    bne .L_021c7b10
    mov r0, r8
    bl func_0202b878
    cmp r0, #0x17
    bne .L_021c7430
    cmp r10, r11
    movne r0, #0x1
    moveq r0, #0x0
    ldr r1, [r9, #0x28]
    add r0, r0, #0x1
    and r0, r1, r0
    cmp r0, #0x0
    bgt .L_021c7d48
    b .L_021c7450
.L_021c7430:
    cmp r10, r11
    movne r0, #0x1
    moveq r0, #0x0
    ldr r1, [r9, #0x24]
    add r0, r0, #0x1
    and r0, r1, r0
    cmp r0, #0x0
    bgt .L_021c7d48
.L_021c7450:
    ldr r0, .L_021c7f04
    cmp r8, r0
    bgt .L_021c76b4
    bge .L_021c7aa4
    ldr r0, .L_021c7f08
    cmp r8, r0
    bgt .L_021c75cc
    bge .L_021c79dc
    sub r1, r0, #0xd8
    cmp r8, r1
    bgt .L_021c7558
    bge .L_021c78a4
    sub r1, r0, #0xe6
    cmp r8, r1
    bgt .L_021c752c
    bge .L_021c78a4
    sub r0, r0, #0x22c
    cmp r8, r0
    bgt .L_021c751c
    ldr r0, .L_021c7f0c
    subs r0, r8, r0
    addpl pc, pc, r0, lsl #0x2
    b .L_021c7b10
    b .L_021c78d4
    b .L_021c7908
    b .L_021c78d4
    b .L_021c78b4
    b .L_021c78d4
    b .L_021c78a4
    b .L_021c7908
    b .L_021c78d4
    b .L_021c7908
    b .L_021c78d4
    b .L_021c789c
    b .L_021c78d4
    b .L_021c78cc
    b .L_021c78e0
    b .L_021c78d4
    b .L_021c78d4
    b .L_021c789c
    b .L_021c7b10
    b .L_021c78d4
    b .L_021c7b10
    b .L_021c78a4
    b .L_021c78d4
    b .L_021c78d4
    b .L_021c7908
    b .L_021c78d4
    b .L_021c78d4
    b .L_021c78d4
    b .L_021c78d4
.L_021c751c:
    ldr r0, .L_021c7f10
    cmp r8, r0
    beq .L_021c789c
    b .L_021c7b10
.L_021c752c:
    sub r1, r0, #0xe3
    cmp r8, r1
    bgt .L_021c7548
    sub r0, r0, #0xe3
    cmp r8, r0
    beq .L_021c7920
    b .L_021c7b10
.L_021c7548:
    sub r0, r0, #0xe2
    cmp r8, r0
    beq .L_021c78d4
    b .L_021c7b10
.L_021c7558:
    sub r1, r0, #0x2b
    cmp r8, r1
    bgt .L_021c7594
    bge .L_021c7908
    sub r1, r0, #0x54
    cmp r8, r1
    bgt .L_021c7584
    sub r0, r0, #0x54
    cmp r8, r0
    beq .L_021c7984
    b .L_021c7b10
.L_021c7584:
    sub r0, r0, #0x2c
    cmp r8, r0
    beq .L_021c7908
    b .L_021c7b10
.L_021c7594:
    sub r1, r0, #0xd
    cmp r8, r1
    bgt .L_021c75b8
    bge .L_021c79b4
    sub r0, r0, #0x11
    cmp r8, r0
    addeq r4, r4, #0x1f4
    addeq r5, r5, #0x1f4
    b .L_021c7b10
.L_021c75b8:
    sub r0, r0, #0x2
    cmp r8, r0
    subeq r4, r4, #0x1f4
    subeq r5, r5, #0x1f4
    b .L_021c7b10
.L_021c75cc:
    ldr r0, .L_021c7f14
    cmp r8, r0
    bgt .L_021c7648
    bge .L_021c7a30
    sub r1, r0, #0x69
    cmp r8, r1
    bgt .L_021c7618
    bge .L_021c7914
    sub r1, r0, #0xcb
    cmp r8, r1
    bgt .L_021c7608
    sub r0, r0, #0xcb
    cmp r8, r0
    beq .L_021c78a4
    b .L_021c7b10
.L_021c7608:
    sub r0, r0, #0x7a
    cmp r8, r0
    beq .L_021c7900
    b .L_021c7b10
.L_021c7618:
    sub r1, r0, #0x21
    cmp r8, r1
    bgt .L_021c7638
    bge .L_021c78bc
    sub r0, r0, #0x67
    cmp r8, r0
    beq .L_021c78ac
    b .L_021c7b10
.L_021c7638:
    sub r0, r0, #0x1
    cmp r8, r0
    beq .L_021c79fc
    b .L_021c7b10
.L_021c7648:
    add r1, r0, #0x42
    cmp r8, r1
    bgt .L_021c7684
    bge .L_021c7a54
    add r1, r0, #0xa
    cmp r8, r1
    bgt .L_021c7674
    add r0, r0, #0xa
    cmp r8, r0
    beq .L_021c78a4
    b .L_021c7b10
.L_021c7674:
    add r0, r0, #0x39
    cmp r8, r0
    beq .L_021c7894
    b .L_021c7b10
.L_021c7684:
    add r1, r0, #0xaf
    cmp r8, r1
    bgt .L_021c76a4
    bge .L_021c78ac
    add r0, r0, #0x90
    cmp r8, r0
    beq .L_021c789c
    b .L_021c7b10
.L_021c76a4:
    add r0, r0, #0xb7
    cmp r8, r0
    beq .L_021c789c
    b .L_021c7b10
.L_021c76b4:
    add r1, r0, #0x1f0
    cmp r8, r1
    bgt .L_021c77ac
    bge .L_021c7a78
    add r1, r0, #0xac
    cmp r8, r1
    bgt .L_021c7740
    bge .L_021c7894
    add r1, r0, #0x1f
    cmp r8, r1
    bgt .L_021c7710
    bge .L_021c7acc
    add r1, r0, #0x3
    cmp r8, r1
    bgt .L_021c7700
    add r0, r0, #0x3
    cmp r8, r0
    beq .L_021c7ab8
    b .L_021c7b10
.L_021c7700:
    add r0, r0, #0x1e
    cmp r8, r0
    beq .L_021c7aa4
    b .L_021c7b10
.L_021c7710:
    add r1, r0, #0x70
    cmp r8, r1
    bgt .L_021c7730
    bge .L_021c7af4
    add r0, r0, #0x21
    cmp r8, r0
    beq .L_021c7ae0
    b .L_021c7b10
.L_021c7730:
    add r0, r0, #0x75
    cmp r8, r0
    addeq r4, r4, #0x190
    b .L_021c7b10
.L_021c7740:
    add r1, r0, #0xaf
    cmp r8, r1
    bgt .L_021c777c
    bge .L_021c789c
    add r1, r0, #0xad
    cmp r8, r1
    bgt .L_021c776c
    add r0, r0, #0xad
    cmp r8, r0
    subeq r4, r4, #0x3e8
    b .L_021c7b10
.L_021c776c:
    add r0, r0, #0xae
    cmp r8, r0
    beq .L_021c789c
    b .L_021c7b10
.L_021c777c:
    add r1, r0, #0xb1
    cmp r8, r1
    bgt .L_021c779c
    bge .L_021c7900
    add r0, r0, #0xb0
    cmp r8, r0
    addeq r5, r5, #0x1f4
    b .L_021c7b10
.L_021c779c:
    add r0, r0, #0x11c
    cmp r8, r0
    beq .L_021c78a4
    b .L_021c7b10
.L_021c77ac:
    ldr r0, .L_021c7f18
    cmp r8, r0
    bgt .L_021c7828
    bge .L_021c7aa4
    ldr r2, .L_021c7f1c
    cmp r8, r2
    bgt .L_021c77f0
    bge .L_021c7ae0
    sub r0, r2, #0x2b
    cmp r8, r0
    bgt .L_021c77e0
    beq .L_021c78ec
    b .L_021c7b10
.L_021c77e0:
    sub r0, r2, #0x2a
    cmp r8, r0
    beq .L_021c78ec
    b .L_021c7b10
.L_021c77f0:
    add r1, r2, #0xf2
    cmp r8, r1
    bgt .L_021c7818
    mov r0, r1
    cmp r8, r0
    bge .L_021c7b00
    add r0, r2, #0x1d
    cmp r8, r0
    subeq r4, r4, #0x12c
    b .L_021c7b10
.L_021c7818:
    sub r0, r0, #0x11
    cmp r8, r0
    beq .L_021c7894
    b .L_021c7b10
.L_021c7828:
    add r1, r0, #0x65
    cmp r8, r1
    bgt .L_021c7864
    bge .L_021c789c
    add r1, r0, #0xe
    cmp r8, r1
    bgt .L_021c7854
    add r0, r0, #0xe
    cmp r8, r0
    beq .L_021c7a8c
    b .L_021c7b10
.L_021c7854:
    add r0, r0, #0x3e
    cmp r8, r0
    beq .L_021c78ac
    b .L_021c7b10
.L_021c7864:
    ldr r0, .L_021c7f20
    cmp r8, r0
    bgt .L_021c7884
    bge .L_021c789c
    sub r0, r0, #0x91
    cmp r8, r0
    beq .L_021c78ac
    b .L_021c7b10
.L_021c7884:
    add r0, r0, #0x51
    cmp r8, r0
    addeq r4, r4, #0x258
    b .L_021c7b10
.L_021c7894:
    add r4, r4, #0x12c
    b .L_021c7b10
.L_021c789c:
    add r4, r4, #0x1f4
    b .L_021c7b10
.L_021c78a4:
    add r4, r4, #0x2bc
    b .L_021c7b10
.L_021c78ac:
    add r4, r4, #0x320
    b .L_021c7b10
.L_021c78b4:
    add r4, r4, #0x3e8
    b .L_021c7b10
.L_021c78bc:
    ldr r0, [sp, #0x20]
    ldr r0, [r0, #0x3c]
    add r4, r4, r0
    b .L_021c7b10
.L_021c78cc:
    add r5, r5, #0x320
    b .L_021c7b10
.L_021c78d4:
    add r4, r4, #0x12c
    add r5, r5, #0x12c
    b .L_021c7b10
.L_021c78e0:
    add r4, r4, #0x2bc
    add r5, r5, #0x2bc
    b .L_021c7b10
.L_021c78ec:
    add r0, r4, #0x1dc
    add r4, r0, #0x400
    add r0, r5, #0x1dc
    add r5, r0, #0x400
    b .L_021c7b10
.L_021c7900:
    sub r4, r4, #0x1f4
    b .L_021c7b10
.L_021c7908:
    add r4, r4, #0x190
    sub r5, r5, #0xc8
    b .L_021c7b10
.L_021c7914:
    add r4, r4, #0x3e8
    sub r5, r5, #0x3e8
    b .L_021c7b10
.L_021c7920:
    ldr r0, [sp, #0x44]
    cmp r0, #0x0
    bne .L_021c7b10
    rsb r0, r11, #0x1
    and r8, r0, #0x1
    ldr r0, [sp, #0x24]
    ldr r2, .L_021c7ee8
    ldr r3, [r0, #0x0]
    mul r0, r8, r2
    ldr r1, .L_021c7eec
    ldr r2, [r1, r0]
    cmp r3, r2
    ldrlt r2, [r9, #0x1c]
    movlt r2, r2, lsl #0x1
    strlt r2, [r9, #0x14]
    ldr r1, [r1, r0]
    ldr r0, [sp, #0x24]
    ldr r0, [r0, #0x0]
    cmp r0, r1
    ble .L_021c7b10
    ldr r0, [r9, #0x1c]
    add r0, r0, #0x1
    mov r0, r0, asr #0x1
    str r0, [r9, #0x14]
    b .L_021c7b10
.L_021c7984:
    ldr r0, [r9, #0x4]
    cmp r0, #0x7
    bne .L_021c7b10
    ldr r0, [sp, #0x20]
    ldr r0, [r0, #0x3c]
    cmp r0, #0x1
    beq .L_021c79ac
    cmp r0, #0x2
    addeq r5, r5, #0x2bc
    b .L_021c7b10
.L_021c79ac:
    add r4, r4, #0x2bc
    b .L_021c7b10
.L_021c79b4:
    ldr r0, [r9, #0x4]
    cmp r0, #0x7
    beq .L_021c7b10
    ldr r1, [sp, #0x34]
    mov r0, r11
    bl func_ov002_021b9bd4
    mov r1, #0x12c
    mul r1, r0, r1
    sub r4, r4, r1
    b .L_021c7b10
.L_021c79dc:
    ldr r1, [sp, #0x34]
    mov r0, r11
    bl func_ov002_021b9bd4
    mov r1, #0xc8
    mul r1, r0, r1
    rsb r0, r1, #0x2bc
    add r4, r4, r0
    b .L_021c7b10
.L_021c79fc:
    mov r0, r11
    mov r1, #0x1
    mov r2, #0x0
    bl func_ov002_021bc0d4
    mov r1, #0x320
    mla r4, r0, r1, r4
    mov r0, r11
    mov r1, #0x1
    mov r2, #0x0
    bl func_ov002_021bc0d4
    mov r1, #0x320
    mla r5, r0, r1, r5
    b .L_021c7b10
.L_021c7a30:
    mov r0, r11
    bl func_ov002_021bcf00
    mov r1, #0x1f4
    mla r4, r0, r1, r4
    mov r0, r11
    bl func_ov002_021bcf00
    mov r1, #0x1f4
    mla r5, r0, r1, r5
    b .L_021c7b10
.L_021c7a54:
    ldr r0, [sp, #0x20]
    ldr r1, [sp, #0x4]
    ldrh r2, [r0, #0x34]
    mov r0, r10
    bl func_ov002_021c8950
    cmp r0, #0xf
    addeq r4, r4, #0x1f4
    addeq r5, r5, #0x1f4
    b .L_021c7b10
.L_021c7a78:
    ldr r0, [sp, #0x20]
    ldr r1, [r0, #0x3c]
    mov r0, #0x3e8
    mla r4, r1, r0, r4
    b .L_021c7b10
.L_021c7a8c:
    ldr r1, [sp, #0x4]
    mov r0, r10
    bl func_ov002_021bd5f4
    mov r1, #0x320
    mla r4, r0, r1, r4
    b .L_021c7b10
.L_021c7aa4:
    ldr r0, [sp, #0x38]
    cmp r0, #0xb
    addeq r4, r4, #0x190
    addeq r5, r5, #0x190
    b .L_021c7b10
.L_021c7ab8:
    ldr r0, [sp, #0x38]
    cmp r0, #0xb
    addeq r4, r4, #0x258
    addeq r5, r5, #0x258
    b .L_021c7b10
.L_021c7acc:
    ldr r0, [sp, #0x38]
    cmp r0, #0xb
    addeq r4, r4, #0x384
    addeq r5, r5, #0x384
    b .L_021c7b10
.L_021c7ae0:
    ldr r0, [sp, #0x38]
    cmp r0, #0xb
    addeq r4, r4, #0x1f4
    addeq r5, r5, #0x1f4
    b .L_021c7b10
.L_021c7af4:
    add r0, r4, #0x3b8
    add r4, r0, #0x800
    b .L_021c7b10
.L_021c7b00:
    ldr r0, [sp, #0x38]
    cmp r0, #0xb
    addeq r0, r4, #0x1c4
    addeq r4, r0, #0x800
.L_021c7b10:
    ldr r0, [r9, #0x0]
    ldr r2, .L_021c7f24
    cmp r0, r2
    bne .L_021c7d48
    ldr r1, [sp, #0x6c]
    ldr r0, [sp, #0x68]
    ldr r1, [r1, r0]
    sub r0, r2, #0xce
    mov r1, r1, lsl #0x13
    cmp r0, r1, lsr #0x13
    bne .L_021c7d48
    mov r0, #0x0
    str r0, [r9, #0x14]
    mov r0, #0x7d0
    str r0, [r9, #0x18]
    b .L_021c7d48
.L_021c7b50:
    ldr r1, [r9, #0x0]
    ldr r0, .L_021c7f28
    cmp r1, r0
    bgt .L_021c7b88
    bge .L_021c7cb8
    ldr r2, .L_021c7f2c
    cmp r1, r2
    bgt .L_021c7d48
    sub r0, r2, #0x3
    cmp r1, r0
    blt .L_021c7d48
    cmpne r1, r2
    beq .L_021c7bb8
    b .L_021c7d48
.L_021c7b88:
    add r2, r0, #0x3
    cmp r1, r2
    bgt .L_021c7d48
    add r2, r0, #0x1
    cmp r1, r2
    blt .L_021c7d48
    addne r2, r0, #0x2
    cmpne r1, r2
    addne r0, r0, #0x3
    cmpne r1, r0
    beq .L_021c7cb8
    b .L_021c7d48
.L_021c7bb8:
    ldr r3, .L_021c7eec
    ldr r2, .L_021c7ee8
    and r0, r11, #0x1
    mla r3, r0, r2, r3
    ldr r0, [sp, #0x34]
    mov r1, #0x14
    mla r1, r0, r1, r3
    ldrh r0, [r1, #0x38]
    cmp r0, #0x0
    beq .L_021c7ca0
    ldr r0, [r1, #0x30]
    ldr r1, .L_021c7f30
    mov r0, r0, lsl #0x13
    cmp r1, r0, lsr #0x13
    mov r6, r0, lsr #0x13
    blt .L_021c7c10
    cmp r6, r1
    bge .L_021c7c48
    sub r0, r1, #0x1c4
    cmp r6, r0
    beq .L_021c7c34
    b .L_021c7c84
.L_021c7c10:
    add r0, r1, #0xf9
    cmp r6, r0
    bgt .L_021c7c24
    beq .L_021c7c5c
    b .L_021c7c84
.L_021c7c24:
    ldr r0, .L_021c7f34
    cmp r6, r0
    beq .L_021c7c70
    b .L_021c7c84
.L_021c7c34:
    mov r0, #0x640
    str r0, [r9, #0x14]
    add r0, r0, #0xc8
    str r0, [r9, #0x18]
    b .L_021c7cac
.L_021c7c48:
    mov r0, #0x0
    str r0, [r9, #0x14]
    add r0, r2, #0x350
    str r0, [r9, #0x18]
    b .L_021c7cac
.L_021c7c5c:
    sub r0, r2, #0x160
    str r0, [r9, #0x14]
    mov r0, #0x1f4
    str r0, [r9, #0x18]
    b .L_021c7cac
.L_021c7c70:
    mov r0, #0x0
    str r0, [r9, #0x14]
    mov r0, #0x7d0
    str r0, [r9, #0x18]
    b .L_021c7cac
.L_021c7c84:
    mov r0, r6
    bl func_0202b8f0
    str r0, [r9, #0x14]
    mov r0, r6
    bl func_0202b920
    str r0, [r9, #0x18]
    b .L_021c7cac
.L_021c7ca0:
    mov r0, #0x0
    str r0, [r9, #0x14]
    str r0, [r9, #0x18]
.L_021c7cac:
    mov r6, #0x0
    str r6, [sp, #0x58]
    b .L_021c7d48
.L_021c7cb8:
    ldr r0, .L_021c7ee8
    ldr r2, .L_021c7eec
    and r3, r11, #0x1
    mla r2, r3, r0, r2
    ldr r0, [sp, #0x34]
    mov r1, #0x14
    mla r1, r0, r1, r2
    ldr r0, [r1, #0x30]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b8f0
    add r4, r4, r0
    b .L_021c7d48
.L_021c7cec:
    ldr r3, .L_021c7eec
    ldr r0, .L_021c7ee8
    and r2, r11, #0x1
    mla r3, r2, r0, r3
    ldr r0, [sp, #0x34]
    mov r1, #0x14
    mla r1, r0, r1, r3
    ldr r0, [r1, #0x30]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_021c7d48
    ldr r0, [r1, #0x40]
    mov r0, r0, lsr #0x6
    tst r0, #0x1
    bne .L_021c7d48
    cmp r10, r11
    movne r0, #0x1
    moveq r0, #0x0
    ldr r1, [r9, #0x24]
    add r0, r0, #0x1
    and r0, r1, r0
    cmp r0, #0x0
    addle r4, r4, #0xc8
.L_021c7d48:
    ldr r0, [sp, #0x14]
    cmp r0, #0x0
    bne .L_021c6310
.L_021c7d54:
    ldr r0, [sp, #0x44]
    cmp r0, #0x0
    bne .L_021c7ebc
    ldr r0, [sp, #0x48]
    ldr r1, [r9, #0x14]
    cmp r0, #0x0
    add r0, r6, r4
    beq .L_021c7d9c
    add r0, r7, r0
    sub r0, r1, r0
    str r0, [r9, #0x14]
    ldr r0, [sp, #0x58]
    ldr r2, [r9, #0x18]
    add r1, r0, r5
    ldr r0, [sp, #0x54]
    add r0, r0, r1
    sub r0, r2, r0
    b .L_021c7dc0
.L_021c7d9c:
    add r0, r7, r0
    add r0, r1, r0
    str r0, [r9, #0x14]
    ldr r0, [sp, #0x58]
    ldr r2, [r9, #0x18]
    add r1, r0, r5
    ldr r0, [sp, #0x54]
    add r0, r0, r1
    add r0, r2, r0
.L_021c7dc0:
    str r0, [r9, #0x18]
    ldr r0, .L_021c7f38
    bl func_ov002_021bb068
    cmp r0, #0x0
    beq .L_021c7df4
    ldr r0, [r9, #0x4]
    cmp r0, #0x4
    beq .L_021c7dec
    ldr r0, [r9, #0xc]
    tst r0, #0x10
    beq .L_021c7df4
.L_021c7dec:
    mov r0, #0x0
    str r0, [r9, #0x14]
.L_021c7df4:
    ldr r2, .L_021c7f3c
    ldr r1, [sp, #0x4]
    mov r0, r10
    bl func_ov002_021baca8
    cmp r0, #0x0
    beq .L_021c7e24
    rsb r0, r10, #0x1
    bl func_ov002_021bbf98
    cmp r0, #0x2
    ldreq r0, [r9, #0x14]
    moveq r0, r0, lsl #0x1
    streq r0, [r9, #0x14]
.L_021c7e24:
    ldr r2, .L_021c7f40
    ldr r1, [sp, #0x4]
    mov r0, r10
    bl func_ov002_021b314c
    cmp r0, #0x0
    mov r2, #0x0
    ble .L_021c7e5c
.L_021c7e40:
    ldr r1, [r9, #0x14]
    add r2, r2, #0x1
    add r1, r1, #0x1
    mov r1, r1, asr #0x1
    str r1, [r9, #0x14]
    cmp r2, r0
    blt .L_021c7e40
.L_021c7e5c:
    ldr r1, .L_021c7f44
    rsb r0, r10, #0x1
    mvn r2, #0x0
    bl func_ov002_021bae7c
    mov r4, r0
    ldr r1, .L_021c7f44
    ldr r2, [sp, #0x4]
    mov r0, r10
    bl func_ov002_021bae7c
    add r2, r4, r0
    cmp r2, #0x0
    mov r1, #0x0
    ble .L_021c7ebc
.L_021c7e90:
    ldr r0, [r9, #0x14]
    add r1, r1, #0x1
    add r0, r0, #0x1
    mov r0, r0, asr #0x1
    str r0, [r9, #0x14]
    ldr r0, [r9, #0x18]
    cmp r1, r2
    add r0, r0, #0x1
    mov r0, r0, asr #0x1
    str r0, [r9, #0x18]
    blt .L_021c7e90
.L_021c7ebc:
    ldr r0, [r9, #0x14]
    cmp r0, #0x0
    movlt r0, #0x0
    strlt r0, [r9, #0x14]
    ldr r0, [r9, #0x18]
    cmp r0, #0x0
    movlt r0, #0x0
    strlt r0, [r9, #0x18]
    add sp, sp, #0xb0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_021c7ee4:
        .word   0x13a6
.L_021c7ee8:
        .word   0x868
.L_021c7eec:
        .word   data_ov002_022cf16c
.L_021c7ef0:
        .word   0x180f
.L_021c7ef4:
        .word   0x1243
.L_021c7ef8:
        .word   0xff9
.L_021c7efc:
        .word   0x13f9
.L_021c7f00:
        .word   0x1a7c
.L_021c7f04:
        .word   0x15b0
.L_021c7f08:
        .word   0x131a
.L_021c7f0c:
        .word   0x10d3
.L_021c7f10:
        .word   0x1231
.L_021c7f14:
        .word   0x145d
.L_021c7f18:
        .word   0x194b
.L_021c7f1c:
        .word   0x1825
.L_021c7f20:
        .word   0x1a69
.L_021c7f24:
        .word   0x10bc
.L_021c7f28:
        .word   0x1aae
.L_021c7f2c:
        .word   0x1284
.L_021c7f30:
        .word   0x1636
.L_021c7f34:
        .word   0x1809
.L_021c7f38:
        .word   0x1951
.L_021c7f3c:
        .word   0x1955
.L_021c7f40:
        .word   0x1381
.L_021c7f44:
        .word   0x1905
