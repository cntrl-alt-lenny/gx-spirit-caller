; func_ov016_021b2d4c — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern data_ov016_021b9000
        .extern data_ov016_021b900a
        .extern data_ov016_021b9014
        .extern data_ov016_021babec
        .extern data_ov016_021bac38
        .extern data_ov016_021bac64
        .extern func_020061ac
        .extern func_ov016_021b287c
        .extern func_ov016_021b2a8c
        .extern func_ov016_021b3498
        .extern func_ov016_021b39e4
        .extern func_ov016_021b423c
        .extern func_ov016_021b5dd0
        .extern func_ov016_021b6350
        .global func_ov016_021b2d4c
        .arm
func_ov016_021b2d4c:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x10
    mov r6, r0
    ldr r0, .L_021b2f50
    mov r4, #0x0
    ldr r1, [r0, #0x8]
    cmp r1, #0x0
    beq .L_021b2d74
    bl func_ov016_021b5dd0
    mov r4, #0x1
.L_021b2d74:
    ldr r0, [r6, #0x4]
    cmp r0, #0x0
    beq .L_021b2d94
    cmp r0, #0x1
    beq .L_021b2f30
    cmp r0, #0x2
    beq .L_021b2f3c
    b .L_021b2f44
.L_021b2d94:
    ldr r7, .L_021b2f54
    mov r5, #0x3
    mov r0, r7
    bl func_ov016_021b287c
    cmp r0, #0x0
    beq .L_021b2db4
    cmp r4, #0x0
    moveq r5, #0x4
.L_021b2db4:
    mov r0, r6
    mov r2, r5
    mov r3, r7
    mov r1, #0x0
    bl func_ov016_021b3498
    ldr r7, .L_021b2f58
    mov r8, #0x0
    mov r0, r7
    mov r5, #0x1
    bl func_ov016_021b287c
    cmp r0, #0x0
    beq .L_021b2e04
    cmp r4, #0x0
    bne .L_021b2e04
    mov r1, r8
    mov r0, r6
    str r1, [r6, #0xc]
    mov r8, r5
    bl func_ov016_021b39e4
    mov r5, #0x2
.L_021b2e04:
    mov r0, r6
    mov r2, r8
    mov r3, r7
    mov r1, #0x0
    bl func_ov016_021b3498
    mov r1, #0x100
    ldr r0, .L_021b2f5c
    str r1, [sp, #0x0]
    ldrh r1, [r0, #0xc]
    mov r3, r5
    mov r0, #0x0
    add r1, r1, #0x3
    mov r2, #0x288
    bl func_ov016_021b2a8c
    ldr r7, .L_021b2f60
    mov r8, #0x0
    mov r0, r7
    mov r5, #0x1
    bl func_ov016_021b287c
    cmp r0, #0x0
    beq .L_021b2e74
    cmp r4, #0x0
    bne .L_021b2e74
    mov r8, r5
    mov r0, r6
    str r8, [r6, #0xc]
    bl func_ov016_021b39e4
    mov r5, #0x2
.L_021b2e74:
    mov r0, r6
    mov r2, r8
    mov r3, r7
    mov r1, #0x0
    bl func_ov016_021b3498
    mov r1, #0x100
    ldr r0, .L_021b2f5c
    str r1, [sp, #0x0]
    ldrh r1, [r0, #0x16]
    mov r3, r5
    mov r0, #0x0
    add r1, r1, #0x3
    mov r2, #0x298
    bl func_ov016_021b2a8c
    bl func_020061ac
    cmp r0, #0x0
    cmpeq r4, #0x0
    bne .L_021b2f10
    ldr r1, [r6, #0xc]
    mov r0, #0xa
    add r1, r1, #0x1
    mul r0, r1, r0
    ldr r1, .L_021b2f54
    add r3, sp, #0x4
    add r2, r1, r0
    ldrh r1, [r1, r0]
    ldrh r0, [r2, #0x2]
    ldrh r5, [r2, #0x8]
    ldrh r4, [r2, #0x6]
    sub lr, r1, #0x3
    sub ip, r0, #0x3
    mov r0, r6
    mov r1, #0x0
    mov r2, #0x2
    strh lr, [sp, #0x4]
    strh ip, [sp, #0x6]
    strh r5, [sp, #0xc]
    strh r4, [sp, #0xa]
    bl func_ov016_021b3498
.L_021b2f10:
    mov r4, #0xc0
    mov r0, #0x20
    mov r1, #0xa
    mov r2, #0x27c
    mov r3, #0x3
    str r4, [sp, #0x0]
    bl func_ov016_021b2a8c
    b .L_021b2f44
.L_021b2f30:
    ldr r0, .L_021b2f64
    bl func_ov016_021b423c
    b .L_021b2f44
.L_021b2f3c:
    ldr r0, .L_021b2f68
    bl func_ov016_021b6350
.L_021b2f44:
    mov r0, #0x1
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_021b2f50:
        .word   data_ov016_021bac38
.L_021b2f54:
        .word   data_ov016_021b9000
.L_021b2f58:
        .word   data_ov016_021b900a
.L_021b2f5c:
        .word   data_ov016_021b9000
.L_021b2f60:
        .word   data_ov016_021b9014
.L_021b2f64:
        .word   data_ov016_021babec
.L_021b2f68:
        .word   data_ov016_021bac64
