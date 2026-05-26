; func_ov002_021f754c — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern func_ov002_021f40f4
        .extern func_ov002_0226aea8
        .global func_ov002_021f754c
        .arm
func_ov002_021f754c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r1, [r4, #0x2]
    mov r1, r1, lsl #0x14
    mov r1, r1, lsr #0x1a
    cmp r1, #0x23
    beq .L_021f7590
    bl func_ov002_021f40f4
    mov r1, r0
    cmp r1, #0x0
    ble .L_021f7590
    ldrh r0, [r4, #0x2]
    mov r2, #0x0
    mov r3, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0226aea8
.L_021f7590:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
