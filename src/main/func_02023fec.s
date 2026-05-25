; func_02023fec — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern data_0219a8e4
        .extern Task_InvokeLocked
        .global func_02023fec
        .arm
func_02023fec:
    stmdb sp!, {r4, lr}
    ldr r0, .L_0202401c
    ldr r4, .L_02024020
    ldr r0, [r0, #0x0]
    cmp r0, #0x0
    beq .L_02024014
    ldr r0, [r4, #0x0]
    bl Task_InvokeLocked
    mov r0, #0x0
    str r0, [r4, #0x0]
.L_02024014:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_0202401c:
        .word   data_0219a8e4
.L_02024020:
        .word   data_0219a8e4
