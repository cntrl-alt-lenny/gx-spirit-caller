; func_ov002_021ff2c8 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern data_ov002_022cf178
        .extern func_ov002_021b9aa8
        .global func_ov002_021ff2c8
        .arm
func_ov002_021ff2c8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r2, [r4, #0x4]
    mov r0, r1
    mov r1, r2, lsl #0x11
    mov r1, r1, lsr #0x17
    bl func_ov002_021b9aa8
    ldrh r2, [r4, #0x2]
    cmp r0, #0x0
    ldr r0, .L_021ff318
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    and r2, r2, #0x1
    mul r0, r2, r0
    ldr r1, .L_021ff31c
    movge r3, #0x1
    ldr r0, [r1, r0]
    movlt r3, #0x0
    sub r0, r0, r3
    ldmia sp!, {r4, pc}
.L_021ff318:
        .word   0x868
.L_021ff31c:
        .word   data_ov002_022cf178
