; func_ov002_022961a0 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern func_ov002_021ba6cc
        .global func_ov002_022961a0
        .arm
func_ov002_022961a0:
    ldrh r2, [r0, #0x2]
    ldrh r1, [r0, #0x0]
    ldr ip, .L_022961b8
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bx ip
.L_022961b8:
        .word   func_ov002_021ba6cc
