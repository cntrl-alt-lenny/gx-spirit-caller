; func_ov002_021b150c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd220
        .extern data_ov002_022cd65c
        .extern data_ov002_022cd888
        .extern data_ov002_022cd88a
        .extern data_ov002_022cd88c
        .extern data_ov002_022cdb88
        .extern data_ov002_022ce1a8
        .extern data_ov002_022ce4a8
        .extern data_ov002_022d008c
        .extern data_ov002_022d0170
        .extern data_ov002_022d0e3c
        .extern func_0202e1e0
        .extern func_ov002_021ae674
        .extern func_ov002_021b0b74
        .extern func_ov002_021b1378
        .extern func_ov002_021b13a8
        .extern func_ov002_021b1c00
        .extern func_ov002_021d47b8
        .extern func_ov002_021e2a4c
        .extern func_ov002_021e2ae4
        .extern func_ov002_021e2b6c
        .extern func_ov002_021e2d90
        .extern func_ov002_021fd838
        .extern func_ov002_02244efc
        .extern func_ov002_0225968c
        .extern func_ov002_0226ac34
        .extern func_ov002_0227a960
        .extern func_ov002_0229cbf8
        .extern func_ov002_0229cc24
        .extern func_ov002_0229cc60
        .global func_ov002_021b150c
        .arm
