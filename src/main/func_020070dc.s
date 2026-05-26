; func_020070dc — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .global func_020070dc
        .arm
func_020070dc:
    ldrsb r1, [r0], #0x1
    mov r2, #0x0
    cmp r1, #0x0
    beq .L_020070fc
.L_020070ec:
    ldrsb r1, [r0], #0x1
    add r2, r2, #0x1
    cmp r1, #0x0
    bne .L_020070ec
.L_020070fc:
    mov r0, r2
    bx lr
