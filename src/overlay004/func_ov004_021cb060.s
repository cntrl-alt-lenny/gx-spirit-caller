; func_ov004_021cb060 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern data_ov004_0220b500
        .extern func_02005ca0
        .extern func_02005e20
        .extern func_0201d400
        .extern func_0208c884
        .extern func_0208e318
        .extern func_ov004_021cb9e4
        .extern func_ov004_021cda8c
        .extern func_ov004_021cdd1c
        .extern func_ov004_021ce4a8
        .extern func_ov004_021cf638
        .extern func_ov004_021cfb84
        .extern func_ov004_021d06ac
        .extern func_ov004_021d2520
        .extern func_ov004_021d2ec4
        .extern func_ov004_021d3390
        .extern func_ov004_021d3578
        .extern func_ov004_021d3818
        .global func_ov004_021cb060
        .arm
func_ov004_021cb060:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    ldr r0, .L_021cb264
    mov r1, #0x0
    str r1, [r0, #0x60]
    ldr r1, [r0, #0x48]
    ldr r0, [r0, #0x4c]
    ldr r4, .L_021cb268
    cmp r1, r0
    ldr r0, [r4, #0x5c]
    beq .L_021cb164
    add r0, r0, #0x1
    str r0, [r4, #0x5c]
    cmp r0, #0x10
    ble .L_021cb170
    ldr r0, [r4, #0x4c]
    mov r1, #0x10
    str r1, [r4, #0x5c]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b .L_021cb0e4
.L_021cb0b4: ; jump table
    b .L_021cb0c8 ; case 0
    b .L_021cb0d0 ; case 1
    b .L_021cb0e4 ; case 2
    b .L_021cb0d8 ; case 3
    b .L_021cb0e0 ; case 4
.L_021cb0c8:
    bl func_ov004_021cdd1c
    b .L_021cb0e4
.L_021cb0d0:
    bl func_ov004_021cfb84
    b .L_021cb0e4
.L_021cb0d8:
    bl func_ov004_021d2520
    b .L_021cb0e4
.L_021cb0e0:
    bl func_ov004_021d3818
.L_021cb0e4:
    ldr r0, [r4, #0x48]
    str r0, [r4, #0x4c]
    cmp r0, #0xb
    addls pc, pc, r0, lsl #0x2
    b .L_021cb170
.L_021cb0f8: ; jump table
    b .L_021cb128 ; case 0
    b .L_021cb130 ; case 1
    b .L_021cb170 ; case 2
    b .L_021cb138 ; case 3
    b .L_021cb140 ; case 4
    b .L_021cb148 ; case 5
    b .L_021cb148 ; case 6
    b .L_021cb148 ; case 7
    b .L_021cb148 ; case 8
    b .L_021cb170 ; case 9
    b .L_021cb170 ; case 10
    b .L_021cb154 ; case 11
.L_021cb128:
    bl func_ov004_021cb9e4
    b .L_021cb170
.L_021cb130:
    bl func_ov004_021ce4a8
    b .L_021cb170
.L_021cb138:
    bl func_ov004_021d06ac
    b .L_021cb170
.L_021cb140:
    bl func_ov004_021d3390
    b .L_021cb170
.L_021cb148:
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r3, r4, pc}
.L_021cb154:
    bl func_0201d400
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r3, r4, pc}
.L_021cb164:
    cmp r0, #0x0
    subgt r0, r0, #0x1
    strgt r0, [r4, #0x5c]
.L_021cb170:
    ldr r0, [r4, #0x4c]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b .L_021cb1f0
.L_021cb180: ; jump table
    b .L_021cb194 ; case 0
    b .L_021cb1ac ; case 1
    b .L_021cb1f0 ; case 2
    b .L_021cb1c4 ; case 3
    b .L_021cb1dc ; case 4
.L_021cb194:
    bl func_ov004_021cda8c
    cmp r0, #0x0
    beq .L_021cb1f0
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r3, r4, pc}
.L_021cb1ac:
    bl func_ov004_021cf638
    cmp r0, #0x0
    beq .L_021cb1f0
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r3, r4, pc}
.L_021cb1c4:
    bl func_ov004_021d2ec4
    cmp r0, #0x0
    beq .L_021cb1f0
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r3, r4, pc}
.L_021cb1dc:
    bl func_ov004_021d3578
    cmp r0, #0x0
    addne sp, sp, #0x4
    movne r0, #0x1
    ldmneia sp!, {r3, r4, pc}
.L_021cb1f0:
    ldr r1, [r4, #0x0]
    mov r0, #0x1
    add r1, r1, #0x1
    str r1, [r4, #0x0]
    bl func_02005e20
    mov r0, #0x2
    bl func_02005e20
    mov r0, #0x1
    bl func_02005ca0
    mov r0, #0x2
    bl func_02005ca0
    mov r0, #0x0
    str r0, [sp, #0x0]
    ldr r0, .L_021cb26c
    mov r1, #0x1
    mov r2, #0x3f
    mov r3, #0x10
    bl func_0208e318
    ldr r0, .L_021cb270
    ldr r1, [r4, #0x5c]
    rsb r1, r1, #0x0
    bl func_0208c884
    ldr r1, [r4, #0x5c]
    ldr r0, .L_021cb274
    rsb r1, r1, #0x0
    bl func_0208c884
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
.L_021cb264:
        .word   data_ov004_0220b500
.L_021cb268:
        .word   data_ov004_0220b500
.L_021cb26c:
        .word   0x4000050
.L_021cb270:
        .word   0x400006c
.L_021cb274:
        .word   0x400106c
