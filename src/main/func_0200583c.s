; func_0200583c — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern data_021040ac
        .extern func_0209065c
        .global func_0200583c
        .arm
func_0200583c:
    stmdb sp!, {r4, lr}
    ldr r1, .L_02005870
    mov r4, r0
    ldr r0, [r1, #0x0]
    bic r0, r0, #0x1
    bl func_0209065c
    ldr r0, .L_02005874
    ldr r1, .L_02005870
    str r4, [r0, #0x8]
    ldr r0, [r1, #0x0]
    orr r0, r0, #0x1
    bl func_0209065c
    ldmia sp!, {r4, pc}
.L_02005870:
        .word   0x4000210
.L_02005874:
        .word   data_021040ac
