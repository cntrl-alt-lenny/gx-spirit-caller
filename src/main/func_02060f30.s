; func_02060f30 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern data_02101354
        .global func_02060f30
        .arm
func_02060f30:
    ldr r1, .L_02060f4c
    mvn r0, #0x0
    ldr r1, [r1, #0x0]
    cmp r1, r0
    movne r0, #0x1
    moveq r0, #0x0
    bx lr
.L_02060f4c:
        .word   data_02101354
