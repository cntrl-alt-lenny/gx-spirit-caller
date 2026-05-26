; func_0200b59c — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern Fill32
        .extern Task_PostLocked
        .global func_0200b59c
        .arm
func_0200b59c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r0, #0x18
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    movs r4, r0
    beq .L_0200b60c
    mov r1, r4
    mov r0, #0x0
    mov r2, #0x18
    bl Fill32
    ldr r0, [r5, #0x18]
    str r0, [r4, #0x0]
    ldr r0, [r5, #0x20]
    add r0, r5, r0
    str r0, [r4, #0x4]
    ldr r0, [r5, #0x28]
    add r0, r5, r0
    str r0, [r4, #0x8]
    ldr r0, [r5, #0x30]
    add r0, r5, r0
    str r0, [r4, #0xc]
    ldr r0, [r5, #0x34]
    str r0, [r4, #0x10]
    ldr r0, [r5, #0x38]
    add r0, r5, r0
    str r0, [r4, #0x14]
.L_0200b60c:
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
