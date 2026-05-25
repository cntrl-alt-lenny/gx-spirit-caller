; func_ov002_022b595c — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern data_ov002_022cccbc
        .extern data_ov002_022ccfd8
        .extern data_ov002_022ccfec
        .extern data_ov002_022cd000
        .extern data_ov002_022cd73c
        .extern data_ov002_022d0e70
        .extern data_ov002_022d0f2c
        .extern data_ov002_022d11bc
        .extern data_ov002_022d1410
        .extern data_ov002_022d28fc
        .extern Copy32
        .extern func_020212cc
        .extern func_020215d8
        .extern func_02021660
        .extern func_020216b0
        .extern func_020216bc
        .extern func_02022234
        .extern func_0202224c
        .extern func_02023d44
        .extern func_02025840
        .extern func_0202c9b0
        .extern func_0202e310
        .extern func_02036590
        .extern func_02037dc0
        .extern func_020a978c
        .extern func_020aadf8
        .extern func_020aaf40
        .extern func_ov002_0229da60
        .extern func_ov002_022a1784
        .extern func_ov002_022a6324
        .extern func_ov002_022a6afc
        .extern func_ov002_022a6bdc
        .extern func_ov002_022b867c
        .extern func_ov002_022b88c4
        .extern func_ov002_022b9420
        .extern func_ov002_022b94b8
        .extern func_ov002_022b95cc
        .extern func_ov002_022b9da4
        .extern func_ov002_022bade4
        .extern func_ov002_022baf44
        .extern func_ov002_022bb074
        .extern func_ov002_022bb294
        .extern func_ov002_022bb4b8
        .extern func_ov002_022bb6fc
        .extern func_ov002_022bb84c
        .extern func_ov002_022bb9d8
        .extern func_ov002_022bbb18
        .extern func_ov002_022bbcb4
        .extern func_ov002_022bbe88
        .extern func_ov002_022bc0b8
        .extern func_ov002_022bc2b4
        .extern func_ov002_022bc4fc
        .extern func_ov002_022bc798
        .extern func_ov002_022bca80
        .extern func_ov002_022bccec
        .extern func_ov002_022bced8
        .extern func_ov002_022bd080
        .extern func_ov002_022bd1fc
        .extern func_ov002_022bd2c4
        .extern func_ov002_022bd428
        .extern func_ov002_022bd5a4
        .extern func_ov002_022bd804
        .extern func_ov002_022bd940
        .extern func_ov002_022bd9c0
        .extern func_ov002_022bdb88
        .global func_ov002_022b595c
        .arm
