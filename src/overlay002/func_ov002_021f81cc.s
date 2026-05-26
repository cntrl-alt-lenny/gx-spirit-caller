; func_ov002_021f81cc — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern func_ov002_021b9bd4
        .extern func_ov002_021decdc
        .global func_ov002_021f81cc
        .arm
func_ov002_021f81cc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    mov r2, r0, lsl #0x1f
    mov r1, r0, lsl #0x1a
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021b9bd4
    strh r0, [r4, #0xa]
    ldrh r1, [r4, #0x2]
    mov r0, r4
    mov r3, r1, lsl #0x1f
    mov r2, r1, lsl #0x1a
    mov r1, r3, lsr #0x1f
    mov r2, r2, lsr #0x1b
    bl func_ov002_021decdc
    mov r0, #0x1
    ldmia sp!, {r4, pc}
