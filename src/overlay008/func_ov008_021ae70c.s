; func_ov008_021ae70c — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern data_02104bac
        .extern data_02104f4c
        .extern data_ov008_021b2780
        .extern data_ov008_021b279c
        .extern data_ov008_021b27a0
        .extern data_ov008_021b27a4
        .extern data_ov008_021b2dc0
        .extern data_ov008_021b2dc8
        .extern data_ov008_021b2dcc
        .extern data_ov008_021b2dd4
        .extern func_0200617c
        .extern func_02006194
        .extern func_02037208
        .extern func_ov008_021ac208
        .extern func_ov008_021ada90
        .extern func_ov008_021adc44
        .global func_ov008_021ae70c
        .arm
func_ov008_021ae70c:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r0, .L_021aedc8
    ldrh r0, [r0, #0x8]
    cmp r0, #0x0
    bne .L_021aedbc
    bl func_0200617c
    cmp r0, #0x0
    beq .L_021ae828
    ldr r0, .L_021aedcc
    ldr r1, [r0, #0x55c]
    cmp r1, #0x0
    beq .L_021ae78c
    ldr r0, .L_021aedd0
    mov r1, #0x34
    ldrh r3, [r0, #0x6]
    ldr r2, .L_021aedc8
    mov r0, #0x42
    mov r3, r3, lsl #0x18
    mov r3, r3, lsr #0x18
    mul ip, r3, r1
    ldr r3, [r2, #0xc]
    ldr r1, .L_021aedd4
    ldr r4, .L_021aedd8
    str r3, [r1, ip]
    ldr r5, [r2, #0x10]
    sub r1, r0, #0x43
    mov r2, #0x0
    mov r3, #0x1
    str r5, [r4, ip]
    bl func_02037208
    mov r0, #0x4
    ldmia sp!, {r3, r4, r5, pc}
.L_021ae78c:
    ldr r0, [r0, #0x560]
    cmp r0, #0x0
    beq .L_021aedbc
    ldr r0, .L_021aeddc
    ldr r2, .L_021aedc8
    ldr r1, [r0, #0xa60]
    ldr r0, [r2, #0x18]
    cmp r0, r1
    bls .L_021ae7cc
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    mov r0, #0x6
    ldmia sp!, {r3, r4, r5, pc}
.L_021ae7cc:
    cmp r0, #0x0
    ble .L_021aedbc
    cmp r0, r1
    bhi .L_021aedbc
    ldr r1, .L_021aedd0
    ldr r3, [r2, #0xc]
    ldrh r4, [r1, #0x6]
    mov r1, #0x34
    mov r0, #0x3a
    mov r4, r4, lsl #0x18
    mov r4, r4, lsr #0x18
    mul ip, r4, r1
    ldr r1, .L_021aedd4
    ldr r4, .L_021aedd8
    str r3, [r1, ip]
    ldr r5, [r2, #0x10]
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    str r5, [r4, ip]
    bl func_02037208
    mov r0, #0x5
    ldmia sp!, {r3, r4, r5, pc}
.L_021ae828:
    bl func_02006194
    cmp r0, #0x0
    beq .L_021ae83c
    bl func_ov008_021adc44
    b .L_021aedbc
.L_021ae83c:
    ldr ip, .L_021aedc8
    mov r2, #0x0
    ldr r0, .L_021aede0
    str r2, [ip, #0x14]
    ldrh r1, [r0, #0x54]
    tst r1, #0x1
    beq .L_021ae904
    ldrh r1, [ip, #0x4]
    ldr r3, .L_021aede4
    mov r4, #0x1
    mov r0, r1, lsl #0x18
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x10
    add r0, r0, r0, lsl #0x2
    add r2, r0, r1, lsr #0x18
    mov r0, r2, asr #0x4
    add r0, r2, r0, lsr #0x1b
    mov r5, r0, asr #0x5
    mov r1, r2, lsr #0x1f
    rsb r0, r1, r2, lsl #0x1b
    ldr r2, [r3, r5, lsl #0x2]
    add r1, r1, r0, ror #0x1b
    tst r2, r4, lsl r1
    beq .L_021ae8c8
    mvn r0, r4, lsl r1
    mov r1, r2
    and r0, r1, r0
    str r0, [r3, r5, lsl #0x2]
    bl func_ov008_021ada90
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, #0x0
    mov r3, r4
    bl func_02037208
    b .L_021aedbc
.L_021ae8c8:
    mov r0, r2
    orr r0, r0, r4, lsl r1
    str r0, [r3, r5, lsl #0x2]
    bl func_ov008_021ada90
    ldr r0, .L_021aedcc
    mov r2, #0x0
    ldr r1, [r0, #0x638]
    mov r3, #0x1
    cmp r1, #0x0
    addeq r1, r1, #0x1
    streq r1, [r0, #0x638]
    mov r0, #0x3a
    sub r1, r0, #0x3b
    bl func_02037208
    b .L_021aedbc
.L_021ae904:
    ldrh r0, [r0, #0x56]
    tst r0, #0x20
    beq .L_021ae9b0
    ldrh r1, [ip, #0x4]
    mov r0, r1, lsl #0x10
    mov r0, r0, lsr #0x18
    cmp r0, #0x5
    bhs .L_021ae96c
    cmp r0, #0x0
    biceq r0, r1, #0xff00
    orreq r0, r0, #0x400
    beq .L_021ae950
    add r0, r0, #0xff
    add r0, r0, #0xff00
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0xff00
    mov r0, r0, lsl #0x18
    orr r0, r1, r0, lsr #0x10
.L_021ae950:
    strh r0, [ip, #0x4]
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    b .L_021aedbc
.L_021ae96c:
    biceq r0, r1, #0xff00
    orreq r0, r0, #0x900
    beq .L_021ae994
    add r0, r0, #0xff
    add r0, r0, #0xff00
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0xff00
    mov r0, r0, lsl #0x18
    orr r0, r1, r0, lsr #0x10
.L_021ae994:
    strh r0, [ip, #0x4]
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    b .L_021aedbc
.L_021ae9b0:
    tst r0, #0x10
    beq .L_021aea5c
    ldrh r1, [ip, #0x4]
    ldr lr, .L_021aede8
    mov r0, r1, lsl #0x10
    mov r0, r0, lsr #0x18
    add r4, r0, #0x1
    cmp r0, #0x5
    mov r0, r4, lsr #0x1f
    bhs .L_021aea18
    smull r3, r5, lr, r4
    add r5, r0, r5, asr #0x1
    mov lr, #0x5
    smull r0, r3, lr, r5
    sub r5, r4, r0
    mov r0, r5, lsl #0x10
    mov r3, r0, lsr #0x10
    bic r4, r1, #0xff00
    mov r1, r3, lsl #0x18
    orr r4, r4, r1, lsr #0x10
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r3, #0x1
    strh r4, [ip, #0x4]
    bl func_02037208
    b .L_021aedbc
.L_021aea18:
    smull r3, r5, lr, r4
    add r5, r0, r5, asr #0x1
    mov lr, #0x5
    smull r0, r3, lr, r5
    sub r5, r4, r0
    add r0, r5, #0x5
    mov r0, r0, lsl #0x10
    mov r3, r0, lsr #0x10
    bic r4, r1, #0xff00
    mov r1, r3, lsl #0x18
    orr r4, r4, r1, lsr #0x10
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r3, #0x1
    strh r4, [ip, #0x4]
    bl func_02037208
    b .L_021aedbc
.L_021aea5c:
    tst r0, #0x40
    beq .L_021aeb04
    ldrh r3, [ip, #0x4]
    mov r0, r3, lsl #0x10
    mov r0, r0, lsr #0x18
    cmp r0, #0x5
    blo .L_021aeab8
    ldr ip, .L_021aedec
    mov r0, #0x38
    ldrh r5, [ip, #0x0]
    sub r1, r0, #0x39
    mov r3, #0x1
    mov r4, r5, lsl #0x10
    mov r4, r4, lsr #0x18
    sub r4, r4, #0x5
    mov lr, r4, lsl #0x10
    mov r4, lr, lsr #0x10
    bic r5, r5, #0xff00
    mov r4, r4, lsl #0x18
    orr r4, r5, r4, lsr #0x10
    strh r4, [ip, #0x0]
    bl func_02037208
    b .L_021aedbc
.L_021aeab8:
    mov r0, r3, lsl #0x18
    movs r0, r0, lsr #0x18
    beq .L_021aedbc
    add r0, r0, #0xff
    add r0, r0, #0xff00
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    mov r0, #0x38
    bic r3, r3, #0xff
    and r1, r1, #0xff
    orr r4, r3, r1
    sub r1, r0, #0x39
    mov r3, #0x1
    strh r4, [ip, #0x4]
    bl func_02037208
    ldr r1, .L_021aedf0
    ldr r0, .L_021aedc8
    strh r1, [r0, #0x8]
    b .L_021aedbc
.L_021aeb04:
    tst r0, #0x80
    beq .L_021aebb8
    ldrh r4, [ip, #0x4]
    mov r0, r4, lsl #0x10
    mov r0, r0, lsr #0x18
    cmp r0, #0x5
    bhs .L_021aeb60
    ldr ip, .L_021aedec
    mov r0, #0x38
    ldrh r5, [ip, #0x0]
    sub r1, r0, #0x39
    mov r3, #0x1
    mov r4, r5, lsl #0x10
    mov r4, r4, lsr #0x18
    add r4, r4, #0x5
    mov lr, r4, lsl #0x10
    mov r4, lr, lsr #0x10
    bic r5, r5, #0xff00
    mov r4, r4, lsl #0x18
    orr r4, r5, r4, lsr #0x10
    strh r4, [ip, #0x0]
    bl func_02037208
    b .L_021aedbc
.L_021aeb60:
    ldrh r0, [ip, #0x6]
    mov r1, r4, lsl #0x18
    mov r3, r1, lsr #0x18
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    sub r0, r0, #0x2
    cmp r0, r1, lsr #0x18
    ble .L_021aedbc
    add r0, r3, #0x1
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r4, #0xff
    and r0, r0, #0xff
    orr r1, r1, r0
    mov r0, #0x38
    strh r1, [ip, #0x4]
    mov r4, #0x4
    sub r1, r0, #0x39
    mov r3, #0x1
    strh r4, [ip, #0x8]
    bl func_02037208
    b .L_021aedbc
.L_021aebb8:
    tst r1, #0x2
    beq .L_021aec08
    ldr r1, .L_021aedd0
    ldr r3, [ip, #0xc]
    ldrh r4, [r1, #0x6]
    mov r1, #0x34
    mov r0, #0x42
    mov r4, r4, lsl #0x18
    mov r4, r4, lsr #0x18
    mul lr, r4, r1
    ldr r1, .L_021aedd4
    ldr r4, .L_021aedd8
    str r3, [r1, lr]
    ldr r5, [ip, #0x10]
    sub r1, r0, #0x43
    mov r3, #0x1
    str r5, [r4, lr]
    bl func_02037208
    mov r0, #0x4
    ldmia sp!, {r3, r4, r5, pc}
.L_021aec08:
    tst r1, #0x200
    beq .L_021aeca4
    ldr r1, .L_021aedd0
    mov r0, #0x34
    ldrh r3, [r1, #0x6]
    ldr r1, .L_021aedf4
    mov r3, r3, lsl #0x18
    mov r3, r3, lsr #0x18
    mul r0, r3, r0
    ldrh lr, [r1, r0]
    cmp lr, #0x0
    ble .L_021aec74
    ldr r5, .L_021aedf8
    mov r3, #0x1
.L_021aec40:
    mov r0, r2, asr #0x4
    add r0, r2, r0, lsr #0x1b
    mov r0, r0, asr #0x5
    add ip, r5, r0, lsl #0x2
    mov r1, r2, lsr #0x1f
    rsb r0, r1, r2, lsl #0x1b
    ldr r4, [ip, #0xc]
    add r0, r1, r0, ror #0x1b
    orr r0, r4, r3, lsl r0
    add r2, r2, #0x1
    str r0, [ip, #0xc]
    cmp r2, lr
    blt .L_021aec40
.L_021aec74:
    bl func_ov008_021ada90
    ldr r0, .L_021aedcc
    mov r2, #0x0
    ldr r1, [r0, #0x638]
    mov r3, #0x1
    cmp r1, #0x0
    addeq r1, r1, #0x1
    streq r1, [r0, #0x638]
    mov r0, #0x3a
    sub r1, r0, #0x3b
    bl func_02037208
    b .L_021aedbc
.L_021aeca4:
    tst r1, #0x100
    beq .L_021aed30
    ldr r1, .L_021aedd0
    mov r0, #0x34
    ldrh r3, [r1, #0x6]
    ldr r1, .L_021aedf4
    mov r3, r3, lsl #0x18
    mov r3, r3, lsr #0x18
    mul r0, r3, r0
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    ble .L_021aed14
    ldr lr, .L_021aedf8
    mov r4, #0x1
.L_021aecdc:
    mov r1, r2, asr #0x4
    add r1, r2, r1, lsr #0x1b
    mov ip, r2, lsr #0x1f
    rsb r3, ip, r2, lsl #0x1b
    mov r1, r1, asr #0x5
    add r5, lr, r1, lsl #0x2
    add r1, ip, r3, ror #0x1b
    add r2, r2, #0x1
    mvn r1, r4, lsl r1
    ldr r3, [r5, #0xc]
    cmp r2, r0
    and r1, r3, r1
    str r1, [r5, #0xc]
    blt .L_021aecdc
.L_021aed14:
    bl func_ov008_021ada90
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    b .L_021aedbc
.L_021aed30:
    tst r1, #0x400
    beq .L_021aedbc
    ldr r0, .L_021aeddc
    ldr r1, [ip, #0x18]
    ldr r0, [r0, #0xa60]
    cmp r1, r0
    bls .L_021aed64
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r3, #0x1
    bl func_02037208
    mov r0, #0x6
    ldmia sp!, {r3, r4, r5, pc}
.L_021aed64:
    cmp r1, #0x0
    ble .L_021aedbc
    cmp r1, r0
    bhi .L_021aedbc
    ldr r1, .L_021aedd0
    ldr r3, [ip, #0xc]
    ldrh lr, [r1, #0x6]
    mov r1, #0x34
    mov r0, #0x3a
    mov lr, lr, lsl #0x18
    mov lr, lr, lsr #0x18
    mul r4, lr, r1
    ldr r1, .L_021aedd4
    ldr lr, .L_021aedd8
    str r3, [r1, r4]
    ldr ip, [ip, #0x10]
    sub r1, r0, #0x3b
    mov r3, #0x1
    str ip, [lr, r4]
    bl func_02037208
    mov r0, #0x5
    ldmia sp!, {r3, r4, r5, pc}
.L_021aedbc:
    bl func_ov008_021ac208
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_021aedc8:
        .word   data_ov008_021b2dc8
.L_021aedcc:
        .word   data_ov008_021b2780
.L_021aedd0:
        .word   data_ov008_021b2dc0
.L_021aedd4:
        .word   data_ov008_021b27a0
.L_021aedd8:
        .word   data_ov008_021b27a4
.L_021aeddc:
        .word   data_02104f4c
.L_021aede0:
        .word   data_02104bac
.L_021aede4:
        .word   data_ov008_021b2dd4
.L_021aede8:
        .word   0x66666667
.L_021aedec:
        .word   data_ov008_021b2dcc
.L_021aedf0:
        .word   0xfffc
.L_021aedf4:
        .word   data_ov008_021b279c
.L_021aedf8:
        .word   data_ov008_021b2dc8
