; func_0202111c — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern data_02194340
        .extern func_020216c8
        .global func_0202111c
        .arm
func_0202111c:
    stmdb sp!, {r3, lr}
    ldr r1, .L_02021150
    ldr r0, .L_02021154
    ldr r1, [r1, #0x0]
    cmp r1, #0x0
    beq .L_02021148
    cmp r1, #0x1
    beq .L_02021144
    cmp r1, #0x2
    b .L_02021148
.L_02021144:
    bl func_020216c8
.L_02021148:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.L_02021150:
        .word   data_02194340
.L_02021154:
        .word   data_02194340
