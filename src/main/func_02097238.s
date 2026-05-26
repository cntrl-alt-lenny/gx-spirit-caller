; func_02097238 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .global func_02097238
        .arm
func_02097238:
    cmp r2, #0x0
    moveq r1, #0x0
    beq .L_0209724c
    cmp r1, #0x0
    moveq r2, #0x0
.L_0209724c:
    str r1, [r0, #0x54]
    str r2, [r0, #0x58]
    bx lr
