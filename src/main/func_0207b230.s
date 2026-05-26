; func_0207b230 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern data_021a088c
        .global func_0207b230
        .arm
func_0207b230:
    ldr r0, .L_0207b248
    ldr r1, .L_0207b24c
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    str r1, [r0, #0x264]
    bx lr
.L_0207b248:
        .word   data_021a088c
.L_0207b24c:
        .word   0xaaa082
