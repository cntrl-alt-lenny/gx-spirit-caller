; func_ov002_02200630 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .global func_ov002_02200630
        .arm
func_ov002_02200630:
    ldrh r0, [r0, #0x2]
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x6
    cmpne r0, #0x7
    movne r0, #0x0
    moveq r0, #0x1
    bx lr
