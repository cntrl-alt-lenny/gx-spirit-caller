; func_0209bf18 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .global func_0209bf18
        .arm
func_0209bf18:
    ldr r3, [r0, #0x4]
    ldr r2, [r0, #0x0]
    mov r1, #0x3c
    mla r3, r2, r1, r3
    ldr r0, [r0, #0x8]
    mla r0, r3, r1, r0
    bx lr
