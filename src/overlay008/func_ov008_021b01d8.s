; func_ov008_021b01d8 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern data_02104f4c
        .extern data_02105f4c
        .extern data_ov008_021b26f0
        .extern data_ov008_021b2780
        .extern data_ov008_021b2dc8
        .extern data_ov008_021b2de4
        .extern Task_PostLocked
        .extern func_02006c0c
        .extern Task_Invoke
        .extern func_0201d47c
        .extern func_0201e5b8
        .extern func_0208e2f4
        .extern func_02094504
        .extern func_ov008_021aa540
        .extern func_ov008_021aedfc
        .extern func_ov008_021aefd4
        .global func_ov008_021b01d8
        .arm
func_ov008_021b01d8:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x28
    ldr r1, .L_021b0390
    mov r0, #0x0
    mov r2, #0xc8
    bl func_02094504
    ldr r2, .L_021b0394
    ldr r4, .L_021b0398
    ldr r0, [r2, #0x0]
    ldr r1, [r2, #0x0]
    and r0, r0, #0x1f00
    mov r0, r0, lsr #0x8
    bic r0, r0, #0x8
    bic r1, r1, #0x1f00
    orr r0, r0, #0x2
    orr r0, r1, r0, lsl #0x8
    str r0, [r2, #0x0]
    mov r5, #0x0
    str r5, [r4, #0xb0]
.L_021b0224:
    mov r0, r5
    bl func_ov008_021aa540
    ldrh r1, [r4, #0xa8]
    add r5, r5, #0x1
    cmp r5, #0x1a
    add r0, r1, r0
    strh r0, [r4, #0xa8]
    blt .L_021b0224
    mov r6, #0x0
    mov r5, #0x4
    ldr r4, .L_021b0398
    b .L_021b0268
.L_021b0254:
    mov r0, r6
    bl func_ov008_021aedfc
    mov r1, r6
    bl func_ov008_021aefd4
    add r6, r6, #0x1
.L_021b0268:
    ldrh r0, [r4, #0xa8]
    cmp r0, #0x3
    movhi r0, r5
    cmp r6, r0
    blt .L_021b0254
    add r0, sp, #0x0
    bl func_0201d47c
    ldr r0, .L_021b039c
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    ldrh r1, [sp, #0x14]
    str r0, [sp, #0x0]
    ldr r3, .L_021b03a0
    bic r0, r1, #0xf
    orr r0, r0, #0x9
    strh r0, [sp, #0x14]
    ldrh r2, [sp, #0x14]
    mov r1, #0x600
    add r0, sp, #0x0
    orr r2, r2, #0x10
    str r3, [sp, #0xc]
    strh r2, [sp, #0x14]
    strh r1, [sp, #0x10]
    bl func_0201e5b8
    ldr r0, [sp, #0x0]
    bl Task_Invoke
    ldr r0, .L_021b03a4
    ldr r2, .L_021b03a8
    ldr r0, [r0, #0x18]
    ldr r3, [r2, #0xa60]
    ldr r1, .L_021b03ac
    sub r3, r3, r0
    str r3, [r2, #0xa60]
    ldr r1, [r1, #0x568]
    cmp r1, #0x0
    beq .L_021b0320
    ldr r1, .L_021b03b0
    mvn r2, #0x0
    ldr r3, [r1, #0x854]
    sub r4, r2, r3
    cmp r4, r0
    addhi r0, r3, r0
    strhi r0, [r1, #0x854]
    strls r2, [r1, #0x854]
    b .L_021b0340
.L_021b0320:
    ldr r1, .L_021b03b0
    mvn r2, #0x0
    ldr r3, [r1, #0x858]
    sub r4, r2, r3
    cmp r4, r0
    addhi r0, r3, r0
    strhi r0, [r1, #0x858]
    strls r2, [r1, #0x858]
.L_021b0340:
    ldr r1, .L_021b0398
    mov r0, #0xa
    ldrh r3, [r1, #0xa8]
    mov r1, #0x4
    mov r2, #0x0
    mul r0, r3, r0
    bl Task_PostLocked
    ldr r2, .L_021b0398
    mov r1, #0x1f
    str r0, [r2, #0xc0]
    ldr r0, .L_021b03b4
    mov r2, #0x0
    bl func_0208e2f4
    ldr r2, .L_021b0394
    mov r0, #0x1
    ldr r1, [r2, #0x0]
    bic r1, r1, #0xe000
    str r1, [r2, #0x0]
    add sp, sp, #0x28
    ldmia sp!, {r4, r5, r6, pc}
.L_021b0390:
        .word   data_ov008_021b2de4
.L_021b0394:
        .word   0x4001000
.L_021b0398:
        .word   data_ov008_021b2de4
.L_021b039c:
        .word   data_ov008_021b26f0
.L_021b03a0:
        .word   0x14980
.L_021b03a4:
        .word   data_ov008_021b2dc8
.L_021b03a8:
        .word   data_02104f4c
.L_021b03ac:
        .word   data_ov008_021b2780
.L_021b03b0:
        .word   data_02105f4c
.L_021b03b4:
        .word   0x4001050
