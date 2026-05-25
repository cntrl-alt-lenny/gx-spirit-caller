; func_ov008_021ac2ac — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern data_ov008_021b2dc0
        .extern func_0208e2f4
        .extern func_02094504
        .global func_ov008_021ac2ac
        .arm
func_ov008_021ac2ac:
    stmdb sp!, {r3, lr}
    ldr r1, .L_021ac34c
    mov r0, #0x0
    mov r2, #0x8
    bl func_02094504
    ldr ip, .L_021ac350
    mov r1, #0x10
    ldr r0, [ip, #0x0]
    ldr r2, [ip, #0x0]
    and r0, r0, #0x1f00
    mov r0, r0, lsr #0x8
    bic r0, r0, #0x2
    bic r2, r2, #0x1f00
    orr r0, r0, #0x8
    orr r3, r2, r0, lsl #0x8
    add r0, ip, #0x50
    sub r2, r1, #0x18
    str r3, [ip, #0x0]
    bl func_0208e2f4
    ldr ip, .L_021ac354
    ldr r1, .L_021ac358
    ldrh r2, [ip, #0x0]
    sub r3, ip, #0x4a
    mov r0, #0x1
    bic r2, r2, #0x3f00
    orr r2, r2, #0x3000
    strh r2, [ip, #0x0]
    ldrh r2, [ip, #0x0]
    bic r2, r2, #0x3f
    orr r2, r2, #0x1f
    strh r2, [ip, #0x0]
    ldr r2, [r3, #0x0]
    bic r2, r2, #0xe000
    orr r2, r2, #0x8000
    str r2, [r3, #0x0]
    ldrh r2, [r1, #0x6]
    bic r2, r2, #0xff
    orr r2, r2, #0x1a
    strh r2, [r1, #0x6]
    ldmia sp!, {r3, pc}
.L_021ac34c:
        .word   data_ov008_021b2dc0
.L_021ac350:
        .word   0x4001000
.L_021ac354:
        .word   0x400104a
.L_021ac358:
        .word   data_ov008_021b2dc0
