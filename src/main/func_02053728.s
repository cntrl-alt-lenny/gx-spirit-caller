; func_02053728 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .global func_02053728
        .arm
func_02053728:
    ldr r2, [r0, #0x0]
    ldr r1, .L_02053744
    ldr r0, [r0, #0x4]
    and r1, r2, r1
    orr r1, r1, #0x0
    orr r0, r0, #0x0
    bx lr
.L_02053744:
        .word   0x7ff
