; func_ov002_021f67d0 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern func_ov002_021ff2c8
        .extern func_ov002_0226af78
        .global func_ov002_021f67d0
        .arm
func_ov002_021f67d0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r1, [r4, #0x2]
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_021ff2c8
    cmp r0, #0x2
    blt .L_021f680c
    ldrh r0, [r4, #0x2]
    mov r1, #0x2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0226af78
    mov r0, #0x1
    strh r0, [r4, #0xc]
.L_021f680c:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
