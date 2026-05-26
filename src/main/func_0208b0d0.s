; func_0208b0d0 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .global func_0208b0d0
        .arm
func_0208b0d0:
    mov r2, #0x0
    str r2, [r0, #0x4]
    ldr r1, [r0, #0x4]
    str r1, [r0, #0x0]
    str r2, [r0, #0xc]
    ldr r1, [r0, #0xc]
    str r1, [r0, #0x8]
    bx lr
