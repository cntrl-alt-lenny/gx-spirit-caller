; func_020a4104 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0210260c
        .extern data_02102610
        .extern data_02102614
        .extern data_02102618
        .extern data_021a9810
        .extern data_021a9818
        .extern data_021a981c
        .extern data_021a9820
        .extern func_020927e4
        .extern func_02093b08
        .extern func_02093ec4
        .extern func_020943b0
        .extern func_0209e6fc
        .extern func_0209e930
        .extern func_0209ebd4
        .extern func_0209eef4
        .extern func_0209f37c
        .extern func_020a05bc
        .extern func_020a34e8
        .extern func_020a3938
        .extern func_020a4104
        .extern func_020a49a0
        .extern func_020a5364
        .extern func_020a53cc
        .global func_020a4104
        .arm
func_020a4104:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x20
    mov r6, r0
    ldrh r0, [r6]
    ldr r1, _LIT0
    cmp r0, #0x1d
    ldr r5, [r1]
    bgt .L_8c
    cmp r0, #0x1d
    bge .L_114
    cmp r0, #0x15
    addls pc, pc, r0, lsl #0x2
    b .L_858
    b .L_98
    b .L_728
    b .L_794
    b .L_858
    b .L_858
    b .L_858
    b .L_858
    b .L_858
    b .L_858
    b .L_858
    b .L_1b8
    b .L_440
    b .L_498
    b .L_858
    b .L_630
    b .L_6b8
    b .L_858
    b .L_858
    b .L_858
    b .L_858
    b .L_858
    b .L_7fc
.L_8c:
    cmp r0, #0x80
    beq .L_82c
    b .L_858
