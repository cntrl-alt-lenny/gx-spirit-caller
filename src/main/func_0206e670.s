; func_0206e670 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .global func_0206e670
        .arm
func_0206e670:
    mov r2, r0, lsr #0x18
    strb r2, [r1, #0x0]
    mov r2, r0, lsr #0x10
    strb r2, [r1, #0x1]
    mov r2, r0, lsr #0x8
    strb r2, [r1, #0x2]
    strb r0, [r1, #0x3]
    bx lr
