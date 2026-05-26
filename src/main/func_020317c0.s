; func_020317c0 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .global func_020317c0
        .arm
func_020317c0:
    ldr r1, .L_020317dc
    cmp r0, r1
    bne .L_020317d4
    mov r0, #0x1
    bx lr
.L_020317d4:
    mov r0, #0x0
    bx lr
.L_020317dc:
        .word   0x1a9f
