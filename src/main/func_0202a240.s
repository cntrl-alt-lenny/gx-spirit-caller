; func_0202a240 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern data_0219a934
        .extern Task_InvokeLocked
        .extern func_0202a998
        .global func_0202a240
        .arm
func_0202a240:
    stmdb sp!, {r4, lr}
    ldr r0, .L_0202a274
    ldr r4, .L_0202a278
    ldr r0, [r0, #0x0]
    cmp r0, #0x0
    beq .L_0202a268
    ldr r0, [r4, #0x0]
    bl Task_InvokeLocked
    mov r0, #0x0
    str r0, [r4, #0x0]
.L_0202a268:
    bl func_0202a998
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_0202a274:
        .word   data_0219a934
.L_0202a278:
        .word   data_0219a934
