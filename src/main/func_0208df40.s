; func_0208df40 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .global func_0208df40
        .arm
func_0208df40:
    ldr r0, .L_0208df5c
    ldrh r0, [r0, #0x0]
    and r0, r0, #0x3c
    mov r0, r0, asr #0x2
    mov r0, r0, lsl #0xe
    add r0, r0, #0x6200000
    bx lr
.L_0208df5c:
        .word   0x4001008
