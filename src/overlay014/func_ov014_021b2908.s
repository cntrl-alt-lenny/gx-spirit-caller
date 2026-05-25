; func_ov014_021b2908 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern data_02104f4c
        .extern data_ov014_021b4bf8
        .extern data_ov014_021b4d48
        .extern data_ov014_021b4d54
        .extern data_ov014_021b4d60
        .extern data_ov014_021b4d6c
        .extern data_ov014_021b4d78
        .extern data_ov014_021b4d84
        .extern func_02005dac
        .extern func_020061ac
        .extern func_0201e964
        .extern func_020944a4
        .extern func_ov014_021b3440
        .extern func_ov014_021b3a84
        .global func_ov014_021b2908
        .arm
func_ov014_021b2908:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x38
    ldr r1, .L_021b2ec0
    ldr r5, .L_021b2ec4
    ldrh r4, [r1, #0x8]
    ldrh r3, [r1, #0xa]
    add r2, sp, #0x28
    strh r4, [sp, #0x28]
    strh r3, [sp, #0x2a]
    ldrh r6, [r1, #0xc]
    ldrh r4, [r1, #0xe]
    ldr r1, .L_021b2ec8
    mov r3, #0x4
    strh r4, [sp, #0x2e]
    strh r6, [sp, #0x2c]
    mov r4, r0
    str r5, [sp, #0x0]
    bl func_ov014_021b3a84
    ldr r1, .L_021b2ecc
    ldr r0, .L_021b2ed0
    ldrh r2, [r1, #0x0]
    ldr r0, [r0, #0x4]
    ldrh r1, [r1, #0x2]
    mov r3, r2, lsl #0xc
    mov r0, r0, lsl #0x1d
    mov r2, r1, lsl #0xc
    mov r1, r0, lsr #0x1c
    str r3, [sp, #0x30]
    str r2, [sp, #0x34]
    ldr r0, [r4, #0x4]
    add r5, r1, #0x7
    cmp r0, #0x0
    ldr r6, .L_021b2ed4
    bne .L_021b29a4
    mov r0, r4
    mov r1, r6
    bl func_ov014_021b3440
    cmp r0, #0x0
    addne r5, r5, #0x1
.L_021b29a4:
    mov r3, #0x0
    str r3, [sp, #0x0]
    str r3, [sp, #0x4]
    ldrh r0, [r6, #0x8]
    mov r1, #0x3c00
    add r2, sp, #0x30
    str r0, [sp, #0x8]
    ldrh r6, [r6, #0x6]
    mov r0, #0x2
    str r6, [sp, #0xc]
    str r1, [sp, #0x10]
    str r3, [sp, #0x14]
    str r3, [sp, #0x18]
    str r3, [sp, #0x1c]
    ldr r1, [r4, #0x40]
    ldr r1, [r1, #0x2c]
    add r1, r1, r5, lsl #0x3
    bl func_0201e964
    ldr r5, .L_021b2ed8
    mov r6, #0x3
    ldrh r1, [r5, #0x0]
    ldrh r0, [r5, #0x2]
    mov r1, r1, lsl #0xc
    mov r0, r0, lsl #0xc
    str r1, [sp, #0x30]
    str r0, [sp, #0x34]
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    bne .L_021b2a2c
    mov r0, r4
    mov r1, r5
    bl func_ov014_021b3440
    cmp r0, #0x0
    addne r6, r6, #0x1
.L_021b2a2c:
    mov r3, #0x0
    str r3, [sp, #0x0]
    str r3, [sp, #0x4]
    ldrh r0, [r5, #0x8]
    mov r1, #0x3c00
    add r2, sp, #0x30
    str r0, [sp, #0x8]
    ldrh r5, [r5, #0x6]
    mov r0, #0x2
    str r5, [sp, #0xc]
    str r1, [sp, #0x10]
    str r3, [sp, #0x14]
    str r3, [sp, #0x18]
    str r3, [sp, #0x1c]
    ldr r1, [r4, #0x40]
    ldr r1, [r1, #0x2c]
    add r1, r1, r6, lsl #0x3
    bl func_0201e964
    ldr r5, .L_021b2edc
    mov r6, #0x5
    ldrh r1, [r5, #0x0]
    ldrh r0, [r5, #0x2]
    sub r1, r1, #0x1d
    mov r1, r1, lsl #0xc
    mov r0, r0, lsl #0xc
    str r1, [sp, #0x30]
    str r0, [sp, #0x34]
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    bne .L_021b2ab8
    mov r0, r4
    mov r1, r5
    bl func_ov014_021b3440
    cmp r0, #0x0
    addne r6, r6, #0x1
.L_021b2ab8:
    mov r3, #0x0
    str r3, [sp, #0x0]
    str r3, [sp, #0x4]
    ldrh r0, [r5, #0x8]
    mov r1, #0x3c00
    add r2, sp, #0x30
    str r0, [sp, #0x8]
    ldrh r5, [r5, #0x6]
    mov r0, #0x2
    str r5, [sp, #0xc]
    str r1, [sp, #0x10]
    str r3, [sp, #0x14]
    str r3, [sp, #0x18]
    str r3, [sp, #0x1c]
    ldr r1, [r4, #0x40]
    ldr r1, [r1, #0x2c]
    add r1, r1, r6, lsl #0x3
    bl func_0201e964
    ldr r5, .L_021b2ee0
    mov r6, #0x3
    ldrh r1, [r5, #0x0]
    ldrh r0, [r5, #0x2]
    mov r1, r1, lsl #0xc
    mov r0, r0, lsl #0xc
    str r1, [sp, #0x30]
    str r0, [sp, #0x34]
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    bne .L_021b2b40
    mov r0, r4
    mov r1, r5
    bl func_ov014_021b3440
    cmp r0, #0x0
    addne r6, r6, #0x1
.L_021b2b40:
    mov r3, #0x0
    str r3, [sp, #0x0]
    str r3, [sp, #0x4]
    ldrh r0, [r5, #0x8]
    mov r1, #0x3c00
    add r2, sp, #0x30
    str r0, [sp, #0x8]
    ldrh r5, [r5, #0x6]
    mov r0, #0x2
    str r5, [sp, #0xc]
    str r1, [sp, #0x10]
    str r3, [sp, #0x14]
    str r3, [sp, #0x18]
    str r3, [sp, #0x1c]
    ldr r1, [r4, #0x40]
    ldr r1, [r1, #0x2c]
    add r1, r1, r6, lsl #0x3
    bl func_0201e964
    ldr r5, .L_021b2ee4
    mov r6, #0x5
    ldrh r1, [r5, #0x0]
    ldrh r0, [r5, #0x2]
    sub r1, r1, #0x1d
    mov r1, r1, lsl #0xc
    mov r0, r0, lsl #0xc
    str r1, [sp, #0x30]
    str r0, [sp, #0x34]
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    bne .L_021b2bcc
    mov r0, r4
    mov r1, r5
    bl func_ov014_021b3440
    cmp r0, #0x0
    addne r6, r6, #0x1
.L_021b2bcc:
    mov r3, #0x0
    str r3, [sp, #0x0]
    str r3, [sp, #0x4]
    ldrh r0, [r5, #0x8]
    mov r1, #0x3c00
    add r2, sp, #0x30
    str r0, [sp, #0x8]
    ldrh r5, [r5, #0x6]
    mov r0, #0x2
    str r5, [sp, #0xc]
    str r1, [sp, #0x10]
    str r3, [sp, #0x14]
    str r3, [sp, #0x18]
    str r3, [sp, #0x1c]
    ldr r1, [r4, #0x40]
    ldr r1, [r1, #0x2c]
    add r1, r1, r6, lsl #0x3
    bl func_0201e964
    ldr r5, .L_021b2ee8
    mov r6, #0x0
    ldrh r1, [r5, #0x0]
    ldrh r0, [r5, #0x2]
    mov r1, r1, lsl #0xc
    mov r0, r0, lsl #0xc
    str r1, [sp, #0x30]
    str r0, [sp, #0x34]
    ldrsb r0, [r4, #0xc]
    cmp r0, #0x0
    moveq r6, #0x2
    beq .L_021b2c64
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    bne .L_021b2c64
    mov r0, r4
    mov r1, r5
    bl func_ov014_021b3440
    cmp r0, #0x0
    addne r6, r6, #0x1
.L_021b2c64:
    mov r3, #0x0
    str r3, [sp, #0x0]
    str r3, [sp, #0x4]
    ldrh r0, [r5, #0x8]
    mov r1, #0x3c00
    add r2, sp, #0x30
    str r0, [sp, #0x8]
    ldrh r5, [r5, #0x6]
    mov r0, #0x2
    str r5, [sp, #0xc]
    str r1, [sp, #0x10]
    str r3, [sp, #0x14]
    str r3, [sp, #0x18]
    str r3, [sp, #0x1c]
    ldr r1, [r4, #0x40]
    ldr r1, [r1, #0x2c]
    add r1, r1, r6, lsl #0x3
    bl func_0201e964
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    bne .L_021b2eb4
    bl func_020061ac
    cmp r0, #0x0
    bne .L_021b2eb4
    ldr r0, [r4, #0x34]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_021b2eb4
.L_021b2cd4: ; jump table
    b .L_021b2ce4 ; case 0
    b .L_021b2d68 ; case 1
    b .L_021b2dd0 ; case 2
    b .L_021b2e38 ; case 3
.L_021b2ce4:
    mov r7, #0x0
    ldr r10, .L_021b2ed4
    mov r8, r7
    mov r9, r7
    mov r6, #0x2
    mov r5, r7
    add r4, sp, #0x20
    mov r11, #0x6
.L_021b2d04:
    ldrh r1, [r10, #0x0]
    ldrh r0, [r10, #0x2]
    orr r2, r9, #0x800
    sub r1, r1, #0x3
    sub r0, r0, #0x3
    add r1, r1, r8
    and r0, r0, #0xff
    mov r1, r1, lsl #0x17
    orr r0, r0, #0xc0000000
    orr r3, r0, r1, lsr #0x7
    mov r0, r6
    mov r1, r5
    str r3, [sp, #0x20]
    strh r2, [sp, #0x24]
    bl func_02005dac
    mov r1, r0
    mov r0, r4
    mov r2, r11
    bl func_020944a4
    add r7, r7, #0x1
    cmp r7, #0x2
    add r8, r8, #0x40
    add r9, r9, #0x10
    blt .L_021b2d04
    b .L_021b2eb4
.L_021b2d68:
    ldr r6, [r4, #0x30]
    mov r2, #0x820
    add r1, r6, #0x1
    mov r0, #0xc
    mul r3, r1, r0
    ldr r1, .L_021b2ed4
    mov r0, #0x2
    ldrh r4, [r1, r3]
    add r5, r1, r3
    ldrh r3, [r5, #0x2]
    sub r4, r4, #0x3
    sub r4, r4, r6
    sub r3, r3, #0x3
    and r3, r3, #0xff
    mov r4, r4, lsl #0x17
    orr r3, r3, #0xc0000000
    orr r3, r3, r4, lsr #0x7
    mov r1, #0x0
    str r3, [sp, #0x20]
    strh r2, [sp, #0x24]
    bl func_02005dac
    mov r1, r0
    add r0, sp, #0x20
    mov r2, #0x6
    bl func_020944a4
    b .L_021b2eb4
.L_021b2dd0:
    ldr r6, [r4, #0x30]
    mov r2, #0x820
    add r1, r6, #0x3
    mov r0, #0xc
    mul r3, r1, r0
    ldr r1, .L_021b2ed4
    mov r0, #0x2
    ldrh r4, [r1, r3]
    add r5, r1, r3
    ldrh r3, [r5, #0x2]
    sub r4, r4, #0x3
    sub r4, r4, r6
    sub r3, r3, #0x3
    and r3, r3, #0xff
    mov r4, r4, lsl #0x17
    orr r3, r3, #0xc0000000
    orr r3, r3, r4, lsr #0x7
    mov r1, #0x0
    str r3, [sp, #0x20]
    strh r2, [sp, #0x24]
    bl func_02005dac
    mov r1, r0
    add r0, sp, #0x20
    mov r2, #0x6
    bl func_020944a4
    b .L_021b2eb4
.L_021b2e38:
    mov r7, #0x0
    ldr r10, .L_021b2ee8
    mov r8, r7
    mov r9, #0x30
    mov r6, #0x2
    mov r5, r7
    add r4, sp, #0x20
    mov r11, #0x6
.L_021b2e58:
    ldrh r0, [r10, #0x2]
    ldrh r1, [r10, #0x0]
    orr r2, r9, #0x800
    sub r0, r0, #0x3
    add r1, r1, r8
    and r0, r0, #0xff
    mov r1, r1, lsl #0x17
    orr r0, r0, #0xc0000000
    orr r3, r0, r1, lsr #0x7
    mov r0, r6
    mov r1, r5
    str r3, [sp, #0x20]
    strh r2, [sp, #0x24]
    bl func_02005dac
    mov r1, r0
    mov r0, r4
    mov r2, r11
    bl func_020944a4
    add r7, r7, #0x1
    cmp r7, #0x3
    add r8, r8, #0x40
    add r9, r9, #0x10
    blt .L_021b2e58
.L_021b2eb4:
    mov r0, #0x1
    add sp, sp, #0x38
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_021b2ec0:
        .word   data_ov014_021b4bf8
.L_021b2ec4:
        .word   0x600100
.L_021b2ec8:
        .word   0x5000618
.L_021b2ecc:
        .word   data_ov014_021b4d48
.L_021b2ed0:
        .word   data_02104f4c
.L_021b2ed4:
        .word   data_ov014_021b4d48
.L_021b2ed8:
        .word   data_ov014_021b4d54
.L_021b2edc:
        .word   data_ov014_021b4d60
.L_021b2ee0:
        .word   data_ov014_021b4d6c
.L_021b2ee4:
        .word   data_ov014_021b4d78
.L_021b2ee8:
        .word   data_ov014_021b4d84
