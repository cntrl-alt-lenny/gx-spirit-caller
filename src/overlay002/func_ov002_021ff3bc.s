; func_ov002_021ff3bc — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern func_ov002_021ca2b8
        .extern func_ov002_021ff2b8
        .global func_ov002_021ff3bc
        .arm
func_ov002_021ff3bc:
    stmdb sp!, {r4, lr}
    ldrh r2, [r0, #0x2]
    mov r1, r2, lsl #0x11
    mov r2, r2, lsl #0x1f
    mov r1, r1, lsr #0x1f
    eor r4, r1, r2, lsr #0x1f
    mov r1, r4
    bl func_ov002_021ff2b8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    mov r0, r4
    bl func_ov002_021ca2b8
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, pc}
