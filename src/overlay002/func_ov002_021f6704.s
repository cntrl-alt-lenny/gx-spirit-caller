; func_ov002_021f6704 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern func_ov002_021d5b80
        .extern func_ov002_021deb28
        .global func_ov002_021f6704
        .arm
func_ov002_021f6704:
    stmdb sp!, {r3, lr}
    ldrh r1, [r0, #0x2]
    mov r2, r1, lsl #0x12
    mov r2, r2, lsr #0x1e
    cmp r2, #0x2
    beq .L_021f6734
    mov r0, r1, lsl #0x1f
    mov r1, r1, lsl #0x1a
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021deb28
    b .L_021f674c
.L_021f6734:
    ldrh r2, [r0, #0x0]
    mov r0, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r1, #0xb
    mov r3, #0x0
    bl func_ov002_021d5b80
.L_021f674c:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
