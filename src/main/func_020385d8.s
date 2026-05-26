; func_020385d8 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .global func_020385d8
        .arm
func_020385d8:
    mov r1, r1, lsl #0x8
    strh r1, [r0, #0x2]
    ldrsh r2, [r0, #0x2]
    mov r1, #0x0
    strh r2, [r0, #0x0]
    strh r1, [r0, #0x6]
    strh r1, [r0, #0x4]
    bx lr
