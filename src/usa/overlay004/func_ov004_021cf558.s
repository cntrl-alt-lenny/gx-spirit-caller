; func_ov004_021cf558 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103fcc
        .extern data_0210596c
        .extern data_ov004_0220b2a0
        .extern data_ov004_0220e2a0
        .extern data_ov004_02291388
        .extern func_02008f08
        .extern func_02012420
        .extern func_02012470
        .extern func_0201cf8c
        .extern func_0201cfec
        .extern func_0201cffc
        .extern func_0201d2f8
        .extern func_0201d310
        .extern func_0201d330
        .extern func_02020418
        .extern func_0202c06c
        .extern func_02034768
        .extern func_020347f4
        .extern func_02034838
        .extern func_020371b8
        .extern func_ov004_021c9e10
        .extern func_ov004_021ca0b8
        .extern func_ov004_021ce10c
        .extern func_ov004_021cec98
        .extern func_ov004_021ced18
        .extern func_ov004_021cef90
        .extern func_ov004_021cf2c8
        .extern func_ov004_021cf520
        .extern func_ov004_021d86ac
        .extern func_ov004_021d8be4
        .extern func_ov004_021d8c6c
        .extern func_ov004_021d9000
        .global func_ov004_021cf558
        .arm
func_ov004_021cf558:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x254
    ldr r0, _LIT0
    mvn r1, #0x0
    str r1, [r0, #0xbd8]
    ldr r4, _LIT1
    bl func_02034768
    cmp r0, #0x0
    bne .L_80
    mov r0, #0x0
    str r0, [r4, #0x48]
    str r0, [r4, #0x54]
    str r0, [r4, #0x58]
    str r0, [r4, #0x8c]
    bl func_02020418
    cmp r0, #0x0
    beq .L_54
    bl func_0201d310
    mov r0, #0x0
    bl func_0201cffc
    b .L_58
.L_54:
    bl func_0201d330
.L_58:
    ldr r0, _LIT2
    ldr r0, [r0]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq .L_4f0
    ldr r0, _LIT2
    bl func_ov004_021d8be4
    b .L_4f0
.L_80:
    bl func_ov004_021cef90
    cmp r0, #0x0
    bne .L_4f0
    bl func_0201d2f8
    cmp r0, #0x0
    ldreq r0, [r4, #0x5c]
    cmpeq r0, #0x0
    bne .L_4f0
    mov r0, r4
    ldr r0, [r0, #0x44]
    cmp r0, #0x0
    ldr r0, [r4, #0x54]
    beq .L_1d4
    cmp r0, #0x4
    beq .L_c8
    cmp r0, #0x5
    beq .L_114
    b .L_4f0
.L_c8:
    mov r0, #0x0
    bl func_0201cffc
    ldr r0, [r4, #0x220]
    cmp r0, #0x0
    beq .L_4f0
    mov r0, #0x100
    bl func_ov004_021c9e10
    ldr r1, [r4, #0x54]
    ldr r0, _LIT3
    add r1, r1, #0x1
    str r1, [r4, #0x54]
    bl func_0202c06c
    mov r1, r0
    ldr r0, _LIT2
    mov r2, #0x1
    bl func_ov004_021d86ac
    mov r0, #0x2
    str r0, [r4, #0x22c]
    b .L_4f0
.L_114:
    ldr r0, [r4, #0x224]
    cmp r0, #0x0
    bne .L_144
    ldr r3, [r4, #0x22c]
    mov ip, #0x1
    mov r2, #0x4
    add r1, sp, #0x2
    mov r0, #0x3
    str ip, [r4, #0x224]
    strh r2, [sp, #0x2]
    strh r3, [sp, #0x4]
    bl func_02034838
.L_144:
    ldr r0, [r4, #0x224]
    cmp r0, #0x0
    addne r0, r0, #0x1
    strne r0, [r4, #0x224]
    ldr r0, [r4, #0x228]
    cmp r0, #0x0
    addne r0, r0, #0x1
    strne r0, [r4, #0x228]
    ldr r0, [r4, #0x224]
    cmp r0, #0x1e
    ldrgt r0, [r4, #0x228]
    cmpgt r0, #0x1e
    ble .L_4f0
    bl func_ov004_021cec98
    cmp r0, #0x0
    beq .L_1c4
    ldr r0, [r4, #0x22c]
    mov r1, #0x1
    str r1, [r4, #0x234]
    cmp r0, #0x2
    bne .L_4f0
    mov r0, #0x3
    bl func_0201cffc
    mov r3, #0x3
    mov r2, #0xe
    add r0, r4, #0x3000
    mov r1, #0x0
    str r3, [r4, #0x48]
    str r2, [r4, #0x54]
    str r1, [r0, #0xc10]
    str r1, [r0, #0xc0c]
    b .L_4f0
.L_1c4:
    mov r0, #0x0
    str r0, [r4, #0x228]
    str r0, [r4, #0x224]
    b .L_4f0
.L_1d4:
    cmp r0, #0x13
    bgt .L_214
    bge .L_44c
    cmp r0, #0x9
    addls pc, pc, r0, lsl #0x2
    b .L_4f0
    b .L_4f0
    b .L_4f0
    b .L_4f0
    b .L_4f0
    b .L_220
    b .L_24c
    b .L_4f0
    b .L_3d0
    b .L_4f0
    b .L_3d0
.L_214:
    cmp r0, #0x16
    beq .L_4d8
    b .L_4f0
.L_220:
    mov r0, #0x0
    bl func_0201cffc
    ldr r0, [r4, #0x220]
    cmp r0, #0x0
    beq .L_4f0
    mov r0, #0xe1
    bl func_ov004_021c9e10
    ldr r0, [r4, #0x54]
    add r0, r0, #0x1
    str r0, [r4, #0x54]
    b .L_4f0
.L_24c:
    bl func_ov004_021ced18
    ldr r0, [r4, #0x224]
    cmp r0, #0x0
    addne r0, r0, #0x1
    strne r0, [r4, #0x224]
    ldr r0, [r4, #0x228]
    cmp r0, #0x0
    addne r0, r0, #0x1
    strne r0, [r4, #0x228]
    ldr r0, [r4, #0x224]
    cmp r0, #0x1e
    ldrgt r0, [r4, #0x228]
    cmpgt r0, #0x1e
    ble .L_4f0
    bl func_ov004_021cec98
    cmp r0, #0x0
    beq .L_3a4
    ldr r1, [r4, #0x22c]
    mov r0, #0x1
    str r0, [r4, #0x234]
    cmp r1, #0x4
    addls pc, pc, r1, lsl #0x2
    b .L_4f0
    b .L_2bc
    b .L_2ec
    b .L_320
    b .L_34c
    b .L_368
.L_2bc:
    bl func_0201cffc
    mov r1, #0x7
    mov r0, #0xd4
    str r1, [r4, #0x54]
    bl func_ov004_021c9e10
    bl func_020347f4
    cmp r0, #0x0
    moveq r0, #0x1
    ldr r1, _LIT4
    movne r0, #0x0
    bl func_02012420
    b .L_4f0
.L_2ec:
    mov r0, #0x2
    bl func_0201cffc
    mov r1, #0x7
    mov r0, #0xd4
    str r1, [r4, #0x54]
    bl func_ov004_021c9e10
    bl func_020347f4
    cmp r0, #0x0
    moveq r0, #0x1
    ldr r1, _LIT4
    movne r0, #0x0
    bl func_02012420
    b .L_4f0
.L_320:
    mov r0, #0x3
    bl func_0201cffc
    mov r3, #0x3
    mov r2, #0xe
    add r0, r4, #0x3000
    mov r1, #0x0
    str r3, [r4, #0x48]
    str r2, [r4, #0x54]
    str r1, [r0, #0xc10]
    str r1, [r0, #0xc0c]
    b .L_4f0
.L_34c:
    mov r0, #0x4
    bl func_0201cffc
    mov r1, #0x8
    mov r0, #0x12
    str r1, [r4, #0x48]
    str r0, [r4, #0x54]
    b .L_4f0
.L_368:
    mov r0, #0x5
    bl func_0201cffc
    mov r0, #0xdf
    bl func_ov004_021c9e10
    mov r2, #0x14
    mov r1, #0x0
    mov r0, #0xdf
    str r2, [r4, #0x54]
    str r1, [r4, #0x80]
    bl func_0202c06c
    mov r1, r0
    ldr r0, _LIT2
    mov r2, #0x0
    bl func_ov004_021d86ac
    b .L_4f0
.L_3a4:
    mov r1, #0x0
    mov r0, #0xea
    str r1, [r4, #0x228]
    str r1, [r4, #0x224]
    bl func_ov004_021c9e10
    mov r0, #0x42
    sub r1, r0, #0x43
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    b .L_4f0
.L_3d0:
    bl func_0201cfec
    cmp r0, #0x2
    moveq r2, #0x1
    movne r2, #0x0
    ldr r0, [r4, #0x220]
    mov r1, #0x1
    str r2, [r4, #0x230]
    str r2, [r4, #0x22c]
    str r1, [r4, #0x234]
    cmp r0, #0x0
    beq .L_4f0
    bl func_0201cf8c
    cmp r0, #0x0
    beq .L_434
    add r1, sp, #0x100
    add r1, r1, #0x2e
    mov r3, #0x6
    add r2, sp, #0x100
    mov r0, #0x0
    strh r3, [r2, #0x2c]
    bl func_02012470
    ldr r2, _LIT5
    add r1, sp, #0x12c
    mov r0, #0x3
    bl func_02034838
.L_434:
    mov r0, #0xd4
    bl func_ov004_021c9e10
    ldr r0, [r4, #0x54]
    add r0, r0, #0x1
    str r0, [r4, #0x54]
    b .L_4f0
.L_44c:
    ldr r0, _LIT6
    ldr r1, [r0, #0x3c]
    cmp r1, #0x0
    blt .L_484
    mov r3, #0x11
    add r2, sp, #0x8
    mov r0, #0x0
    strh r3, [sp, #0x6]
    bl func_02008f08
    ldr r2, _LIT5
    add r1, sp, #0x6
    mov r0, #0x3
    bl func_02034838
    b .L_49c
.L_484:
    mov r3, #0x12
    add r1, sp, #0x0
    mov r0, #0x3
    mov r2, #0x2
    strh r3, [sp]
    bl func_02034838
.L_49c:
    mov r1, #0x0
    mov r2, #0x4
    mov r0, #0xdf
    str r2, [r4, #0x54]
    str r1, [r4, #0x230]
    str r1, [r4, #0x22c]
    str r1, [r4, #0x220]
    str r1, [r4, #0x228]
    str r1, [r4, #0x224]
    bl func_0202c06c
    mov r1, r0
    ldr r0, _LIT2
    mov r2, #0x0
    bl func_ov004_021d86ac
    b .L_4f0
.L_4d8:
    ldr r0, _LIT2
    mov r2, #0x4
    mov r1, #0x1
    str r2, [r4, #0x54]
    str r1, [r4, #0x220]
    bl func_ov004_021d8be4
.L_4f0:
    ldr r0, _LIT2
    bl func_ov004_021d8c6c
    ldr r0, _LIT1
    ldr r0, [r0, #0x44]
    cmp r0, #0x0
    beq .L_510
    bl func_ov004_021cf520
    b .L_514
.L_510:
    bl func_ov004_021cf2c8
.L_514:
    bl func_ov004_021ca0b8
    ldr r0, _LIT2
    bl func_ov004_021d9000
    bl func_ov004_021ce10c
    mov r0, #0x0
    add sp, sp, #0x254
    ldmia sp!, {r3, r4, pc}
_LIT0: .word data_ov004_0220e2a0
_LIT1: .word data_ov004_0220b2a0
_LIT2: .word data_ov004_02291388
_LIT3: .word 0x00000101
_LIT4: .word data_0210596c
_LIT5: .word 0x00000126
_LIT6: .word data_02103fcc
