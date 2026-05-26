; func_ov002_021f2ca8 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021c1e44
        .global func_ov002_021f2ca8
        .arm
func_ov002_021f2ca8:
    stmdb sp!, {r3, lr}
    ldrh r3, [r0, #0x2]
    mov r3, r3, lsl #0x1f
    mov r3, r3, lsr #0x1f
    cmp r3, r1
    movne r0, #0x0
    ldmneia sp!, {r3, pc}
    ldr r3, .L_021f2d30
    ldr ip, .L_021f2d34
    and lr, r1, #0x1
    mla ip, lr, r3, ip
    mov r3, #0x14
    mul lr, r2, r3
    add r3, ip, #0x30
    ldr ip, [r3, lr]
    mov r3, ip, lsl #0x13
    movs r3, r3, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    mov r3, ip, lsl #0x2
    ldrh lr, [r0, #0x4]
    mov r3, r3, lsr #0x18
    mov ip, ip, lsl #0x12
    mov r3, r3, lsl #0x1
    mov lr, lr, lsl #0x11
    add r3, r3, ip, lsr #0x1f
    cmp r3, lr, lsr #0x17
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    bl func_ov002_021c1e44
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, pc}
.L_021f2d30:
        .word   0x868
.L_021f2d34:
        .word   data_ov002_022cf16c
