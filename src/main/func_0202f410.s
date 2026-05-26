; func_0202f410 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .global func_0202f410
        .arm
func_0202f410:
    ldr r1, .L_0202f42c
    cmp r0, r1
    bne .L_0202f424
    mov r0, #0x1
    bx lr
.L_0202f424:
    mov r0, #0x0
    bx lr
.L_0202f42c:
        .word   0x1a6c
