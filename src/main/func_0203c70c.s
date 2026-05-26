; func_0203c70c — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .global func_0203c70c
        .arm
func_0203c70c:
    cmp r0, #0x0
    beq .L_0203c720
    ldrh r0, [r0, #0xb0]
    tst r0, #0x800
    beq .L_0203c728
.L_0203c720:
    mov r0, #0x1
    bx lr
.L_0203c728:
    mov r0, #0x0
    bx lr
