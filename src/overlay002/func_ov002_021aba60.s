; func_ov002_021aba60 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern data_ov002_022cd3f4
        .extern data_ov002_022cd420
        .extern data_ov002_022cd490
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern data_ov002_022cf1a2
        .extern data_ov002_022cf1a6
        .extern data_ov002_022cf1ac
        .extern data_ov002_022cf288
        .extern data_ov002_022d016c
        .extern data_ov002_022d0650
        .extern func_0202e340
        .extern func_0202e5ac
        .extern func_0202ed90
        .extern func_0202f9e8
        .extern func_ov002_021ab874
        .extern func_ov002_021b0bdc
        .extern func_ov002_021b30ac
        .extern func_ov002_021b314c
        .extern func_ov002_021b31b8
        .extern func_ov002_021b3618
        .extern func_ov002_021b3ecc
        .extern func_ov002_021b3fd8
        .extern func_ov002_021b4054
        .extern func_ov002_021b9000
        .extern func_ov002_021b90a8
        .extern func_ov002_021b9ea4
        .extern func_ov002_021baca8
        .extern func_ov002_021bae7c
        .extern func_ov002_021bb068
        .extern func_ov002_021bb5a8
        .extern func_ov002_021bbbc0
        .extern func_ov002_021bbd04
        .extern func_ov002_021bbf50
        .extern func_ov002_021bd6c8
        .extern func_ov002_021c0be4
        .extern func_ov002_021c1d4c
        .extern func_ov002_021c848c
        .extern func_ov002_021c92fc
        .extern func_ov002_021c93cc
        .extern func_ov002_021d59cc
        .extern func_ov002_021d94ac
        .extern func_ov002_021df62c
        .extern func_ov002_021e276c
        .global func_ov002_021aba60
        .arm
