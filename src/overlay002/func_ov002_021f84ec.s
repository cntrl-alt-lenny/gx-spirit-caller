; func_ov002_021f84ec — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern func_ov002_021b9aa8
        .extern func_ov002_021d7c40
        .global func_ov002_021f84ec
        .arm
func_ov002_021f84ec:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r1, [r4, #0x2]
    ldrh r0, [r4, #0x4]
    mov r2, r1, lsl #0x1f
    mov r1, r0, lsl #0x11
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x17
    bl func_ov002_021b9aa8
    movs r1, r0
    bmi .L_021f8528
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021d7c40
.L_021f8528:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
