; func_ov006_021b8f88 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .global func_ov006_021b8f88
        .arm
func_ov006_021b8f88:
    add r0, r0, #0xc000
    ldr r2, [r0, #0xa94]
    cmp r1, r2
    movge r0, #0x0
    ldrlt r2, [r0, #0xa90]
    movlt r0, r1, lsl #0x1
    ldrlth r0, [r2, r0]
    bx lr
