; func_020097a4 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern data_021059b8
        .global func_020097a4
        .arm
func_020097a4:
    mov r1, r0, asr #0x4
    add r2, r0, r1, lsr #0x1b
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1b
    ldr r3, .L_020097d0
    mov r2, r2, asr #0x5
    ldr r2, [r3, r2, lsl #0x2]
    add r0, r1, r0, ror #0x1b
    mov r1, #0x1
    and r0, r2, r1, lsl r0
    bx lr
.L_020097d0:
        .word   data_021059b8
