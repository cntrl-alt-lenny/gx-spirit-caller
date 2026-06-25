; func_020a4a78 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102620
        .extern data_021a9818
        .extern data_021a981c
        .extern func_02093720
        .extern func_02093b08
        .extern func_0209e6fc
        .extern func_0209e7dc
        .extern func_0209ed2c
        .extern func_0209edec
        .extern func_0209eef4
        .extern func_0209f37c
        .extern func_020a0628
        .extern func_020a34e8
        .extern func_020a4a78
        .extern func_020a52f0
        .extern func_020a5364
        .global func_020a4a78
        .arm
func_020a4a78:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x20
    mov r4, r0
    ldrh r0, [r4]
    cmp r0, #0x19
    bgt .L_6c
    cmp r0, #0x19
    bge .L_160
    cmp r0, #0xf
    addls pc, pc, r0, lsl #0x2
    b .L_840
    b .L_8c
    b .L_5fc
    b .L_6ac
    b .L_840
    b .L_840
    b .L_840
    b .L_840
    b .L_124
    b .L_1b8
    b .L_840
    b .L_840
    b .L_840
    b .L_840
    b .L_72c
    b .L_448
    b .L_4ec
.L_6c:
    cmp r0, #0x1d
    bgt .L_80
    cmp r0, #0x1d
    beq .L_cc
    b .L_840
.L_80:
    cmp r0, #0x80
    beq .L_76c
    b .L_840
