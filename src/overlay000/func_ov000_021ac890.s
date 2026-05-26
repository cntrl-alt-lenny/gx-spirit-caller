; func_ov000_021ac890 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .global func_ov000_021ac890
        .arm
func_ov000_021ac890:
    ldr r0, [r0, #0x9c]
    mov r1, r0, lsl #0x18
    mov r1, r1, lsr #0x18
    mov r0, r0, lsl #0x10
    cmp r1, r0, lsr #0x18
    movne r0, #0x1
    moveq r0, #0x0
    bx lr
