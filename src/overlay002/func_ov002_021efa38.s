; func_ov002_021efa38 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern data_ov002_022cf16c
        .extern func_0202e2f8
        .extern func_ov002_021c23ac
        .global func_ov002_021efa38
        .arm
func_ov002_021efa38:
    stmdb sp!, {r3, r4, r5, lr}
    ldrh r0, [r0, #0x2]
    mov r5, r1
    mov r4, r2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r5
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    cmp r4, #0x5
    movge r0, #0x0
    ldmgeia sp!, {r3, r4, r5, pc}
    ldr r0, .L_021efac0
    ldr r1, .L_021efac4
    and r2, r5, #0x1
    mla r1, r2, r0, r1
    mov r0, #0x14
    mla r0, r4, r0, r1
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_0202e2f8
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov002_021c23ac
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_021efac0:
        .word   0x868
.L_021efac4:
        .word   data_ov002_022cf16c
