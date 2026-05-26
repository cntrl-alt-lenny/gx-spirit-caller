; func_ov011_021cd6e0 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern data_ov011_021d31d8
        .global func_ov011_021cd6e0
        .arm
func_ov011_021cd6e0:
    ldr r2, .L_021cd6fc
    sub r3, r0, #0x1
    mov r0, #0x14
    mla r0, r3, r0, r2
    sub r1, r1, #0x1
    ldr r0, [r0, r1, lsl #0x2]
    bx lr
.L_021cd6fc:
        .word   data_ov011_021d31d8
