; func_02001ef4 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .global func_02001ef4
        .arm
func_02001ef4:
    ldr r3, [r0, #0x24]
    mov r1, r1, lsl #0x1c
    bic r3, r3, #0xf00
    orr ip, r3, r1, lsr #0x14
    bic r3, ip, #0xf000
    mov r1, r2, lsl #0x1c
    orr r1, r3, r1, lsr #0x10
    str r1, [r0, #0x24]
    bx lr
