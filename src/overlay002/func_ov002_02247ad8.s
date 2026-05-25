; func_ov002_02247ad8 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern data_ov002_022cacc0
        .extern func_ov002_021bb068
        .extern func_ov002_021ca2b8
        .extern func_ov002_022477e8
        .global func_ov002_02247ad8
        .arm
func_ov002_02247ad8:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca2b8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, .L_02247b60
    bl func_ov002_021bb068
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r0, .L_02247b64
    mov r4, #0x0
    ldr r0, [r0, #0x0]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_02247b58
    ldr r6, .L_02247b68
.L_02247b2c:
    mov r0, r5
    mov r1, r4
    bl func_ov002_022477e8
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r0, [r6, #0x4]!
    add r4, r4, #0x1
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    bne .L_02247b2c
.L_02247b58:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_02247b60:
        .word   0x13f2
.L_02247b64:
        .word   data_ov002_022cacc0
.L_02247b68:
        .word   data_ov002_022cacc0
