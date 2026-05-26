; func_0200b0c8 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern Task_InvokeLocked
        .global func_0200b0c8
        .arm
func_0200b0c8:
    stmdb sp!, {r4, r5, r6, lr}
    movs r6, r0
    beq .L_0200b11c
    ldr r5, [r6, #0x0]
    mov r4, #0x0
    cmp r5, #0x0
    ble .L_0200b104
.L_0200b0e4:
    ldr r0, [r6, #0x4]
    ldr r0, [r0, r4, lsl #0x2]
    cmp r0, #0x0
    beq .L_0200b0f8
    bl Task_InvokeLocked
.L_0200b0f8:
    add r4, r4, #0x1
    cmp r4, r5
    blt .L_0200b0e4
.L_0200b104:
    ldr r0, [r6, #0x4]
    bl Task_InvokeLocked
    mov r0, r6
    bl Task_InvokeLocked
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_0200b11c:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