.L_98:
    ldrh r0, [r6, #0x2]
    cmp r0, #0x0
    beq .L_c0
    ldr r2, [r5, #0x51c]
    mov r1, r6
    mov r0, #0x100
    blx r2
    add sp, sp, #0x20
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
.L_c0:
    ldr r2, [r5, #0x51c]
    mov r1, r6
    mov r0, #0x15
    blx r2
    ldr r0, _LIT1
    ldr r1, _LIT2
    ldrh r3, [r0]
    ldr r2, _LIT3
    ldr r0, _LIT4
    str r3, [sp]
    ldrh r3, [r0]
    ldrh r1, [r1]
    ldrh r2, [r2]
    ldr r0, _LIT5
    bl func_020a05bc
    mov r1, r0
    mov r0, #0x1d
    bl func_020a34e8
    add sp, sp, #0x20
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
.L_114:
    ldrh r0, [r6, #0x2]
    cmp r0, #0x0
    beq .L_13c
    ldr r2, [r5, #0x51c]
    mov r1, r6
    mov r0, #0x100
    blx r2
    add sp, sp, #0x20
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
.L_13c:
    ldr r0, _LIT6
    add r2, r5, #0x440
    ldrh r1, [r0, #0x4]
    str r2, [r0]
    mov r2, #0x1
    cmp r1, #0x0
    moveq r1, #0x1
    streqh r1, [r0, #0x4]
    ldr r0, _LIT6
    ldrh r1, [r0, #0x6]
    cmp r1, #0x0
    moveq r1, #0xc8
    streqh r1, [r0, #0x6]
    ldr r1, _LIT6
    mov r0, #0xff
    strb r0, [r1, #0x8]
    strb r0, [r1, #0x9]
    strb r0, [r1, #0xa]
    strb r0, [r1, #0xb]
    strb r0, [r1, #0xc]
    strb r0, [r1, #0xd]
    str r2, [r5, #0x5e4]
    ldr r0, _LIT5
    str r2, [r5, #0x5e8]
    bl func_0209ebd4
    mov r1, r0
    mov r0, #0xa
    bl func_020a34e8
    add sp, sp, #0x20
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
.L_1b8:
    ldrh r0, [r6, #0x2]
    cmp r0, #0x0
    beq .L_1e0
    ldr r2, [r5, #0x51c]
    mov r1, r6
    mov r0, #0x100
    blx r2
    add sp, sp, #0x20
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
.L_1e0:
    ldrh r0, [r6, #0x8]
    cmp r0, #0x3
    addeq sp, sp, #0x20
    ldmeqia sp!, {r4, r5, r6, r7, r8, lr}
    bxeq lr
    cmp r0, #0x4
    beq .L_3bc
    cmp r0, #0x5
    bne .L_424
    add r0, r5, #0x500
    ldrh r0, [r0, #0xe0]
    add r3, r5, #0x600
    mov r4, #0x0
    cmp r0, #0x0
    ble .L_2f4
    ldrb r1, [r6, #0xa]
    mov r2, r3
.L_224:
    ldrb r7, [r2, #0xca]
    cmp r1, r7
    bne .L_2e4
    ldrb r8, [r6, #0xb]
    ldrb r7, [r2, #0xcb]
    cmp r8, r7
    bne .L_2e4
    ldrb r8, [r6, #0xc]
    ldrb r7, [r2, #0xcc]
    cmp r8, r7
    bne .L_2e4
    ldrb r8, [r6, #0xd]
    ldrb r7, [r2, #0xcd]
    cmp r8, r7
    bne .L_2e4
    ldrb r8, [r6, #0xe]
    ldrb r7, [r2, #0xce]
    cmp r8, r7
    bne .L_2e4
    ldrb r8, [r6, #0xf]
    ldrb r7, [r2, #0xcf]
    cmp r8, r7
    bne .L_2e4
    mov r0, #0x180
    mul r7, r4, r0
    add r0, r3, r7
    ldrh r1, [r6, #0x36]
    add r8, r6, #0x38
    add lr, r0, #0xf8
    strh r1, [r0, #0xf6]
    mov ip, #0x8
.L_2a0:
    ldmia r8!, {r0, r1, r2, r3}
    stmia lr!, {r0, r1, r2, r3}
    subs ip, ip, #0x1
    bne .L_2a0
    add r0, r5, #0x600
    add r7, r0, r7
    mov r0, r7
    mov r1, #0xc0
    bl func_020927e4
    ldr r0, _LIT7
    mov r2, r7
    ldrh r0, [r0]
    add r1, r5, #0x440
    mov r3, #0xc0
    bl func_02093ec4
    str r4, [r5, #0x5ec]
    b .L_354
.L_2e4:
    add r4, r4, #0x1
    cmp r4, r0
    add r2, r2, #0x180
    blt .L_224
.L_2f4:
    cmp r4, #0x10
    bge .L_354
    mov r0, #0x180
    mul r7, r4, r0
    add r1, r3, r7
    mov r0, r6
    add ip, r4, #0x1
    add r3, r5, #0x500
    add r1, r1, #0xc0
    mov r2, #0xb8
    strh ip, [r3, #0xe0]
    bl func_020943b0
    add r0, r5, #0x600
    add r7, r0, r7
    mov r0, r7
    mov r1, #0xc0
    bl func_020927e4
    ldr r0, _LIT7
    mov r2, r7
    ldrh r0, [r0]
    add r1, r5, #0x440
    mov r3, #0xc0
    bl func_02093ec4
    str r4, [r5, #0x5ec]
.L_354:
    ldr r2, [r5, #0x51c]
    mov r1, r6
    mov r0, #0x4
    blx r2
    ldr r0, [r5, #0x5e4]
    cmp r0, #0x0
    addeq sp, sp, #0x20
    ldmeqia sp!, {r4, r5, r6, r7, r8, lr}
    bxeq lr
    ldr r0, [r5, #0x5e8]
    cmp r0, #0x0
    beq .L_398
    ldr r0, _LIT6
    bl func_020a53cc
    cmp r0, #0x0
    bne .L_398
    bl func_020a3938
.L_398:
    ldr r0, _LIT5
    ldr r1, _LIT6
    bl func_0209ebd4
    mov r1, r0
    mov r0, #0xa
    bl func_020a34e8
    add sp, sp, #0x20
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
.L_3bc:
    ldr r2, [r5, #0x51c]
    mov r1, r6
    mov r0, #0x5
    blx r2
    ldr r0, [r5, #0x5e4]
    cmp r0, #0x0
    addeq sp, sp, #0x20
    ldmeqia sp!, {r4, r5, r6, r7, r8, lr}
    bxeq lr
    ldr r0, [r5, #0x5e8]
    cmp r0, #0x0
    beq .L_400
    ldr r0, _LIT6
    bl func_020a53cc
    cmp r0, #0x0
    bne .L_400
    bl func_020a3938
.L_400:
    ldr r0, _LIT5
    ldr r1, _LIT6
    bl func_0209ebd4
    mov r1, r0
    mov r0, #0xa
    bl func_020a34e8
    add sp, sp, #0x20
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
.L_424:
    ldr r2, [r5, #0x51c]
    mov r1, r6
    mov r0, #0x100
    blx r2
    add sp, sp, #0x20
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
.L_440:
    ldrh r0, [r6, #0x2]
    cmp r0, #0x0
    beq .L_468
    ldr r2, [r5, #0x51c]
    mov r1, r6
    mov r0, #0x100
    blx r2
    add sp, sp, #0x20
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
.L_468:
    mov r2, #0x0
    str r2, [sp]
    ldr r1, [r5, #0x520]
    ldr r0, _LIT5
    mov r3, #0x1
    bl func_0209e930
    mov r1, r0
    mov r0, #0xc
    bl func_020a34e8
    add sp, sp, #0x20
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
.L_498:
    ldrh r0, [r6, #0x2]
    cmp r0, #0x0
    beq .L_4cc
    add r0, r5, #0x500
    mov r1, #0x0
    strh r1, [r0, #0xe0]
    ldr r2, [r5, #0x51c]
    mov r1, r6
    mov r0, #0xb
    blx r2
    add sp, sp, #0x20
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
.L_4cc:
    ldrh r0, [r6, #0x8]
    cmp r0, #0x9
    bgt .L_4fc
    cmp r0, #0x6
    blt .L_614
    cmp r0, #0x6
    beq .L_510
    cmp r0, #0x7
    beq .L_530
    cmp r0, #0x9
    beq .L_5e8
    b .L_614
.L_4fc:
    cmp r0, #0x1a
    addeq sp, sp, #0x20
    ldmeqia sp!, {r4, r5, r6, r7, r8, lr}
    bxeq lr
    b .L_614
.L_510:
    add r0, r5, #0x500
    mov r1, #0x0
    strh r1, [r0, #0x2a]
    mov r1, #0x1
    strh r1, [r0, #0x28]
    add sp, sp, #0x20
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
.L_530:
    ldrh r2, [r6, #0xa]
    add r0, r5, #0x500
    mov r1, r6
    strh r2, [r0, #0xe2]
    ldr r2, [r5, #0x51c]
    mov r0, #0x6
    blx r2
    ldr r1, _LIT8
    add r3, r5, #0x500
    mov r0, #0x1
    mov r2, #0x0
    strh r0, [r3, #0x2a]
    bl func_0209e6fc
    cmp r0, #0x0
    addne sp, sp, #0x20
    ldmneia sp!, {r4, r5, r6, r7, r8, lr}
    bxne lr
    add r0, r5, #0x500
    ldrh r0, [r0, #0x2c]
    add r1, r5, #0x500
    ldrh r2, [r1, #0x18]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r2, [sp]
    str r0, [sp, #0x4]
    mov r0, #0x0
    str r0, [sp, #0x8]
    str r0, [sp, #0xc]
    str r0, [sp, #0x10]
    mov r0, #0x1
    str r0, [sp, #0x14]
    str r0, [sp, #0x18]
    ldrh r2, [r1, #0x1a]
    ldr r1, [r5, #0x504]
    ldr r0, _LIT5
    add r3, r5, #0x40
    bl func_0209f37c
    mov r1, r0
    mov r0, #0xe
    bl func_020a34e8
    add sp, sp, #0x20
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
.L_5e8:
    ldr r2, [r5, #0x51c]
    mov r1, r6
    mov r0, #0xa
    blx r2
    add r0, r5, #0x500
    mov r1, #0x0
    strh r1, [r0, #0x2a]
    strh r1, [r0, #0x28]
    add sp, sp, #0x20
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
.L_614:
    ldr r2, [r5, #0x51c]
    mov r1, r6
    mov r0, #0x100
    blx r2
    add sp, sp, #0x20
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
.L_630:
    ldrh r0, [r6, #0x4]
    cmp r0, #0xa
    beq .L_660
    cmp r0, #0xc
    addeq sp, sp, #0x20
    ldmeqia sp!, {r4, r5, r6, r7, r8, lr}
    bxeq lr
    cmp r0, #0xd
    addeq sp, sp, #0x20
    ldmeqia sp!, {r4, r5, r6, r7, r8, lr}
    bxeq lr
    b .L_69c
.L_660:
    add r0, r5, #0x500
    mov r1, #0x1
    strh r1, [r0, #0x28]
    bl func_020a5364
    cmp r0, #0x0
    addeq sp, sp, #0x20
    ldmeqia sp!, {r4, r5, r6, r7, r8, lr}
    bxeq lr
    ldr r2, [r5, #0x51c]
    mov r0, #0x19
    mov r1, #0x0
    blx r2
    add sp, sp, #0x20
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
.L_69c:
    ldr r2, [r5, #0x51c]
    mov r1, r6
    mov r0, #0x100
    blx r2
    add sp, sp, #0x20
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
.L_6b8:
    mov r0, #0x0
    strb r0, [r5, #0x50c]
    ldrh r0, [r6, #0x2]
    cmp r0, #0x0
    bne .L_6e0
    ldr r2, [r5, #0x51c]
    mov r1, r6
    mov r0, #0x8
    blx r2
    b .L_70c
.L_6e0:
    cmp r0, #0x9
    bne .L_6fc
    ldr r2, [r5, #0x51c]
    mov r1, r6
    mov r0, #0x29
    blx r2
    b .L_70c
.L_6fc:
    ldr r2, [r5, #0x51c]
    mov r1, r6
    mov r0, #0x12
    blx r2
.L_70c:
    ldr r2, [r5, #0x51c]
    mov r0, #0x19
    mov r1, #0x0
    blx r2
    add sp, sp, #0x20
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
.L_728:
    ldrh r0, [r6, #0x2]
    cmp r0, #0x0
    beq .L_75c
    add r0, r5, #0x500
    mov r1, #0x0
    strh r1, [r0, #0x26]
    ldr r2, [r5, #0x51c]
    mov r1, r6
    mov r0, #0x100
    blx r2
    add sp, sp, #0x20
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
.L_75c:
    add r0, r5, #0x500
    mov r2, #0x0
    strh r2, [r0, #0x2a]
    ldr r1, [r1]
    ldr r0, _LIT5
    add r1, r1, #0x500
    strh r2, [r1, #0x28]
    bl func_0209eef4
    mov r1, r0
    mov r0, #0x2
    bl func_020a34e8
    add sp, sp, #0x20
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
.L_794:
    ldrh r0, [r6, #0x2]
    cmp r0, #0x0
    beq .L_7c8
    add r0, r5, #0x500
    mov r1, #0x0
    strh r1, [r0, #0x26]
    ldr r2, [r5, #0x51c]
    mov r1, r6
    mov r0, #0x100
    blx r2
    add sp, sp, #0x20
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
.L_7c8:
    mov r2, #0x0
    ldr r0, _LIT9
    strb r2, [r5, #0x50d]
    ldr r0, [r0]
    mov r1, r6
    add r0, r0, #0x1300
    strh r2, [r0, #0x16]
    ldr r2, [r5, #0x51c]
    mov r0, #0x11
    blx r2
    add sp, sp, #0x20
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
.L_7fc:
    bl func_020a5364
    cmp r0, #0x0
    addeq sp, sp, #0x20
    ldmeqia sp!, {r4, r5, r6, r7, r8, lr}
    bxeq lr
    ldr r2, [r5, #0x51c]
    mov r0, #0x19
    mov r1, #0x0
    blx r2
    add sp, sp, #0x20
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
.L_82c:
    ldrh r0, [r6, #0x4]
    cmp r0, #0x16
    beq .L_848
    add sp, sp, #0x20
    cmp r0, #0x17
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
.L_848:
    bl func_02093b08
    add sp, sp, #0x20
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
.L_858:
    ldr r2, [r5, #0x51c]
    mov r1, r6
    mov r0, #0x100
    blx r2
    add sp, sp, #0x20
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
_LIT0: .word data_021a9818
_LIT1: .word data_02102614
_LIT2: .word data_02102618
_LIT3: .word data_02102610
_LIT4: .word data_0210260c
_LIT5: .word func_020a4104
_LIT6: .word data_021a9820
_LIT7: .word data_021a9810
_LIT8: .word func_020a49a0
_LIT9: .word data_021a981c
