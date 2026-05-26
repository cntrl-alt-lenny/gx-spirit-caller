; func_0200fd84 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern data_0218dbc8
        .global func_0200fd84
        .arm
func_0200fd84:
    ldr r1, .L_0200fdbc
    ldr r1, [r1, #0x910]
    cmp r1, #0x0
    beq .L_0200fdb4
    ldr r2, [r0, #0x0]
.L_0200fd98:
    ldr r0, [r1, #0x8]
    cmp r0, r2
    moveq r0, r1
    bxeq lr
    ldr r1, [r1, #0x0]
    cmp r1, #0x0
    bne .L_0200fd98
.L_0200fdb4:
    mov r0, #0x0
    bx lr
.L_0200fdbc:
        .word   data_0218dbc8
