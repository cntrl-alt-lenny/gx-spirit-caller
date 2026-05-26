; func_ov002_021ec110 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021b33b0
        .extern func_ov002_021c23ac
        .global func_ov002_021ec110
        .arm
func_ov002_021ec110:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r2
    cmp r4, #0x5
    mov r5, r1
    movlt r0, #0x0
    ldmltia sp!, {r3, r4, r5, pc}
    ldr r1, .L_021ec19c
    ldr r2, .L_021ec1a0
    and r3, r5, #0x1
    mla r2, r3, r1, r2
    mov r1, #0x14
    mla r1, r4, r1, r2
    ldr r1, [r1, #0x30]
    mov r1, r1, lsl #0x13
    movs r1, r1, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r2, [r0, #0x2]
    mov r0, r5
    mov r1, r4
    mov r3, r2, lsl #0x1a
    mov ip, r2, lsl #0x1f
    mov r2, ip, lsr #0x1f
    mov r3, r3, lsr #0x1b
    bl func_ov002_021b33b0
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov002_021c23ac
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_021ec19c:
        .word   0x868
.L_021ec1a0:
        .word   data_ov002_022cf16c
