; func_02023f28 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .global func_02023f28
        .arm
func_02023f28:
    ldr r3, .L_02023f48
    ldrsh r1, [r0, #0xc8]
    ldrh r2, [r3, #0x0]
    mov r0, #0x1
    bic r2, r2, #0x3
    orr r1, r2, r1
    strh r1, [r3, #0x0]
    bx lr
.L_02023f48:
        .word   0x4000008
