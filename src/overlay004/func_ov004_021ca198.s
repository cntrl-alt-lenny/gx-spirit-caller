; func_ov004_021ca198 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern data_ov004_0220b500
        .extern func_02005dac
        .extern func_02034810
        .extern func_0208e120
        .global func_ov004_021ca198
        .arm
func_ov004_021ca198:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x20
    bl func_02034810
    mov r2, r0, lsl #0x8
    mov r0, r2, asr #0x6
    ldr r1, .L_021ca4e0
    add r0, r2, r0, lsr #0x19
    mov r2, r0, asr #0x7
    str r1, [sp, #0x18]
    mov r0, #0x1
    mov r1, #0x0
    strh r2, [sp, #0x1c]
    bl func_02005dac
    ldr r1, [sp, #0x18]
    ldr r2, [sp, #0x1c]
    str r1, [r0, #0x0]
    ldr r1, .L_021ca4e4
    str r2, [r0, #0x4]
    ldr r0, [r1, #0x40]
    cmp r0, #0x0
    beq .L_021ca3c4
    ldr r0, .L_021ca4e8
    mov r7, #0x0
    ldr r4, [r0, #0x0]
    ldr r0, .L_021ca4ec
    ldr r6, .L_021ca4f0
    smull r1, r2, r0, r4
    mov r3, r4, lsr #0x1f
    add r2, r3, r2, asr #0x3
    smull r3, r1, r6, r4
    smull r5, r3, r6, r2
    add r1, r1, r4, lsr #0x1f
    mov r4, r2, lsr #0x1f
    add r3, r4, r3, asr #0x1
    mov r5, #0xc
    smull r3, r4, r5, r3
    sub r3, r2, r3
    smull r4, r6, r0, r1
    mov r2, r1, lsr #0x1f
    add r6, r2, r6, asr #0x4
    mov r4, #0x28
    smull r0, r2, r4, r6
    mov r11, r7
    cmp r3, #0x3
    sub r6, r1, r0
    blt .L_021ca258
    cmp r3, #0x6
    sublt r7, r3, #0x2
.L_021ca258:
    cmp r3, #0x9
    blt .L_021ca268
    cmp r3, #0xc
    sublt r11, r3, #0x8
.L_021ca268:
    sub r0, r7, #0x1
    mov r0, r0, lsl #0x2
    mov r8, #0x0
    sub r1, r11, #0x1
    str r0, [sp, #0x4]
    mov r0, r1, lsl #0x2
    str r8, [sp, #0x14]
    str r0, [sp, #0x0]
.L_021ca288:
    ldr r1, .L_021ca4e8
    ldr r0, [sp, #0x4]
    mov r9, #0x0
    add r2, r1, r0, lsl #0x1
    ldr r0, [sp, #0x0]
    add r5, r2, r8, lsl #0x1
    add r0, r1, r0, lsl #0x1
    add r4, r0, r8, lsl #0x1
.L_021ca2a8:
    cmp r7, #0x0
    moveq r10, #0x0
    beq .L_021ca2c0
    add r0, r5, r9, lsl #0x1
    add r0, r0, #0x5c00
    ldrh r10, [r0, #0xd8]
.L_021ca2c0:
    bl func_0208e120
    add r0, r0, r8, lsl #0x1
    add r0, r0, r9, lsl #0x1
    add r0, r0, #0x200
    strh r10, [r0, #0xc]
    cmp r11, #0x0
    moveq r10, #0x0
    beq .L_021ca2ec
    add r0, r4, r9, lsl #0x1
    add r0, r0, #0x5d00
    ldrh r10, [r0, #0xd8]
.L_021ca2ec:
    bl func_0208e120
    add r0, r0, r8, lsl #0x1
    add r0, r0, r9, lsl #0x1
    add r0, r0, #0x200
    strh r10, [r0, #0x2c]
    add r9, r9, #0x1
    cmp r9, #0x4
    blt .L_021ca2a8
    ldr r0, [sp, #0x14]
    add r8, r8, #0x20
    add r0, r0, #0x1
    str r0, [sp, #0x14]
    cmp r0, #0x4
    blt .L_021ca288
    ldr r3, .L_021ca4f4
    mov r8, #0x0
    smull r0, r4, r3, r6
    add r4, r4, r6, lsr #0x1f
    mov r2, #0x3
    smull r1, r0, r2, r4
    smull r0, r2, r3, r6
    sub r4, r6, r1
    mov r1, #0xa
    mul r1, r4, r1
    add r2, r2, r6, lsr #0x1f
    add r0, r2, r2, lsl #0x2
    mov r2, r0, lsl #0x6
    ldr r0, .L_021ca4e8
    mov r7, r8
    add r0, r0, r2, lsl #0x1
    add r11, r0, r1, lsl #0x1
    mov r4, r8
.L_021ca36c:
    mov r9, #0x0
    add r5, r11, r7, lsl #0x1
.L_021ca374:
    cmp r6, #0x9
    movge r10, r4
    bge .L_021ca38c
    add r0, r5, r9, lsl #0x1
    add r0, r0, #0x5400
    ldrh r10, [r0, #0xd8]
.L_021ca38c:
    bl func_0208e120
    add r0, r0, r7, lsl #0x1
    add r0, r0, r9, lsl #0x1
    add r0, r0, #0x100
    add r9, r9, #0x1
    strh r10, [r0, #0x16]
    cmp r9, #0xa
    blt .L_021ca374
    add r8, r8, #0x1
    cmp r8, #0xa
    add r7, r7, #0x20
    blt .L_021ca36c
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_021ca3c4:
    ldr r0, .L_021ca4e8
    mov r6, #0x0
    ldr r1, [r0, #0x0]
    ldr r2, .L_021ca4ec
    mov r0, r1, lsr #0x1f
    smull r1, r3, r2, r1
    add r3, r0, r3, asr #0x3
    ldr r2, .L_021ca4f0
    mov r0, r3, lsr #0x1f
    smull r1, r4, r2, r3
    add r4, r0, r4, asr #0x1
    mov r2, #0xc
    smull r0, r1, r2, r4
    sub r4, r3, r0
    mov r7, r6
    cmp r4, #0x3
    blt .L_021ca410
    cmp r4, #0x6
    sublt r6, r4, #0x2
.L_021ca410:
    cmp r4, #0x9
    blt .L_021ca420
    cmp r4, #0xc
    sublt r7, r4, #0x8
.L_021ca420:
    sub r0, r6, #0x1
    mov r0, r0, lsl #0x2
    mov r8, #0x0
    sub r1, r7, #0x1
    str r0, [sp, #0xc]
    mov r0, r1, lsl #0x2
    str r8, [sp, #0x10]
    str r0, [sp, #0x8]
.L_021ca440:
    ldr r1, .L_021ca4e8
    ldr r0, [sp, #0xc]
    mov r9, #0x0
    add r2, r1, r0, lsl #0x1
    ldr r0, [sp, #0x8]
    add r5, r2, r8, lsl #0x1
    add r0, r1, r0, lsl #0x1
    add r4, r0, r8, lsl #0x1
    mov r11, r9
.L_021ca464:
    cmp r6, #0x0
    moveq r10, r11
    beq .L_021ca47c
    add r0, r5, r9, lsl #0x1
    add r0, r0, #0x5400
    ldrh r10, [r0, #0xd8]
.L_021ca47c:
    bl func_0208e120
    add r0, r0, r8, lsl #0x1
    add r0, r0, r9, lsl #0x1
    strh r10, [r0, #0xd6]
    cmp r7, #0x0
    moveq r10, #0x0
    beq .L_021ca4a4
    add r0, r4, r9, lsl #0x1
    add r0, r0, #0x5800
    ldrh r10, [r0, #0xd8]
.L_021ca4a4:
    bl func_0208e120
    add r0, r0, r8, lsl #0x1
    add r0, r0, r9, lsl #0x1
    strh r10, [r0, #0xe2]
    add r9, r9, #0x1
    cmp r9, #0x4
    blt .L_021ca464
    ldr r0, [sp, #0x10]
    add r8, r8, #0x20
    add r0, r0, #0x1
    str r0, [sp, #0x10]
    cmp r0, #0x4
    blt .L_021ca440
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_021ca4e0:
        .word   0x40f02000
.L_021ca4e4:
        .word   data_ov004_0220b500
.L_021ca4e8:
        .word   data_ov004_0220b500
.L_021ca4ec:
        .word   0x66666667
.L_021ca4f0:
        .word   0x2aaaaaab
.L_021ca4f4:
        .word   0x55555556
