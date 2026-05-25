; func_ov006_021be948 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern data_ov006_021cc034
        .extern data_ov006_021cc03c
        .extern data_ov006_021cc050
        .extern data_ov006_021cc064
        .extern data_ov006_021cc078
        .extern data_ov006_021cc164
        .extern data_ov006_021cc1b8
        .extern data_ov006_021cc268
        .extern data_ov006_021cc2c8
        .extern data_ov006_021cc334
        .extern data_ov006_021cc618
        .extern data_ov006_021cca50
        .extern data_ov006_0224f448
        .extern data_ov006_0225de70
        .extern func_ov006_021b6d1c
        .extern func_ov006_021b6f50
        .extern func_ov006_021bd6bc
        .extern func_ov006_021c6bdc
        .global func_ov006_021be948
        .arm
func_ov006_021be948:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0xc
    mov r9, r0
    ldr r0, [sp, #0x34]
    ldr r6, [r9, #0x50]
    mov r4, #0x0
    str r4, [r0, #0x0]
    str r4, [r0, #0x4]
    str r4, [r0, #0x8]
    str r0, [sp, #0x34]
    add r4, r9, #0xa0
    mov r0, #0x24
    ldr r5, [r9, #0x40]
    mla r4, r6, r0, r4
    mov r8, r1
    mov r7, r2
    cmp r5, #0x6
    addls pc, pc, r5, lsl #0x2
    b .L_021be9b0
.L_021be994: ; jump table
    b .L_021be9b8 ; case 0
    b .L_021be9b8 ; case 1
    b .L_021be9b8 ; case 2
    b .L_021be9b8 ; case 3
    b .L_021be9b0 ; case 4
    b .L_021be9b0 ; case 5
    b .L_021be9b0 ; case 6
.L_021be9b0:
    mov r3, #0x0
    str r3, [sp, #0x30]
.L_021be9b8:
    cmp r3, #0x0
    beq .L_021beb10
    ldr r1, [r9, #0x50]
    mov r0, r9
    bl func_ov006_021bd6bc
    movs r2, r0
    bmi .L_021beb10
    ldr r0, [r4, #0x20]
    ldr r1, [r9, #0x50]
    mov r3, r0, lsl #0x1f
    ldr r0, .L_021bee2c
    mov r3, r3, lsr #0x1f
    bl func_ov006_021b6d1c
    ldr r1, .L_021bee30
    ldr r11, .L_021bee34
    ldr r10, .L_021bee38
    ldr r6, .L_021bee3c
    str r1, [sp, #0x0]
    str r0, [sp, #0x4]
    mov r5, #0x0
.L_021bea08:
    ldr r0, .L_021bee2c
    ldr r2, [sp, #0x4]
    mov r1, r5
    bl func_ov006_021b6f50
    cmp r0, #0x0
    ble .L_021beaec
    ldr r1, [r9, #0x40]
    cmp r1, #0x6
    addls pc, pc, r1, lsl #0x2
    b .L_021bea64
.L_021bea30: ; jump table
    b .L_021bea4c ; case 0
    b .L_021bea54 ; case 1
    b .L_021bea5c ; case 2
    b .L_021bea4c ; case 3
    b .L_021bea64 ; case 4
    b .L_021bea4c ; case 5
    b .L_021bea64 ; case 6
.L_021bea4c:
    ldr r1, [sp, #0x0]
    b .L_021bea68
.L_021bea54:
    mov r1, r11
    b .L_021bea68
.L_021bea5c:
    mov r1, r10
    b .L_021bea68
.L_021bea64:
    mov r1, r6
.L_021bea68:
    sub r0, r0, #0x1
    ldrsh r2, [r1, #0x2]
    add r0, r0, r0, lsl #0x1
    add r3, r0, #0x1
    add ip, r3, r3, lsr #0x1f
    sub r3, r2, #0x7
    mov r3, r3, lsl #0x10
    ldrsh r1, [r1, #0x0]
    str r3, [sp, #0x8]
    add r2, r2, #0x7
    add r3, r1, #0x6
    add r3, r3, ip, asr #0x1
    add r0, r0, r0, lsr #0x1f
    sub r1, r1, #0x6
    sub r0, r1, r0, asr #0x1
    mov r0, r0, lsl #0x10
    cmp r8, r0, asr #0x10
    ldrge r0, [sp, #0x8]
    mov r2, r2, lsl #0x10
    mov r3, r3, lsl #0x10
    cmpge r7, r0, asr #0x10
    blt .L_021beaec
    cmp r8, r3, asr #0x10
    cmple r7, r2, asr #0x10
    bgt .L_021beaec
    ldr r0, [sp, #0x34]
    mov r1, #0x3
    stmia r0, {r1, r5}
    ldr r1, [sp, #0x4]
    add sp, sp, #0xc
    str r1, [r0, #0x8]
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_021beaec:
    ldr r0, [sp, #0x0]
    add r5, r5, #0x1
    add r0, r0, #0x4
    cmp r5, #0x5
    str r0, [sp, #0x0]
    add r11, r11, #0x4
    add r10, r10, #0x4
    add r6, r6, #0x4
    blt .L_021bea08
.L_021beb10:
    ldr r0, [sp, #0x30]
    cmp r0, #0x0
    beq .L_021beb64
    ldr r0, .L_021bee40
    ldr r1, .L_021bee44
    ldrsh r0, [r0, #0x0]
    cmp r8, r0
    ldrgesh r0, [r1, #0x2]
    cmpge r7, r0
    blt .L_021beb64
    ldrsh r0, [r1, #0x4]
    cmp r8, r0
    ldrlesh r0, [r1, #0x6]
    cmple r7, r0
    bgt .L_021beb64
    ldr r0, [sp, #0x34]
    mov r1, #0x4
    str r1, [r0, #0x0]
    add sp, sp, #0xc
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_021beb64:
    ldr r0, [r9, #0x40]
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b .L_021bebdc
.L_021beb74: ; jump table
    b .L_021beb90 ; case 0
    b .L_021bebac ; case 1
    b .L_021bebb8 ; case 2
    b .L_021beb90 ; case 3
    b .L_021bebdc ; case 4
    b .L_021bebc4 ; case 5
    b .L_021bebd0 ; case 6
.L_021beb90:
    ldr r0, [r9, #0x50]
    cmp r0, #0x4
    ldreq r10, .L_021bee48
    moveq r6, #0x9
    ldrne r10, .L_021bee4c
    movne r6, #0x1a
    b .L_021bebe4
.L_021bebac:
    ldr r10, .L_021bee50
    mov r6, #0x7
    b .L_021bebe4
.L_021bebb8:
    ldr r10, .L_021bee54
    mov r6, #0xf
    b .L_021bebe4
.L_021bebc4:
    ldr r10, .L_021bee58
    mov r6, #0x9
    b .L_021bebe4
.L_021bebd0:
    ldr r10, .L_021bee5c
    mov r6, #0x7
    b .L_021bebe4
.L_021bebdc:
    ldr r10, .L_021bee60
    mov r6, #0x8
.L_021bebe4:
    cmp r6, #0x0
    mov r5, #0x0
    ble .L_021bece8
.L_021bebf0:
    ldr r0, [r10, #0x8]
    cmp r0, #0x16
    blt .L_021bec6c
    cmp r0, #0x1d
    bgt .L_021bec6c
    ldr r1, [r4, #0x20]
    mov r1, r1, lsl #0x1f
    movs r1, r1, lsr #0x1f
    bne .L_021becd8
    ldr r1, [r9, #0x50]
    cmp r1, #0x4
    beq .L_021becd8
    cmp r0, #0x16
    blt .L_021bec38
    cmp r0, #0x19
    movle r11, #0x1
    suble r3, r0, #0x16
    ble .L_021bec40
.L_021bec38:
    mov r11, #0x0
    sub r3, r0, #0x1a
.L_021bec40:
    ldr r2, [r4, #0x10]
    ldr r1, [r4, #0x8]
    sub r1, r2, r1
    cmp r3, r1
    bge .L_021becd8
    cmp r11, #0x0
    beq .L_021bec6c
    add r1, r4, r3
    ldrsb r1, [r1, #0x1c]
    cmp r1, #0x0
    beq .L_021becd8
.L_021bec6c:
    ldr r1, [r9, #0x40]
    cmp r1, #0x3
    cmpeq r0, #0x1
    beq .L_021becd8
    ldr r0, .L_021bee64
    bl func_ov006_021c6bdc
    cmp r0, #0x0
    ldreq r0, [r10, #0x8]
    cmpeq r0, #0x5
    beq .L_021becd8
    ldrsh r0, [r10, #0x0]
    cmp r8, r0
    ldrgesh r0, [r10, #0x2]
    cmpge r7, r0
    blt .L_021becd8
    ldrsh r0, [r10, #0x4]
    cmp r8, r0
    ldrlesh r0, [r10, #0x6]
    cmple r7, r0
    bgt .L_021becd8
    ldr r1, [sp, #0x34]
    mov r0, #0x1
    str r0, [r1, #0x0]
    ldr r2, [r10, #0x8]
    add sp, sp, #0xc
    str r2, [r1, #0x4]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_021becd8:
    add r5, r5, #0x1
    cmp r5, r6
    add r10, r10, #0xc
    blt .L_021bebf0
.L_021bece8:
    ldr r10, [r9, #0x50]
    mov r1, #0x0
    cmp r10, #0x4
    moveq r11, #0x3
    movne r11, #0x4
    cmp r11, #0x0
    ble .L_021bee18
    ldr r9, [r4, #0x8]
    mov r3, #0x56
    mov r2, r9
    mov r5, #0x36
.L_021bed14:
    cmp r2, #0x0
    blt .L_021bed2c
    ldr r0, [r4, #0x10]
    add r6, r9, r1
    cmp r6, r0
    blt .L_021bed40
.L_021bed2c:
    cmp r9, #0x0
    cmpeq r1, #0x0
    ldreq r0, [r4, #0x10]
    cmpeq r0, #0x0
    bne .L_021bee00
.L_021bed40:
    cmp r10, #0x4
    moveq r6, r3
    movne r6, r5
    sub r0, r6, #0xd
    cmp r7, r0
    blt .L_021bee00
    add r0, r6, #0xd
    cmp r7, r0
    bgt .L_021bee00
    ldr r0, [r4, #0x20]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    beq .L_021bedcc
    mov r0, #0x0
    mov r6, #0xe
.L_021bed7c:
    sub ip, r6, #0xa
    cmp r8, ip
    blt .L_021bedb8
    add ip, r6, #0xa
    cmp r8, ip
    bgt .L_021bedb8
    ldr r2, [sp, #0x34]
    mov r3, #0x2
    str r3, [r2, #0x0]
    str r0, [r2, #0x4]
    mov r0, r2
    str r1, [r0, #0x8]
    add sp, sp, #0xc
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_021bedb8:
    add r0, r0, #0x1
    cmp r0, #0xa
    add r6, r6, #0x17
    blt .L_021bed7c
    b .L_021bee00
.L_021bedcc:
    cmp r8, #0x4
    blt .L_021bee00
    cmp r8, #0xe7
    bgt .L_021bee00
    ldr r0, [sp, #0x34]
    mov r2, #0x2
    str r2, [r0, #0x0]
    mov r2, #0x0
    str r2, [r0, #0x4]
    str r1, [r0, #0x8]
    add sp, sp, #0xc
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_021bee00:
    add r1, r1, #0x1
    cmp r1, r11
    add r2, r2, #0x1
    add r3, r3, #0x20
    add r5, r5, #0x20
    blt .L_021bed14
.L_021bee18:
    ldr r1, [sp, #0x34]
    mov r0, #0x0
    str r0, [r1, #0x0]
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_021bee2c:
        .word   data_ov006_0224f448
.L_021bee30:
        .word   data_ov006_021cc03c
.L_021bee34:
        .word   data_ov006_021cc050
.L_021bee38:
        .word   data_ov006_021cc064
.L_021bee3c:
        .word   data_ov006_021cc078
.L_021bee40:
        .word   data_ov006_021cc034
.L_021bee44:
        .word   data_ov006_021cc034
.L_021bee48:
        .word   data_ov006_021cc2c8
.L_021bee4c:
        .word   data_ov006_021cca50
.L_021bee50:
        .word   data_ov006_021cc164
.L_021bee54:
        .word   data_ov006_021cc618
.L_021bee58:
        .word   data_ov006_021cc334
.L_021bee5c:
        .word   data_ov006_021cc1b8
.L_021bee60:
        .word   data_ov006_021cc268
.L_021bee64:
        .word   data_ov006_0225de70
