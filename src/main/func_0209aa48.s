; func_0209aa48 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .global func_0209aa48
        .arm
func_0209aa48:
    ldr r0, .L_0209aa60
    ldrh r0, [r0, #0x0]
    ands r0, r0, #0x1
    movne r0, #0x1
    moveq r0, #0x0
    bx lr
.L_0209aa60:
        .word   0x4000304
