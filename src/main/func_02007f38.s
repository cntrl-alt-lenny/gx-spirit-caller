; func_02007f38 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern data_02104f3c
        .global func_02007f38
        .arm
func_02007f38:
    mov r0, #0x0
    orr r0, r0, #0x21
    orr r1, r0, #0x8400
    ldr r0, .L_02007f54
    orr r1, r1, #0x52000000
    str r1, [r0, #0xa74]
    bx lr
.L_02007f54:
        .word   data_02104f3c
