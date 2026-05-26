; func_0208e200 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .global func_0208e200
        .arm
func_0208e200:
    ldr r0, .L_0208e21c
    ldrh r0, [r0, #0x0]
    and r0, r0, #0x1f00
    mov r0, r0, asr #0x8
    mov r0, r0, lsl #0xb
    add r0, r0, #0x6200000
    bx lr
.L_0208e21c:
        .word   0x4001008
