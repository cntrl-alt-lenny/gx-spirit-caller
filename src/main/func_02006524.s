; func_02006524 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern data_02103da4
        .extern data_027e0000
        .extern func_020919d8
        .global func_02006524
        .arm
func_02006524:
    stmdb sp!, {r3, lr}
    ldr r1, .L_020065a0
    ldr r0, .L_020065a4
    ldr r2, [r1, #0x31c]
    add r0, r0, #0x3000
    orr r2, r2, #0x1
    str r2, [r1, #0x31c]
    ldr r3, [r1, #0x334]
    ldr r2, [r0, #0xff8]
    add r3, r3, #0x1
    str r3, [r1, #0x334]
    ldr r1, [r1, #0x314]
    orr r2, r2, #0x1
    str r2, [r0, #0xff8]
    cmp r1, #0x0
    beq .L_02006568
    blx r1
.L_02006568:
    ldr r0, .L_020065a0
    ldr r0, [r0, #0x310]
    cmp r0, #0x0
    beq .L_0200657c
    blx r0
.L_0200657c:
    ldr r0, .L_020065a0
    ldr r0, [r0, #0x30c]
    cmp r0, #0x0
    beq .L_02006590
    blx r0
.L_02006590:
    ldr r0, .L_020065a0
    ldr r0, [r0, #0x0]
    bl func_020919d8
    ldmia sp!, {r3, pc}
.L_020065a0:
        .word   data_02103da4
.L_020065a4:
        .word   data_027e0000