.L_8c:
    ldrh r0, [r4, #0x2]
    cmp r0, #0x0
    beq .L_bc
    ldr r0, _LIT0
    mov r1, r4
    ldr r2, [r0]
    mov r0, #0x100
    ldr r2, [r2, #0x51c]
    blx r2
    add sp, sp, #0x20
    ldmia sp!, {r4, lr}
    bx lr
.L_bc:
    bl func_020a52f0
    add sp, sp, #0x20
    ldmia sp!, {r4, lr}
    bx lr
.L_cc:
    ldrh r0, [r4, #0x2]
    cmp r0, #0x0
    beq .L_fc
    ldr r0, _LIT0
    mov r1, r4
    ldr r2, [r0]
    mov r0, #0x100
    ldr r2, [r2, #0x51c]
    blx r2
    add sp, sp, #0x20
    ldmia sp!, {r4, lr}
    bx lr
.L_fc:
    ldr r1, _LIT0
    ldr r0, _LIT1
    ldr r1, [r1]
    bl func_0209edec
    mov r1, r0
    mov r0, #0x7
    bl func_020a34e8
    add sp, sp, #0x20
    ldmia sp!, {r4, lr}
    bx lr
.L_124:
    ldr r0, _LIT0
    mov r1, r4
    ldr r2, [r0]
    mov r0, #0x15
    ldr r2, [r2, #0x51c]
    blx r2
    ldr r0, _LIT1
    mov r1, #0x1
    bl func_020a0628
    mov r1, r0
    mov r0, #0x19
    bl func_020a34e8
    add sp, sp, #0x20
    ldmia sp!, {r4, lr}
    bx lr
.L_160:
    ldrh r0, [r4, #0x2]
    cmp r0, #0x0
    beq .L_190
    ldr r0, _LIT0
    mov r1, r4
    ldr r2, [r0]
    mov r0, #0x100
    ldr r2, [r2, #0x51c]
    blx r2
    add sp, sp, #0x20
    ldmia sp!, {r4, lr}
    bx lr
.L_190:
    ldr r1, _LIT2
    ldr r0, _LIT1
    ldr r1, [r1]
    bl func_0209ed2c
    mov r1, r0
    mov r0, #0x8
    bl func_020a34e8
    add sp, sp, #0x20
    ldmia sp!, {r4, lr}
    bx lr
.L_1b8:
    ldrh r0, [r4, #0x2]
    cmp r0, #0x0
    beq .L_1e8
    ldr r0, _LIT0
    mov r1, r4
    ldr r2, [r0]
    mov r0, #0x100
    ldr r2, [r2, #0x51c]
    blx r2
    add sp, sp, #0x20
    ldmia sp!, {r4, lr}
    bx lr
.L_1e8:
    ldrh r0, [r4, #0x8]
    cmp r0, #0x7
    bgt .L_220
    cmp r0, #0x7
    bge .L_274
    cmp r0, #0x2
    bgt .L_424
    cmp r0, #0x0
    blt .L_424
    cmp r0, #0x0
    beq .L_248
    cmp r0, #0x2
    beq .L_3e8
    b .L_424
.L_220:
    cmp r0, #0x9
    bgt .L_234
    cmp r0, #0x9
    beq .L_3a8
    b .L_424
.L_234:
    cmp r0, #0x1a
    addeq sp, sp, #0x20
    ldmeqia sp!, {r4, lr}
    bxeq lr
    b .L_424
.L_248:
    ldr r1, _LIT0
    mov r2, #0x0
    ldr r0, [r1]
    add sp, sp, #0x20
    add r0, r0, #0x500
    strh r2, [r0, #0x2a]
    ldr r0, [r1]
    add r0, r0, #0x500
    strh r2, [r0, #0x28]
    ldmia sp!, {r4, lr}
    bx lr
.L_274:
    ldr r2, _LIT0
    ldr r0, [r2]
    add r0, r0, #0x500
    ldrh r1, [r0, #0x26]
    cmp r1, #0x1
    addeq sp, sp, #0x20
    ldmeqia sp!, {r4, lr}
    bxeq lr
    ldrh lr, [r0, #0x2a]
    ldrh r3, [r4, #0x10]
    mov ip, #0x1
    mov r1, r4
    orr r3, lr, ip, lsl r3
    strh r3, [r0, #0x2a]
    ldr r2, [r2]
    mov r0, #0x0
    ldr r2, [r2, #0x51c]
    blx r2
    ldr r1, _LIT0
    ldr r0, [r1]
    add r0, r0, #0x500
    ldrh r0, [r0, #0x28]
    cmp r0, #0x0
    bne .L_370
    ldr r0, _LIT3
    ldr r0, [r0]
    add r0, r0, #0x1000
    ldr r2, [r0, #0x31c]
    cmp r2, #0x0
    bne .L_370
    mov r2, #0x1
    str r2, [r0, #0x31c]
    ldr r0, [r1]
    ldr r1, _LIT0
    add r0, r0, #0x500
    ldrh r0, [r0, #0x2c]
    ldr ip, [r1]
    mov r1, #0x1
    cmp r0, #0x0
    movne r2, #0x0
    mov r0, r2, lsl #0x10
    mov r3, r0, lsr #0x10
    add r0, ip, #0x500
    ldrh r4, [r0, #0x18]
    mov r2, #0x0
    str r4, [sp]
    str r3, [sp, #0x4]
    str r2, [sp, #0x8]
    str r2, [sp, #0xc]
    str r2, [sp, #0x10]
    str r1, [sp, #0x14]
    str r1, [sp, #0x18]
    ldrh r2, [r0, #0x1a]
    ldr r1, [ip, #0x504]
    ldr r0, _LIT1
    add r3, ip, #0x40
    bl func_0209f37c
    mov r1, r0
    mov r0, #0xe
    bl func_020a34e8
    add sp, sp, #0x20
    ldmia sp!, {r4, lr}
    bx lr
.L_370:
    bl func_020a5364
    cmp r0, #0x0
    addeq sp, sp, #0x20
    ldmeqia sp!, {r4, lr}
    bxeq lr
    ldr r1, _LIT0
    mov r0, #0x19
    ldr r2, [r1]
    mov r1, #0x0
    ldr r2, [r2, #0x51c]
    blx r2
    add sp, sp, #0x20
    ldmia sp!, {r4, lr}
    bx lr
.L_3a8:
    ldr r2, _LIT0
    ldrh r3, [r4, #0x10]
    ldr r1, [r2]
    mov r0, #0x1
    add r1, r1, #0x500
    ldrh ip, [r1, #0x2a]
    mvn r3, r0, lsl r3
    and r3, ip, r3
    strh r3, [r1, #0x2a]
    ldr r2, [r2]
    mov r1, r4
    ldr r2, [r2, #0x51c]
    blx r2
    add sp, sp, #0x20
    ldmia sp!, {r4, lr}
    bx lr
.L_3e8:
    ldr r0, _LIT0
    ldr r1, [r0]
    add r0, r1, #0x500
    ldrh r0, [r0, #0x26]
    cmp r0, #0x1
    addeq sp, sp, #0x20
    ldmeqia sp!, {r4, lr}
    bxeq lr
    ldr r2, [r1, #0x51c]
    mov r1, r4
    mov r0, #0x1c
    blx r2
    add sp, sp, #0x20
    ldmia sp!, {r4, lr}
    bx lr
.L_424:
    ldr r0, _LIT0
    mov r1, r4
    ldr r2, [r0]
    mov r0, #0x100
    ldr r2, [r2, #0x51c]
    blx r2
    add sp, sp, #0x20
    ldmia sp!, {r4, lr}
    bx lr
.L_448:
    ldr r0, _LIT3
    mov r1, #0x0
    ldr r0, [r0]
    add r0, r0, #0x1000
    str r1, [r0, #0x31c]
    ldrh r0, [r4, #0x4]
    cmp r0, #0xa
    beq .L_474
    cmp r0, #0xb
    beq .L_4a4
    b .L_4c8
.L_474:
    ldr r3, _LIT0
    mov r4, #0x1
    ldr r2, [r3]
    mov r0, #0x19
    add r2, r2, #0x500
    strh r4, [r2, #0x28]
    ldr r2, [r3]
    ldr r2, [r2, #0x51c]
    blx r2
    add sp, sp, #0x20
    ldmia sp!, {r4, lr}
    bx lr
.L_4a4:
    ldr r0, _LIT0
    ldr r1, [r4, #0x8]
    ldr r2, [r0]
    mov r0, #0x3
    ldr r2, [r2, #0x51c]
    blx r2
    add sp, sp, #0x20
    ldmia sp!, {r4, lr}
    bx lr
.L_4c8:
    ldr r0, _LIT0
    mov r1, r4
    ldr r2, [r0]
    mov r0, #0x100
    ldr r2, [r2, #0x51c]
    blx r2
    add sp, sp, #0x20
    ldmia sp!, {r4, lr}
    bx lr
.L_4ec:
    ldr r0, _LIT3
    ldr r1, [r0]
    add r0, r1, #0x7000
    ldr r0, [r0, #0x4c8]
    cmp r0, #0x0
    beq .L_548
    mov r3, #0x0
    mov r2, r3
.L_50c:
    add r0, r1, r2, lsl #0x2
    add r0, r0, #0x1000
    ldr r0, [r0, #0x4e8]
    cmp r0, #0x0
    beq .L_52c
    add r3, r3, #0x1
    cmp r3, #0x2
    bcs .L_538
.L_52c:
    add r2, r2, #0x1
    cmp r2, #0xf
    bcc .L_50c
.L_538:
    cmp r3, #0x1
    bne .L_548
    ldr r0, _LIT4
    bl func_02093720
.L_548:
    ldr r0, _LIT0
    mov r2, #0x0
    ldr r1, [r0]
    strb r2, [r1, #0x50c]
    ldrh r1, [r4, #0x2]
    cmp r1, #0x0
    bne .L_59c
    ldr r0, [r0]
    mov r1, r4
    ldr r2, [r0, #0x51c]
    mov r0, #0x2
    blx r2
    ldr r1, _LIT0
    mov r0, #0x19
    ldr r2, [r1]
    mov r1, #0x0
    ldr r2, [r2, #0x51c]
    blx r2
    add sp, sp, #0x20
    ldmia sp!, {r4, lr}
    bx lr
.L_59c:
    cmp r1, #0xa
    bne .L_5c4
    ldr r0, [r0]
    mov r1, r4
    ldr r2, [r0, #0x51c]
    mov r0, #0x2a
    blx r2
    add sp, sp, #0x20
    ldmia sp!, {r4, lr}
    bx lr
.L_5c4:
    ldr r0, [r0]
    mov r1, r4
    ldr r2, [r0, #0x51c]
    mov r0, #0x13
    blx r2
    ldr r1, _LIT0
    mov r0, #0x19
    ldr r2, [r1]
    mov r1, #0x0
    ldr r2, [r2, #0x51c]
    blx r2
    add sp, sp, #0x20
    ldmia sp!, {r4, lr}
    bx lr
.L_5fc:
    ldr r0, _LIT3
    ldr r0, [r0]
    add r0, r0, #0x1000
    ldr r0, [r0, #0x320]
    cmp r0, #0x0
    bne .L_694
    ldrh r0, [r4, #0x2]
    cmp r0, #0x0
    beq .L_654
    ldr r2, _LIT0
    mov r3, #0x0
    ldr r0, [r2]
    mov r1, r4
    add r0, r0, #0x500
    strh r3, [r0, #0x26]
    ldr r2, [r2]
    mov r0, #0x100
    ldr r2, [r2, #0x51c]
    blx r2
    add sp, sp, #0x20
    ldmia sp!, {r4, lr}
    bx lr
.L_654:
    ldr r2, _LIT0
    mov r3, #0x0
    ldr r1, [r2]
    ldr r0, _LIT1
    add r1, r1, #0x500
    strh r3, [r1, #0x2a]
    ldr r1, [r2]
    add r1, r1, #0x500
    strh r3, [r1, #0x28]
    bl func_0209eef4
    mov r1, r0
    mov r0, #0x2
    bl func_020a34e8
    add sp, sp, #0x20
    ldmia sp!, {r4, lr}
    bx lr
.L_694:
    mov r1, #0x0
    mov r2, r1
    mov r0, #0x1
    bl func_0209e6fc
    mov r0, #0x0
    bl func_0209e7dc
.L_6ac:
    ldrh r0, [r4, #0x2]
    cmp r0, #0x0
    beq .L_6ec
    ldr r2, _LIT0
    mov r3, #0x0
    ldr r0, [r2]
    mov r1, r4
    add r0, r0, #0x500
    strh r3, [r0, #0x26]
    ldr r2, [r2]
    mov r0, #0x100
    ldr r2, [r2, #0x51c]
    blx r2
    add sp, sp, #0x20
    ldmia sp!, {r4, lr}
    bx lr
.L_6ec:
    ldr r2, _LIT0
    mov r3, #0x0
    ldr r1, [r2]
    ldr r0, _LIT3
    strb r3, [r1, #0x50d]
    ldr r0, [r0]
    mov r1, r4
    add r0, r0, #0x1300
    strh r3, [r0, #0x16]
    ldr r2, [r2]
    mov r0, #0x11
    ldr r2, [r2, #0x51c]
    blx r2
    add sp, sp, #0x20
    ldmia sp!, {r4, lr}
    bx lr
.L_72c:
    ldrh r0, [r4, #0x2]
    cmp r0, #0x0
    addne sp, sp, #0x20
    ldmneia sp!, {r4, lr}
    bxne lr
    ldr r0, _LIT0
    ldrh r1, [r4, #0xa]
    ldr r0, [r0]
    add sp, sp, #0x20
    add r0, r0, #0x500
    ldrh r2, [r0, #0x2a]
    mvn r1, r1
    and r1, r2, r1
    strh r1, [r0, #0x2a]
    ldmia sp!, {r4, lr}
    bx lr
.L_76c:
    ldrh r0, [r4, #0x4]
    sub r0, r0, #0x10
    cmp r0, #0x7
    addls pc, pc, r0, lsl #0x2
    b .L_858
    b .L_7a0
    b .L_7c4
    b .L_7e8
    b .L_80c
    b .L_858
    b .L_858
    b .L_830
    b .L_858
.L_7a0:
    ldr r0, _LIT0
    mov r1, r4
    ldr r2, [r0]
    mov r0, #0x1d
    ldr r2, [r2, #0x51c]
    blx r2
    add sp, sp, #0x20
    ldmia sp!, {r4, lr}
    bx lr
.L_7c4:
    ldr r0, _LIT0
    mov r1, r4
    ldr r2, [r0]
    mov r0, #0x1f
    ldr r2, [r2, #0x51c]
    blx r2
    add sp, sp, #0x20
    ldmia sp!, {r4, lr}
    bx lr
.L_7e8:
    ldr r0, _LIT0
    mov r1, r4
    ldr r2, [r0]
    mov r0, #0x20
    ldr r2, [r2, #0x51c]
    blx r2
    add sp, sp, #0x20
    ldmia sp!, {r4, lr}
    bx lr
.L_80c:
    ldr r0, _LIT0
    mov r1, r4
    ldr r2, [r0]
    mov r0, #0x21
    ldr r2, [r2, #0x51c]
    blx r2
    add sp, sp, #0x20
    ldmia sp!, {r4, lr}
    bx lr
.L_830:
    bl func_02093b08
    add sp, sp, #0x20
    ldmia sp!, {r4, lr}
    bx lr
.L_840:
    ldr r0, _LIT0
    mov r1, r4
    ldr r2, [r0]
    mov r0, #0x100
    ldr r2, [r2, #0x51c]
    blx r2
.L_858:
    add sp, sp, #0x20
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word data_021a9818
_LIT1: .word func_020a4a78
_LIT2: .word data_02102620
_LIT3: .word data_021a981c
_LIT4: .word 0x000032c8
