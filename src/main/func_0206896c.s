; func_0206896c — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .global func_0206896c
        .arm
func_0206896c:
    ldrh r0, [r0, #0xc]
    mov r1, r0, asr #0x8
    mov r0, r0, lsl #0x8
    and r1, r1, #0xff
    and r0, r0, #0xff00
    orr r0, r1, r0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bx lr
