; func_ov002_022a1870 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .global func_ov002_022a1870
        .arm
func_ov002_022a1870:
    ldr r1, [r0, #0x4]
    cmp r1, #0xc
    cmpne r1, #0x20
    bne .L_022a1888
    mov r0, #0x0
    bx lr
.L_022a1888:
    ldr r0, [r0, #0x0]
    bx lr
