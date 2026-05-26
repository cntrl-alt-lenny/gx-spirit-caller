; func_0207f85c — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .global func_0207f85c
        .arm
func_0207f85c:
    mov r3, #0x0
    mvn r2, #0x0
.L_0207f864:
    add r1, r0, r3, lsl #0x2
    add r3, r3, #0x1
    str r2, [r1, #0x8]
    cmp r3, #0x3
    blt .L_0207f864
    bx lr