func_ov002_021b150c:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r0, _LIT0
    ldr r1, [r0, #0x300]
    mov r1, r1, lsl #0x1f
    movs r1, r1, lsr #0x1f
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
    mov r1, #0x0
    strh r1, [r0]
    bl func_ov002_0229cbf8
    movs r5, r0
    bne .L_64
    bl func_ov002_0229cc24
    cmp r0, #0x0
    beq .L_48
    bl func_ov002_021b1c00
    cmp r0, #0x0
    beq .L_5c
.L_48:
    ldr r0, _LIT1
    mov r1, #0x1
    str r1, [r0, #0xd10]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_5c:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_64:
    ldr r0, _LIT0
    mov r1, #0x0
    ldrh r0, [r0]
    bl func_ov002_021b13a8
    ldr r4, _LIT0
    ldrh r0, [r4]
    cmp r0, #0x1f
    addls pc, pc, r0, lsl #0x2
    b .L_6a0
    b .L_108
    b .L_68c
    b .L_110
    b .L_140
    b .L_6a0
    b .L_6a0
    b .L_654
    b .L_65c
    b .L_678
    b .L_1a0
    b .L_1bc
    b .L_218
    b .L_1f8
    b .L_278
    b .L_28c
    b .L_338
    b .L_364
    b .L_378
    b .L_2d8
    b .L_2f8
    b .L_30c
    b .L_158
    b .L_174
    b .L_18c
    b .L_504
    b .L_5f0
    b .L_48c
    b .L_4d4
    b .L_414
    b .L_45c
    b .L_3c4
    b .L_3ec
.L_108:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_110:
    ldr r0, [r4, #0x300]
    mov r1, #0x0
    bic r0, r0, #0x1
    orr ip, r0, #0x1
    mov r2, r1
    mov r3, r1
    mov r0, #0x3
    str ip, [r4, #0x300]
    bl func_ov002_021b1378
    bl func_ov002_021ae674
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_140:
    ldr r1, [r4, #0x300]
    mov r0, #0x1
    bic r1, r1, #0x1
    orr r1, r1, #0x1
    str r1, [r4, #0x300]
    ldmia sp!, {r3, r4, r5, pc}
.L_158:
    ldr r0, _LIT2
    ldr r1, _LIT3
    mov r2, #0x1c
    bl func_ov002_0229cc60
    bl func_ov002_0227a960
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_174:
    ldr r0, _LIT2
    ldr r1, _LIT3
    mov r2, #0x1c
    bl func_ov002_0229cc60
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_18c:
    ldr r1, [r4, #0x300]
    mov r0, #0x1
    orr r1, r1, #0x2
    str r1, [r4, #0x300]
    ldmia sp!, {r3, r4, r5, pc}
.L_1a0:
    ldrh r2, [r4, #0x4]
    ldrh r1, [r4, #0x6]
    ldrh r0, [r4, #0x2]
    orr r1, r2, r1, lsl #0x10
    bl func_ov002_02244efc
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_1bc:
    ldrh r0, [r4, #0x2]
    cmp r0, #0x0
    beq .L_1ec
    cmp r0, #0x1
    beq .L_1dc
    cmp r0, #0x2
    beq .L_1e4
    b .L_1f0
.L_1dc:
    bl func_ov002_021e2a4c
    b .L_1f0
.L_1e4:
    bl func_ov002_021e2ae4
    b .L_1f0
.L_1ec:
    bl func_ov002_021e2b6c
.L_1f0:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_1f8:
    ldr r0, _LIT4
    mov r1, #0x0
    str r1, [r0, #0x484]
    str r1, [r0, #0x694]
    str r1, [r0, #0x698]
    ldr r0, [r4, #0x300]
    orr r0, r0, #0x10
    str r0, [r4, #0x300]
.L_218:
    ldr r0, _LIT0
    ldr r1, _LIT3
    ldrh ip, [r0, #0x2]
    ldr lr, _LIT4
    add r5, r1, #0x2
    str ip, [lr, #0x5d4]
    cmp ip, #0x0
    mov r4, #0x0
    ble .L_270
    mov r1, lr
.L_240:
    ldrh r2, [r5]
    add r0, r1, r4, lsl #0x2
    add r4, r4, #0x1
    strb r2, [lr, #0x5dc]
    ldrh r3, [r5, #0x2]
    ldrh r2, [r5, #0x4]
    cmp r4, ip
    add r5, r5, #0x6
    orr r2, r3, r2, lsl #0x10
    str r2, [r0, #0x5fc]
    add lr, lr, #0x1
    blt .L_240
.L_270:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_278:
    ldr r1, [r4, #0x300]
    mov r0, #0x1
    orr r1, r1, #0x20
    str r1, [r4, #0x300]
    ldmia sp!, {r3, r4, r5, pc}
.L_28c:
    ldr r1, _LIT5
    ldr r0, _LIT1
    ldr r1, [r1, #0x4]
    ldr r2, _LIT3
    eor r1, r1, #0x1
    str r1, [r0, #0xd6c]
    ldrh r0, [r2]
    ldrh r1, [r2, #0x2]
    ldrh r2, [r2, #0x4]
    mov r3, #0x3
    bl func_ov002_0225968c
    ldr r2, _LIT4
    mov r0, #0x1
    mov r1, r4
    str r0, [r2, #0x68c]
    ldr r2, [r1, #0x300]
    orr r2, r2, #0x20
    str r2, [r1, #0x300]
    ldmia sp!, {r3, r4, r5, pc}
.L_2d8:
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT6
    mov r2, #0x18
    mla r0, r1, r2, r0
    ldr r1, _LIT7
    bl func_ov002_0229cc60
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_2f8:
    ldrh r2, [r4, #0x2]
    ldr r1, _LIT4
    mov r0, #0x1
    str r2, [r1, #0x484]
    ldmia sp!, {r3, r4, r5, pc}
.L_30c:
    ldrh lr, [r4, #0x4]
    ldrh r1, [r4, #0x6]
    ldrh ip, [r4, #0x8]
    ldrh r3, [r4, #0xa]
    ldrh r0, [r4, #0x2]
    ldrh r2, [r4, #0xc]
    orr r1, lr, r1, lsl #0x10
    orr r3, ip, r3, lsl #0x10
    bl func_ov002_021e2d90
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_338:
    ldrh r2, [r4, #0x2]
    ldr r1, _LIT4
    mov r0, #0x0
    str r2, [r1, #0x484]
    str r0, [r1, #0x694]
    mov r0, #0x1
    str r0, [r1, #0x698]
    ldr r1, [r4, #0x300]
    orr r1, r1, #0x10
    str r1, [r4, #0x300]
    ldmia sp!, {r3, r4, r5, pc}
.L_364:
    ldr r1, [r4, #0x300]
    mov r0, #0x1
    orr r1, r1, #0x20
    str r1, [r4, #0x300]
    ldmia sp!, {r3, r4, r5, pc}
.L_378:
    ldr r1, _LIT5
    ldr r0, _LIT1
    ldr r1, [r1, #0x4]
    ldr r2, _LIT3
    eor r1, r1, #0x1
    str r1, [r0, #0xd6c]
    ldrh r0, [r2]
    ldrh r1, [r2, #0x2]
    ldrh r2, [r2, #0x4]
    mov r3, #0x3
    bl func_ov002_0225968c
    ldr r2, _LIT4
    mov r0, #0x1
    mov r1, r4
    str r0, [r2, #0x68c]
    ldr r2, [r1, #0x300]
    orr r2, r2, #0x20
    str r2, [r1, #0x300]
    ldmia sp!, {r3, r4, r5, pc}
.L_3c4:
    ldr r0, _LIT5
    ldrh r1, [r4, #0x2]
    ldr r0, [r0, #0x4]
    ldr r2, _LIT7
    mov r3, #0x8
    bl func_ov002_0226ac34
    ldr r1, _LIT1
    mov r0, #0x1
    str r0, [r1, #0xd8c]
    ldmia sp!, {r3, r4, r5, pc}
.L_3ec:
    ldr r0, _LIT8
    ldr r1, _LIT3
    mov r2, #0x10
    bl func_ov002_0229cc60
    mov r1, r4
    ldr r2, [r1, #0x300]
    mov r0, #0x1
    orr r2, r2, #0x200
    str r2, [r1, #0x300]
    ldmia sp!, {r3, r4, r5, pc}
.L_414:
    ldrh r4, [r4, #0x2]
    ldr r0, _LIT6
    mov r2, #0x18
    mla r0, r4, r2, r0
    ldr r3, _LIT4
    ldr r1, _LIT7
    str r4, [r3, #0x484]
    bl func_ov002_0229cc60
    ldr r2, _LIT9
    ldr r1, _LIT0
    ldrh r3, [r2, #0xc]
    mov r0, #0x1
    bic r3, r3, #0xff00
    strh r3, [r2, #0xc]
    ldr r2, [r1, #0x300]
    orr r2, r2, #0x1000
    str r2, [r1, #0x300]
    ldmia sp!, {r3, r4, r5, pc}
.L_45c:
    ldr r1, [r4, #0x300]
    ldr r0, _LIT4
    orr r1, r1, #0x2000
    str r1, [r4, #0x300]
    ldr r1, [r0, #0x484]
    ldr r0, _LIT6
    mov r2, #0x18
    mla r0, r1, r2, r0
    ldr r1, _LIT3
    bl func_ov002_0229cc60
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_48c:
    ldrh r4, [r4, #0x2]
    ldr r0, _LIT6
    mov r2, #0x18
    mla r0, r4, r2, r0
    ldr r3, _LIT4
    ldr r1, _LIT7
    str r4, [r3, #0x484]
    bl func_ov002_0229cc60
    ldr r2, _LIT9
    ldr r1, _LIT0
    ldrh r3, [r2, #0xe]
    mov r0, #0x1
    bic r3, r3, #0xff
    strh r3, [r2, #0xe]
    ldr r2, [r1, #0x300]
    orr r2, r2, #0x400
    str r2, [r1, #0x300]
    ldmia sp!, {r3, r4, r5, pc}
.L_4d4:
    ldr r1, [r4, #0x300]
    ldr r0, _LIT4
    orr r1, r1, #0x800
    str r1, [r4, #0x300]
    ldr r1, [r0, #0x484]
    ldr r0, _LIT6
    mov r2, #0x18
    mla r0, r1, r2, r0
    ldr r1, _LIT3
    bl func_ov002_0229cc60
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_504:
    ldrh ip, [r4, #0x2]
    ldr r0, _LIT6
    mov r2, #0x18
    mla r4, ip, r2, r0
    ldr r3, _LIT4
    ldr r1, _LIT7
    mov r0, r4
    str ip, [r3, #0x484]
    bl func_ov002_0229cc60
    ldrh r0, [r4, #0x4]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    bne .L_59c
    ldrh r0, [r4]
    bl func_0202e1e0
    cmp r0, #0x0
    bne .L_58c
    ldrh r2, [r4, #0x2]
    ldr r0, _LIT5
    mov r1, r2, lsl #0x11
    mov r2, r2, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r3, [r0, #0x4]
    eor r0, r1, r2, lsr #0x1f
    cmp r3, r0
    bne .L_58c
    ldrh r0, [r4, #0x4]
    ldr r2, _LIT10
    mov r0, r0, lsl #0x11
    mov r0, r0, lsr #0x17
    mov r1, r0, lsl #0x2
    ldrh r0, [r2, r1]
    orr r0, r0, #0x8000
    strh r0, [r2, r1]
.L_58c:
    ldr r1, _LIT4
    mov r0, r4
    ldr r1, [r1, #0x484]
    bl func_ov002_021b0b74
.L_59c:
    mov r0, r4
    bl func_ov002_021fd838
    cmp r0, #0x0
    bne .L_5c8
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    mov r0, #0x19
    bl func_ov002_021b1378
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_5c8:
    ldr r2, _LIT9
    ldr r1, _LIT0
    ldrh r3, [r2, #0xe]
    mov r0, #0x1
    bic r3, r3, #0xff00
    strh r3, [r2, #0xe]
    ldr r2, [r1, #0x300]
    orr r2, r2, #0x4000
    str r2, [r1, #0x300]
    ldmia sp!, {r3, r4, r5, pc}
.L_5f0:
    ldr r0, _LIT4
    mov r1, #0x0
    str r1, [r0, #0x5a8]
    cmp r5, #0x18
    movcc r0, #0x1
    ldmccia sp!, {r3, r4, r5, pc}
    ldr r1, [r0, #0x480]
    cmp r1, #0x1
    ble .L_634
    ldr r2, _LIT6
    sub r1, r1, #0x2
    mov r0, #0x18
    mla r0, r1, r0, r2
    ldr r1, _LIT3
    mov r2, #0x30
    bl func_ov002_0229cc60
    b .L_64c
.L_634:
    ldr r0, _LIT6
    sub r1, r1, #0x1
    mov r2, #0x18
    mla r0, r1, r2, r0
    ldr r1, _LIT3
    bl func_ov002_0229cc60
.L_64c:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_654:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_65c:
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4, #0x4]
    ldrh r2, [r4, #0x6]
    ldrh r3, [r4, #0x8]
    bl func_ov002_021d47b8
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_678:
    ldr r1, [r4, #0x300]
    mov r0, #0x1
    orr r1, r1, #0x8
    str r1, [r4, #0x300]
    ldmia sp!, {r3, r4, r5, pc}
.L_68c:
    ldr r0, _LIT1
    mov r1, #0x1
    str r1, [r0, #0xd10]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_6a0:
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    mov r0, #0x1
    bl func_ov002_021b1378
    ldr r0, _LIT1
    mov r1, #0x1
    str r1, [r0, #0xd10]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022cd888
_LIT1: .word data_ov002_022d008c
_LIT2: .word data_ov002_022cd220
_LIT3: .word data_ov002_022cd88a
_LIT4: .word data_ov002_022ce1a8
_LIT5: .word data_ov002_022cd65c
_LIT6: .word data_ov002_022ce4a8
_LIT7: .word data_ov002_022cd88c
_LIT8: .word data_ov002_022d0e3c
_LIT9: .word data_ov002_022cdb88
_LIT10: .word data_ov002_022d0170
