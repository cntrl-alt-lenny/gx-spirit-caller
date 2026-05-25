; func_02021158 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern data_02194340
        .extern func_02021934
        .global func_02021158
        .arm
func_02021158:
    stmdb sp!, {r3, lr}
    ldr r1, .L_02021188
    ldr r0, .L_0202118c
    ldr r1, [r1, #0x0]
    cmp r1, #0x0
    beq .L_02021180
    cmp r1, #0x1
    cmpne r1, #0x2
    bne .L_02021180
    bl func_02021934
.L_02021180:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.L_02021188:
        .word   data_02194340
.L_0202118c:
        .word   data_02194340
