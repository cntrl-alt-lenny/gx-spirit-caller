; func_02067850 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern data_02101928
        .global func_02067850
        .arm
func_02067850:
    cmp r0, #0x32
    bxlt lr
    cmp r0, #0xfe
    bxgt lr
    ldr r2, .L_0206786c
    str r1, [r2, r0, lsl #0x2]
    bx lr
.L_0206786c:
        .word   data_02101928
