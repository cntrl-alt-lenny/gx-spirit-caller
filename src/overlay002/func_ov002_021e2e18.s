; func_ov002_021e2e18 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .global func_ov002_021e2e18
        .arm
func_ov002_021e2e18:
    ldr r1, .L_021e2e34
    cmp r0, r1
    bne .L_021e2e2c
    mov r0, #0x0
    bx lr
.L_021e2e2c:
    mov r0, #0x1
    bx lr
.L_021e2e34:
        .word   0x18ec
