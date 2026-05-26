; func_02085864 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .global func_02085864
        .arm
func_02085864:
    mov r2, #0x1000
    str r2, [r0, #0x0]
    mov r1, #0x0
    str r1, [r0, #0x4]
    str r1, [r0, #0x10]
    str r2, [r0, #0x14]
    str r1, [r0, #0x30]
    str r1, [r0, #0x34]
    bx lr
