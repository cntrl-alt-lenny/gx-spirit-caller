; func_0202c46c — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern data_0219a93c
        .global func_0202c46c
        .arm
func_0202c46c:
    ldr r1, .L_0202c48c
    ldr r2, [r1, #0x4]
    ldr r1, [r2, #0x0]
    ldr r2, [r2, #0x8]
    add r0, r1, r0, lsl #0x3
    ldr r0, [r0, #0x4]
    add r0, r2, r0
    bx lr
.L_0202c48c:
        .word   data_0219a93c
