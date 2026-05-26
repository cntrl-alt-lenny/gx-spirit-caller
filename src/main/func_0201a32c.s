; func_0201a32c — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern GetSystemWork
        .global func_0201a32c
        .arm
func_0201a32c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl GetSystemWork
    ldr r1, [r0, #0x8e4]
    add r2, r4, r1, lsr #0x18
    bic r1, r1, #0xff000000
    cmp r2, #0xff
    orrhi r1, r1, #0xff000000
    orrls r1, r1, r2, lsl #0x18
    str r1, [r0, #0x8e4]
    ldr r1, [r0, #0x8e4]
    cmp r4, #0xa
    movge r4, #0xf
    mov r2, r1, lsl #0x8
    add r3, r4, r2, lsr #0x18
    cmp r3, #0xff
    bichi r1, r1, #0xff0000
    orrhi r1, r1, #0xff0000
    bicls r2, r1, #0xff0000
    movls r1, r3, lsl #0x18
    orrls r1, r2, r1, lsr #0x8
    str r1, [r0, #0x8e4]
    ldmia sp!, {r4, pc}
