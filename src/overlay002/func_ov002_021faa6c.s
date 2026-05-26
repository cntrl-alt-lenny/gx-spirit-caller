; func_ov002_021faa6c — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern func_ov002_021b4120
        .extern func_ov002_021d5b80
        .global func_ov002_021faa6c
        .arm
func_ov002_021faa6c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    ldrh r2, [r4, #0x0]
    mov r1, #0xb
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021b4120
    str r0, [r4, #0x14]
    ldrh r0, [r4, #0x2]
    ldrh r2, [r4, #0x0]
    mov r1, #0xb
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x0
    bl func_ov002_021d5b80
    mov r0, #0x1
    ldmia sp!, {r4, pc}
