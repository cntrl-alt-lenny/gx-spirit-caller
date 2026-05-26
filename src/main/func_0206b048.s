; func_0206b048 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .global func_0206b048
        .arm
func_0206b048:
    ldr r3, [r0, #0x0]
    strb r1, [r3, #0x0]
    ldr r1, [r2, #0x0]
    add r1, r1, #0x1
    str r1, [r2, #0x0]
    ldr r1, [r0, #0x0]
    add r1, r1, #0x1
    str r1, [r0, #0x0]
    bx lr