func_ov002_022b595c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x110
    mov r9, r0
    ldr r0, [r9, #0xc54]
    str r0, [sp, #0x50]
    cmp r0, #0x14
    addls pc, pc, r0, lsl #0x2
    b .L_022b59e0
.L_022b597c: ; jump table
    b .L_022b59e0 ; case 0
    b .L_022b59d0 ; case 1
    b .L_022b59d0 ; case 2
    b .L_022b59d0 ; case 3
    b .L_022b59d0 ; case 4
    b .L_022b59d0 ; case 5
    b .L_022b59d0 ; case 6
    b .L_022b59d0 ; case 7
    b .L_022b59d0 ; case 8
    b .L_022b59d0 ; case 9
    b .L_022b59d0 ; case 10
    b .L_022b59d0 ; case 11
    b .L_022b59e0 ; case 12
    b .L_022b59e0 ; case 13
    b .L_022b59d0 ; case 14
    b .L_022b59e0 ; case 15
    b .L_022b59e0 ; case 16
    b .L_022b59e0 ; case 17
    b .L_022b59e0 ; case 18
    b .L_022b59e0 ; case 19
    b .L_022b59d0 ; case 20
.L_022b59d0:
    add r0, r9, #0xc00
    ldrh r0, [r0, #0x68]
    strh r0, [sp, #0xdc]
    b .L_022b59f0
.L_022b59e0:
    ldr r0, .L_022b6834
    add r0, r0, #0x500
    ldrh r0, [r0, #0x90]
    strh r0, [sp, #0xdc]
.L_022b59f0:
    ldrh r1, [sp, #0xdc]
    add r5, sp, #0x104
    mov r0, r9
    mov r6, r1, lsl #0x12
    mov r3, r1, lsl #0x1a
    mov r2, r1, lsl #0x1f
    mov r1, r6, lsr #0x18
    str r1, [sp, #0x4c]
    mov r1, r3, lsr #0x1b
    str r1, [sp, #0x44]
    mov r1, r2, lsr #0x1f
    ldr r3, [sp, #0x4c]
    ldr r2, [sp, #0x44]
    str r1, [sp, #0x48]
    str r5, [sp, #0x0]
    bl func_ov002_022b867c
    ldr r0, .L_022b6834
    ldr r1, [sp, #0x48]
    ldr r2, [sp, #0x44]
    ldr r3, [sp, #0x4c]
    bl func_ov002_022a6324
    str r0, [sp, #0x8c]
    cmp r0, #0x0
    ldrne r0, [r0, #0xc]
    strne r0, [sp, #0x2c]
    moveq r0, #0x0
    streq r0, [sp, #0x2c]
    ldr r0, .L_022b6838
    ldr r1, [r0, #0x4]
    ldr r0, [sp, #0x48]
    cmp r0, r1
    ldreq r0, [sp, #0x44]
    cmpeq r0, #0xb
    moveq r0, #0x1
    streq r0, [sp, #0x28]
    movne r0, #0x0
    strne r0, [sp, #0x28]
    ldr r0, [sp, #0x44]
    cmp r0, #0xb
    moveq r0, #0x1
    streq r0, [sp, #0x24]
    movne r0, #0x0
    strne r0, [sp, #0x24]
    ldr r0, [sp, #0x44]
    cmp r0, #0x4
    bhi .L_022b5ad8
    ldr r0, [sp, #0x8c]
    cmp r0, #0x0
    ldrnesb r0, [r0, #0x0]
    cmpne r0, #0x0
    beq .L_022b5ad8
    ldr r0, [sp, #0x8c]
    ldrh r0, [r0, #0xa]
    mov r0, r0, lsl #0x11
    movs r0, r0, lsr #0x1f
    movne r0, #0x1
    strne r0, [sp, #0x20]
    bne .L_022b5ae0
.L_022b5ad8:
    mov r0, #0x0
    str r0, [sp, #0x20]
.L_022b5ae0:
    ldr r0, [r9, #0x0]
    mov r1, #0x1
    mov r2, #0x0
    bl func_02021660
    mov r2, #0x0
    add r1, sp, #0xf8
    mov r3, r2
    str r0, [sp, #0x84]
    bl func_02023d44
    ldr r0, [r9, #0x4]
    mov r1, #0x3
    mov r2, #0xa
    bl func_02021660
    bl func_02025840
    str r0, [sp, #0x88]
    ldr r0, [r9, #0xc54]
    cmp r0, #0x1b
    addls pc, pc, r0, lsl #0x2
    b .L_022b5cdc
.L_022b5b2c: ; jump table
    b .L_022b5cdc ; case 0
    b .L_022b5b9c ; case 1
    b .L_022b5ba8 ; case 2
    b .L_022b5bb4 ; case 3
    b .L_022b5bc0 ; case 4
    b .L_022b5bcc ; case 5
    b .L_022b5bd8 ; case 6
    b .L_022b5be4 ; case 7
    b .L_022b5bf0 ; case 8
    b .L_022b5bfc ; case 9
    b .L_022b5c08 ; case 10
    b .L_022b5c14 ; case 11
    b .L_022b5c20 ; case 12
    b .L_022b5c2c ; case 13
    b .L_022b5c38 ; case 14
    b .L_022b5c44 ; case 15
    b .L_022b5c50 ; case 16
    b .L_022b5c5c ; case 17
    b .L_022b5c68 ; case 18
    b .L_022b5c74 ; case 19
    b .L_022b5c80 ; case 20
    b .L_022b5c8c ; case 21
    b .L_022b5c98 ; case 22
    b .L_022b5ca4 ; case 23
    b .L_022b5cb0 ; case 24
    b .L_022b5cbc ; case 25
    b .L_022b5cc8 ; case 26
    b .L_022b5cd4 ; case 27
.L_022b5b9c:
    mov r0, r9
    bl func_ov002_022b95cc
    b .L_022b5cdc
.L_022b5ba8:
    mov r0, r9
    bl func_ov002_022b9da4
    b .L_022b5cdc
.L_022b5bb4:
    mov r0, r9
    bl func_ov002_022bade4
    b .L_022b5cdc
.L_022b5bc0:
    mov r0, r9
    bl func_ov002_022baf44
    b .L_022b5cdc
.L_022b5bcc:
    mov r0, r9
    bl func_ov002_022bb074
    b .L_022b5cdc
.L_022b5bd8:
    mov r0, r9
    bl func_ov002_022bb294
    b .L_022b5cdc
.L_022b5be4:
    mov r0, r9
    bl func_ov002_022bb4b8
    b .L_022b5cdc
.L_022b5bf0:
    mov r0, r9
    bl func_ov002_022bb6fc
    b .L_022b5cdc
.L_022b5bfc:
    mov r0, r9
    bl func_ov002_022bb84c
    b .L_022b5cdc
.L_022b5c08:
    mov r0, r9
    bl func_ov002_022bb9d8
    b .L_022b5cdc
.L_022b5c14:
    mov r0, r9
    bl func_ov002_022bbb18
    b .L_022b5cdc
.L_022b5c20:
    mov r0, r9
    bl func_ov002_022bbcb4
    b .L_022b5cdc
.L_022b5c2c:
    mov r0, r9
    bl func_ov002_022bbe88
    b .L_022b5cdc
.L_022b5c38:
    mov r0, r9
    bl func_ov002_022bc0b8
    b .L_022b5cdc
.L_022b5c44:
    mov r0, r9
    bl func_ov002_022bc4fc
    b .L_022b5cdc
.L_022b5c50:
    mov r0, r9
    bl func_ov002_022bc798
    b .L_022b5cdc
.L_022b5c5c:
    mov r0, r9
    bl func_ov002_022bca80
    b .L_022b5cdc
.L_022b5c68:
    mov r0, r9
    bl func_ov002_022bccec
    b .L_022b5cdc
.L_022b5c74:
    mov r0, r9
    bl func_ov002_022bced8
    b .L_022b5cdc
.L_022b5c80:
    mov r0, r9
    bl func_ov002_022bd080
    b .L_022b5cdc
.L_022b5c8c:
    mov r0, r9
    bl func_ov002_022bd1fc
    b .L_022b5cdc
.L_022b5c98:
    mov r0, r9
    bl func_ov002_022bd2c4
    b .L_022b5cdc
.L_022b5ca4:
    mov r0, r9
    bl func_ov002_022bd428
    b .L_022b5cdc
.L_022b5cb0:
    mov r0, r9
    bl func_ov002_022bd5a4
    b .L_022b5cdc
.L_022b5cbc:
    mov r0, r9
    bl func_ov002_022bd804
    b .L_022b5cdc
.L_022b5cc8:
    mov r0, r9
    bl func_ov002_022bd940
    b .L_022b5cdc
.L_022b5cd4:
    mov r0, r9
    bl func_ov002_022bd9c0
.L_022b5cdc:
    ldr r0, [r9, #0xd44]
    cmp r0, #0x0
    beq .L_022b6180
    ldr r0, [r9, #0xccc]
    cmp r0, #0x0
    bne .L_022b6180
    add r0, r9, #0x74
    add r0, r0, #0xc00
    str r0, [sp, #0x5c]
    add r0, r9, #0x78
    mov r10, #0x0
    add r0, r0, #0xc00
    str r0, [sp, #0x58]
    str r10, [sp, #0x54]
.L_022b5d14:
    add r0, r9, r10, lsl #0x2
    ldr r0, [r0, #0xd50]
    cmp r0, #0x0
    beq .L_022b5ee8
    mvn r1, #0x0
    cmp r0, r1
    beq .L_022b6150
    bl func_020215d8
    cmp r0, #0x0
    beq .L_022b6150
    ldr r0, [r9, #0xc54]
    cmp r0, #0xa
    cmpne r0, #0x9
    cmpne r0, #0x7
    ldrne r1, [sp, #0x50]
    cmpne r1, #0xc
    bne .L_022b5d90
    add r1, r9, #0xc00
    ldrh r2, [r1, #0x6a]
    ldr r1, [sp, #0x5c]
    ldrh r3, [r1, #0x0]
    mov r1, r2, lsl #0x1f
    mov r5, r1, lsr #0x1f
    mov r1, r3, lsl #0x1f
    cmp r5, r1, lsr #0x1f
    bne .L_022b5d90
    mov r1, r2, lsl #0x1a
    mov r2, r1, lsr #0x1b
    mov r1, r3, lsl #0x1a
    cmp r2, r1, lsr #0x1b
    beq .L_022b5d98
.L_022b5d90:
    cmp r0, #0x11
    bne .L_022b5e3c
.L_022b5d98:
    add r0, r9, r10, lsl #0x2
    ldr r0, [r0, #0xd50]
    bl func_020212cc
    mvn r1, #0x0
    add r0, r9, r10, lsl #0x2
    str r1, [r0, #0xd50]
    ldr r0, [sp, #0x5c]
    ldrh r1, [r0, #0x0]
    mov r0, r10, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x1
    and r0, r0, #0x1
    orr r1, r1, r0
    ldr r0, [sp, #0x5c]
    strh r1, [r0, #0x0]
    ldrh r0, [r0, #0x0]
    add r1, r9, #0xc00
    bic r0, r0, #0x3e
    orr r2, r0, #0x3e
    ldr r0, [sp, #0x5c]
    strh r2, [r0, #0x0]
    ldr r0, [sp, #0x58]
    ldrh r2, [r0, #0x0]
    ldrh r0, [r1, #0x6a]
    bic r2, r2, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r0, r0, #0x1
    orr r2, r2, r0
    ldr r0, [sp, #0x58]
    strh r2, [r0, #0x0]
    ldrh r1, [r1, #0x6a]
    ldrh r2, [r0, #0x0]
    mov r0, r1, lsl #0x1a
    mov r0, r0, lsr #0x1b
    bic r1, r2, #0x3e
    mov r0, r0, lsl #0x1b
    orr r1, r1, r0, lsr #0x1a
    ldr r0, [sp, #0x58]
    strh r1, [r0, #0x0]
    b .L_022b6150
.L_022b5e3c:
    cmp r0, #0x5
    bne .L_022b5ec0
    ldr r2, .L_022b683c
    mov r1, #0x0
.L_022b5e4c:
    ldr r0, [r2, #0x0]
    cmp r0, #0x0
    beq .L_022b5e68
    ldr r0, [r2, #0x4]
    cmp r0, #0x30
    moveq r0, #0x1
    beq .L_022b5e7c
.L_022b5e68:
    add r2, r2, #0x8
    add r1, r1, #0x1
    cmp r1, #0x10
    blt .L_022b5e4c
    mov r0, #0x0
.L_022b5e7c:
    cmp r0, #0x0
    beq .L_022b5ec0
    add r0, r9, #0xc00
    ldrh r1, [r0, #0x68]
    ldr r0, [sp, #0x5c]
    ldrh r2, [r0, #0x0]
    mov r0, r1, lsl #0x1f
    mov r3, r0, lsr #0x1f
    mov r0, r2, lsl #0x1f
    cmp r3, r0, lsr #0x1f
    bne .L_022b5ec0
    mov r0, r1, lsl #0x1a
    mov r1, r0, lsr #0x1b
    mov r0, r2, lsl #0x1a
    cmp r1, r0, lsr #0x1b
    moveq r5, #0x0
    beq .L_022b5ec4
.L_022b5ec0:
    mov r5, #0x1f
.L_022b5ec4:
    add r0, r9, r10, lsl #0x2
    ldr r0, [r0, #0xd50]
    mov r1, #0x3
    mov r2, #0x2
    bl func_02021660
    mov r2, r5
    mov r1, #0xb
    bl func_020216b0
    b .L_022b6150
.L_022b5ee8:
    ldr r1, [r9, #0xc54]
    cmp r1, #0xa
    cmpne r1, #0x9
    cmpne r1, #0x7
    ldrne r2, [sp, #0x50]
    cmpne r2, #0xc
    bne .L_022b5f3c
    add r2, r9, #0xc00
    ldrh r3, [r2, #0x6a]
    ldr r2, [sp, #0x5c]
    ldrh r5, [r2, #0x0]
    mov r2, r3, lsl #0x1f
    mov r6, r2, lsr #0x1f
    mov r2, r5, lsl #0x1f
    cmp r6, r2, lsr #0x1f
    bne .L_022b5f3c
    mov r2, r3, lsl #0x1a
    mov r3, r2, lsr #0x1b
    mov r2, r5, lsl #0x1a
    cmp r3, r2, lsr #0x1b
    beq .L_022b5f44
.L_022b5f3c:
    cmp r1, #0x11
    bne .L_022b5fac
.L_022b5f44:
    mvn r1, #0x0
    add r0, r9, r10, lsl #0x2
    str r1, [r0, #0xd50]
    ldr r0, [sp, #0x58]
    add r1, r9, #0xc00
    ldrh r2, [r0, #0x0]
    ldrh r0, [r1, #0x6a]
    bic r3, r2, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r0, r0, #0x1
    orr r3, r3, r0
    ldr r0, [sp, #0x58]
    mov r2, #0x0
    strh r3, [r0, #0x0]
    ldrh r1, [r1, #0x6a]
    ldrh r3, [r0, #0x0]
    mov r0, r1, lsl #0x1a
    mov r0, r0, lsr #0x1b
    bic r1, r3, #0x3e
    mov r0, r0, lsl #0x1b
    orr r1, r1, r0, lsr #0x1a
    ldr r0, [sp, #0x58]
    strh r1, [r0, #0x0]
    str r2, [r9, #0xd44]
    b .L_022b6150
.L_022b5fac:
    cmp r0, #0x0
    bne .L_022b6150
    mov r6, #0x0
    add r5, r9, #0xc00
.L_022b5fbc:
    ldr r0, .L_022b6840
    cmp r10, #0x1
    smull r1, r7, r0, r6
    smull r2, r8, r0, r6
    mov r1, r6, lsr #0x1f
    add r8, r1, r8, asr #0x1
    mov r0, #0x5
    add r7, r1, r7, asr #0x1
    smull r1, r2, r0, r8
    ldreqh r0, [r5, #0x74]
    sub r8, r6, r1
    moveq r1, r0, lsl #0x1f
    cmpeq r7, r1, lsr #0x1f
    moveq r0, r0, lsl #0x1a
    moveq r0, r0, lsr #0x1b
    cmpeq r0, r8
    beq .L_022b6144
    ldrh r0, [r5, #0x78]
    mov r1, r0, lsl #0x1f
    cmp r7, r1, lsr #0x1f
    moveq r0, r0, lsl #0x1a
    moveq r0, r0, lsr #0x1b
    cmpeq r0, r8
    beq .L_022b6144
    ldrh r0, [r5, #0x7a]
    mov r1, r0, lsl #0x1f
    cmp r7, r1, lsr #0x1f
    moveq r0, r0, lsl #0x1a
    moveq r0, r0, lsr #0x1b
    cmpeq r0, r8
    beq .L_022b6144
    ldr r0, .L_022b6834
    mov r1, r7
    mov r2, r8
    mov r3, #0x100
    bl func_ov002_022a6324
    movs r11, r0
    ldrnesb r0, [r11, #0x0]
    cmpne r0, #0x0
    beq .L_022b6144
    add r1, sp, #0xec
    str r1, [sp, #0x0]
    mov r0, r9
    mov r1, r7
    mov r2, r8
    mov r3, #0x0
    bl func_ov002_022b867c
    mov r0, #0x0
    str r0, [sp, #0x0]
    ldr r0, .L_022b683c
    mov r1, #0x32
    mov r2, r10
    add r3, sp, #0xec
    bl func_ov002_022bdb88
    mov r1, r7, lsl #0x10
    mov r1, r1, lsr #0x10
    and r5, r1, #0x1
    mov r1, r8, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r3, r1, lsl #0x1b
    add r1, r9, r10, lsl #0x2
    str r0, [r1, #0xd50]
    add r0, r9, r10, lsl #0x1
    ldrh r1, [sp, #0xd8]
    add r2, r0, #0xc00
    bic r0, r1, #0x1
    orr r0, r0, r5
    strh r0, [sp, #0xd8]
    add r0, r9, #0x124
    ldrh r5, [sp, #0xd8]
    add r1, r0, #0x800
    bic r0, r5, #0x3e
    orr r0, r0, r3, lsr #0x1a
    strh r0, [sp, #0xd8]
    ldr r0, [sp, #0x54]
    ldrh r3, [sp, #0xd8]
    add r0, r0, #0x78
    add r0, r1, r0
    bic r1, r3, #0x3fc0
    strh r1, [sp, #0xd8]
    ldrh r3, [sp, #0xd8]
    ldr r1, .L_022b6844
    bic r3, r3, #0x4000
    strh r3, [sp, #0xd8]
    ldrh r3, [sp, #0xd8]
    bic r3, r3, #0x8000
    strh r3, [sp, #0xd8]
    ldrh r3, [sp, #0xd8]
    strh r3, [r2, #0x74]
    ldr r2, [r11, #0xc]
    bl func_020a978c
    add r0, r9, #0x174
    ldr r1, .L_022b6848
    add r0, r0, #0x800
    bl func_020a978c
    mov r0, #0x1
    str r0, [r9, #0xd44]
    b .L_022b6150
.L_022b6144:
    add r6, r6, #0x1
    cmp r6, #0xa
    blt .L_022b5fbc
.L_022b6150:
    ldr r0, [sp, #0x5c]
    add r10, r10, #0x1
    add r0, r0, #0x2
    str r0, [sp, #0x5c]
    ldr r0, [sp, #0x58]
    cmp r10, #0x2
    add r0, r0, #0x2
    str r0, [sp, #0x58]
    ldr r0, [sp, #0x54]
    add r0, r0, #0x28
    str r0, [sp, #0x54]
    blt .L_022b5d14
.L_022b6180:
    ldr r0, [r9, #0xd44]
    cmp r0, #0x0
    bne .L_022b6264
    mov r6, #0x0
    mov r7, r6
    mov r5, #0x100
    mov r11, #0x1
    mov r10, r6
.L_022b61a0:
    mov r8, r10
.L_022b61a4:
    ldr r0, .L_022b6834
    mov r1, r7
    mov r2, r8
    mov r3, r5
    bl func_ov002_022a6324
    cmp r0, #0x0
    ldrnesb r0, [r0, #0x0]
    cmpne r0, #0x0
    movne r6, r11
    bne .L_022b61d8
    add r8, r8, #0x1
    cmp r8, #0x4
    ble .L_022b61a4
.L_022b61d8:
    add r7, r7, #0x1
    cmp r7, #0x2
    blt .L_022b61a0
    cmp r6, #0x0
    bne .L_022b6264
    add r0, r9, #0x74
    add r1, r0, #0xc00
    add r0, r9, #0x78
    mov r3, #0x0
    add r2, r0, #0xc00
    mov r0, r3
.L_022b6204:
    add r5, r9, r3, lsl #0x2
    str r0, [r5, #0xd50]
    ldrh r6, [r1, #0x0]
    mov r5, r3, lsl #0x10
    mov r5, r5, lsr #0x10
    bic r7, r6, #0x1
    and r6, r5, #0x1
    orr r5, r7, r6
    strh r5, [r1, #0x0]
    ldrh r5, [r1, #0x0]
    add r3, r3, #0x1
    cmp r3, #0x2
    bic r5, r5, #0x3e
    orr r5, r5, #0x3e
    strh r5, [r1], #0x2
    ldrh r5, [r2, #0x0]
    bic r5, r5, #0x1
    orr r5, r5, r6
    strh r5, [r2, #0x0]
    ldrh r5, [r2, #0x0]
    bic r5, r5, #0x3e
    orr r5, r5, #0x3e
    strh r5, [r2], #0x2
    blt .L_022b6204
.L_022b6264:
    ldr r0, [r9, #0xcc8]
    cmp r0, #0x0
    subgt r0, r0, #0x1
    strgt r0, [r9, #0xcc8]
    ldr r0, [r9, #0xccc]
    cmp r0, #0x0
    subgt r0, r0, #0x1
    strgt r0, [r9, #0xccc]
    ldr r0, [r9, #0xcd0]
    cmp r0, #0x0
    subgt r0, r0, #0x1
    strgt r0, [r9, #0xcd0]
    ldr r0, [r9, #0xc50]
    cmp r0, #0x0
    ble .L_022b62d0
    subs r0, r0, #0x1
    str r0, [r9, #0xc50]
    bne .L_022b62d0
    ldr r0, [r9, #0xc4c]
    bl func_ov002_022bc2b4
    mov r1, #0x1e0
    bl func_02036590
    ldr r0, .L_022b684c
    mov r1, #0x7f
    ldr r0, [r0, #0xd8]
    mov r2, #0x1e0
    bl func_02037dc0
.L_022b62d0:
    ldr r0, [r9, #0xcd4]
    cmp r0, #0x0
    subgt r0, r0, #0x1
    strgt r0, [r9, #0xcd4]
    add r0, r9, #0xc00
    ldrh r2, [r0, #0x6e]
    ldr r0, [sp, #0x48]
    mov r1, r2, lsl #0x1f
    cmp r0, r1, lsr #0x1f
    ldreq r0, [sp, #0x44]
    moveq r1, r2, lsl #0x1a
    cmpeq r0, r1, lsr #0x1b
    ldreq r0, [sp, #0x4c]
    moveq r1, r2, lsl #0x12
    cmpeq r0, r1, lsr #0x18
    movne r0, #0x3
    strne r0, [r9, #0xcd8]
    ldr r0, [r9, #0xcd8]
    cmp r0, #0x0
    subgt r0, r0, #0x1
    strgt r0, [r9, #0xcd8]
    mov r0, #0x0
    bl func_0202224c
    tst r0, #0x1
    bne .L_022b6668
    ldrh r2, [sp, #0xdc]
    add r0, r9, #0xc00
    mov r1, #0x0
    strh r2, [r0, #0x6e]
    str r1, [r9, #0xc44]
    str r1, [r9, #0xcf4]
    ldr r0, [r9, #0xc54]
    cmp r0, #0x1
    bne .L_022b637c
    ldr r1, [r9, #0xd18]
    cmp r1, #0x0
    beq .L_022b637c
    ldr r10, [sp, #0x108]
    ldr r8, [sp, #0x104]
    ldr r5, [sp, #0x10c]
    mov r6, r10
    mov r7, r5
    b .L_022b65e4
.L_022b637c:
    cmp r0, #0x0
    ldreq r1, [r9, #0xcc8]
    cmpeq r1, #0x0
    ldreq r1, [r9, #0xccc]
    cmpeq r1, #0x0
    bne .L_022b63c0
    ldr r1, [r9, #0xd3c]
    cmp r1, #0x0
    beq .L_022b63c0
    mov r8, #0x0
    mov r10, r8
    sub r5, r8, #0x20
    mov r6, #0xc0
    mov r7, r6
    mov r0, #0x1
    str r0, [r9, #0xcf4]
    b .L_022b65e4
.L_022b63c0:
    cmp r0, #0x5
    cmpne r0, #0xe
    bne .L_022b63f8
    ldr r1, [r9, #0xcf0]
    cmp r1, #0x0
    beq .L_022b63f8
    mov r8, #0x0
    mov r10, r8
    mov r5, #0x20
    mov r6, #0xc0
    mov r7, #0x120
    mov r0, #0x1
    str r0, [r9, #0xcf4]
    b .L_022b65e4
.L_022b63f8:
    cmp r0, #0x2
    cmpne r0, #0x3
    cmpne r0, #0x5
    cmpne r0, #0x6
    cmpne r0, #0xa
    cmpne r0, #0xb
    beq .L_022b645c
    cmp r0, #0xd
    ldreq r1, [r9, #0xd0c]
    cmpeq r1, #0x0
    beq .L_022b645c
    cmp r0, #0xe
    beq .L_022b645c
    cmp r0, #0x1
    bne .L_022b6440
    ldr r1, [r9, #0xd2c]
    cmp r1, #0x0
    bne .L_022b645c
.L_022b6440:
    ldr r1, [r9, #0xcf8]
    cmp r1, #0x0
    bne .L_022b645c
    ldr r1, [r9, #0xd3c]
    cmp r1, #0x0
    cmpne r0, #0x14
    beq .L_022b64bc
.L_022b645c:
    cmp r0, #0x5
    bne .L_022b6480
    add r0, r9, #0xc00
    ldrh r0, [r0, #0x68]
    mov r0, r0, lsl #0x1a
    mov r0, r0, lsr #0x1b
    cmp r0, #0xe
    moveq r0, #0x1
    beq .L_022b6484
.L_022b6480:
    mov r0, #0x0
.L_022b6484:
    cmp r0, #0x0
    movne r2, #0x38
    moveq r2, #0x28
    ldr r1, [sp, #0x10c]
    cmp r0, #0x0
    ldr r0, [sp, #0x108]
    ldr r8, [sp, #0x104]
    add r10, r0, r2
    movne r2, #0x38
    moveq r2, #0x28
    sub r5, r1, #0x30
    add r6, r0, r2
    add r7, r1, #0x40
    b .L_022b65e4
.L_022b64bc:
    cmp r0, #0xd
    bne .L_022b64e4
    ldr r0, [sp, #0x108]
    ldr r8, [sp, #0x104]
    add r10, r0, #0x18
    add r6, r0, #0x20
    ldr r0, [sp, #0x10c]
    sub r5, r0, #0x30
    add r7, r0, #0x40
    b .L_022b65e4
.L_022b64e4:
    cmp r0, #0x9
    bne .L_022b650c
    ldr r0, [sp, #0x108]
    ldr r8, [sp, #0x104]
    add r10, r0, #0x60
    ldr r0, [sp, #0x10c]
    mov r6, r10
    sub r5, r0, #0x30
    add r7, r0, #0x60
    b .L_022b65e4
.L_022b650c:
    ldr r1, [sp, #0x20]
    cmp r1, #0x0
    beq .L_022b657c
    cmp r0, #0x1
    ldreq r1, [r9, #0xd24]
    cmpeq r1, #0x0
    beq .L_022b657c
    cmp r0, #0x16
    beq .L_022b657c
    ldr r0, [r9, #0xc40]
    cmp r0, #0x1e
    blt .L_022b6558
    ldr r0, [sp, #0x10c]
    ldr r8, [sp, #0x104]
    mov r10, #0x34
    sub r5, r0, #0x40
    add r7, r0, #0x28
    mov r6, #0x4c
    b .L_022b6570
.L_022b6558:
    ldr r0, [sp, #0x10c]
    ldr r8, [sp, #0x104]
    mov r10, #0x20
    sub r5, r0, #0x30
    add r7, r0, #0x38
    mov r6, #0x38
.L_022b6570:
    mov r0, #0x1
    str r0, [r9, #0xc44]
    b .L_022b65e4
.L_022b657c:
    ldr r0, [sp, #0x28]
    cmp r0, #0x0
    beq .L_022b65a4
    ldr r0, [sp, #0x10c]
    ldr r8, [sp, #0x104]
    mov r10, #0x10
    sub r5, r0, #0x40
    add r7, r0, #0x58
    mov r6, #0x58
    b .L_022b65e4
.L_022b65a4:
    ldr r0, [sp, #0x24]
    cmp r0, #0x0
    beq .L_022b65cc
    ldr r0, [sp, #0x10c]
    ldr r8, [sp, #0x104]
    mov r10, #0x10
    sub r5, r0, #0x40
    add r7, r0, #0x6e
    mov r6, #0x3e
    b .L_022b65e4
.L_022b65cc:
    ldr r0, [sp, #0x10c]
    ldr r8, [sp, #0x104]
    ldr r10, [sp, #0x108]
    sub r5, r0, #0x40
    add r7, r0, #0x60
    mov r6, #0x60
.L_022b65e4:
    ldr r0, [sp, #0x84]
    mov r1, #0x0
    mov r2, r8
    bl func_020216b0
    ldr r0, [sp, #0x84]
    mov r2, r10
    mov r1, #0x1
    bl func_020216b0
    ldr r0, [sp, #0x84]
    mov r2, r5
    mov r1, #0x2
    bl func_020216b0
    ldr r0, [sp, #0x84]
    mov r2, r8
    mov r1, #0x3
    bl func_020216b0
    ldr r0, [sp, #0x84]
    mov r2, r6
    mov r1, #0x4
    bl func_020216b0
    ldr r0, [sp, #0x84]
    mov r2, r7
    mov r1, #0x5
    bl func_020216b0
    mov r0, #0x0
    bl func_0202224c
    orr r1, r0, #0x1
    ldr r0, [r9, #0xcf4]
    cmp r0, #0x0
    orrne r1, r1, #0x2
    biceq r1, r1, #0x2
    mov r0, #0x0
    bl func_02022234
.L_022b6668:
    ldr r0, [r9, #0xc44]
    cmp r0, #0x0
    beq .L_022b66b4
    ldr r2, .L_022b6850
    ldr r0, [sp, #0x2c]
    cmp r0, r2
    addne r1, r2, #0x1
    cmpne r0, r1
    addne r1, r2, #0x2
    cmpne r0, r1
    beq .L_022b66a4
    ldr r1, .L_022b6854
    add r0, r0, r1
    cmp r0, #0x2
    bhi .L_022b66b4
.L_022b66a4:
    ldr r0, [r9, #0xc40]
    add r0, r0, #0x1
    str r0, [r9, #0xc40]
    b .L_022b66bc
.L_022b66b4:
    mov r0, #0x0
    str r0, [r9, #0xc40]
.L_022b66bc:
    ldr r0, .L_022b6834
    bl func_ov002_022a6afc
    mov r10, r0
    ldr r0, .L_022b6834
    bl func_ov002_022a6bdc
    mov r11, r0
    mov r0, #0x18
    mul r0, r11, r0
    mov r5, #0x0
    mov r6, r0, asr #0x8
.L_022b66e4:
    ldr r0, [r9, #0x0]
    mov r1, #0x3
    add r2, r5, #0x31
    bl func_02021660
    mov r7, r0
    ldr r0, [sp, #0x44]
    cmp r0, #0xb
    mov r0, #0x0
    orr r8, r0, #0x3
    bne .L_022b6734
    orr r8, r8, #0x40
    bl func_0202c9b0
    cmp r0, #0x0
    beq .L_022b672c
    ldr r0, .L_022b6858
    bl func_ov002_022a1784
    cmp r0, #0x0
    bne .L_022b6754
.L_022b672c:
    orr r8, r8, #0x8
    b .L_022b6754
.L_022b6734:
    ldr r0, [sp, #0x44]
    cmp r0, #0x4
    bls .L_022b6750
    cmp r0, #0x5
    blo .L_022b6754
    cmp r0, #0x9
    bhi .L_022b6754
.L_022b6750:
    orr r8, r8, #0x80
.L_022b6754:
    ldr r0, [sp, #0x44]
    mov r1, #0x3
    cmp r0, #0xb
    mov r0, r7
    bne .L_022b6798
    ldr r2, [sp, #0x104]
    bl func_020216b0
    ldr r2, [sp, #0x108]
    mov r0, r7
    mov r1, #0x4
    bl func_020216b0
    ldr r2, [sp, #0x10c]
    mov r0, r7
    mov r1, #0x5
    add r2, r2, #0x1
    bl func_020216b0
    b .L_022b67c8
.L_022b6798:
    ldr r2, [sp, #0x104]
    bl func_020216b0
    ldr r2, [sp, #0x108]
    mov r0, r7
    mov r1, #0x4
    add r2, r2, #0x2
    bl func_020216b0
    ldr r2, [sp, #0x10c]
    mov r0, r7
    mov r1, #0x5
    add r2, r2, #0x1
    bl func_020216b0
.L_022b67c8:
    orr r2, r8, #0x200
    mov r0, r7
    mov r1, #0x0
    bl func_020216b0
    ldr r1, .L_022b683c
    mov r2, #0x0
.L_022b67e0:
    ldr r0, [r1, r2, lsl #0x3]
    cmp r0, #0x0
    movne r0, #0x1
    bne .L_022b6800
    add r2, r2, #0x1
    cmp r2, #0x10
    blt .L_022b67e0
    mov r0, #0x0
.L_022b6800:
    cmp r0, #0x0
    ldreq r0, [r9, #0xc54]
    cmpeq r0, #0x0
    ldreq r0, [r9, #0xd3c]
    cmpeq r0, #0x0
    movne r2, #0x0
    bne .L_022b6864
    cmp r5, r10
    bne .L_022b682c
    cmp r11, #0x0
    bge .L_022b6860
.L_022b682c:
    mov r2, #0x0
    b .L_022b6864
.L_022b6834:
        .word   data_ov002_022d1410
.L_022b6838:
        .word   data_ov002_022cd73c
.L_022b683c:
        .word   data_ov002_022d28fc
.L_022b6840:
        .word   0x66666667
.L_022b6844:
        .word   data_ov002_022ccfd8
.L_022b6848:
        .word   data_ov002_022ccfec
.L_022b684c:
        .word   data_ov002_022d0f2c
.L_022b6850:
        .word   0x1386
.L_022b6854:
        .word   0xffffe65d
.L_022b6858:
        .word   data_ov002_022d11bc
.L_022b685c:
        .word   data_ov002_022cd000
.L_022b6860:
    mov r2, r6
.L_022b6864:
    mov r0, r7
    mov r1, #0xb
    bl func_020216b0
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_022b66e4
    ldr r0, .L_022b6834
    mov r5, #0x0
    add r0, r0, #0x3e0
    str r0, [sp, #0x68]
    mov r0, #0x10
    str r5, [sp, #0x64]
    str r0, [sp, #0x60]
.L_022b6898:
    ldr r0, [sp, #0x68]
    mov r8, #0x0
    ldr r0, [r0, #0xa4]
    str r0, [sp, #0x1c]
    cmp r0, #0x8
    movge r0, #0x8
    strge r0, [sp, #0x1c]
    ldr r0, [sp, #0x1c]
    cmp r0, #0x0
    ble .L_022b6b64
    mvn r0, #0x0
    str r0, [sp, #0x9c]
    add r0, r9, #0x14
    str r0, [sp, #0x98]
.L_022b68d0:
    ldr r0, [sp, #0x68]
    ldr r0, [r0, #0xa8]
    str r0, [sp, #0x90]
    ldr r1, [sp, #0x90]
    ldr r0, [sp, #0x68]
    add r1, r8, r1
    bl func_ov002_0229da60
    str r0, [sp, #0x94]
    ldr r0, [sp, #0x64]
    mov r1, #0x28
    add r2, r8, r0
    ldr r0, [sp, #0x98]
    mla r10, r2, r1, r0
    ldr r0, [r9, #0x0]
    mov r1, #0x3
    bl func_02021660
    mov r1, #0x1
    mov r7, r0
    bl func_020216bc
    mov r6, r0
    mov r0, #0x0
    orr r11, r0, #0x1
    ldr r0, [sp, #0x94]
    ldrh r0, [r0, #0xa]
    mov r0, r0, lsl #0x11
    movs r0, r0, lsr #0x1f
    ldrne r0, [sp, #0x94]
    ldrne r2, [r0, #0xc]
    moveq r2, #0x0
    tst r6, #0x100
    strne r2, [r10, #0x20]
    bicne r6, r6, #0x100
    bne .L_022b6970
    ldr r0, [r10, #0x20]
    cmp r2, r0
    beq .L_022b6970
    ldr r1, .L_022b685c
    mov r0, r10
    bl func_020a978c
    orr r11, r11, #0x100
.L_022b6970:
    ldr r0, [sp, #0x90]
    mov r1, r5
    add r3, r8, r0
    add r0, sp, #0xec
    str r0, [sp, #0x0]
    mov r0, r9
    mov r2, #0xb
    bl func_ov002_022b867c
    ldr r0, [r9, #0xc54]
    cmp r0, #0x15
    ldreq r0, [r9, #0xce0]
    cmpeq r0, r5
    bne .L_022b69fc
    ldr r1, .L_022b6838
    ldr r3, [r9, #0xcdc]
    ldr r2, [r1, #0x4]
    mov r1, r3, lsl #0x6
    cmp r5, r2
    rsb r2, r1, #0x0
    mov r1, r2, asr #0x7
    add r1, r2, r1, lsr #0x18
    ldr r0, [sp, #0xf0]
    moveq r2, #0x1
    add r0, r0, r1, asr #0x8
    str r0, [sp, #0xf0]
    ldrne r2, [sp, #0x9c]
    mov r0, #0x28
    mul r1, r2, r0
    ldr r2, [r9, #0xcdc]
    ldr r0, [sp, #0xf4]
    mul r3, r2, r1
    mov r1, r3, asr #0x7
    add r1, r3, r1, lsr #0x18
    add r0, r0, r1, asr #0x8
    str r0, [sp, #0xf4]
.L_022b69fc:
    ldr r2, [sp, #0xec]
    mov r0, r7
    mov r1, #0x3
    bl func_020216b0
    ldr r2, [sp, #0xf0]
    mov r0, r7
    mov r1, #0x4
    bl func_020216b0
    ldr r2, [sp, #0xf4]
    mov r0, r7
    mov r1, #0x5
    bl func_020216b0
    orr r2, r11, #0x200
    mov r0, r7
    mov r1, #0x0
    bl func_020216b0
    mov r2, r6
    mov r0, r7
    mov r1, #0x1
    bl func_020216b0
    ldr r0, [r9, #0xc54]
    cmp r0, #0x2
    beq .L_022b6a6c
    ldr r1, [r9, #0xccc]
    cmp r1, #0x0
    bgt .L_022b6a6c
    cmp r0, #0xf
    bne .L_022b6a74
.L_022b6a6c:
    mov r2, #0x0
    b .L_022b6b48
.L_022b6a74:
    ldr r1, .L_022b6838
    ldr r1, [r1, #0x4]
    cmp r5, r1
    bne .L_022b6b1c
    cmp r0, #0x1
    ldr r1, [sp, #0x100]
    mov r2, r1, asr #0x4
    beq .L_022b6ae4
    cmp r0, #0x5
    ldreq r1, [r9, #0xcf0]
    cmpeq r1, #0x0
    beq .L_022b6ae4
    cmp r0, #0x6
    cmpne r0, #0x9
    cmpne r0, #0xa
    beq .L_022b6ae4
    ldr r1, [r9, #0xcd0]
    cmp r1, #0x0
    bgt .L_022b6ae4
    cmp r0, #0xb
    beq .L_022b6ae4
    cmp r0, #0xe
    ldreq r1, [r9, #0xcf0]
    cmpeq r1, #0x0
    beq .L_022b6ae4
    sub r0, r0, #0x10
    cmp r0, #0x3
    bhi .L_022b6aec
.L_022b6ae4:
    mov r2, #0x0
    b .L_022b6b48
.L_022b6aec:
    cmp r2, #0x110
    movge r2, #0x1f
    bge .L_022b6b48
    cmp r2, #0xf0
    movle r2, #0x0
    ble .L_022b6b48
    sub r0, r2, #0xf0
    rsb r1, r0, r0, lsl #0x5
    mov r0, r1, asr #0x4
    add r0, r1, r0, lsr #0x1b
    mov r2, r0, asr #0x5
    b .L_022b6b48
.L_022b6b1c:
    ldrne r1, [sp, #0x24]
    cmpne r1, #0x0
    beq .L_022b6b44
    ldr r1, [sp, #0x28]
    cmp r1, #0x0
    bne .L_022b6b44
    sub r0, r0, #0x9
    cmp r0, #0x1
    movls r2, #0x0
    bls .L_022b6b48
.L_022b6b44:
    mov r2, #0x1f
.L_022b6b48:
    mov r0, r7
    mov r1, #0xb
    bl func_020216b0
    ldr r0, [sp, #0x1c]
    add r8, r8, #0x1
    cmp r8, r0
    blt .L_022b68d0
.L_022b6b64:
    cmp r8, #0x8
    bge .L_022b6bd0
    add r7, r9, #0x14
    mov r11, #0x0
    mvn r10, #0x0
.L_022b6b78:
    ldr r0, [sp, #0x64]
    mov r1, #0x3
    add r2, r8, r0
    mov r0, #0x28
    mul r0, r2, r0
    strb r11, [r7, r0]
    add r0, r7, r0
    str r10, [r0, #0x20]
    str r11, [r0, #0x24]
    ldr r0, [r9, #0x0]
    bl func_02021660
    mov r1, #0x0
    mov r6, r0
    mov r2, r1
    bl func_020216b0
    mov r0, r6
    mov r1, #0x1
    mov r2, #0x0
    bl func_020216b0
    add r8, r8, #0x1
    cmp r8, #0x8
    blt .L_022b6b78
.L_022b6bd0:
    add r0, r9, #0x14
    str r0, [sp, #0xa0]
    mvn r0, #0x0
    str r0, [sp, #0xa4]
    add r0, r9, #0xc00
    mov r6, #0x0
    str r0, [sp, #0xc8]
.L_022b6bec:
    cmp r6, #0xb
    beq .L_022b6f54
    sub r0, r6, #0xa
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    b .L_022b6c44
.L_022b6c04: ; jump table
    b .L_022b6c1c ; case 0
    b .L_022b6c44 ; case 1
    b .L_022b6c24 ; case 2
    b .L_022b6c2c ; case 3
    b .L_022b6c34 ; case 4
    b .L_022b6c3c ; case 5
.L_022b6c1c:
    mov r4, #0xa
    b .L_022b6c68
.L_022b6c24:
    mov r4, #0xc
    b .L_022b6c68
.L_022b6c2c:
    mov r4, #0xd
    b .L_022b6c68
.L_022b6c34:
    mov r4, #0xe
    b .L_022b6c68
.L_022b6c3c:
    mov r4, #0xf
    b .L_022b6c68
.L_022b6c44:
    cmp r6, #0x0
    blt .L_022b6c58
    cmp r6, #0x4
    movle r4, r6
    ble .L_022b6c68
.L_022b6c58:
    cmp r6, #0x5
    blt .L_022b6c68
    cmp r6, #0x9
    movle r4, r6
.L_022b6c68:
    ldr r0, .L_022b6834
    mov r1, r5
    mov r2, r4
    mov r3, #0x0
    bl func_ov002_022a6324
    mov r11, r0
    sub r0, r4, #0xc
    cmp r0, #0x3
    movls r0, #0x1
    strls r0, [sp, #0x18]
    movhi r0, #0x0
    strhi r0, [sp, #0x18]
    cmp r4, #0x0
    blt .L_022b6cb0
    cmp r4, #0x4
    movle r0, #0x1
    strle r0, [sp, #0x14]
    ble .L_022b6cb8
.L_022b6cb0:
    mov r0, #0x0
    str r0, [sp, #0x14]
.L_022b6cb8:
    ldr r0, [sp, #0x60]
    cmp r6, #0xb
    add r2, r6, r0
    ldr r0, [sp, #0xa0]
    subgt r2, r2, #0x1
    mov r1, #0x28
    mla r7, r2, r1, r0
    ldr r0, [r9, #0x0]
    mov r1, #0x3
    bl func_02021660
    mov r1, #0x1
    mov r10, r0
    mov r8, #0x0
    bl func_020216bc
    str r0, [sp, #0x34]
    ldrsb r0, [r11, #0x0]
    cmp r0, #0x0
    mov r0, r8
    beq .L_022b6ddc
    orr r8, r0, #0x1
    ldrh r0, [r11, #0xa]
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x1f
    ldrh r0, [r11, #0xa]
    orrne r8, r8, #0x10
    mov r0, r0, lsl #0x11
    movs r0, r0, lsr #0x1f
    ldrne r2, [r11, #0xc]
    ldr r0, [sp, #0x34]
    moveq r2, #0x0
    tst r0, #0x100
    beq .L_022b6d48
    bic r0, r0, #0x100
    str r2, [r7, #0x20]
    str r0, [sp, #0x34]
    b .L_022b6d64
.L_022b6d48:
    ldr r0, [r7, #0x20]
    cmp r2, r0
    beq .L_022b6d64
    ldr r1, .L_022b685c
    mov r0, r7
    bl func_020a978c
    orr r8, r8, #0x100
.L_022b6d64:
    ldr r0, [r7, #0x24]
    tst r0, #0x200
    beq .L_022b6d7c
    sub r0, r6, #0xc
    cmp r0, #0x3
    bhi .L_022b6df0
.L_022b6d7c:
    add r0, sp, #0xec
    str r0, [sp, #0x0]
    mov r0, r9
    mov r1, r5
    mov r2, r6
    mov r3, #0x0
    bl func_ov002_022b867c
    ldr r2, [sp, #0xec]
    mov r0, r10
    mov r1, #0x3
    bl func_020216b0
    ldr r2, [sp, #0xf0]
    mov r0, r10
    mov r1, #0x4
    bl func_020216b0
    ldr r2, [sp, #0xf4]
    mov r0, r10
    mov r1, #0x5
    bl func_020216b0
    ldr r0, [r7, #0x24]
    orr r8, r8, #0x200
    orr r0, r0, #0x200
    str r0, [r7, #0x24]
    b .L_022b6df0
.L_022b6ddc:
    strb r0, [r7, #0x0]
    ldr r0, [sp, #0xa4]
    str r0, [r7, #0x20]
    mov r0, r8
    str r0, [r7, #0x24]
.L_022b6df0:
    mov r2, r8
    mov r0, r10
    mov r1, #0x0
    bl func_020216b0
    ldr r2, [sp, #0x34]
    mov r0, r10
    mov r1, #0x1
    bl func_020216b0
    ldr r0, [r9, #0xc54]
    cmp r0, #0x2
    beq .L_022b6e28
    ldr r1, [r9, #0xccc]
    cmp r1, #0x0
    ble .L_022b6e30
.L_022b6e28:
    mov r2, #0x0
    b .L_022b6f48
.L_022b6e30:
    cmp r0, #0x5
    cmpne r0, #0x9
    cmpne r0, #0xa
    beq .L_022b6e80
    ldr r1, [r9, #0xcd0]
    cmp r1, #0x0
    bgt .L_022b6e80
    cmp r0, #0xb
    ldreq r1, [r9, #0xd38]
    cmpeq r1, #0x0
    beq .L_022b6e80
    cmp r0, #0xe
    ldreq r1, [sp, #0x14]
    cmpeq r1, #0x0
    beq .L_022b6e80
    cmp r0, #0x1
    bne .L_022b6ea0
    ldr r1, [r9, #0xd30]
    cmp r1, #0x0
    beq .L_022b6ea0
.L_022b6e80:
    ldr r1, [sp, #0x48]
    cmp r1, r5
    ldreq r1, [sp, #0x44]
    cmpeq r1, r4
    ldreq r1, [sp, #0x18]
    cmpeq r1, #0x0
    moveq r2, #0x0
    beq .L_022b6f48
.L_022b6ea0:
    ldr r1, [r9, #0xcd4]
    cmp r1, #0x0
    ble .L_022b6ef8
    ldr r1, [sp, #0xc8]
    ldrh r1, [r1, #0x6a]
    mov r2, r1, lsl #0x1f
    cmp r5, r2, lsr #0x1f
    moveq r1, r1, lsl #0x1a
    moveq r1, r1, lsr #0x1b
    cmpeq r1, r4
    beq .L_022b6ee8
    ldr r1, [sp, #0xc8]
    ldrh r1, [r1, #0x6c]
    mov r2, r1, lsl #0x1f
    cmp r5, r2, lsr #0x1f
    moveq r1, r1, lsl #0x1a
    cmpeq r4, r1, lsr #0x1b
    bne .L_022b6ef8
.L_022b6ee8:
    ldr r1, [sp, #0x18]
    cmp r1, #0x0
    moveq r2, #0x0
    beq .L_022b6f48
.L_022b6ef8:
    cmp r0, #0x14
    ldreq r1, [r9, #0xc60]
    cmpeq r1, #0x2
    cmpeq r4, #0xd
    moveq r2, #0x0
    beq .L_022b6f48
    cmp r0, #0x16
    bne .L_022b6f44
    ldr r0, [r9, #0xcec]
    cmp r0, #0x0
    beq .L_022b6f44
    ldr r0, [r9, #0xce8]
    cmp r0, r5
    bne .L_022b6f44
    ldr r1, [r9, #0xce4]
    mov r0, #0x1
    tst r1, r0, lsl r4
    movne r2, #0x0
    bne .L_022b6f48
.L_022b6f44:
    mov r2, #0x1f
.L_022b6f48:
    mov r0, r10
    mov r1, #0xb
    bl func_020216b0
.L_022b6f54:
    add r6, r6, #0x1
    cmp r6, #0x10
    blt .L_022b6bec
    ldr r0, [sp, #0x68]
    add r5, r5, #0x1
    add r0, r0, #0xcc
    str r0, [sp, #0x68]
    ldr r0, [sp, #0x64]
    cmp r5, #0x2
    add r0, r0, #0x8
    str r0, [sp, #0x64]
    ldr r0, [sp, #0x60]
    add r0, r0, #0xf
    str r0, [sp, #0x60]
    blt .L_022b6898
    add r0, r9, #0x214
    add r0, r0, #0x800
    str r0, [sp, #0xb4]
    ldr r0, .L_022b6834
    mov r7, #0x0
    add r0, r0, #0x3e0
    str r0, [sp, #0xac]
    add r0, r9, #0xc00
    str r0, [sp, #0xcc]
    ldrh r0, [sp, #0xdc]
    str r0, [sp, #0xa8]
    mvn r0, #0x0
    str r0, [sp, #0xb8]
.L_022b6fc4:
    ldr r0, [sp, #0xa8]
    mov r1, #0xcc
    strh r0, [sp, #0xda]
    ldrh r3, [sp, #0xda]
    mov r5, #0x0
    mov r0, r3, lsl #0x1f
    mov r2, r0, lsr #0x1f
    ldr r0, [sp, #0xac]
    str r2, [sp, #0x30]
    mla r0, r2, r1, r0
    str r0, [sp, #0x78]
    mov r0, r2
    str r0, [sp, #0x40]
    mov r0, r3, lsl #0x1a
    mov r6, r0, lsr #0x1b
    mov r0, r3, lsl #0x12
    str r0, [sp, #0xb0]
    cmp r6, #0xb
    mov r4, r6
    bne .L_022b7028
    ldr r0, [sp, #0x78]
    ldr r1, [r0, #0xa8]
    ldr r0, [sp, #0xb0]
    rsb r0, r1, r0, lsr #0x18
    b .L_022b7038
.L_022b7028:
    ldr r0, .L_022b7de4
    mov r1, #0x6
    mla r0, r6, r1, r0
    ldrsh r0, [r0, #0x4]
.L_022b7038:
    add r3, r7, r0
    ldr r0, .L_022b7de8
    smull r1, r10, r0, r3
    add r10, r10, r3, lsr #0x1f
    mov r0, #0x3
    smull r1, r2, r0, r10
    sub r10, r3, r1
    ldr r0, [sp, #0xb4]
    mov r1, #0x28
    mla r0, r10, r1, r0
    str r0, [sp, #0x3c]
    ldr r0, [r9, #0x0]
    mov r1, #0x3
    add r2, r10, #0x2e
    bl func_02021660
    mov r1, #0x1
    mov r11, r0
    mov r8, #0x0
    bl func_020216bc
    str r0, [sp, #0x38]
    cmp r7, #0x0
    bne .L_022b70a8
    add r0, sp, #0x104
    add r1, sp, #0xe0
    mov r2, #0xc
    ldr r5, [sp, #0x8c]
    bl Copy32
    b .L_022b71fc
.L_022b70a8:
    cmp r6, #0xb
    bne .L_022b715c
    cmp r7, #0x1
    moveq r1, #0x1
    ldrne r1, [sp, #0xb8]
    ldr r0, [sp, #0xb0]
    add r1, r1, r0, lsr #0x18
    ldr r0, [sp, #0x78]
    ldr r2, [r0, #0xa8]
    cmp r1, r2
    blt .L_022b71fc
    ldr r3, [r0, #0xa4]
    sub r0, r1, r2
    cmp r3, #0x8
    movge r3, #0x8
    cmp r0, r3
    bge .L_022b71fc
    ldrh r2, [sp, #0xda]
    mov r0, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r0, lsl #0x18
    bic r2, r2, #0x3fc0
    orr r1, r2, r1, lsr #0x12
    strh r1, [sp, #0xda]
    ldrh r2, [sp, #0xda]
    ldr r0, .L_022b6834
    mov r1, r2, lsl #0x12
    mov r5, r1, lsr #0x18
    mov r1, r2, lsl #0x1a
    mov r6, r1, lsr #0x1b
    mov r1, r2, lsl #0x1f
    mov r1, r1, lsr #0x1f
    mov r2, r6
    mov r3, r5
    str r1, [sp, #0x30]
    bl func_ov002_022a6324
    add r1, sp, #0xe0
    str r1, [sp, #0x0]
    mov r3, r5
    mov r5, r0
    ldr r1, [sp, #0x30]
    mov r0, r9
    mov r2, r6
    bl func_ov002_022b867c
    b .L_022b71fc
.L_022b715c:
    cmp r7, #0x1
    moveq r0, #0x1
    movne r0, r8
    mov r2, r0, lsl #0x1
    ldr r0, .L_022b7de4
    mov r1, #0x6
    mla r0, r4, r1, r0
    ldrsh r4, [r2, r0]
    cmp r4, #0x0
    blt .L_022b71fc
    ldrh r1, [sp, #0xda]
    mov r0, r4, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x3e
    mov r0, r0, lsl #0x1b
    orr r0, r1, r0, lsr #0x1a
    strh r0, [sp, #0xda]
    ldrh r1, [sp, #0xda]
    ldr r0, .L_022b6834
    bic r1, r1, #0x3fc0
    strh r1, [sp, #0xda]
    ldrh r2, [sp, #0xda]
    mov r1, r2, lsl #0x12
    mov r5, r1, lsr #0x18
    mov r1, r2, lsl #0x1a
    mov r6, r1, lsr #0x1b
    mov r1, r2, lsl #0x1f
    mov r1, r1, lsr #0x1f
    mov r2, r6
    mov r3, r5
    str r1, [sp, #0x30]
    bl func_ov002_022a6324
    add r1, sp, #0xe0
    str r1, [sp, #0x0]
    mov r3, r5
    mov r5, r0
    ldr r1, [sp, #0x30]
    mov r0, r9
    mov r2, r6
    bl func_ov002_022b867c
.L_022b71fc:
    cmp r5, #0x0
    ldrnesb r0, [r5, #0x0]
    cmpne r0, #0x0
    beq .L_022b7578
    sub r0, r4, #0xc
    cmp r0, #0x3
    movls r0, #0x1
    strls r0, [sp, #0x10]
    movhi r0, #0x0
    strhi r0, [sp, #0x10]
    cmp r4, #0x0
    blt .L_022b723c
    cmp r4, #0x4
    movle r0, #0x1
    strle r0, [sp, #0xc]
    ble .L_022b7244
.L_022b723c:
    mov r0, #0x0
    str r0, [sp, #0xc]
.L_022b7244:
    cmp r6, #0xb
    orr r8, r8, #0x5
    bne .L_022b7260
    cmp r7, #0x0
    orreq r8, r8, #0x8
    orr r8, r8, #0x40
    b .L_022b7274
.L_022b7260:
    ldr r0, .L_022b6838
    ldr r1, [r0, #0x4]
    ldr r0, [sp, #0x30]
    cmp r0, r1
    orrne r8, r8, #0x20
.L_022b7274:
    ldrh r0, [r5, #0xa]
    ldr r2, [sp, #0xe0]
    mov r1, #0x3
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x1f
    mov r0, r11
    orrne r8, r8, #0x10
    bl func_020216b0
    ldr r2, [sp, #0xe4]
    mov r0, r11
    mov r1, #0x4
    bl func_020216b0
    ldr r2, [sp, #0xe8]
    mov r0, r11
    mov r1, #0x5
    bl func_020216b0
    mov r0, #0x1
    str r0, [sp, #0x74]
    ldrh r0, [r5, #0xa]
    orr r8, r8, #0x200
    mov r0, r0, lsl #0x11
    movs r0, r0, lsr #0x1f
    bne .L_022b733c
    mov r0, #0x0
    cmp r7, #0x0
    str r0, [sp, #0x70]
    mov r6, r0
    bne .L_022b72f0
    bl func_0202c9b0
    cmp r0, #0x0
    movne r6, #0x1
.L_022b72f0:
    cmp r6, #0x0
    beq .L_022b732c
    ldr r0, .L_022b6838
    ldr r1, [r0, #0x4]
    ldr r0, [sp, #0x40]
    cmp r0, r1
    bne .L_022b7314
    cmp r4, #0xd
    bne .L_022b7324
.L_022b7314:
    ldr r0, .L_022b7dec
    ldr r0, [r0, #0x0]
    cmp r0, #0x3
    bne .L_022b732c
.L_022b7324:
    mov r0, #0x1
    str r0, [sp, #0x70]
.L_022b732c:
    ldr r0, [sp, #0x70]
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [sp, #0x74]
.L_022b733c:
    ldr r0, [sp, #0x74]
    cmp r0, #0x0
    ldrne r5, [r5, #0xc]
    ldr r0, [sp, #0x38]
    moveq r5, #0x0
    tst r0, #0x100
    beq .L_022b737c
    add r2, r9, r10, lsl #0x2
    bic r0, r0, #0x100
    str r0, [sp, #0x38]
    ldr r1, [r2, #0xc28]
    ldr r0, [sp, #0x3c]
    str r1, [r0, #0x20]
    ldr r0, [r2, #0xc28]
    str r0, [r2, #0xc1c]
    b .L_022b73a8
.L_022b737c:
    add r0, r9, r10, lsl #0x2
    ldr r0, [r0, #0xc1c]
    cmp r5, r0
    beq .L_022b73a8
    ldr r0, [sp, #0x3c]
    ldr r1, .L_022b6844
    mov r2, r5
    bl func_020a978c
    add r0, r9, r10, lsl #0x2
    str r5, [r0, #0xc28]
    orr r8, r8, #0x100
.L_022b73a8:
    ldr r0, [r9, #0xc54]
    cmp r0, #0x2
    beq .L_022b73c8
    ldr r1, [r9, #0xccc]
    cmp r1, #0x0
    bgt .L_022b73c8
    cmp r0, #0x3
    bne .L_022b73d8
.L_022b73c8:
    add r1, r9, r10, lsl #0x2
    mov r0, #0x0
    str r0, [r1, #0xd00]
    b .L_022b7584
.L_022b73d8:
    cmp r0, #0x5
    cmpne r0, #0x9
    cmpne r0, #0xa
    beq .L_022b7448
    ldr r1, [r9, #0xcd0]
    cmp r1, #0x0
    bgt .L_022b7448
    cmp r0, #0xb
    ldreq r1, [r9, #0xd38]
    cmpeq r1, #0x0
    beq .L_022b7448
    cmp r0, #0xe
    ldreq r1, [sp, #0xc]
    cmpeq r1, #0x0
    beq .L_022b7448
    cmp r0, #0x1
    bne .L_022b7428
    ldr r1, [r9, #0xd30]
    cmp r1, #0x0
    bne .L_022b7448
.L_022b7428:
    cmp r0, #0x10
    cmpne r0, #0x11
    cmpne r0, #0x12
    cmpne r0, #0x13
    beq .L_022b7448
    sub r1, r0, #0x15
    cmp r1, #0x1
    bhi .L_022b7458
.L_022b7448:
    add r1, r9, r10, lsl #0x2
    mov r0, #0x0
    str r0, [r1, #0xd00]
    b .L_022b7584
.L_022b7458:
    cmp r7, #0x0
    bne .L_022b74d4
    ldr r1, [r9, #0xcd4]
    cmp r1, #0x0
    ble .L_022b74d4
    ldr r1, [sp, #0xcc]
    ldrh r2, [r1, #0x6a]
    ldr r1, [sp, #0x40]
    mov r3, r2, lsl #0x1f
    cmp r1, r3, lsr #0x1f
    moveq r1, r2, lsl #0x1a
    moveq r1, r1, lsr #0x1b
    cmpeq r1, r4
    beq .L_022b74b0
    ldr r1, [sp, #0xcc]
    ldrh r2, [r1, #0x6c]
    ldr r1, [sp, #0x40]
    mov r3, r2, lsl #0x1f
    cmp r1, r3, lsr #0x1f
    moveq r1, r2, lsl #0x1a
    cmpeq r4, r1, lsr #0x1b
    bne .L_022b74d4
.L_022b74b0:
    cmp r4, #0xb
    beq .L_022b74d4
    ldr r1, [sp, #0x10]
    cmp r1, #0x0
    bne .L_022b74d4
    add r1, r9, r10, lsl #0x2
    mov r0, #0x0
    str r0, [r1, #0xd00]
    b .L_022b7584
.L_022b74d4:
    cmp r0, #0x14
    ldreq r1, [r9, #0xc60]
    cmpeq r1, #0x2
    cmpeq r4, #0xd
    bne .L_022b74f8
    add r1, r9, r10, lsl #0x2
    mov r0, #0x0
    str r0, [r1, #0xd00]
    b .L_022b7584
.L_022b74f8:
    cmp r0, #0x16
    bne .L_022b753c
    ldr r0, [r9, #0xcec]
    cmp r0, #0x0
    beq .L_022b753c
    ldr r1, [r9, #0xce8]
    ldr r0, [sp, #0x40]
    cmp r1, r0
    bne .L_022b753c
    ldr r1, [r9, #0xce4]
    mov r0, #0x1
    tst r1, r0, lsl r4
    beq .L_022b753c
    add r1, r9, r10, lsl #0x2
    mov r0, #0x0
    str r0, [r1, #0xd00]
    b .L_022b7584
.L_022b753c:
    bl func_0202c9b0
    cmp r0, #0x0
    beq .L_022b7568
    ldr r0, .L_022b6858
    bl func_ov002_022a1784
    cmp r0, #0x0
    beq .L_022b7568
    add r1, r9, r10, lsl #0x2
    mov r0, #0x0
    str r0, [r1, #0xd00]
    b .L_022b7584
.L_022b7568:
    add r1, r9, r10, lsl #0x2
    mov r0, #0x1
    str r0, [r1, #0xd00]
    b .L_022b7584
.L_022b7578:
    add r1, r9, r10, lsl #0x2
    mov r0, #0x0
    str r0, [r1, #0xd00]
.L_022b7584:
    add r0, r9, r10, lsl #0x2
    ldr r1, [r0, #0xd00]
    cmp r1, #0x0
    movne r4, #0x1f
    bne .L_022b75d0
    ldr r1, [sp, #0x3c]
    mov r2, #0x0
    strb r2, [r1, #0x0]
    ldr r2, [sp, #0xb8]
    str r2, [r1, #0x20]
    mov r2, #0x0
    str r2, [r1, #0x24]
    ldr r1, [sp, #0xb8]
    mov r8, r2
    str r1, [r0, #0xc1c]
    str r1, [r0, #0xc28]
    mov r0, r2
    str r0, [sp, #0x38]
    mov r4, r2
.L_022b75d0:
    mov r2, r8
    mov r0, r11
    mov r1, #0x0
    bl func_020216b0
    ldr r2, [sp, #0x38]
    mov r0, r11
    mov r1, #0x1
    bl func_020216b0
    mov r0, r11
    mov r2, r4
    mov r1, #0xb
    bl func_020216b0
    add r7, r7, #0x1
    cmp r7, #0x3
    blt .L_022b6fc4
    mov r0, #0x17
    bl func_0202224c
    add r1, r9, #0xc00
    ldrh r3, [r1, #0x72]
    mov r1, r0
    ldr r0, [sp, #0x48]
    mov r2, r3, lsl #0x1f
    cmp r0, r2, lsr #0x1f
    ldreq r0, [sp, #0x44]
    moveq r2, r3, lsl #0x1a
    cmpeq r0, r2, lsr #0x1b
    ldreq r0, [sp, #0x4c]
    moveq r2, r3, lsl #0x12
    cmpeq r0, r2, lsr #0x18
    beq .L_022b765c
    ldr r0, [sp, #0x44]
    cmp r0, #0xb
    moveq r1, #0x8
    movne r1, #0x0
    b .L_022b7664
.L_022b765c:
    cmp r1, #0x0
    subgt r1, r1, #0x1
.L_022b7664:
    mov r0, #0x17
    bl func_02022234
    mov r5, #0x0
    ldrh r1, [sp, #0xdc]
    add r0, r9, #0xc00
    str r5, [sp, #0x6c]
    strh r1, [r0, #0x72]
.L_022b7680:
    add r0, r9, #0x2dc
    add r0, r0, #0x800
    add r1, r9, #0x344
    str r0, [sp, #0xc4]
    add r0, r1, #0x400
    str r0, [sp, #0xbc]
    ldr r0, .L_022b7df0
    mov r6, #0x0
    sub r0, r0, #0x1
    str r0, [sp, #0xd4]
    mvn r0, #0x0
    str r0, [sp, #0xc0]
    ldr r0, .L_022b7df0
    add r4, r9, #0xc00
    sub r0, r0, #0x2
    str r0, [sp, #0xd0]
.L_022b76c0:
    ldr r0, .L_022b6834
    mov r1, r5
    mov r2, r6
    mov r3, #0x0
    bl func_ov002_022a6324
    mov r7, r0
    ldr r0, [sp, #0x6c]
    mov r1, #0x28
    add r2, r6, r0
    ldr r0, [sp, #0xbc]
    str r2, [sp, #0x80]
    mla r8, r2, r1, r0
    ldr r0, [r9, #0x4]
    mov r1, #0x3
    bl func_02021660
    add r1, sp, #0xec
    mov r10, #0x0
    str r1, [sp, #0x0]
    mov r11, r0
    mov r0, r9
    mov r1, r5
    mov r2, r6
    mov r3, r10
    bl func_ov002_022b867c
    ldrsb r0, [r7, #0x0]
    cmp r0, #0x0
    beq .L_022b7898
    ldrh r0, [r7, #0xa]
    mov r0, r0, lsl #0x11
    movs r0, r0, lsr #0x1f
    beq .L_022b7898
    mov r0, r10
    orr r10, r0, #0x1
    ldr r0, [r9, #0xc54]
    cmp r0, #0x2
    ldreq r0, [sp, #0xc0]
    streq r0, [sp, #0x7c]
    beq .L_022b77b4
    mov r0, #0x1
    bl func_0202224c
    tst r0, #0x2
    ldrne r0, [sp, #0xc0]
    strne r0, [sp, #0x7c]
    bne .L_022b77b4
    ldrh r0, [r7, #0xa]
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x1f
    ldr r0, .L_022b6838
    moveq r2, #0x1
    ldr r0, [r0, #0x4]
    movne r2, #0x0
    str r8, [sp, #0x0]
    stmib sp, {r5, r6}
    eor r0, r0, #0x1
    cmp r5, r0
    moveq r3, #0x1
    ldr r1, [r7, #0xc]
    movne r3, #0x0
    mov r0, r9
    bl func_ov002_022b88c4
    str r0, [sp, #0x7c]
.L_022b77b4:
    ldr r0, [sp, #0x7c]
    cmp r0, #0x0
    blt .L_022b7848
    ldr r2, [sp, #0xc4]
    ldr r1, [sp, #0x80]
    mov r0, r8
    add r1, r2, r1, lsl #0x5
    bl func_020aaf40
    cmp r0, #0x0
    beq .L_022b77f4
    ldr r1, [sp, #0xc4]
    ldr r0, [sp, #0x80]
    orr r10, r10, #0x100
    add r0, r1, r0, lsl #0x5
    mov r1, r8
    bl func_020aadf8
.L_022b77f4:
    ldr r0, [sp, #0x7c]
    orr r10, r10, #0x1000
    tst r0, #0x100
    beq .L_022b7814
    tst r0, #0xff
    moveq r0, #0x2000
    movne r0, #0x4000
    orr r10, r10, r0
.L_022b7814:
    ldr r1, [r7, #0xc]
    ldr r0, [sp, #0xd0]
    cmp r1, r0
    ldrne r0, [sp, #0xd4]
    cmpne r1, r0
    ldrne r0, .L_022b7df0
    cmpne r1, r0
    beq .L_022b7844
    ldr r0, .L_022b7df4
    add r0, r1, r0
    cmp r0, #0x2
    bhi .L_022b7848
.L_022b7844:
    orr r10, r10, #0x8000
.L_022b7848:
    ldr r0, [r8, #0x24]
    tst r0, #0x200
    bne .L_022b78bc
    ldr r2, [sp, #0xec]
    mov r0, r11
    mov r1, #0x3
    bl func_020216b0
    ldr r2, [sp, #0xf0]
    mov r0, r11
    mov r1, #0x4
    bl func_020216b0
    ldr r2, [sp, #0xf4]
    mov r0, r11
    mov r1, #0x5
    bl func_020216b0
    ldr r0, [r8, #0x24]
    orr r10, r10, #0x200
    orr r0, r0, #0x200
    str r0, [r8, #0x24]
    b .L_022b78bc
.L_022b7898:
    ldr r0, [sp, #0x80]
    add r1, r9, r0, lsl #0x5
    mov r0, #0x0
    strb r0, [r8, #0x0]
    ldr r0, [sp, #0xc0]
    str r0, [r8, #0x20]
    mov r0, #0x0
    str r0, [r8, #0x24]
    strb r0, [r1, #0xadc]
.L_022b78bc:
    mov r2, r10
    mov r0, r11
    mov r1, #0x0
    bl func_020216b0
    ldr r1, [r9, #0xc54]
    cmp r1, #0x2
    beq .L_022b78f0
    ldr r0, [r9, #0xccc]
    cmp r0, #0x0
    bgt .L_022b78f0
    sub r0, r1, #0x11
    cmp r0, #0x2
    bhi .L_022b78f8
.L_022b78f0:
    mov r2, #0x0
    b .L_022b7a8c
.L_022b78f8:
    ldrh r0, [r4, #0x74]
    mov r1, r0, lsl #0x1f
    cmp r5, r1, lsr #0x1f
    moveq r0, r0, lsl #0x1a
    cmpeq r6, r0, lsr #0x1b
    beq .L_022b7928
    ldrh r0, [r4, #0x76]
    mov r1, r0, lsl #0x1f
    cmp r5, r1, lsr #0x1f
    moveq r0, r0, lsl #0x1a
    cmpeq r6, r0, lsr #0x1b
    bne .L_022b7930
.L_022b7928:
    mov r2, #0x0
    b .L_022b7a8c
.L_022b7930:
    mov r0, #0x1
    bl func_0202224c
    tst r0, #0x2
    movne r2, #0x0
    bne .L_022b7a8c
    mov r0, #0x1
    bl func_0202224c
    tst r0, #0x1
    bne .L_022b797c
    ldr r1, [r9, #0xc54]
    cmp r1, #0x1
    cmpne r1, #0x9
    cmpne r1, #0xa
    beq .L_022b797c
    ldr r0, [r9, #0xcd0]
    cmp r0, #0x0
    bgt .L_022b797c
    cmp r1, #0xb
    bne .L_022b7998
.L_022b797c:
    ldrh r0, [r4, #0x70]
    mov r1, r0, lsl #0x1f
    cmp r5, r1, lsr #0x1f
    moveq r0, r0, lsl #0x1a
    cmpeq r6, r0, lsr #0x1b
    moveq r2, #0x0
    beq .L_022b7a8c
.L_022b7998:
    ldr r0, [r9, #0xcd4]
    cmp r0, #0x0
    ble .L_022b79e0
    ldrh r0, [r4, #0x6a]
    mov r1, r0, lsl #0x1f
    cmp r5, r1, lsr #0x1f
    moveq r0, r0, lsl #0x1a
    moveq r0, r0, lsr #0x1b
    cmpeq r0, r6
    beq .L_022b79d8
    ldrh r0, [r4, #0x6c]
    mov r1, r0, lsl #0x1f
    cmp r5, r1, lsr #0x1f
    moveq r0, r0, lsl #0x1a
    cmpeq r6, r0, lsr #0x1b
    bne .L_022b79e0
.L_022b79d8:
    mov r2, #0x0
    b .L_022b7a8c
.L_022b79e0:
    mov r0, #0x1
    bl func_0202224c
    tst r0, #0x1
    ldreq r0, [r9, #0xc44]
    cmpeq r0, #0x0
    beq .L_022b7a70
    ldr r0, [r9, #0xc48]
    cmp r0, #0x0
    beq .L_022b7a70
    ldrh r0, [r4, #0x70]
    mov r1, r0, lsl #0x1f
    cmp r5, r1, lsr #0x1f
    bne .L_022b7a70
    mov r0, r0, lsl #0x1a
    cmp r6, r0, lsr #0x1b
    mov r0, r0, lsr #0x1b
    beq .L_022b7a70
    cmp r0, #0x4
    bhi .L_022b7a70
    ldr r1, [sp, #0xec]
    ldr r0, [sp, #0xf8]
    subs r0, r1, r0, asr #0x4
    rsbmi r0, r0, #0x0
    cmp r0, #0x24
    movle r2, #0x1f
    ble .L_022b7a8c
    cmp r0, #0x48
    movge r2, #0x0
    bge .L_022b7a8c
    sub r0, r0, #0x24
    rsb r3, r0, r0, lsl #0x5
    ldr r0, .L_022b7df8
    smull r1, r2, r0, r3
    mov r0, r3, lsr #0x1f
    add r2, r0, r2, asr #0x3
    b .L_022b7a8c
.L_022b7a70:
    ldr r0, [sp, #0x100]
    ldr r1, [sp, #0xf4]
    mov r0, r0, asr #0x4
    sub r0, r0, #0x28
    cmp r1, r0
    movgt r2, #0x0
    movle r2, #0x1f
.L_022b7a8c:
    mov r0, r11
    mov r1, #0xb
    bl func_020216b0
    add r6, r6, #0x1
    cmp r6, #0x4
    ble .L_022b76c0
    ldr r0, [sp, #0x6c]
    add r5, r5, #0x1
    add r0, r0, #0x5
    cmp r5, #0x2
    str r0, [sp, #0x6c]
    blt .L_022b7680
    ldr r0, [r9, #0x4]
    mov r1, #0x3
    mov r2, #0xa
    bl func_02021660
    mov r1, #0x1
    mov r6, r0
    mov r7, #0x0
    bl func_020216bc
    ldr r1, [r9, #0xc54]
    mov r8, r0
    cmp r1, #0x1
    ldreq r0, [r9, #0xd24]
    cmpeq r0, #0x0
    beq .L_022b7c00
    cmp r1, #0x3
    cmpne r1, #0x9
    cmpne r1, #0xa
    beq .L_022b7c00
    ldr r0, [r9, #0xcd0]
    cmp r0, #0x0
    bgt .L_022b7c00
    cmp r1, #0xb
    ldreq r0, [r9, #0xd38]
    cmpeq r0, #0x0
    beq .L_022b7c00
    cmp r1, #0x11
    cmpne r1, #0x12
    cmpne r1, #0x13
    beq .L_022b7c00
    add r0, r9, #0xc00
    ldrh r2, [r0, #0x70]
    ldrh r3, [r0, #0x74]
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r1, r3, lsl #0x1f
    cmp r0, r1, lsr #0x1f
    bne .L_022b7b64
    mov r1, r2, lsl #0x1a
    mov r2, r1, lsr #0x1b
    mov r1, r3, lsl #0x1a
    cmp r2, r1, lsr #0x1b
    beq .L_022b7c00
.L_022b7b64:
    add r1, r9, #0xc00
    ldrh r3, [r1, #0x76]
    mov r2, r3, lsl #0x1f
    cmp r0, r2, lsr #0x1f
    bne .L_022b7b90
    ldrh r2, [r1, #0x70]
    mov r1, r3, lsl #0x1a
    mov r2, r2, lsl #0x1a
    mov r2, r2, lsr #0x1b
    cmp r2, r1, lsr #0x1b
    beq .L_022b7c00
.L_022b7b90:
    ldr r1, [r9, #0xcd4]
    cmp r1, #0x0
    ble .L_022b7bf4
    add r1, r9, #0xc00
    ldrh r3, [r1, #0x6a]
    mov r2, r3, lsl #0x1f
    cmp r0, r2, lsr #0x1f
    bne .L_022b7bc8
    ldrh r2, [r1, #0x70]
    mov r1, r3, lsl #0x1a
    mov r2, r2, lsl #0x1a
    mov r2, r2, lsr #0x1b
    cmp r2, r1, lsr #0x1b
    beq .L_022b7c00
.L_022b7bc8:
    add r1, r9, #0xc00
    ldrh r2, [r1, #0x6c]
    mov r3, r2, lsl #0x1f
    cmp r0, r3, lsr #0x1f
    bne .L_022b7bf4
    ldrh r1, [r1, #0x70]
    mov r0, r2, lsl #0x1a
    mov r1, r1, lsl #0x1a
    mov r1, r1, lsr #0x1b
    cmp r1, r0, lsr #0x1b
    beq .L_022b7c00
.L_022b7bf4:
    ldr r0, [r9, #0xcf4]
    cmp r0, #0x0
    beq .L_022b7c30
.L_022b7c00:
    mvn r0, #0x0
    str r0, [r9, #0xc34]
    mov r1, #0x0
    str r0, [r9, #0xc38]
    ldrh r4, [sp, #0xdc]
    mov r0, r6
    mov r2, r1
    str r1, [r9, #0xc3c]
    add r3, r9, #0xc00
    strh r4, [r3, #0x70]
    bl func_020216b0
    b .L_022b7e4c
.L_022b7c30:
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    beq .L_022b7e04
    ldr r0, [sp, #0x8c]
    ldr r3, [sp, #0x48]
    ldr r1, [r0, #0xc]
    ldr r4, [sp, #0x44]
    mov r0, r9
    mov r2, #0x1
    str r4, [sp, #0x0]
    bl func_ov002_022b9420
    mov r4, r0
    ldrsh r5, [r4, #0x0]
    orr r7, r7, #0x1
    mov r0, r5
    bl func_0202e310
    cmp r0, #0x0
    ldr r0, [sp, #0x8c]
    orrne r7, r7, #0x2000
    ldrh r0, [r0, #0xa]
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x1f
    orrne r7, r7, #0x10
    tst r8, #0x800
    ldr r0, [r9, #0xc3c]
    beq .L_022b7cb8
    bic r0, r0, #0x10
    tst r7, #0x10
    str r0, [r9, #0xc3c]
    ldrne r0, [r9, #0xc3c]
    bic r8, r8, #0x800
    orrne r0, r0, #0x10
    strne r0, [r9, #0xc3c]
    b .L_022b7cc4
.L_022b7cb8:
    eor r0, r7, r0
    tst r0, #0x10
    orrne r7, r7, #0x800
.L_022b7cc4:
    tst r8, #0x100
    beq .L_022b7cdc
    ldr r0, [r9, #0xc38]
    bic r8, r8, #0x100
    str r0, [r9, #0xc34]
    b .L_022b7d20
.L_022b7cdc:
    ldr r1, [r9, #0xc34]
    cmp r5, r1
    strne r5, [r9, #0xc38]
    orrne r7, r7, #0x100
    bne .L_022b7d20
    ldr r0, [sp, #0x88]
    cmp r0, #0x0
    beq .L_022b7d20
    ldr r0, [r9, #0xc38]
    cmp r1, r0
    bne .L_022b7d20
    mov r0, #0x15
    bl func_0202224c
    ldrsh r1, [r4, #0x2]
    cmp r1, r0
    strne r5, [r9, #0xc38]
    orrne r7, r7, #0x100
.L_022b7d20:
    ldr r0, [r9, #0xcd8]
    cmp r0, #0x0
    bne .L_022b7e4c
    ldrsh r2, [r4, #0x2]
    mov r0, r6
    mov r1, #0xe
    bl func_020216b0
    ldrsh r2, [r4, #0x4]
    mov r0, r6
    mov r1, #0xf
    bl func_020216b0
    ldrb r2, [r4, #0x17]
    mov r0, r6
    mov r1, #0xd
    bl func_020216b0
    ands r5, r7, #0x10
    ldrnesh r2, [r4, #0xc]
    ldr r1, [sp, #0x104]
    mov r0, r6
    ldreqsh r2, [r4, #0x6]
    add r2, r1, r2
    mov r1, #0x3
    bl func_020216b0
    cmp r5, #0x0
    ldrnesh r2, [r4, #0xe]
    ldr r1, [sp, #0x108]
    mov r0, r6
    ldreqsh r2, [r4, #0x8]
    add r2, r1, r2
    mov r1, #0x4
    bl func_020216b0
    cmp r5, #0x0
    ldrnesh r0, [r4, #0x10]
    ldr r2, [sp, #0x10c]
    ldreqsh r0, [r4, #0xa]
    sub r1, r0, #0x6
    add r2, r2, r1
    mov r0, r6
    mov r1, #0x5
    bl func_020216b0
    ldrsh r2, [r4, #0x12]
    mov r0, r6
    mov r1, #0xa
    bl func_020216b0
    ldrh r1, [sp, #0xdc]
    add r0, r9, #0xc00
    orr r7, r7, #0x200
    strh r1, [r0, #0x70]
    b .L_022b7e4c
.L_022b7de4:
        .word   data_ov002_022cccbc
.L_022b7de8:
        .word   0x55555556
.L_022b7dec:
        .word   data_ov002_022d0e70
.L_022b7df0:
        .word   0x1388
.L_022b7df4:
        .word   0xffffe65d
.L_022b7df8:
        .word   0x38e38e39
.L_022b7dfc:
        .word   data_ov002_022d1410
.L_022b7e00:
        .word   data_ov002_022cd73c
.L_022b7e04:
    ldr r0, [r9, #0xcd8]
    cmp r0, #0x0
    bne .L_022b7e38
    ldrh r2, [sp, #0xdc]
    mvn r0, #0x0
    str r0, [r9, #0xc34]
    bic r1, r2, #0x3e
    str r0, [r9, #0xc38]
    mov r0, #0x0
    str r0, [r9, #0xc3c]
    add r0, r9, #0xc00
    orr r1, r1, #0x3e
    strh r1, [r0, #0x70]
.L_022b7e38:
    mov r0, #0x1
    bl func_0202224c
    bic r1, r0, #0x1
    mov r0, #0x1
    bl func_02022234
.L_022b7e4c:
    ldr r0, [r9, #0xd28]
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r9, #0xd28]
    ldr r0, [r9, #0xd34]
    orrne r7, r7, #0x4000
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r9, #0xd34]
    ldr r0, [r9, #0xcd8]
    orrne r7, r7, #0x8000
    cmp r0, #0x0
    bne .L_022b7ea0
    mov r0, r6
    mov r2, r7
    mov r1, #0x0
    bl func_020216b0
    mov r0, r6
    mov r2, r8
    mov r1, #0x1
    bl func_020216b0
.L_022b7ea0:
    ldr r0, [r9, #0x4]
    mov r1, #0x3
    mov r2, #0xb
    bl func_02021660
    ldr r1, [r9, #0xd1c]
    mov r5, r0
    cmp r1, #0x0
    mov r6, #0x0
    beq .L_022b7f9c
    sub r3, r6, #0x1
    str r3, [sp, #0x0]
    ldr r1, [r9, #0xd14]
    mov r0, r9
    mov r2, r6
    bl func_ov002_022b94b8
    mov r4, r0
    ldrsh r2, [r4, #0x2]
    mov r0, r5
    mov r1, #0xe
    orr r6, r6, #0x1
    bl func_020216b0
    ldr r2, [r4, #0x20]
    mov r0, r5
    mov r1, #0xd
    bl func_020216b0
    mov r0, r5
    mov r1, #0x3
    ldr r3, [sp, #0x104]
    ldrsh r2, [r4, #0x8]
    add r2, r3, r2
    bl func_020216b0
    mov r0, r5
    mov r1, #0x4
    ldr r3, [sp, #0x108]
    ldrsh r2, [r4, #0xa]
    add r2, r3, r2
    bl func_020216b0
    mov r0, r5
    mov r1, #0x5
    ldr r3, [sp, #0x10c]
    ldrsh r2, [r4, #0xc]
    add r2, r3, r2
    bl func_020216b0
    mov r0, r5
    mov r1, #0x6
    ldrsh r2, [r4, #0xe]
    bl func_020216b0
    mov r0, r5
    mov r1, #0x7
    ldrsh r2, [r4, #0x10]
    bl func_020216b0
    mov r0, r5
    mov r1, #0x8
    ldrsh r2, [r4, #0x12]
    bl func_020216b0
    mov r0, r5
    mov r1, #0xa
    ldrsh r2, [r4, #0x4]
    bl func_020216b0
    ldrsh r2, [r4, #0x6]
    mov r0, r5
    mov r1, #0xc
    bl func_020216b0
.L_022b7f9c:
    mov r0, r5
    mov r2, r6
    mov r1, #0x0
    bl func_020216b0
    ldr r0, [r9, #0xd1c]
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r9, #0xd1c]
    ldr r1, [r9, #0xc54]
    mov r0, #0x2
    bl func_02022234
    ldr r1, [r9, #0xc60]
    mov r0, #0x3
    bl func_02022234
    ldr r0, .L_022b7dfc
    mov r7, #0x28
    ldr r4, .L_022b7e00
    add r8, r0, #0x280
    mov r10, #0x0
    mov r5, #0xb
    mov r6, #0xa
    mov r11, r7
.L_022b7ff4:
    ldrsh r1, [r8, #0x56]
    ldr r0, [r4, #0x4]
    cmp r1, #0x28
    movgt r1, r7
    cmp r10, r0
    moveq r0, r6
    movne r0, r5
    bl func_02022234
    ldrsh r1, [r8, #0x2a]
    ldr r0, [r4, #0x4]
    cmp r1, #0x28
    movgt r1, r11
    cmp r10, r0
    moveq r0, #0xc
    movne r0, #0xd
    bl func_02022234
    ldrsh r1, [r8, #0x82]
    ldr r0, [r4, #0x4]
    cmp r1, #0x28
    movgt r1, #0x28
    cmp r10, r0
    moveq r0, #0xe
    movne r0, #0xf
    bl func_02022234
    ldrsh r1, [r8, #0xae]
    ldr r0, [r4, #0x4]
    cmp r1, #0x28
    movgt r1, #0x28
    cmp r10, r0
    moveq r0, #0x10
    movne r0, #0x11
    bl func_02022234
    add r10, r10, #0x1
    add r8, r8, #0xb0
    cmp r10, #0x2
    blt .L_022b7ff4
    ldr r0, [r9, #0x10]
    add r0, r0, #0x1
    str r0, [r9, #0x10]
    add sp, sp, #0x110
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
