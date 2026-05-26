; func_ov002_021f8244 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern func_ov002_021d91e0
        .extern func_ov002_021f60fc
        .global func_ov002_021f8244
        .arm
func_ov002_021f8244:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov002_021f60fc
    cmp r0, #0x0
    beq .L_021f8288
    ldrh r1, [r4, #0x2]
    mov r0, r1, lsl #0x12
    movs r0, r0, lsr #0x1e
    bne .L_021f8280
    mov r0, r1, lsl #0x1f
    mov r1, r1, lsl #0x1a
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r2, #0x3
    bl func_ov002_021d91e0
.L_021f8280:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_021f8288:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
