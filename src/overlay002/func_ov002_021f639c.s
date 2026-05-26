; func_ov002_021f639c — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern func_ov002_021d59cc
        .extern func_ov002_021f49d0
        .global func_ov002_021f639c
        .arm
func_ov002_021f639c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r2, #0x0
    mov r5, r0
    str r2, [sp, #0x0]
    ldrh r0, [r5, #0x2]
    ldrh r2, [r5, #0x0]
    mov r4, r1
    mov r3, r0, lsl #0x1f
    mov r1, r0, lsl #0x1a
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r3, #0x4
    bl func_ov002_021d59cc
    mov r0, r5
    mov r1, r4
    bl func_ov002_021f49d0
    ldmia sp!, {r3, r4, r5, pc}