func_ov002_021aba60:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x4c
    ldr r7, .L_021aca30
    str r1, [sp, #0x4]
    ldr r8, [r7, #0x0]
    mov r2, #0x38
    ldr r1, [r7, #0x1c]
    mov r3, #0x14
    ldr r9, .L_021aca34
    and r11, r8, #0x1
    add r4, r2, #0x830
    mul r5, r1, r3
    mla r4, r11, r4, r9
    ldr r5, [r5, r4]
    ldr r4, [r7, #0x8]
    ldr r6, .L_021aca38
    mov r11, r5, lsr #0x6
    cmp r4, #0x0
    rsb r10, r8, #0x1
    mla r5, r8, r2, r6
    mla r6, r10, r2, r6
    mov r10, r0
    and r0, r11, #0x1
    str r0, [sp, #0x3c]
    movne r0, #0x0
    ldr r4, [r7, #0x4]
    strne r0, [sp, #0x8]
    bne .L_021abaf4
    ldr r7, [r7, #0x20]
    and r0, r4, #0x1
    add r2, r2, #0x830
    mul r3, r7, r3
    mla r2, r0, r2, r9
    ldr r0, [r3, r2]
    mov r0, r0, lsr #0x6
    and r0, r0, #0x1
    str r0, [sp, #0x8]
.L_021abaf4:
    mov r0, r8
    bl func_ov002_021c1d4c
    mov r0, #0x0
    ldr r2, .L_021aca30
    str r0, [sp, #0x38]
    mov r3, r2
    mov r1, r0
.L_021abb10:
    str r1, [r2, #0x58]
    str r1, [r2, #0x5c]
    str r1, [r2, #0x60]
    add r0, r0, #0x1
    str r1, [r3, #0x9c]
    cmp r0, #0x2
    add r2, r2, #0x38
    add r3, r3, #0x14
    blt .L_021abb10
    ldr r0, .L_021aca30
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    beq .L_021abb54
    ldr r2, [r5, #0x1c]
    mov r0, r5
    bl func_ov002_021ab874
    b .L_021abdf0
.L_021abb54:
    ldr r1, [r6, #0x8]
    ldr r0, [r5, #0x1c]
    cmp r1, #0x0
    ldrne r2, [r6, #0x20]
    ldreq r2, [r6, #0x1c]
    cmp r0, r2
    bne .L_021abb90
    cmp r1, #0x0
    bne .L_021abdf0
    cmp r0, #0x0
    ble .L_021abdf0
    mov r0, #0x1
    str r0, [r5, #0x2c]
    str r0, [r6, #0x2c]
    b .L_021abdf0
.L_021abb90:
    ble .L_021abcb4
    cmp r1, #0x0
    sub r7, r0, r2
    bne .L_021abbb4
    mov r0, r5
    mov r1, r6
    mov r2, r7
    bl func_ov002_021ab874
    b .L_021abca8
.L_021abbb4:
    ldr r1, .L_021aca30
    mov r0, r8
    ldr r1, [r1, #0x1c]
    bl func_ov002_021c0be4
    cmp r0, #0x0
    beq .L_021abbf4
    cmp r8, r4
    mov r0, r5
    beq .L_021abbe8
    mov r1, r6
    mov r2, r7
    bl func_ov002_021ab874
    b .L_021abbf4
.L_021abbe8:
    mov r2, r7
    mov r1, #0x0
    bl func_ov002_021ab874
.L_021abbf4:
    ldr r0, .L_021aca30
    rsb r9, r8, #0x1
    ldr r1, [r0, #0x1c]
    ldr r2, .L_021aca3c
    mov r0, r8
    mov r3, r9
    bl func_ov002_021b31b8
    cmp r0, #0x0
    bne .L_021abc98
    ldr r0, .L_021aca30
    ldr r2, .L_021aca40
    ldr r1, [r0, #0x1c]
    mov r0, r8
    mov r3, r9
    bl func_ov002_021b31b8
    cmp r0, #0x0
    bne .L_021abc98
    ldr r0, .L_021aca30
    ldr r2, .L_021aca44
    ldr r1, [r0, #0x1c]
    mov r0, r8
    mov r3, r9
    bl func_ov002_021b31b8
    cmp r0, #0x0
    bne .L_021abc98
    ldr r0, .L_021aca30
    ldr r2, .L_021aca48
    ldr r1, [r0, #0x1c]
    mov r0, r8
    mov r3, r9
    bl func_ov002_021b31b8
    cmp r0, #0x0
    bne .L_021abc98
    ldr r0, .L_021aca30
    ldr r2, .L_021aca4c
    ldr r1, [r0, #0x1c]
    mov r0, r8
    mov r3, r9
    bl func_ov002_021b31b8
    cmp r0, #0x0
    beq .L_021abca8
.L_021abc98:
    mov r0, r5
    mov r1, r5
    mov r2, r7
    bl func_ov002_021ab874
.L_021abca8:
    mov r0, #0x1
    str r0, [r6, #0x2c]
    b .L_021abdf0
.L_021abcb4:
    cmp r1, #0x0
    sub r7, r2, r0
    beq .L_021abce8
    ldr r2, .L_021aca50
    rsb r0, r8, #0x1
    mov r1, #0xb
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_021abce8
    mov r0, #0x1
    mov r7, r7, lsl #0x1
    str r0, [sp, #0x38]
    b .L_021abd18
.L_021abce8:
    ldr r0, [r6, #0x8]
    cmp r0, #0x0
    beq .L_021abd18
    ldr r0, [r6, #0x24]
    cmp r0, #0x6
    bne .L_021abd18
    ldr r0, .L_021aca54
    bl func_ov002_021bb068
    cmp r0, #0x0
    movne r0, #0x1
    movne r7, r7, lsl #0x1
    strne r0, [sp, #0x38]
.L_021abd18:
    mov r0, r6
    mov r1, r5
    mov r2, r7
    bl func_ov002_021ab874
    ldr r0, [r6, #0x8]
    cmp r0, #0x0
    moveq r0, #0x1
    streq r0, [r5, #0x2c]
    beq .L_021abdf0
    cmp r10, #0x0
    beq .L_021abdf0
    rsb r7, r8, #0x1
    ldr r2, .L_021aca58
    mov r0, r7
    mov r1, #0xb
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_021abd80
    mov r1, #0x0
    ldr r0, .L_021aca30
    str r1, [sp, #0x0]
    ldr r1, [r0, #0x1c]
    ldr r2, .L_021aca58
    mov r0, r8
    mov r3, #0x4
    bl func_ov002_021d59cc
.L_021abd80:
    ldr r2, .L_021aca50
    mov r0, r7
    mov r1, #0xb
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_021abdb8
    mov r1, #0x0
    ldr r0, .L_021aca30
    str r1, [sp, #0x0]
    ldr r1, [r0, #0x1c]
    ldr r2, .L_021aca50
    mov r0, r8
    mov r3, #0x4
    bl func_ov002_021d59cc
.L_021abdb8:
    ldr r1, .L_021aca5c
    mov r0, r7
    mvn r2, #0x0
    bl func_ov002_021bae7c
    cmp r0, #0x0
    beq .L_021abdf0
    mov r1, #0x0
    ldr r0, .L_021aca30
    str r1, [sp, #0x0]
    ldr r1, [r0, #0x1c]
    ldr r2, .L_021aca5c
    mov r0, r8
    mov r3, #0x4
    bl func_ov002_021d59cc
.L_021abdf0:
    mov r0, #0x0
    str r0, [sp, #0xc]
    ldr r0, .L_021aca60
    ldr r9, .L_021aca64
    rsb r0, r0, #0x2980
    str r0, [sp, #0x40]
    ldr r0, .L_021aca68
    ldr r11, .L_021aca30
    sub r7, r0, #0x10000
    ldr r0, .L_021aca6c
    sub r0, r0, #0x2f
    str r0, [sp, #0x44]
    ldr r0, .L_021aca70
    rsb r0, r0, #0x2b00
    str r0, [sp, #0x48]
.L_021abe2c:
    ldr r0, [r9, #0x0]
    cmp r0, #0x0
    beq .L_021ac174
    ldr r0, [r9, #0x4]
    ldr r1, [r9, #0xc]
    cmp r0, r1
    beq .L_021abeec
    ldr r1, [r9, #0x8]
    ldr r2, .L_021aca60
    bl func_ov002_021baca8
    cmp r0, #0x0
    beq .L_021abea0
    cmp r10, #0x0
    beq .L_021abe8c
    ldr r1, [r9, #0x0]
    ldr r0, .L_021aca68
    mov r2, #0x4
    cmp r1, r0
    movhi r1, r0
    mov r0, r1, lsl #0x10
    mov r3, r0, lsr #0x10
    ldr r0, [r9, #0x4]
    ldr r1, .L_021aca60
    bl func_ov002_021e276c
.L_021abe8c:
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [r9, #0x0]
    b .L_021ac174
.L_021abea0:
    ldr r0, [r9, #0xc]
    ldr r2, .L_021aca74
    ldr r1, .L_021aca78
    and r3, r0, #0x1
    mla r1, r3, r2, r1
    ldr r1, [r1, #0x11c]
    mov r1, r1, lsr #0x17
    tst r1, #0x1
    movne r0, #0x0
    strne r0, [r9, #0x0]
    bne .L_021ac174
    ldr r2, .L_021aca6c
    mov r1, #0xb
    mov r3, #0x1
    bl func_ov002_021b4054
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r9, #0x0]
    bne .L_021ac174
.L_021abeec:
    ldr r0, [r9, #0x4]
    cmp r0, r8
    bne .L_021abf28
    ldr r0, .L_021aca70
    bl func_ov002_021bd6c8
    cmp r0, #0x0
    beq .L_021abf28
    ldr r0, [r9, #0xc]
    ldr r1, [sp, #0x40]
    mov r2, r7
    bl func_ov002_021bae7c
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r9, #0x0]
    bne .L_021ac174
.L_021abf28:
    ldr r0, .L_021aca7c
    bl func_ov002_021bb068
    cmp r0, #0x0
    beq .L_021abf74
    ldr r1, [r9, #0xc]
    cmp r1, r8
    ldreq r0, [r5, #0x24]
    cmpeq r0, #0x11
    moveq r0, #0x0
    streq r0, [r9, #0x0]
    beq .L_021ac174
    ldr r0, [r11, #0x8]
    cmp r0, #0x0
    cmpeq r1, r4
    ldreq r0, [r6, #0x24]
    cmpeq r0, #0x11
    moveq r0, #0x0
    streq r0, [r9, #0x0]
    beq .L_021ac174
.L_021abf74:
    ldr r1, .L_021aca7c
    ldr r0, [r9, #0xc]
    add r1, r1, #0x3f
    mov r2, r7
    bl func_ov002_021bae7c
    cmp r0, #0x0
    beq .L_021abfec
    mov r0, r8
    ldr r1, [r5, #0x4]
    bl func_ov002_021b90a8
    cmp r0, #0x0
    beq .L_021abfb8
    ldr r0, [r5, #0x28]
    cmp r0, #0x3
    movle r0, #0x0
    strle r0, [r9, #0x0]
    ble .L_021ac174
.L_021abfb8:
    ldr r0, [r11, #0x8]
    cmp r0, #0x0
    bne .L_021abfec
    mov r0, r4
    ldr r1, [r6, #0x4]
    bl func_ov002_021b90a8
    cmp r0, #0x0
    beq .L_021abfec
    ldr r0, [r6, #0x28]
    cmp r0, #0x3
    movle r0, #0x0
    strle r0, [r9, #0x0]
    ble .L_021ac174
.L_021abfec:
    ldr r2, .L_021aca7c
    ldr r0, [r9, #0xc]
    mov r1, #0xb
    add r2, r2, #0x14c
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r9, #0x0]
    bne .L_021ac174
    ldr r0, [r9, #0xc]
    bl func_ov002_021bbf50
    cmp r0, #0x0
    beq .L_021ac044
    ldr r1, .L_021aca7c
    ldr r0, [r9, #0xc]
    add r1, r1, #0xa0
    mov r2, r7
    bl func_ov002_021bae7c
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r9, #0x0]
    bne .L_021ac174
.L_021ac044:
    ldr r0, [r11, #0x8]
    cmp r0, #0x0
    bne .L_021ac0a8
    ldr r0, [r9, #0xc]
    cmp r0, r8
    bne .L_021ac07c
    ldr r1, [r11, #0x1c]
    ldr r2, [sp, #0x44]
    mov r0, r8
    bl func_ov002_021b30ac
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r9, #0x0]
    bne .L_021ac174
.L_021ac07c:
    ldr r0, [r9, #0xc]
    cmp r0, r4
    bne .L_021ac0a8
    ldr r1, [r11, #0x20]
    ldr r2, [sp, #0x44]
    mov r0, r4
    bl func_ov002_021b30ac
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r9, #0x0]
    bne .L_021ac174
.L_021ac0a8:
    ldr r1, .L_021aca6c
    ldr r0, [r9, #0xc]
    add r1, r1, #0x4d
    bl func_ov002_021bb5a8
    cmp r0, #0x0
    beq .L_021ac108
    ldr r0, [r9, #0xc]
    cmp r0, r8
    bne .L_021ac0e4
    ldr r0, [r5, #0x10]
    bl func_0202ed90
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r9, #0x0]
    bne .L_021ac174
.L_021ac0e4:
    ldr r0, [r9, #0xc]
    cmp r0, r4
    bne .L_021ac108
    ldr r0, [r6, #0x10]
    bl func_0202ed90
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r9, #0x0]
    bne .L_021ac174
.L_021ac108:
    ldr r0, [r9, #0xc]
    ldr r2, [sp, #0x48]
    mov r1, #0xa
    bl func_ov002_021baca8
    cmp r0, #0x0
    beq .L_021ac148
    ldr r0, [r9, #0xc]
    ldr r1, .L_021aca74
    and r2, r0, #0x1
    ldr r0, .L_021aca78
    mla r0, r2, r1, r0
    ldr r0, [r0, #0x104]
    cmp r0, #0x4
    movhs r0, #0x0
    strhs r0, [r9, #0x0]
    bhs .L_021ac174
.L_021ac148:
    ldr r0, [r9, #0xc]
    ldr r1, [r9, #0x4]
    cmp r1, r0
    beq .L_021ac174
    ldr r2, .L_021aca7c
    mov r1, #0xb
    add r2, r2, #0xa7
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r9, #0x0]
.L_021ac174:
    ldr r0, [sp, #0xc]
    add r9, r9, #0x14
    add r0, r0, #0x1
    str r0, [sp, #0xc]
    cmp r0, #0x2
    blt .L_021abe2c
    ldr r2, .L_021aca80
    mov r0, r8
    mov r1, #0xb
    mov r3, #0x4
    bl func_ov002_021b4054
    cmp r0, #0x0
    beq .L_021ac1c8
    mov r2, #0x0
    ldr r1, .L_021aca30
    mov r0, r2
.L_021ac1b4:
    add r2, r2, #0x1
    str r0, [r1, #0x9c]
    cmp r2, #0x2
    add r1, r1, #0x14
    blt .L_021ac1b4
.L_021ac1c8:
    ldr r1, [r5, #0x1c]
    ldr r0, [r6, #0x1c]
    cmp r1, r0
    bne .L_021ac210
    ldr r1, .L_021aca84
    mov r0, r8
    mvn r2, #0x0
    bl func_ov002_021bae7c
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r5, #0x2c]
    ldr r1, .L_021aca84
    mov r0, r4
    mvn r2, #0x0
    bl func_ov002_021bae7c
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r6, #0x2c]
.L_021ac210:
    ldr r7, .L_021aca30
    ldr r0, [r7, #0x8]
    cmp r0, #0x0
    beq .L_021ac380
    ldr r0, [sp, #0x3c]
    cmp r0, #0x0
    bne .L_021ac26c
    ldr r1, [r5, #0x10]
    cmp r1, #0x1500
    ldrne r0, .L_021aca88
    cmpne r1, r0
    beq .L_021ac258
    add r0, r0, #0xc3
    cmp r1, r0
    ldreq r0, [r7, #0x9c]
    moveq r0, r0, lsl #0x1
    streq r0, [r7, #0x9c]
    b .L_021ac26c
.L_021ac258:
    ldr r0, .L_021aca30
    ldr r1, [r0, #0x9c]
    add r1, r1, #0x1
    mov r1, r1, lsr #0x1
    str r1, [r0, #0x9c]
.L_021ac26c:
    ldr r0, .L_021aca30
    ldr r1, [r0, #0x9c]
    cmp r1, #0x0
    beq .L_021ac29c
    ldr r1, [r0, #0x1c]
    ldr r2, .L_021aca8c
    mov r0, r8
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    ldrne r0, .L_021aca30
    movne r1, #0x190
    strne r1, [r0, #0x9c]
.L_021ac29c:
    ldr r0, .L_021aca30
    ldr r1, [r0, #0x9c]
    cmp r1, #0x0
    beq .L_021ac2d0
    ldr r1, [r0, #0x1c]
    ldr r2, .L_021aca90
    mov r0, r8
    mov r3, r8
    bl func_ov002_021b31b8
    cmp r0, #0x0
    ldrne r0, .L_021aca30
    movne r1, #0x3e8
    strne r1, [r0, #0x9c]
.L_021ac2d0:
    ldr r0, .L_021aca30
    ldr r0, [r0, #0x9c]
    cmp r0, #0x0
    beq .L_021ac30c
    ldr r2, .L_021aca94
    mov r0, r8
    mov r1, #0xb
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_021ac30c
    ldr r1, [r5, #0x4]
    mov r0, r8
    bl func_ov002_021c848c
    ldr r1, .L_021aca30
    str r0, [r1, #0x9c]
.L_021ac30c:
    ldr r0, .L_021aca30
    ldr r0, [r0, #0x9c]
    cmp r0, #0x0
    beq .L_021ac348
    ldr r2, .L_021aca98
    mov r0, r8
    mov r1, #0xb
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_021ac348
    ldr r1, [r5, #0x4]
    mov r0, r8
    bl func_ov002_021c848c
    ldr r1, .L_021aca30
    str r0, [r1, #0x9c]
.L_021ac348:
    ldr r0, .L_021aca30
    ldr r1, [r0, #0x9c]
    cmp r1, #0x0
    beq .L_021ae174
    ldr r1, [r0, #0x1c]
    ldr r2, .L_021aca9c
    mov r0, r8
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_021ae174
    ldr r0, .L_021aca30
    mov r1, #0x0
    str r1, [r0, #0x9c]
    b .L_021ae174
.L_021ac380:
    ldr r0, [sp, #0x3c]
    cmp r0, #0x0
    bne .L_021acb3c
    ldr r2, [r5, #0x10]
    ldr r3, .L_021aca88
    cmp r2, r3
    bgt .L_021ac530
    bge .L_021ac850
    ldr r0, .L_021acaa0
    cmp r2, r0
    bgt .L_021ac478
    bge .L_021ac950
    sub r1, r0, #0x7b
    cmp r2, r1
    bgt .L_021ac42c
    bge .L_021ac804
    sub r1, r0, #0x210
    cmp r2, r1
    bgt .L_021ac3e4
    sub r0, r0, #0x210
    cmp r2, r0
    bge .L_021ac6c0
    cmp r2, #0x1140
    beq .L_021ac7bc
    b .L_021acb3c
.L_021ac3e4:
    sub r1, r0, #0xf1
    cmp r2, r1
    bgt .L_021ac400
    sub r0, r0, #0xf1
    cmp r2, r0
    beq .L_021ac6d4
    b .L_021acb3c
.L_021ac400:
    sub r1, r0, #0x83
    cmp r2, r1
    bgt .L_021acb3c
    sub r1, r0, #0x85
    cmp r2, r1
    blt .L_021acb3c
    beq .L_021ac7b0
    sub r0, r0, #0x83
    cmp r2, r0
    beq .L_021ac920
    b .L_021acb3c
.L_021ac42c:
    sub r1, r0, #0x10
    cmp r2, r1
    bgt .L_021ac44c
    bge .L_021ac73c
    sub r1, r0, #0x40
    cmp r2, r1
    beq .L_021ac724
    b .L_021acb3c
.L_021ac44c:
    sub r1, r0, #0xd
    cmp r2, r1
    bgt .L_021ac468
    sub r0, r0, #0xd
    cmp r2, r0
    beq .L_021ac80c
    b .L_021acb3c
.L_021ac468:
    sub r0, r0, #0x6
    cmp r2, r0
    beq .L_021ac984
    b .L_021acb3c
.L_021ac478:
    add r1, r0, #0xda
    cmp r2, r1
    bgt .L_021ac4d0
    bge .L_021ac7b0
    cmp r2, #0x1500
    bgt .L_021ac4a4
    bge .L_021ac850
    add r0, r0, #0x2d
    cmp r2, r0
    beq .L_021ac838
    b .L_021acb3c
.L_021ac4a4:
    add r1, r0, #0xb4
    cmp r2, r1
    bgt .L_021ac4c0
    add r0, r0, #0xb4
    cmp r2, r0
    beq .L_021ac75c
    b .L_021acb3c
.L_021ac4c0:
    add r0, r0, #0xc2
    cmp r2, r0
    beq .L_021ac788
    b .L_021acb3c
.L_021ac4d0:
    sub r1, r3, #0x4b
    cmp r2, r1
    bgt .L_021ac50c
    bge .L_021ac80c
    add r1, r0, #0xdc
    cmp r2, r1
    bgt .L_021ac4fc
    add r0, r0, #0xdc
    cmp r2, r0
    beq .L_021ac7b0
    b .L_021acb3c
.L_021ac4fc:
    sub r0, r3, #0x6b
    cmp r2, r0
    beq .L_021ac984
    b .L_021acb3c
.L_021ac50c:
    sub r0, r3, #0x48
    cmp r2, r0
    bgt .L_021ac520
    beq .L_021ac7b0
    b .L_021acb3c
.L_021ac520:
    sub r0, r3, #0x40
    cmp r2, r0
    beq .L_021ac984
    b .L_021acb3c
.L_021ac530:
    ldr r1, .L_021acaa4
    cmp r2, r1
    bgt .L_021ac5ec
    bge .L_021ac80c
    sub r0, r1, #0x91
    cmp r2, r0
    bgt .L_021ac594
    bge .L_021acab8
    add r0, r3, #0xb6
    cmp r2, r0
    bgt .L_021ac570
    bge .L_021ac8a0
    add r0, r3, #0x4
    cmp r2, r0
    beq .L_021ac984
    b .L_021acb3c
.L_021ac570:
    sub r0, r1, #0x148
    cmp r2, r0
    bgt .L_021ac584
    beq .L_021ac7b0
    b .L_021acb3c
.L_021ac584:
    sub r0, r1, #0xd4
    cmp r2, r0
    beq .L_021acab8
    b .L_021acb3c
.L_021ac594:
    sub r0, r1, #0x63
    cmp r2, r0
    bgt .L_021ac5c8
    bge .L_021ac7b0
    sub r0, r1, #0x8d
    cmp r2, r0
    bgt .L_021ac5b8
    beq .L_021ac99c
    b .L_021acb3c
.L_021ac5b8:
    sub r0, r1, #0x81
    cmp r2, r0
    beq .L_021ac7a4
    b .L_021acb3c
.L_021ac5c8:
    sub r0, r1, #0x57
    cmp r2, r0
    bgt .L_021ac5dc
    beq .L_021acab8
    b .L_021acb3c
.L_021ac5dc:
    sub r0, r1, #0xc
    cmp r2, r0
    beq .L_021ac9b8
    b .L_021acb3c
.L_021ac5ec:
    ldr r0, .L_021acaa8
    cmp r2, r0
    bgt .L_021ac648
    bge .L_021ac7a4
    sub r1, r0, #0x76
    cmp r2, r1
    bgt .L_021ac61c
    bge .L_021acaf8
    sub r0, r0, #0xac
    cmp r2, r0
    beq .L_021ac7a4
    b .L_021acb3c
.L_021ac61c:
    sub r1, r0, #0x6a
    cmp r2, r1
    bgt .L_021ac638
    sub r0, r0, #0x6a
    cmp r2, r0
    beq .L_021acb28
    b .L_021acb3c
.L_021ac638:
    sub r0, r0, #0x5d
    cmp r2, r0
    beq .L_021ac7a4
    b .L_021acb3c
.L_021ac648:
    add r3, r0, #0xee
    cmp r2, r3
    bgt .L_021ac688
    mov r1, r3
    cmp r2, r1
    bge .L_021ac7b0
    add r1, r0, #0x40
    cmp r2, r1
    bgt .L_021ac67c
    add r0, r0, #0x40
    cmp r2, r0
    beq .L_021ac7b0
    b .L_021acb3c
.L_021ac67c:
    cmp r2, #0x1a00
    beq .L_021ac7b0
    b .L_021acb3c
.L_021ac688:
    add r0, r1, #0x224
    cmp r2, r0
    bgt .L_021ac69c
    beq .L_021ac9b8
    b .L_021acb3c
.L_021ac69c:
    ldr r1, .L_021acaac
    cmp r2, r1
    bgt .L_021acb3c
    sub r0, r1, #0x1
    cmp r2, r0
    blt .L_021acb3c
    cmpne r2, r1
    beq .L_021ac9e8
    b .L_021acb3c
.L_021ac6c0:
    ldr r0, [r6, #0x28]
    cmp r0, #0x7
    movle r0, #0x0
    strle r0, [r5, #0x2c]
    b .L_021acb3c
.L_021ac6d4:
    ldr r0, .L_021acab0
    ldr r1, [r0, #0xcec]
    cmp r1, r8
    ldreq r0, [r0, #0xcf8]
    cmpeq r0, #0x3
    bne .L_021acb3c
    mov r3, #0x0
    str r3, [r5, #0x2c]
    mov r0, r3
.L_021ac6f8:
    ldr r1, [r7, #0xa8]
    add r3, r3, #0x1
    cmp r8, r1
    ldreq r2, [r5, #0x4]
    ldreq r1, [r7, #0xac]
    cmpeq r2, r1
    streq r0, [r7, #0x9c]
    cmp r3, #0x2
    add r7, r7, #0x14
    blt .L_021ac6f8
    b .L_021acb3c
.L_021ac724:
    ldr r1, [r6, #0x1c]
    sub r0, r0, #0xd50
    cmp r1, r0
    movge r0, #0x0
    strge r0, [r5, #0x2c]
    b .L_021acb3c
.L_021ac73c:
    ldr r1, [r7, #0x1c]
    mov r0, r8
    bl func_ov002_021b3618
    ldr r1, .L_021aca68
    cmp r0, r1
    movne r0, #0x0
    strne r0, [r5, #0x2c]
    b .L_021acb3c
.L_021ac75c:
    ldr r0, [r5, #0x0]
    bl func_ov002_021bbf50
    cmp r0, #0x1
    bne .L_021acb3c
    ldr r0, [r6, #0x10]
    bl func_0202f9e8
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    str r0, [r6, #0x34]
    b .L_021acb3c
.L_021ac788:
    ldr r1, [r7, #0x20]
    mov r0, r4
    bl func_ov002_021c92fc
    tst r0, #0x7c
    movne r0, #0x0
    strne r0, [r5, #0x2c]
    b .L_021acb3c
.L_021ac7a4:
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    bne .L_021acb3c
.L_021ac7b0:
    mov r0, #0x0
    str r0, [r5, #0x2c]
    b .L_021acb3c
.L_021ac7bc:
    ldr r1, [r7, #0x20]
    mov r0, r4
    mov r2, #0x2
    bl func_ov002_021c93cc
    cmp r0, #0x0
    cmpne r10, #0x0
    beq .L_021acb3c
    mov r0, #0x0
    str r0, [sp, #0x0]
    ldr r1, [r5, #0x10]
    mov r0, r7
    mov r2, r1, lsl #0x10
    ldr r1, [r0, #0x20]
    mov r0, r4
    mov r2, r2, lsr #0x10
    mov r3, #0x1
    bl func_ov002_021d59cc
    b .L_021acb3c
.L_021ac804:
    mov r0, #0x0
    str r0, [r5, #0x2c]
.L_021ac80c:
    mov r3, #0x0
    ldr r2, .L_021aca30
    mov r0, r3
.L_021ac818:
    ldr r1, [r2, #0xa8]
    add r3, r3, #0x1
    cmp r8, r1
    streq r0, [r2, #0x9c]
    cmp r3, #0x2
    add r2, r2, #0x14
    blt .L_021ac818
    b .L_021acb3c
.L_021ac838:
    ldr r1, [r5, #0x1c]
    ldr r0, [r6, #0x1c]
    cmp r1, r0
    moveq r0, #0x0
    streq r0, [r5, #0x2c]
    b .L_021acb3c
.L_021ac850:
    ldr r0, .L_021aca30
    rsb r1, r8, #0x1
    mov r2, #0x0
.L_021ac85c:
    ldr r3, [r0, #0xa0]
    cmp r8, r3
    ldreq r7, [r5, #0x4]
    ldreq r3, [r0, #0xa4]
    cmpeq r7, r3
    ldreq r3, [r0, #0xa8]
    cmpeq r1, r3
    bne .L_021ac88c
    ldr r3, [r0, #0x9c]
    add r3, r3, #0x1
    mov r3, r3, lsr #0x1
    str r3, [r0, #0x9c]
.L_021ac88c:
    add r2, r2, #0x1
    cmp r2, #0x2
    add r0, r0, #0x14
    blt .L_021ac85c
    b .L_021acb3c
.L_021ac8a0:
    ldr r2, [r7, #0x1c]
    mov r1, #0x14
    ldr r0, .L_021aca74
    ldr r3, .L_021acab4
    and r7, r8, #0x1
    mla r0, r7, r0, r3
    mul r1, r2, r1
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    bne .L_021acb3c
    mov r0, #0x0
    str r0, [r5, #0x2c]
    cmp r10, #0x0
    beq .L_021acb3c
    ldr r1, [r5, #0x4]
    ldr r2, [r5, #0xc]
    mov r0, r8
    bl func_ov002_021df62c
    mov r0, #0x0
    str r0, [sp, #0x0]
    ldr r2, .L_021aca30
    mov r0, r4
    ldr r1, [r2, #0x20]
    ldr r2, [r2, #0x1c]
    and r3, r8, #0xff
    and r2, r2, #0xff
    orr r2, r3, r2, lsl #0x8
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    mov r3, #0x6
    bl func_ov002_021d59cc
    b .L_021acb3c
.L_021ac920:
    ldr r2, [r7, #0x1c]
    mov r1, #0x14
    ldr r0, .L_021aca74
    ldr r3, .L_021acab4
    and r7, r8, #0x1
    mla r0, r7, r0, r3
    mul r1, r2, r1
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [r5, #0x2c]
    b .L_021acb3c
.L_021ac950:
    ldr r2, [r7, #0x1c]
    mov r0, r8
    mov r1, #0x3
    bl func_ov002_021bbbc0
    cmp r0, #0x0
    beq .L_021acb3c
    ldr r0, [r6, #0x10]
    bl func_0202f9e8
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    str r0, [r6, #0x34]
    b .L_021acb3c
.L_021ac984:
    ldr r1, .L_021aca30
    mov r0, r4
    ldr r1, [r1, #0x20]
    bl func_ov002_021b9000
    str r0, [r6, #0x34]
    b .L_021acb3c
.L_021ac99c:
    ldr r0, [r6, #0x10]
    bl func_0202f9e8
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    str r0, [r6, #0x34]
    b .L_021acb3c
.L_021ac9b8:
    cmp r8, r4
    beq .L_021ac9dc
    ldr r1, .L_021aca30
    mov r0, r4
    ldr r1, [r1, #0x20]
    bl func_ov002_021b9000
    cmp r0, #0x0
    movne r0, #0x1
    bne .L_021ac9e0
.L_021ac9dc:
    mov r0, #0x0
.L_021ac9e0:
    str r0, [r6, #0x34]
    b .L_021acb3c
.L_021ac9e8:
    ldr r1, .L_021aca30
    mov r0, r8
    ldr r1, [r1, #0x1c]
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_021acb3c
    cmp r8, r4
    beq .L_021aca24
    ldr r1, .L_021aca30
    mov r0, r4
    ldr r1, [r1, #0x20]
    bl func_ov002_021b9000
    cmp r0, #0x0
    movne r0, #0x1
    bne .L_021aca28
.L_021aca24:
    mov r0, #0x0
.L_021aca28:
    str r0, [r6, #0x34]
    b .L_021acb3c
.L_021aca30:
        .word   data_ov002_022cd3f4
.L_021aca34:
        .word   data_ov002_022cf1ac
.L_021aca38:
        .word   data_ov002_022cd420
.L_021aca3c:
        .word   0x1408
.L_021aca40:
        .word   0x1625
.L_021aca44:
        .word   0x1496
.L_021aca48:
        .word   0x15ce
.L_021aca4c:
        .word   0x1620
.L_021aca50:
        .word   0x1883
.L_021aca54:
        .word   0x19f2
.L_021aca58:
        .word   0x1493
.L_021aca5c:
        .word   0x162e
.L_021aca60:
        .word   0x1589
.L_021aca64:
        .word   data_ov002_022cd490
.L_021aca68:
        .word   0xffff
.L_021aca6c:
        .word   0x19b8
.L_021aca70:
        .word   0x10f4
.L_021aca74:
        .word   0x868
.L_021aca78:
        .word   data_ov002_022cf16c
.L_021aca7c:
        .word   0x175e
.L_021aca80:
        .word   0x151e
.L_021aca84:
        .word   0x15ec
.L_021aca88:
        .word   0x168d
.L_021aca8c:
        .word   0x16a3
.L_021aca90:
        .word   0x1663
.L_021aca94:
        .word   0x1a41
.L_021aca98:
        .word   0x1a52
.L_021aca9c:
        .word   0x1890
.L_021acaa0:
        .word   0x14bc
.L_021acaa4:
        .word   0x18b8
.L_021acaa8:
        .word   0x19bf
.L_021acaac:
        .word   0x1ade
.L_021acab0:
        .word   data_ov002_022d016c
.L_021acab4:
        .word   data_ov002_022cf1a2
.L_021acab8:
    mov r0, #0x0
    mov r1, #0x5
    bl func_ov002_021bbd04
    cmp r0, #0x0
    bne .L_021acae0
    mov r0, #0x1
    mov r1, #0x5
    bl func_ov002_021bbd04
    cmp r0, #0x0
    beq .L_021acb3c
.L_021acae0:
    ldr r1, .L_021aca30
    mov r0, r4
    ldr r1, [r1, #0x20]
    bl func_ov002_021b9000
    str r0, [r6, #0x34]
    b .L_021acb3c
.L_021acaf8:
    ldr r0, [r5, #0x8]
    cmp r0, #0x0
    bne .L_021acb3c
    ldr r0, .L_021aca74
    and r1, r8, #0x1
    mul r2, r1, r0
    ldr r0, .L_021adad0
    ldr r0, [r0, r2]
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [r5, #0x2c]
    b .L_021acb3c
.L_021acb28:
    rsb r0, r8, #0x1
    bl func_ov002_021bbf50
    cmp r0, #0x1
    moveq r0, #0x0
    streq r0, [r5, #0x2c]
.L_021acb3c:
    ldr r0, [r5, #0x10]
    ldr r3, .L_021adad4
    cmp r0, r3
    bgt .L_021acb94
    bge .L_021acc2c
    sub r1, r3, #0xb
    cmp r0, r1
    bgt .L_021acb84
    cmp r0, #0x1700
    blt .L_021acb74
    beq .L_021acc80
    cmp r0, r1
    beq .L_021acc88
    b .L_021acdb0
.L_021acb74:
    ldr r1, .L_021adad8
    cmp r0, r1
    beq .L_021acc80
    b .L_021acdb0
.L_021acb84:
    sub r1, r3, #0x1
    cmp r0, r1
    beq .L_021acbd8
    b .L_021acdb0
.L_021acb94:
    ldr r2, .L_021adadc
    cmp r0, r2
    bgt .L_021acbb4
    bge .L_021acd20
    add r1, r3, #0xc8
    cmp r0, r1
    beq .L_021acccc
    b .L_021acdb0
.L_021acbb4:
    add r1, r2, #0x56
    cmp r0, r1
    bgt .L_021acbc8
    beq .L_021acc80
    b .L_021acdb0
.L_021acbc8:
    ldr r1, .L_021adae0
    cmp r0, r1
    beq .L_021acd60
    b .L_021acdb0
.L_021acbd8:
    ldr r0, [r6, #0x24]
    cmp r0, #0x2
    cmpne r0, #0x3
    bne .L_021acdb0
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [r6, #0x30]
    cmp r10, #0x0
    beq .L_021acdb0
    mov r0, #0x0
    str r0, [sp, #0x0]
    ldr r1, [r5, #0x10]
    ldr r0, .L_021aca30
    mov r2, r1, lsl #0x10
    ldr r1, [r0, #0x20]
    mov r0, r4
    mov r2, r2, lsr #0x10
    mov r3, #0x4
    bl func_ov002_021d59cc
    b .L_021acdb0
.L_021acc2c:
    ldr r0, [r6, #0x24]
    cmp r0, #0xf
    cmpne r0, #0x12
    bne .L_021acdb0
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [r6, #0x30]
    cmp r10, #0x0
    beq .L_021acdb0
    mov r0, #0x0
    str r0, [sp, #0x0]
    ldr r1, [r5, #0x10]
    ldr r0, .L_021aca30
    mov r2, r1, lsl #0x10
    ldr r1, [r0, #0x20]
    mov r0, r4
    mov r2, r2, lsr #0x10
    mov r3, #0x4
    bl func_ov002_021d59cc
    b .L_021acdb0
.L_021acc80:
    cmp r8, r4
    beq .L_021acdb0
.L_021acc88:
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [r6, #0x30]
    cmp r10, #0x0
    beq .L_021acdb0
    mov r0, #0x0
    str r0, [sp, #0x0]
    ldr r1, [r5, #0x10]
    ldr r0, .L_021aca30
    mov r2, r1, lsl #0x10
    ldr r1, [r0, #0x20]
    mov r0, r4
    mov r2, r2, lsr #0x10
    mov r3, #0x4
    bl func_ov002_021d59cc
    b .L_021acdb0
.L_021acccc:
    cmp r10, #0x0
    ldrne r0, [r5, #0x2c]
    cmpne r0, #0x0
    beq .L_021acdb0
    ldr r1, .L_021aca30
    mov r0, r8
    ldr r1, [r1, #0x1c]
    add r2, r3, #0xc7
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_021acdb0
    ldr r3, [r5, #0xc]
    ldr r0, [r5, #0x10]
    mov r2, r3, lsl #0x10
    mov r1, r0, lsl #0x10
    and r0, r3, #0x1
    mov r1, r1, lsr #0x10
    mov r3, r2, lsr #0x10
    mov r2, #0x4
    bl func_ov002_021e276c
    b .L_021acdb0
.L_021acd20:
    cmp r10, #0x0
    ldrne r1, [r5, #0x2c]
    cmpne r1, #0x0
    beq .L_021acdb0
    ldr r1, [r6, #0x24]
    cmp r1, #0x4
    bne .L_021acdb0
    ldr r3, [r5, #0xc]
    mov r1, r0, lsl #0x10
    mov r2, r3, lsl #0x10
    and r0, r3, #0x1
    mov r1, r1, lsr #0x10
    mov r3, r2, lsr #0x10
    mov r2, #0x4
    bl func_ov002_021e276c
    b .L_021acdb0
.L_021acd60:
    cmp r10, #0x0
    ldrne r0, [r6, #0x2c]
    cmpne r0, #0x0
    beq .L_021acdb0
    ldr r1, .L_021aca30
    mov r0, r4
    ldr r1, [r1, #0x20]
    bl func_ov002_021b9ea4
    cmp r0, #0x0
    beq .L_021acdb0
    mov r0, #0x0
    str r0, [sp, #0x0]
    ldr r1, [r5, #0x10]
    ldr r0, .L_021aca30
    mov r2, r1, lsl #0x10
    ldr r1, [r0, #0x1c]
    mov r0, r8
    mov r2, r2, lsr #0x10
    mov r3, #0x4
    bl func_ov002_021d59cc
.L_021acdb0:
    ldr r7, .L_021aca30
    mov r9, #0x0
    mov r11, #0x3e8
.L_021acdbc:
    ldr r0, [r7, #0xa0]
    cmp r8, r0
    ldreq r1, [r5, #0x4]
    ldreq r0, [r7, #0xa4]
    cmpeq r1, r0
    bne .L_021ace24
    ldr r0, [r7, #0x9c]
    cmp r0, #0x0
    beq .L_021ace24
    ldr r3, [r7, #0xa8]
    ldr r2, .L_021aca90
    mov r0, r8
    rsb r3, r3, #0x1
    bl func_ov002_021b31b8
    cmp r0, #0x0
    strne r11, [r7, #0x9c]
    ldr r0, [r7, #0xa8]
    cmp r8, r0
    beq .L_021ace24
    ldr r1, [r5, #0x4]
    ldr r2, .L_021aca9c
    mov r0, r8
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r7, #0x9c]
.L_021ace24:
    add r7, r7, #0x14
    add r9, r9, #0x1
    cmp r9, #0x2
    blt .L_021acdbc
    cmp r8, r4
    beq .L_021ace9c
    ldr r0, .L_021aca74
    and r1, r8, #0x1
    mul r2, r1, r0
    ldr r0, .L_021adae4
    mov r1, #0xb
    ldr r0, [r0, r2]
    ldr r2, .L_021adae8
    mov r0, r0, lsr #0x17
    tst r0, #0x1
    movne r0, #0x0
    strne r0, [r5, #0x2c]
    mov r0, r8
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r5, #0x2c]
    ldr r2, .L_021aca6c
    mov r0, r8
    mov r1, #0xb
    mov r3, #0x1
    bl func_ov002_021b4054
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r5, #0x2c]
.L_021ace9c:
    ldr r0, [r5, #0x2c]
    cmp r0, #0x0
    beq .L_021aced4
    ldr r0, [r5, #0x10]
    bl func_0202e5ac
    cmp r0, #0x0
    beq .L_021aced4
    ldr r2, .L_021adaec
    mov r0, r8
    mov r1, #0xb
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r5, #0x2c]
.L_021aced4:
    ldr r0, .L_021aca30
    ldr r2, .L_021adaf0
    ldr r1, [r0, #0x1c]
    mov r0, r8
    bl func_ov002_021b314c
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r5, #0x2c]
    ldr r0, .L_021aca30
    ldr r2, .L_021adaf4
    ldr r1, [r0, #0x1c]
    mov r0, r8
    bl func_ov002_021b314c
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r5, #0x2c]
    ldr r0, .L_021aca30
    ldr r2, .L_021adaf8
    ldr r1, [r0, #0x1c]
    mov r0, r8
    bl func_ov002_021b314c
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r5, #0x2c]
    ldr r0, .L_021aca30
    ldr r2, .L_021adafc
    ldr r1, [r0, #0x1c]
    mov r0, r8
    bl func_ov002_021b314c
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r5, #0x2c]
    ldr r0, .L_021aca30
    ldr r2, .L_021adb00
    ldr r1, [r0, #0x1c]
    mov r0, r8
    bl func_ov002_021b30ac
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r5, #0x2c]
    ldr r0, [r5, #0x10]
    bl func_0202ed90
    cmp r0, #0x0
    beq .L_021acf9c
    ldr r1, .L_021adb04
    mov r0, r8
    bl func_ov002_021bb5a8
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r5, #0x2c]
.L_021acf9c:
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    bne .L_021ad160
    ldr r0, [r5, #0x2c]
    cmp r0, #0x0
    beq .L_021ad160
    ldr r0, .L_021aca30
    ldr r3, .L_021adb08
    ldr r1, [r0, #0x1c]
    mov r0, #0x14
    mul r2, r1, r0
    ldr r0, .L_021aca74
    and r7, r8, #0x1
    mla r0, r7, r0, r3
    ldrh r11, [r2, r0]
    cmp r11, #0x0
    beq .L_021ad160
.L_021acfe0:
    ldr r0, .L_021adb0c
    add r0, r0, r11, lsl #0x3
    str r0, [sp, #0x34]
    ldrh r11, [r0, #0x6]
    ldrh r0, [r0, #0x2]
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    cmp r0, #0x6
    blo .L_021ad158
    cmp r0, #0xd
    ldr r0, [sp, #0x34]
    mov r7, #0x0
    ldrh r1, [r0, #0x0]
    and r0, r1, #0xff
    str r0, [sp, #0x30]
    mov r0, r1, asr #0x8
    and r1, r0, #0xff
    mov r0, #0x14
    smulbb r9, r1, r0
    ldr r0, [sp, #0x30]
    str r1, [sp, #0x2c]
    and r2, r0, #0x1
    ldr r1, .L_021aca74
    ldr r0, .L_021aca78
    mla r0, r2, r1, r0
    str r0, [sp, #0x14]
    add r0, r0, r9
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    str r0, [sp, #0x28]
    ldreq r0, [sp, #0x3c]
    cmpeq r0, #0x0
    moveq r7, #0x1
    beq .L_021ad128
    ldr r0, [sp, #0x28]
    bl func_0202e340
    cmp r0, #0x0
    beq .L_021ad0e0
    ldr r0, [sp, #0x34]
    ldrh r0, [r0, #0x2]
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    add r0, r0, #0xf6
    add r0, r0, #0xff00
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    cmp r0, #0x1
    bhi .L_021ad0e0
    ldr r0, [sp, #0x14]
    add r0, r0, r9
    ldr r1, [r0, #0x40]
    ldrh r2, [r0, #0x38]
    mov r0, r1, lsr #0x6
    and r0, r0, #0x1
    mvn r0, r0
    and r0, r2, r0
    mov r2, r1, lsr #0x2
    orr r1, r2, r1, lsr #0x1
    and r1, r1, #0x1
    mvn r1, r1
    tst r0, r1
    movne r7, #0x1
    bne .L_021ad128
.L_021ad0e0:
    ldr r1, [sp, #0x28]
    ldr r0, .L_021adb10
    cmp r1, r0
    bne .L_021ad128
    ldr r0, [sp, #0x14]
    add r1, r0, r9
    ldr r0, [r1, #0x40]
    ldrh r2, [r1, #0x38]
    mov r1, r0, lsr #0x6
    and r1, r1, #0x1
    mvn r1, r1
    and r2, r2, r1
    mov r1, r0, lsr #0x2
    orr r0, r1, r0, lsr #0x1
    and r0, r0, #0x1
    mvn r0, r0
    tst r2, r0
    movne r7, #0x1
.L_021ad128:
    cmp r7, #0x0
    movne r0, #0x0
    strne r0, [r5, #0x2c]
    cmpne r10, #0x0
    beq .L_021ad158
    mov r2, #0x0
    str r2, [sp, #0x0]
    ldr r0, [sp, #0x30]
    ldr r1, [sp, #0x2c]
    ldr r2, .L_021adb14
    mov r3, #0x1
    bl func_ov002_021d59cc
.L_021ad158:
    cmp r11, #0x0
    bne .L_021acfe0
.L_021ad160:
    ldr r1, .L_021aca30
    mov r0, r4
    ldr r1, [r1, #0x20]
    bl func_ov002_021b9000
    cmp r0, #0x0
    beq .L_021ad230
    ldr r0, .L_021aca30
    ldr r2, .L_021adb18
    ldr r1, [r0, #0x1c]
    mov r0, r8
    mov r3, #0x1
    bl func_ov002_021b3fd8
    cmp r0, #0x0
    movne r3, #0x1
    strne r3, [r6, #0x34]
    cmpne r10, #0x0
    beq .L_021ad1c0
    ldr r1, [r6, #0xc]
    mov r0, r8
    mov r2, r1, lsl #0x10
    rsb r1, r3, #0x1600
    mov r3, r2, lsr #0x10
    mov r2, #0x4
    bl func_ov002_021e276c
.L_021ad1c0:
    ldr r0, .L_021aca30
    ldr r2, .L_021adb1c
    ldr r1, [r0, #0x1c]
    mov r0, r8
    eor r3, r4, #0x1
    bl func_ov002_021b31b8
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [r6, #0x34]
    ldr r0, [r5, #0x24]
    cmp r0, #0x3
    bne .L_021ad230
    ldr r1, .L_021adb20
    mov r0, r8
    mvn r2, #0x0
    bl func_ov002_021bae7c
    cmp r0, #0x0
    beq .L_021ad230
    ldr r0, .L_021aca30
    ldr r1, .L_021adb20
    ldr r2, [r0, #0x1c]
    mov r0, r8
    bl func_ov002_021bae7c
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    add r0, r0, #0x1
    str r0, [r6, #0x34]
.L_021ad230:
    cmp r10, #0x0
    beq .L_021ad274
    ldr r0, .L_021aca30
    ldr r2, .L_021adb24
    ldr r1, [r0, #0x1c]
    mov r0, r8
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_021ad274
    mov r1, #0x0
    ldr r0, .L_021aca30
    str r1, [sp, #0x0]
    ldr r1, [r0, #0x20]
    ldr r2, .L_021adb24
    mov r0, r4
    mov r3, #0x4
    bl func_ov002_021d59cc
.L_021ad274:
    ldr r0, [sp, #0x8]
    cmp r0, #0x0
    bne .L_021ad9a0
    ldr r2, [r6, #0x10]
    ldr r0, .L_021adb28
    cmp r2, r0
    bgt .L_021ad420
    bge .L_021ad870
    sub r1, r0, #0x1a8
    cmp r2, r1
    bgt .L_021ad360
    bge .L_021ad6e0
    sub r1, r0, #0x250
    cmp r2, r1
    bgt .L_021ad31c
    sub r0, r0, #0x250
    cmp r2, r0
    bge .L_021ad6ac
    ldr r0, .L_021adb2c
    cmp r2, r0
    bgt .L_021ad2dc
    bge .L_021ad5a4
    sub r0, r0, #0x1a
    cmp r2, r0
    beq .L_021ad6f8
    b .L_021ad9a0
.L_021ad2dc:
    ldr r1, .L_021adb30
    cmp r2, r1
    bgt .L_021ad2f0
    beq .L_021ad5b8
    b .L_021ad9a0
.L_021ad2f0:
    add r0, r1, #0x6e
    cmp r2, r0
    bgt .L_021ad9a0
    add r0, r1, #0x6c
    cmp r2, r0
    blt .L_021ad9a0
    beq .L_021ad6a0
    add r0, r1, #0x6e
    cmp r2, r0
    beq .L_021ad80c
    b .L_021ad9a0
.L_021ad31c:
    ldr r1, .L_021adb34
    cmp r2, r1
    bgt .L_021ad33c
    bge .L_021ad624
    sub r0, r1, #0x30
    cmp r2, r0
    beq .L_021ad60c
    b .L_021ad9a0
.L_021ad33c:
    add r0, r1, #0x3
    cmp r2, r0
    bgt .L_021ad350
    beq .L_021ad6b4
    b .L_021ad9a0
.L_021ad350:
    add r0, r1, #0xa
    cmp r2, r0
    beq .L_021ad870
    b .L_021ad9a0
.L_021ad360:
    sub r1, r0, #0xf9
    cmp r2, r1
    bgt .L_021ad3b8
    sub r0, r0, #0xf9
    cmp r2, r0
    bge .L_021ad6a0
    ldr r1, .L_021adb38
    cmp r2, r1
    bgt .L_021ad394
    bge .L_021ad648
    cmp r2, #0x1500
    beq .L_021ad738
    b .L_021ad9a0
.L_021ad394:
    add r0, r1, #0xe
    cmp r2, r0
    bgt .L_021ad3a8
    beq .L_021ad674
    b .L_021ad9a0
.L_021ad3a8:
    add r0, r1, #0x26
    cmp r2, r0
    beq .L_021ad6a0
    b .L_021ad9a0
.L_021ad3b8:
    sub r1, r0, #0x4c
    cmp r2, r1
    bgt .L_021ad3f4
    bge .L_021ad6a0
    sub r1, r0, #0x6f
    cmp r2, r1
    bgt .L_021ad3e4
    sub r0, r0, #0x6f
    cmp r2, r0
    beq .L_021ad870
    b .L_021ad9a0
.L_021ad3e4:
    sub r0, r0, #0x4f
    cmp r2, r0
    beq .L_021ad6b4
    b .L_021ad9a0
.L_021ad3f4:
    sub r1, r0, #0x44
    cmp r2, r1
    bgt .L_021ad410
    sub r0, r0, #0x44
    cmp r2, r0
    beq .L_021ad870
    b .L_021ad9a0
.L_021ad410:
    sub r0, r0, #0x4
    cmp r2, r0
    beq .L_021ad738
    b .L_021ad9a0
.L_021ad420:
    ldr r1, .L_021acaa4
    cmp r2, r1
    bgt .L_021ad4d0
    bge .L_021ad6b4
    sub r3, r1, #0x8d
    cmp r2, r3
    bgt .L_021ad48c
    bge .L_021ad888
    sub r3, r1, #0x148
    cmp r2, r3
    bgt .L_021ad468
    sub r1, r1, #0x148
    cmp r2, r1
    bge .L_021ad6a0
    add r0, r0, #0xb2
    cmp r2, r0
    beq .L_021ad788
    b .L_021ad9a0
.L_021ad468:
    sub r0, r1, #0xd4
    cmp r2, r0
    bgt .L_021ad47c
    beq .L_021ad91c
    b .L_021ad9a0
.L_021ad47c:
    sub r0, r1, #0x91
    cmp r2, r0
    beq .L_021ad91c
    b .L_021ad9a0
.L_021ad48c:
    sub r0, r1, #0x63
    cmp r2, r0
    bgt .L_021ad4ac
    bge .L_021ad6a0
    sub r0, r1, #0x81
    cmp r2, r0
    beq .L_021ad694
    b .L_021ad9a0
.L_021ad4ac:
    sub r0, r1, #0x57
    cmp r2, r0
    bgt .L_021ad4c0
    beq .L_021ad91c
    b .L_021ad9a0
.L_021ad4c0:
    sub r0, r1, #0xc
    cmp r2, r0
    beq .L_021ad8a4
    b .L_021ad9a0
.L_021ad4d0:
    ldr r0, .L_021acaa8
    cmp r2, r0
    bgt .L_021ad52c
    bge .L_021ad694
    sub r1, r0, #0x76
    cmp r2, r1
    bgt .L_021ad500
    bge .L_021ad95c
    sub r0, r0, #0xac
    cmp r2, r0
    beq .L_021ad694
    b .L_021ad9a0
.L_021ad500:
    sub r1, r0, #0x6a
    cmp r2, r1
    bgt .L_021ad51c
    sub r0, r0, #0x6a
    cmp r2, r0
    beq .L_021ad98c
    b .L_021ad9a0
.L_021ad51c:
    sub r0, r0, #0x5d
    cmp r2, r0
    beq .L_021ad694
    b .L_021ad9a0
.L_021ad52c:
    add r3, r0, #0xee
    cmp r2, r3
    bgt .L_021ad56c
    mov r1, r3
    cmp r2, r1
    bge .L_021ad6a0
    add r1, r0, #0x40
    cmp r2, r1
    bgt .L_021ad560
    add r0, r0, #0x40
    cmp r2, r0
    beq .L_021ad6a0
    b .L_021ad9a0
.L_021ad560:
    cmp r2, #0x1a00
    beq .L_021ad6a0
    b .L_021ad9a0
.L_021ad56c:
    add r0, r1, #0x224
    cmp r2, r0
    bgt .L_021ad580
    beq .L_021ad8a4
    b .L_021ad9a0
.L_021ad580:
    ldr r1, .L_021acaac
    cmp r2, r1
    bgt .L_021ad9a0
    sub r0, r1, #0x1
    cmp r2, r0
    blt .L_021ad9a0
    cmpne r2, r1
    beq .L_021ad8d4
    b .L_021ad9a0
.L_021ad5a4:
    ldr r0, [r5, #0x28]
    cmp r0, #0x7
    movle r0, #0x0
    strle r0, [r6, #0x2c]
    b .L_021ad9a0
.L_021ad5b8:
    ldr r0, .L_021acab0
    ldr r1, [r0, #0xcec]
    cmp r1, r4
    ldreq r0, [r0, #0xcf8]
    cmpeq r0, #0x3
    bne .L_021ad9a0
    mov r7, #0x0
    ldr r3, .L_021aca30
    str r7, [r6, #0x2c]
    mov r0, r7
.L_021ad5e0:
    ldr r1, [r3, #0xa8]
    add r7, r7, #0x1
    cmp r4, r1
    ldreq r2, [r6, #0x4]
    ldreq r1, [r3, #0xac]
    cmpeq r2, r1
    streq r0, [r3, #0x9c]
    cmp r7, #0x2
    add r3, r3, #0x14
    blt .L_021ad5e0
    b .L_021ad9a0
.L_021ad60c:
    ldr r2, [r5, #0x1c]
    sub r0, r1, #0xd40
    cmp r2, r0
    movge r0, #0x0
    strge r0, [r6, #0x2c]
    b .L_021ad9a0
.L_021ad624:
    ldr r1, .L_021aca30
    mov r0, r4
    ldr r1, [r1, #0x20]
    bl func_ov002_021b3618
    ldr r1, .L_021aca68
    cmp r0, r1
    movne r0, #0x0
    strne r0, [r6, #0x2c]
    b .L_021ad9a0
.L_021ad648:
    ldr r0, [r6, #0x0]
    bl func_ov002_021bbf50
    cmp r0, #0x1
    bne .L_021ad9a0
    ldr r0, [r5, #0x10]
    bl func_0202f9e8
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    str r0, [r5, #0x34]
    b .L_021ad9a0
.L_021ad674:
    ldr r1, .L_021aca30
    mov r0, r8
    ldr r1, [r1, #0x1c]
    bl func_ov002_021c92fc
    tst r0, #0x7c
    movne r0, #0x0
    strne r0, [r6, #0x2c]
    b .L_021ad9a0
.L_021ad694:
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    bne .L_021ad9a0
.L_021ad6a0:
    mov r0, #0x0
    str r0, [r6, #0x2c]
    b .L_021ad9a0
.L_021ad6ac:
    mov r0, #0x0
    str r0, [r6, #0x2c]
.L_021ad6b4:
    mov r3, #0x0
    ldr r2, .L_021aca30
    mov r0, r3
.L_021ad6c0:
    ldr r1, [r2, #0xa8]
    add r3, r3, #0x1
    cmp r4, r1
    streq r0, [r2, #0x9c]
    cmp r3, #0x2
    add r2, r2, #0x14
    blt .L_021ad6c0
    b .L_021ad9a0
.L_021ad6e0:
    ldr r1, [r5, #0x1c]
    ldr r0, [r6, #0x1c]
    cmp r1, r0
    moveq r0, #0x0
    streq r0, [r6, #0x2c]
    b .L_021ad9a0
.L_021ad6f8:
    ldr r0, [sp, #0x38]
    cmp r0, #0x0
    bne .L_021ad9a0
    ldr r1, .L_021aca30
    rsb r2, r4, #0x1
    mov r3, #0x0
.L_021ad710:
    ldr r0, [r1, #0xa8]
    add r3, r3, #0x1
    cmp r2, r0
    ldreq r0, [r1, #0x9c]
    moveq r0, r0, lsl #0x1
    streq r0, [r1, #0x9c]
    cmp r3, #0x2
    add r1, r1, #0x14
    blt .L_021ad710
    b .L_021ad9a0
.L_021ad738:
    ldr r0, .L_021aca30
    rsb r1, r4, #0x1
    mov r2, #0x0
.L_021ad744:
    ldr r3, [r0, #0xa0]
    cmp r4, r3
    ldreq r7, [r6, #0x4]
    ldreq r3, [r0, #0xa4]
    cmpeq r7, r3
    ldreq r3, [r0, #0xa8]
    cmpeq r1, r3
    bne .L_021ad774
    ldr r3, [r0, #0x9c]
    add r3, r3, #0x1
    mov r3, r3, lsr #0x1
    str r3, [r0, #0x9c]
.L_021ad774:
    add r2, r2, #0x1
    cmp r2, #0x2
    add r0, r0, #0x14
    blt .L_021ad744
    b .L_021ad9a0
.L_021ad788:
    ldr r1, .L_021aca30
    ldr r0, .L_021aca74
    ldr r2, [r1, #0x20]
    mov r1, #0x14
    ldr r3, .L_021acab4
    and r7, r4, #0x1
    mul r1, r2, r1
    mla r0, r7, r0, r3
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    bne .L_021ad9a0
    mov r0, #0x0
    str r0, [r6, #0x2c]
    cmp r10, #0x0
    beq .L_021ad9a0
    ldr r1, [r6, #0x4]
    ldr r2, [r6, #0xc]
    mov r0, r4
    bl func_ov002_021df62c
    mov r1, #0x0
    ldr r0, .L_021aca30
    str r1, [sp, #0x0]
    ldr r2, [r0, #0x20]
    ldr r1, [r0, #0x1c]
    and r2, r2, #0xff
    mov r0, r8
    and r3, r4, #0xff
    orr r2, r3, r2, lsl #0x8
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    mov r3, #0x6
    bl func_ov002_021d59cc
    b .L_021ad9a0
.L_021ad80c:
    ldr r1, .L_021aca30
    ldr r0, .L_021aca74
    ldr r2, [r1, #0x20]
    mov r1, #0x14
    ldr r3, .L_021acab4
    and r7, r4, #0x1
    mul r1, r2, r1
    mla r0, r7, r0, r3
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [r6, #0x2c]
    cmp r10, #0x0
    beq .L_021ad9a0
    ldr r1, [r6, #0x4]
    ldr r2, [r6, #0xc]
    mov r0, r4
    bl func_ov002_021df62c
    ldr r0, .L_021aca30
    ldr r3, .L_021adb3c
    ldr r1, [r0, #0x1c]
    mov r0, r8
    mov r2, #0x1
    bl func_ov002_021d94ac
    b .L_021ad9a0
.L_021ad870:
    ldr r1, .L_021aca30
    mov r0, r8
    ldr r1, [r1, #0x1c]
    bl func_ov002_021b9000
    str r0, [r5, #0x34]
    b .L_021ad9a0
.L_021ad888:
    ldr r0, [r5, #0x10]
    bl func_0202f9e8
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    str r0, [r5, #0x34]
    b .L_021ad9a0
.L_021ad8a4:
    cmp r8, r4
    beq .L_021ad8c8
    ldr r1, .L_021aca30
    mov r0, r8
    ldr r1, [r1, #0x1c]
    bl func_ov002_021b9000
    cmp r0, #0x0
    movne r0, #0x1
    bne .L_021ad8cc
.L_021ad8c8:
    mov r0, #0x0
.L_021ad8cc:
    str r0, [r5, #0x34]
    b .L_021ad9a0
.L_021ad8d4:
    ldr r1, .L_021aca30
    mov r0, r4
    ldr r1, [r1, #0x20]
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_021ad9a0
    cmp r8, r4
    beq .L_021ad910
    ldr r1, .L_021aca30
    mov r0, r8
    ldr r1, [r1, #0x1c]
    bl func_ov002_021b9000
    cmp r0, #0x0
    movne r0, #0x1
    bne .L_021ad914
.L_021ad910:
    mov r0, #0x0
.L_021ad914:
    str r0, [r5, #0x34]
    b .L_021ad9a0
.L_021ad91c:
    mov r0, #0x0
    mov r1, #0x5
    bl func_ov002_021bbd04
    cmp r0, #0x0
    bne .L_021ad944
    mov r0, #0x1
    mov r1, #0x5
    bl func_ov002_021bbd04
    cmp r0, #0x0
    beq .L_021ad9a0
.L_021ad944:
    ldr r1, .L_021aca30
    mov r0, r8
    ldr r1, [r1, #0x1c]
    bl func_ov002_021b9000
    str r0, [r5, #0x34]
    b .L_021ad9a0
.L_021ad95c:
    ldr r0, [r6, #0x8]
    cmp r0, #0x0
    bne .L_021ad9a0
    ldr r0, .L_021aca74
    and r1, r4, #0x1
    mul r2, r1, r0
    ldr r0, .L_021adad0
    ldr r0, [r0, r2]
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [r6, #0x2c]
    b .L_021ad9a0
.L_021ad98c:
    rsb r0, r4, #0x1
    bl func_ov002_021bbf50
    cmp r0, #0x1
    moveq r0, #0x0
    streq r0, [r6, #0x2c]
.L_021ad9a0:
    ldr r0, [r6, #0x10]
    ldr r2, .L_021adad4
    cmp r0, r2
    bgt .L_021ad9f8
    bge .L_021ada7c
    sub r1, r2, #0xb
    cmp r0, r1
    bgt .L_021ad9e8
    cmp r0, #0x1700
    blt .L_021ad9d8
    beq .L_021adb44
    cmp r0, r1
    beq .L_021adb4c
    b .L_021adc20
.L_021ad9d8:
    ldr r1, .L_021adad8
    cmp r0, r1
    beq .L_021adb44
    b .L_021adc20
.L_021ad9e8:
    sub r1, r2, #0x1
    cmp r0, r1
    beq .L_021ada28
    b .L_021adc20
.L_021ad9f8:
    ldr r1, .L_021adadc
    cmp r0, r1
    bgt .L_021ada18
    bge .L_021adbe4
    add r1, r2, #0xc8
    cmp r0, r1
    beq .L_021adb90
    b .L_021adc20
.L_021ada18:
    add r1, r1, #0x56
    cmp r0, r1
    beq .L_021adb44
    b .L_021adc20
.L_021ada28:
    ldr r0, [r5, #0x24]
    cmp r0, #0x2
    cmpne r0, #0x3
    bne .L_021adc20
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [r5, #0x30]
    cmp r10, #0x0
    beq .L_021adc20
    mov r0, #0x0
    str r0, [sp, #0x0]
    ldr r1, [r6, #0x10]
    ldr r0, .L_021adb40
    mov r2, r1, lsl #0x10
    ldr r1, [r0, #0x1c]
    mov r0, r8
    mov r2, r2, lsr #0x10
    mov r3, #0x4
    bl func_ov002_021d59cc
    b .L_021adc20
.L_021ada7c:
    ldr r0, [r5, #0x24]
    cmp r0, #0xf
    cmpne r0, #0x12
    bne .L_021adc20
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [r5, #0x30]
    cmp r10, #0x0
    beq .L_021adc20
    mov r0, #0x0
    str r0, [sp, #0x0]
    ldr r1, [r6, #0x10]
    ldr r0, .L_021adb40
    mov r2, r1, lsl #0x10
    ldr r1, [r0, #0x1c]
    mov r0, r8
    mov r2, r2, lsr #0x10
    mov r3, #0x4
    bl func_ov002_021d59cc
    b .L_021adc20
.L_021adad0:
        .word   data_ov002_022cf178
.L_021adad4:
        .word   0x170e
.L_021adad8:
        .word   0x1441
.L_021adadc:
        .word   0x1950
.L_021adae0:
        .word   0x1a93
.L_021adae4:
        .word   data_ov002_022cf288
.L_021adae8:
        .word   0x1805
.L_021adaec:
        .word   0x1594
.L_021adaf0:
        .word   0x150a
.L_021adaf4:
        .word   0x17ff
.L_021adaf8:
        .word   0x1992
.L_021adafc:
        .word   0x1a18
.L_021adb00:
        .word   0x1957
.L_021adb04:
        .word   0x1a05
.L_021adb08:
        .word   data_ov002_022cf1a6
.L_021adb0c:
        .word   data_ov002_022d0650
.L_021adb10:
        .word   0x1989
.L_021adb14:
        .word   0x15b3
.L_021adb18:
        .word   0x15ff
.L_021adb1c:
        .word   0x165f
.L_021adb20:
        .word   0x14b5
.L_021adb24:
        .word   0x18cd
.L_021adb28:
        .word   0x1691
.L_021adb2c:
        .word   0x12ac
.L_021adb30:
        .word   0x13cb
.L_021adb34:
        .word   0x14ac
.L_021adb38:
        .word   0x1570
.L_021adb3c:
        .word   0x1439
.L_021adb40:
        .word   data_ov002_022cd3f4
.L_021adb44:
    cmp r8, r4
    beq .L_021adc20
.L_021adb4c:
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [r5, #0x30]
    cmp r10, #0x0
    beq .L_021adc20
    mov r0, #0x0
    str r0, [sp, #0x0]
    ldr r1, [r6, #0x10]
    ldr r0, .L_021adb40
    mov r2, r1, lsl #0x10
    ldr r1, [r0, #0x1c]
    mov r0, r8
    mov r2, r2, lsr #0x10
    mov r3, #0x4
    bl func_ov002_021d59cc
    b .L_021adc20
.L_021adb90:
    cmp r10, #0x0
    ldrne r0, [r6, #0x2c]
    cmpne r0, #0x0
    beq .L_021adc20
    ldr r1, .L_021adb40
    mov r0, r4
    ldr r1, [r1, #0x20]
    add r2, r2, #0xc7
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_021adc20
    ldr r3, [r6, #0xc]
    ldr r0, [r6, #0x10]
    mov r2, r3, lsl #0x10
    mov r1, r0, lsl #0x10
    and r0, r3, #0x1
    mov r1, r1, lsr #0x10
    mov r3, r2, lsr #0x10
    mov r2, #0x4
    bl func_ov002_021e276c
    b .L_021adc20
.L_021adbe4:
    cmp r10, #0x0
    ldrne r1, [r6, #0x2c]
    cmpne r1, #0x0
    beq .L_021adc20
    ldr r1, [r5, #0x24]
    cmp r1, #0x4
    bne .L_021adc20
    ldr r3, [r6, #0xc]
    mov r1, r0, lsl #0x10
    mov r2, r3, lsl #0x10
    and r0, r3, #0x1
    mov r1, r1, lsr #0x10
    mov r3, r2, lsr #0x10
    mov r2, #0x4
    bl func_ov002_021e276c
.L_021adc20:
    ldr r7, .L_021adb40
    mov r9, #0x0
    mov r11, #0x3e8
.L_021adc2c:
    ldr r0, [r7, #0xa0]
    cmp r4, r0
    ldreq r1, [r6, #0x4]
    ldreq r0, [r7, #0xa4]
    cmpeq r1, r0
    bne .L_021adc94
    ldr r0, [r7, #0x9c]
    cmp r0, #0x0
    beq .L_021adc94
    ldr r3, [r7, #0xa8]
    ldr r2, .L_021ae3c4
    mov r0, r4
    rsb r3, r3, #0x1
    bl func_ov002_021b31b8
    cmp r0, #0x0
    strne r11, [r7, #0x9c]
    ldr r0, [r7, #0xa8]
    cmp r4, r0
    beq .L_021adc94
    ldr r1, [r6, #0x4]
    ldr r2, .L_021ae3c8
    mov r0, r4
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r7, #0x9c]
.L_021adc94:
    add r7, r7, #0x14
    add r9, r9, #0x1
    cmp r9, #0x2
    blt .L_021adc2c
    cmp r8, r4
    beq .L_021add0c
    ldr r0, .L_021ae3cc
    and r1, r4, #0x1
    mul r2, r1, r0
    ldr r0, .L_021adae4
    mov r1, #0xb
    ldr r0, [r0, r2]
    ldr r2, .L_021adae8
    mov r0, r0, lsr #0x17
    tst r0, #0x1
    movne r0, #0x0
    strne r0, [r6, #0x2c]
    mov r0, r4
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r6, #0x2c]
    ldr r2, .L_021ae3d0
    mov r0, r4
    mov r1, #0xb
    mov r3, #0x1
    bl func_ov002_021b4054
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r6, #0x2c]
.L_021add0c:
    ldr r0, [r6, #0x2c]
    cmp r0, #0x0
    beq .L_021add44
    ldr r0, [r6, #0x10]
    bl func_0202e5ac
    cmp r0, #0x0
    beq .L_021add44
    ldr r2, .L_021adaec
    mov r0, r4
    mov r1, #0xb
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r6, #0x2c]
.L_021add44:
    ldr r0, .L_021adb40
    ldr r2, .L_021adaf0
    ldr r1, [r0, #0x20]
    mov r0, r4
    bl func_ov002_021b314c
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r6, #0x2c]
    ldr r0, .L_021adb40
    ldr r2, .L_021adaf4
    ldr r1, [r0, #0x20]
    mov r0, r4
    bl func_ov002_021b314c
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r6, #0x2c]
    ldr r0, .L_021adb40
    ldr r2, .L_021adaf8
    ldr r1, [r0, #0x20]
    mov r0, r4
    bl func_ov002_021b314c
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r6, #0x2c]
    ldr r0, .L_021adb40
    ldr r2, .L_021adafc
    ldr r1, [r0, #0x20]
    mov r0, r4
    bl func_ov002_021b314c
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r6, #0x2c]
    ldr r0, .L_021adb40
    ldr r2, .L_021adb00
    ldr r1, [r0, #0x20]
    mov r0, r4
    bl func_ov002_021b30ac
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r6, #0x2c]
    ldr r0, [r6, #0x10]
    bl func_0202ed90
    cmp r0, #0x0
    beq .L_021ade0c
    ldr r1, .L_021adb04
    mov r0, r4
    bl func_ov002_021bb5a8
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r6, #0x2c]
.L_021ade0c:
    ldr r0, .L_021adb40
    ldr r2, .L_021ae3d4
    ldr r1, [r0, #0x20]
    mov r0, r4
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r6, #0x2c]
    ldr r0, .L_021adb40
    ldr r2, .L_021ae3d8
    ldr r1, [r0, #0x20]
    mov r0, r4
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r6, #0x2c]
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    bne .L_021ae010
    ldr r0, [r6, #0x2c]
    cmp r0, #0x0
    beq .L_021ae010
    ldr r0, .L_021adb40
    ldr r3, .L_021adb08
    ldr r1, [r0, #0x20]
    mov r0, #0x14
    mul r2, r1, r0
    ldr r0, .L_021ae3cc
    and r7, r4, #0x1
    mla r0, r7, r0, r3
    ldrh r11, [r2, r0]
    cmp r11, #0x0
    beq .L_021ae010
.L_021ade90:
    ldr r0, .L_021adb0c
    add r0, r0, r11, lsl #0x3
    str r0, [sp, #0x24]
    ldrh r11, [r0, #0x6]
    ldrh r0, [r0, #0x2]
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    cmp r0, #0x6
    blo .L_021ae008
    cmp r0, #0xd
    ldr r0, [sp, #0x24]
    mov r7, #0x0
    ldrh r1, [r0, #0x0]
    and r0, r1, #0xff
    str r0, [sp, #0x20]
    mov r0, r1, asr #0x8
    and r1, r0, #0xff
    mov r0, #0x14
    smulbb r9, r1, r0
    ldr r0, [sp, #0x20]
    str r1, [sp, #0x1c]
    and r2, r0, #0x1
    ldr r1, .L_021ae3cc
    ldr r0, .L_021ae3dc
    mla r0, r2, r1, r0
    str r0, [sp, #0x10]
    add r0, r0, r9
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    str r0, [sp, #0x18]
    ldreq r0, [sp, #0x8]
    cmpeq r0, #0x0
    moveq r7, #0x1
    beq .L_021adfd8
    ldr r0, [sp, #0x18]
    bl func_0202e340
    cmp r0, #0x0
    beq .L_021adf90
    ldr r0, [sp, #0x24]
    ldrh r0, [r0, #0x2]
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    add r0, r0, #0xf6
    add r0, r0, #0xff00
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    cmp r0, #0x1
    bhi .L_021adf90
    ldr r0, [sp, #0x10]
    add r0, r0, r9
    ldr r1, [r0, #0x40]
    ldrh r2, [r0, #0x38]
    mov r0, r1, lsr #0x6
    and r0, r0, #0x1
    mvn r0, r0
    and r0, r2, r0
    mov r2, r1, lsr #0x2
    orr r1, r2, r1, lsr #0x1
    and r1, r1, #0x1
    mvn r1, r1
    tst r0, r1
    movne r7, #0x1
    bne .L_021adfd8
.L_021adf90:
    ldr r1, [sp, #0x18]
    ldr r0, .L_021adb10
    cmp r1, r0
    bne .L_021adfd8
    ldr r0, [sp, #0x10]
    add r1, r0, r9
    ldr r0, [r1, #0x40]
    ldrh r2, [r1, #0x38]
    mov r1, r0, lsr #0x6
    and r1, r1, #0x1
    mvn r1, r1
    and r2, r2, r1
    mov r1, r0, lsr #0x2
    orr r0, r1, r0, lsr #0x1
    and r0, r0, #0x1
    mvn r0, r0
    tst r2, r0
    movne r7, #0x1
.L_021adfd8:
    cmp r7, #0x0
    movne r0, #0x0
    strne r0, [r6, #0x2c]
    cmpne r10, #0x0
    beq .L_021ae008
    mov r2, #0x0
    str r2, [sp, #0x0]
    ldr r0, [sp, #0x20]
    ldr r1, [sp, #0x1c]
    ldr r2, .L_021adb14
    mov r3, #0x1
    bl func_ov002_021d59cc
.L_021ae008:
    cmp r11, #0x0
    bne .L_021ade90
.L_021ae010:
    ldr r1, .L_021adb40
    mov r0, r8
    ldr r1, [r1, #0x1c]
    bl func_ov002_021b9000
    cmp r0, #0x0
    beq .L_021ae098
    ldr r0, .L_021adb40
    ldr r2, .L_021adb1c
    ldr r1, [r0, #0x20]
    mov r0, r4
    eor r3, r8, #0x1
    bl func_ov002_021b31b8
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [r5, #0x34]
    ldr r0, [r6, #0x24]
    cmp r0, #0x3
    bne .L_021ae098
    ldr r1, .L_021adb20
    mov r0, r4
    mvn r2, #0x0
    bl func_ov002_021bae7c
    cmp r0, #0x0
    beq .L_021ae098
    ldr r0, .L_021adb40
    ldr r1, .L_021adb20
    ldr r2, [r0, #0x20]
    mov r0, r4
    bl func_ov002_021bae7c
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    add r0, r0, #0x1
    str r0, [r5, #0x34]
.L_021ae098:
    cmp r10, #0x0
    beq .L_021ae0dc
    ldr r0, .L_021adb40
    ldr r2, .L_021adb24
    ldr r1, [r0, #0x20]
    mov r0, r4
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_021ae0dc
    mov r1, #0x0
    ldr r0, .L_021adb40
    str r1, [sp, #0x0]
    ldr r1, [r0, #0x1c]
    ldr r2, .L_021adb24
    mov r0, r8
    mov r3, #0x4
    bl func_ov002_021d59cc
.L_021ae0dc:
    cmp r10, #0x0
    beq .L_021ae174
    ldr r0, .L_021adb40
    ldr r2, .L_021ae3e0
    ldr r1, [r0, #0x1c]
    mov r0, r8
    bl func_ov002_021b30ac
    cmp r0, #0x0
    beq .L_021ae12c
    ldr r0, [r6, #0x24]
    cmp r0, #0x1
    bne .L_021ae12c
    mov r1, #0x0
    ldr r0, .L_021adb40
    str r1, [sp, #0x0]
    ldr r1, [r0, #0x20]
    ldr r2, .L_021ae3e0
    mov r0, r4
    mov r3, #0x1
    bl func_ov002_021d59cc
.L_021ae12c:
    ldr r0, .L_021adb40
    ldr r2, .L_021ae3e0
    ldr r1, [r0, #0x20]
    mov r0, r4
    bl func_ov002_021b30ac
    cmp r0, #0x0
    beq .L_021ae174
    ldr r0, [r5, #0x24]
    cmp r0, #0x1
    bne .L_021ae174
    mov r1, #0x0
    ldr r0, .L_021adb40
    str r1, [sp, #0x0]
    ldr r1, [r0, #0x1c]
    ldr r2, .L_021ae3e0
    mov r0, r8
    mov r3, #0x1
    bl func_ov002_021d59cc
.L_021ae174:
    ldr r1, .L_021adb40
    ldr r0, [r1, #0x8]
    cmp r0, #0x0
    ldreq r0, [sp, #0x4]
    cmpeq r0, #0x0
    bne .L_021ae30c
    ldr r0, [r5, #0x2c]
    cmp r0, #0x0
    beq .L_021ae24c
    ldr r0, [sp, #0x3c]
    cmp r0, #0x0
    ldreq r2, [r5, #0x10]
    ldreq r0, .L_021ae3e4
    cmpeq r2, r0
    bne .L_021ae24c
    ldr r1, [r1, #0x1c]
    ldr r2, .L_021ae3e8
    mov r0, r8
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    bne .L_021ae22c
    mov r0, #0x0
    str r0, [r5, #0x2c]
    cmp r10, #0x0
    beq .L_021ae24c
    ldr r1, [r5, #0x4]
    ldr r2, [r5, #0xc]
    mov r0, r8
    bl func_ov002_021df62c
    mov r1, #0x0
    ldr r0, .L_021adb40
    str r1, [sp, #0x0]
    ldr r1, [r0, #0x1c]
    ldr r2, .L_021ae3e8
    mov r0, r8
    mov r3, #0x2
    bl func_ov002_021d59cc
    mov r0, #0x0
    str r0, [sp, #0x0]
    mov r0, r8
    ldr r1, .L_021adb40
    ldr r2, .L_021ae3e4
    ldr r1, [r1, #0x1c]
    mov r3, #0x4
    bl func_ov002_021d59cc
    b .L_021ae24c
.L_021ae22c:
    ldr r0, .L_021adb40
    ldr r2, .L_021ae3e4
    ldr r1, [r0, #0x1c]
    mov r0, r8
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r5, #0x2c]
.L_021ae24c:
    ldr r0, [r6, #0x2c]
    cmp r0, #0x0
    beq .L_021ae30c
    ldr r0, [sp, #0x8]
    cmp r0, #0x0
    ldreq r0, [r6, #0x10]
    ldreq r2, .L_021ae3e4
    cmpeq r0, r2
    bne .L_021ae30c
    cmp r10, #0x0
    beq .L_021ae2f0
    ldr r0, .L_021adb40
    ldr r2, .L_021ae3e8
    ldr r1, [r0, #0x20]
    mov r0, r4
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    bne .L_021ae30c
    mov r0, #0x0
    str r0, [r6, #0x2c]
    ldr r1, [r6, #0x4]
    ldr r2, [r6, #0xc]
    mov r0, r4
    bl func_ov002_021df62c
    mov r1, #0x0
    ldr r0, .L_021adb40
    str r1, [sp, #0x0]
    ldr r1, [r0, #0x20]
    ldr r2, .L_021ae3e8
    mov r0, r4
    mov r3, #0x2
    bl func_ov002_021d59cc
    mov r0, #0x0
    str r0, [sp, #0x0]
    ldr r1, .L_021adb40
    mov r0, r4
    ldr r1, [r1, #0x20]
    ldr r2, .L_021ae3e4
    mov r3, #0x4
    bl func_ov002_021d59cc
    b .L_021ae30c
.L_021ae2f0:
    ldr r1, .L_021adb40
    mov r0, r4
    ldr r1, [r1, #0x20]
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r6, #0x2c]
.L_021ae30c:
    cmp r10, #0x0
    cmpne r8, r4
    ldrne r0, [r5, #0x2c]
    cmpne r0, #0x0
    ldrne r0, [r6, #0x2c]
    cmpne r0, #0x0
    beq .L_021ae334
    mov r0, #0x11
    mov r1, #0x1
    bl func_ov002_021b0bdc
.L_021ae334:
    ldr r0, [r5, #0x2c]
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [r5, #0x34]
    ldr r0, [r6, #0x2c]
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [r6, #0x34]
    ldr r0, [r5, #0x2c]
    cmp r0, #0x0
    ldrne r0, [r6, #0x2c]
    cmpne r0, #0x0
    beq .L_021ae388
    ldr r0, [r5, #0x34]
    cmp r0, #0x2
    movlt r0, #0x0
    strlt r0, [r5, #0x34]
    ldr r0, [r6, #0x34]
    cmp r0, #0x2
    movlt r0, #0x0
    strlt r0, [r6, #0x34]
.L_021ae388:
    ldr r1, .L_021adb40
    ldr r0, .L_021ae3ec
    ldr r2, [r1, #0x9c]
    ldr r1, .L_021adb40
    cmp r2, r0
    movhi r2, r0
    str r2, [r1, #0x9c]
    ldr r0, .L_021ae3ec
    ldr r1, [r1, #0xb0]
    cmp r1, r0
    movhi r1, r0
    ldr r0, .L_021adb40
    str r1, [r0, #0xb0]
    add sp, sp, #0x4c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_021ae3c4:
        .word   0x1663
.L_021ae3c8:
        .word   0x1890
.L_021ae3cc:
        .word   0x868
.L_021ae3d0:
        .word   0x19b8
.L_021ae3d4:
        .word   0x1aac
.L_021ae3d8:
        .word   0x1b2c
.L_021ae3dc:
        .word   data_ov002_022cf16c
.L_021ae3e0:
        .word   0x1392
.L_021ae3e4:
        .word   0x18f1
.L_021ae3e8:
        .word   0xfb6
.L_021ae3ec:
        .word   0xffff
