; func_02056a34 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .global func_02056a34
        .arm
func_02056a34:
    ldr r1, [r1, #0x8]
    cmp r1, #0x0
    beq .L_02056a50
    ldr r0, [r1, #0x0]
    cmp r0, r2
    subgt r0, r0, #0x1
    strgt r0, [r1, #0x0]
.L_02056a50:
    mov r0, #0x1
    bx lr
