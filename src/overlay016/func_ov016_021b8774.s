; func_ov016_021b8774 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern data_ov016_021b940c
        .extern data_ov016_021b9458
        .extern data_ov016_021b9478
        .extern data_ov016_021b9498
        .extern data_ov016_021b94b8
        .extern data_ov016_021bb1a4
        .extern data_ov016_021bb1b0
        .extern Task_InvokeLocked
        .extern func_0201e7e0
        .extern func_0201ede4
        .extern func_0201ef3c
        .extern func_0201ef90
        .extern func_02091554
        .extern func_ov016_021b894c
        .extern func_ov016_021b8a30
        .extern func_ov016_021b8b10
        .extern func_ov016_021b8bf4
        .extern func_ov016_021b8cd8
        .global func_ov016_021b8774
        .arm
func_ov016_021b8774:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x1c
    mov r4, r1
    ldr r1, [r4, #0x44]
    mov r5, r0
    cmp r1, #0x0
    beq .L_021b8860
    mov r8, #0x0
    ldr r7, .L_021b892c
    mov r6, r8
.L_021b879c:
    ldr r0, [r7, r8, lsl #0x2]
    cmp r0, #0x0
    beq .L_021b87ac
    bl Task_InvokeLocked
.L_021b87ac:
    str r6, [r7, r8, lsl #0x2]
    add r8, r8, #0x1
    cmp r8, #0x5
    blt .L_021b879c
    ldr r0, [r4, #0x44]
    add r2, r5, #0x100
    and r0, r0, #0x1f
    strb r0, [r5, #0x1cc]
    ldr r0, [r4, #0x44]
    ldr r1, .L_021b8930
    and r0, r0, #0x3e0
    mov r0, r0, lsr #0x5
    strb r0, [r5, #0x1cd]
    ldr r3, [r4, #0x44]
    mov r0, r5
    and r3, r3, #0x7c00
    mov r3, r3, lsr #0xa
    strb r3, [r5, #0x1ce]
    ldr r3, [r4, #0x44]
    and r3, r3, #0xf8000
    mov r3, r3, lsr #0xf
    strb r3, [r5, #0x1cf]
    ldr r3, [r4, #0x44]
    and r3, r3, #0x1f00000
    mov r3, r3, lsr #0x14
    strh r3, [r2, #0xd0]
    ldr r2, [r4, #0x44]
    and r2, r2, #0x7e000000
    mov r2, r2, lsr #0x19
    str r2, [r5, #0x1d4]
    bl func_ov016_021b8a30
    ldr r1, .L_021b8930
    mov r0, r5
    bl func_ov016_021b894c
    ldr r1, .L_021b8930
    mov r0, r5
    bl func_ov016_021b8b10
    ldr r1, .L_021b8930
    mov r0, r5
    bl func_ov016_021b8bf4
    ldr r1, .L_021b8930
    mov r0, r5
    bl func_ov016_021b8cd8
    add sp, sp, #0x1c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_021b8860:
    ldr r0, .L_021b8934
    ldr r1, .L_021b8938
    ldr r0, [r0, #0x0]
    bl func_02091554
    ldr r0, .L_021b8934
    ldr r1, .L_021b893c
    ldr r0, [r0, #0x4]
    bl func_02091554
    ldr r0, .L_021b8934
    ldr r1, .L_021b8940
    ldr r0, [r0, #0x8]
    bl func_02091554
    ldr r0, .L_021b8934
    ldr r1, .L_021b8944
    ldr r0, [r0, #0xc]
    bl func_02091554
    ldr r0, [r5, #0xb0]
    cmp r0, #0x0
    beq .L_021b88c8
    ldr r0, [r5, #0x5c]
    add r1, r5, #0x64
    add r2, r5, #0xb0
    bl func_0201ef3c
    mov r0, #0x0
    str r0, [r5, #0xb4]
    str r0, [r5, #0xb0]
.L_021b88c8:
    bl func_0201e7e0
    mov r0, #0x200
    str r0, [sp, #0x0]
    mov r1, #0x1
    ldr r0, .L_021b8930
    str r1, [sp, #0x4]
    str r0, [sp, #0x8]
    str r1, [sp, #0xc]
    sub r0, r1, #0x2
    str r0, [sp, #0x10]
    add r4, r5, #0xb0
    add r0, r5, #0x5c
    add r1, r5, #0x60
    add r2, r5, #0x64
    mov r3, #0x6000
    str r4, [sp, #0x14]
    bl func_0201ef90
    ldr r1, .L_021b8934
    add r0, sp, #0x18
    ldr r1, [r1, #0xc]
    bl func_0201ede4
    ldr r1, .L_021b8948
    str r0, [r1, #0x10]
    add sp, sp, #0x1c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_021b892c:
        .word   data_ov016_021bb1b0
.L_021b8930:
        .word   data_ov016_021b940c
.L_021b8934:
        .word   data_ov016_021b940c
.L_021b8938:
        .word   data_ov016_021b9458
.L_021b893c:
        .word   data_ov016_021b9478
.L_021b8940:
        .word   data_ov016_021b9498
.L_021b8944:
        .word   data_ov016_021b94b8
.L_021b8948:
        .word   data_ov016_021bb1a4
