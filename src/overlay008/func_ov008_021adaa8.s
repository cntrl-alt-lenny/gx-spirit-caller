; func_ov008_021adaa8 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern data_ov008_021b279c
        .extern data_ov008_021b27a0
        .extern data_ov008_021b27a4
        .extern data_ov008_021b2dc0
        .extern data_ov008_021b2dc8
        .extern data_ov008_021b2dce
        .extern func_02094504
        .global func_ov008_021adaa8
        .arm
func_ov008_021adaa8:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r3, .L_021adb9c
    mov r5, r0
    ldr r1, .L_021adba0
    ldr r4, [r3, #0x18]
    mov r0, #0x0
    mov r2, #0x1c
    bl func_02094504
    cmp r5, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, .L_021adba4
    ldr r7, .L_021adb9c
    ldrh r1, [r0, #0x6]
    ldrh r3, [r7, #0x6]
    mov r0, #0x34
    mov r1, r1, lsl #0x18
    mov r1, r1, lsr #0x18
    mul r2, r1, r0
    ldr r0, .L_021adba8
    ldr r6, .L_021adbac
    ldrh r1, [r0, r2]
    mov lr, #0x5
    bic r0, r3, #0xff
    mov r5, r1, lsr #0x1f
    smull r3, ip, r6, r1
    add ip, r5, ip, asr #0x1
    smull ip, r3, lr, ip
    smull r3, lr, r6, r1
    add lr, r5, lr, asr #0x1
    mov r3, lr, lsl #0x10
    mov r3, r3, lsr #0x10
    and r3, r3, #0xff
    orr r0, r0, r3
    strh r0, [r7, #0x6]
    subs ip, r1, ip
    beq .L_021adb64
    ldr r5, .L_021adbb0
    ldrh r3, [r5, #0x0]
    mov r0, r3, lsl #0x18
    mov r0, r0, lsr #0x18
    add r0, r0, #0x1
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r3, r3, #0xff
    and r0, r0, #0xff
    orr r0, r3, r0
    strh r0, [r5, #0x0]
.L_021adb64:
    ldr r0, .L_021adb9c
    ldr r5, .L_021adbb4
    ldrh r6, [r0, #0x6]
    ldr r3, .L_021adbb8
    mov r1, r1, lsl #0x18
    bic r6, r6, #0xff00
    orr r1, r6, r1, lsr #0x10
    ldr r5, [r5, r2]
    strh r1, [r0, #0x6]
    ldr r1, [r3, r2]
    str r5, [r0, #0xc]
    str r1, [r0, #0x10]
    str r4, [r0, #0x18]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_021adb9c:
        .word   data_ov008_021b2dc8
.L_021adba0:
        .word   data_ov008_021b2dc8
.L_021adba4:
        .word   data_ov008_021b2dc0
.L_021adba8:
        .word   data_ov008_021b279c
.L_021adbac:
        .word   0x66666667
.L_021adbb0:
        .word   data_ov008_021b2dce
.L_021adbb4:
        .word   data_ov008_021b27a0
.L_021adbb8:
        .word   data_ov008_021b27a4
