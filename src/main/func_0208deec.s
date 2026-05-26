; func_0208deec — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .global func_0208deec
        .arm
func_0208deec:
    ldr r0, .L_0208df08
    ldrh r0, [r0, #0x0]
    and r0, r0, #0x3c
    mov r0, r0, asr #0x2
    mov r0, r0, lsl #0xe
    add r0, r0, #0x6200000
    bx lr
.L_0208df08:
        .word   0x400100a
