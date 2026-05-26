; func_020644a4 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .global func_020644a4
        .arm
func_020644a4:
    ldrb r2, [r0, r1]
    add r1, r1, #0x1
    ldrb r1, [r0, r1]
    mov r0, r2, lsl #0x8
    and r0, r0, #0xff00
    mov r0, r0, lsl #0x10
    orr r0, r1, r0, lsr #0x10
    bx lr
