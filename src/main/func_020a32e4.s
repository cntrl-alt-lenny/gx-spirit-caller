; func_020a32e4 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern data_021a9850
        .global func_020a32e4
        .arm
func_020a32e4:
    ldr r0, .L_020a3304
    mov r1, #0x0
    strb r1, [r0, #0xd]
    strb r1, [r0, #0xe]
    strb r1, [r0, #0xf]
    strb r1, [r0, #0x10]
    strb r1, [r0, #0x11]
    bx lr
.L_020a3304:
        .word   data_021a9850
