; func_0201f2f4 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern data_02191f40
        .extern func_0201f19c
        .extern func_0201f34c
        .extern func_0209ee10
        .global func_0201f2f4
        .arm
func_0201f2f4:
    stmdb sp!, {r3, lr}
    ldr r0, .L_0201f344
    ldr r0, [r0, #0x30]
    sub r0, r0, #0x4
    cmp r0, #0x2
    movls r0, #0x1
    ldmlsia sp!, {r3, pc}
    ldr r0, .L_0201f348
    bl func_0209ee10
    cmp r0, #0x2
    beq .L_0201f32c
    bl func_0201f19c
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_0201f32c:
    ldr r1, .L_0201f344
    mov r0, #0x0
    strh r0, [r1, #0x4]
    mov r0, #0x1
    strh r0, [r1, #0xa]
    ldmia sp!, {r3, pc}
.L_0201f344:
        .word   data_02191f40
.L_0201f348:
        .word   func_0201f34c
