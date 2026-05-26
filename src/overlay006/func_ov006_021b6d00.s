; func_ov006_021b6d00 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .global func_ov006_021b6d00
        .arm
func_ov006_021b6d00:
    add r0, r0, r1, lsl #0x1
    cmp r2, #0x0
    addne r0, r0, #0xc600
    ldrneh r0, [r0, #0x6c]
    addeq r0, r0, #0xc600
    ldreqh r0, [r0, #0x62]
    bx lr
