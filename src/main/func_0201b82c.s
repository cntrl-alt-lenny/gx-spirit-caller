; func_0201b82c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern data_020b5b80
        .extern data_02102c64
        .extern func_02018a2c
        .extern func_02018d98
        .extern func_02018dcc
        .extern SysWork_GetPointDistance
        .extern func_02018f80
        .extern func_02018f90
        .extern func_02019184
        .extern func_02019210
        .extern func_0201942c
        .extern func_020195ec
        .extern func_020197ac
        .extern func_02019820
        .extern func_02019858
        .extern func_02019898
        .extern func_020198ec
        .extern func_02019ea4
        .extern func_02019f94
        .extern func_0201a0e0
        .extern func_0201b7e0
        .global func_0201b82c
        .arm
func_0201b82c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    bl GetSystemWork
    bl func_02018a2c
    mov r6, r0
    mov r0, r4
    bl func_0201b7e0
    mov r5, r0
    mov r0, r6
    bl func_02019210
    cmp r5, #0x8
    addls pc, pc, r5, lsl #0x2
    b .L_368
    b .L_368
    b .L_368
    b .L_58
    b .L_368
    b .L_368
    b .L_368
    b .L_68
    b .L_e0
    b .L_368
.L_58:
    mov r0, #0x0
    bl func_02019184
    bl SysWork_GetPointDistance
    b .L_368
.L_68:
    cmp r6, #0x2f
    bne .L_80
    ldr r0, [r4, #0x10]
    orr r0, r0, #0x10
    str r0, [r4, #0x10]
    b .L_368
.L_80:
    bl func_02018f80
    mov r5, r0
    bl func_02018f90
    mov r1, r0
    mov r0, r5
    mov r2, r6
    mov r3, #0x1
    .word 0xeb065e3c
    cmp r0, #0x0
    beq .L_d0
    ldr r0, _LIT0
    rsb r1, r6, r6, lsl #0x3
    ldrsb r0, [r0, r1]
    cmp r0, #0x2
    ldr r0, [r4, #0x10]
    orreq r0, r0, #0x200
    streq r0, [r4, #0x10]
    orrne r0, r0, #0x100
    strne r0, [r4, #0x10]
    b .L_368
.L_d0:
    ldr r0, [r4, #0x10]
    orr r0, r0, #0x80
    str r0, [r4, #0x10]
    b .L_368
.L_e0:
    ldr r0, [r4, #0x14]
    mov r0, r0, lsl #0x18
    mov r6, r0, lsr #0x18
    bl func_020195ec
    cmp r0, #0x0
    bne .L_368
    mov r0, r6
    bl func_0201942c
    cmp r0, #0x0
    beq .L_170
    ldr r2, _LIT1
    mov r1, #0x0
    ldr r3, [r2]
    ldmib r2, {r0, r5}
    umull lr, ip, r5, r3
    mla ip, r5, r0, ip
    ldr r0, [r2, #0xc]
    ldr r5, [r2, #0x10]
    mla ip, r0, r3, ip
    ldr r0, [r2, #0x14]
    adds lr, r5, lr
    adc ip, r0, ip
    mov r0, #0x65
    umull r3, r5, ip, r0
    mla r5, ip, r1, r5
    mla r5, r1, r0, r5
    str lr, [r2]
    mov r0, r6
    str ip, [r2, #0x4]
    bl func_0201a0e0
    cmp r5, r0
    bcs .L_368
    ldr r0, [r4, #0x10]
    orr r0, r0, #0x20
    str r0, [r4, #0x10]
    b .L_368
.L_170:
    mov r0, r6
    bl func_02019ea4
    cmp r0, #0x0
    beq .L_1e8
    ldr r2, _LIT1
    mov r1, #0x0
    ldr r3, [r2]
    ldmib r2, {r0, r5}
    umull lr, ip, r5, r3
    mla ip, r5, r0, ip
    ldr r0, [r2, #0xc]
    ldr r5, [r2, #0x10]
    mla ip, r0, r3, ip
    ldr r0, [r2, #0x14]
    adds lr, r5, lr
    adc ip, r0, ip
    mov r0, #0x65
    umull r3, r5, ip, r0
    mla r5, ip, r1, r5
    mla r5, r1, r0, r5
    str lr, [r2]
    mov r0, r6
    str ip, [r2, #0x4]
    bl func_02019f94
    cmp r5, r0
    bcs .L_368
    ldr r0, [r4, #0x10]
    orr r0, r0, #0x2
    str r0, [r4, #0x10]
    b .L_368
.L_1e8:
    mov r0, r6
    bl func_02018dcc
    cmp r0, #0x0
    bne .L_270
    mov r0, r6
    bl func_02019820
    cmp r0, #0x0
    beq .L_270
    ldr r2, _LIT1
    mov r1, #0x0
    ldr r3, [r2]
    ldmib r2, {r0, r5}
    umull lr, ip, r5, r3
    mla ip, r5, r0, ip
    ldr r0, [r2, #0xc]
    ldr r5, [r2, #0x10]
    mla ip, r0, r3, ip
    ldr r0, [r2, #0x14]
    adds lr, r5, lr
    adc ip, r0, ip
    mov r0, #0x65
    umull r3, r5, ip, r0
    mla r5, ip, r1, r5
    mla r5, r1, r0, r5
    str lr, [r2]
    mov r0, r6
    str ip, [r2, #0x4]
    bl func_020197ac
    cmp r5, r0
    bcs .L_368
    ldr r0, [r4, #0x10]
    orr r0, r0, #0x4
    str r0, [r4, #0x10]
    b .L_368
.L_270:
    mov r0, r6
    bl func_02018dcc
    cmp r0, #0x0
    beq .L_368
    mov r0, r6
    bl func_02019898
    cmp r0, #0x0
    beq .L_308
    mov r0, r6
    bl func_02018d98
    cmp r0, #0x0
    bne .L_308
    ldr r2, _LIT1
    mov r1, #0x0
    ldr r3, [r2]
    ldmib r2, {r0, r5}
    umull lr, ip, r5, r3
    mla ip, r5, r0, ip
    ldr r0, [r2, #0xc]
    ldr r5, [r2, #0x10]
    mla ip, r0, r3, ip
    ldr r0, [r2, #0x14]
    adds lr, r5, lr
    adc ip, r0, ip
    mov r0, #0x65
    umull r3, r5, ip, r0
    mla r5, ip, r1, r5
    mla r5, r1, r0, r5
    str lr, [r2]
    mov r0, r6
    str ip, [r2, #0x4]
    bl func_02019858
    cmp r5, r0
    bcs .L_368
    ldr r0, [r4, #0x10]
    orr r0, r0, #0x8
    str r0, [r4, #0x10]
    b .L_368
.L_308:
    ldr r2, _LIT1
    mov r1, #0x0
    ldr r3, [r2]
    ldmib r2, {r0, r5}
    umull lr, ip, r5, r3
    mla ip, r5, r0, ip
    ldr r0, [r2, #0xc]
    ldr r5, [r2, #0x10]
    mla ip, r0, r3, ip
    ldr r0, [r2, #0x14]
    adds lr, r5, lr
    adc ip, r0, ip
    mov r0, #0x65
    umull r3, r5, ip, r0
    mla r5, ip, r1, r5
    mla r5, r1, r0, r5
    str lr, [r2]
    mov r0, r6
    str ip, [r2, #0x4]
    bl func_020198ec
    cmp r5, r0
    ldrcc r0, [r4, #0x10]
    orrcc r0, r0, #0x10
    strcc r0, [r4, #0x10]
.L_368:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_020b5b80
_LIT1: .word data_02102c64
