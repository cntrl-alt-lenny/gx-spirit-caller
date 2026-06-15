; func_ov008_021ad018 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov008_021b2780
        .extern data_ov008_021b279c
        .extern data_ov008_021b2c80
        .extern data_ov008_021b2dc0
        .extern func_02006110
        .extern func_02006164
        .extern func_02037208
        .extern func_020b3870
        .extern func_ov008_021aa578
        .extern func_ov008_021ac4d0
        .extern func_ov008_021acd04
        .extern func_ov008_021acdd0
        .extern func_ov008_021aceac
        .extern func_ov008_021acfa0
        .extern func_ov008_021b1ee0
        .global func_ov008_021ad018
        .arm
func_ov008_021ad018:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    add r0, sp, #0x4
    add r1, sp, #0x0
    bl func_02006110
    mov r0, #0x2
    mov r1, #0xa4
    mov r2, #0x2c
    mov r3, #0xbe
    bl func_ov008_021aa578
    cmp r0, #0x0
    beq .L_58
    bl func_02006164
    cmp r0, #0x0
    ldrne r0, _LIT0
    movne r1, #0x1
    strne r1, [r0, #0x560]
    ldr r0, _LIT0
    ldr r1, [r0, #0x634]
    orr r1, r1, #0x2
    str r1, [r0, #0x634]
    b .L_64
.L_58:
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x560]
.L_64:
    mov r0, #0xe3
    mov r1, #0xa4
    mov r2, #0xfd
    mov r3, #0xbe
    bl func_ov008_021aa578
    cmp r0, #0x0
    beq .L_a8
    bl func_02006164
    cmp r0, #0x0
    ldrne r0, _LIT0
    movne r1, #0x1
    strne r1, [r0, #0x55c]
    ldr r0, _LIT0
    ldr r1, [r0, #0x634]
    orr r1, r1, #0x1
    str r1, [r0, #0x634]
    b .L_b4
.L_a8:
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x55c]
.L_b4:
    ldr r0, _LIT1
    ldrh r0, [r0, #0x5a]
    cmp r0, #0x6
    bls .L_344
    mov r0, #0x13
    mov r1, #0x7e
    mov r2, #0x28
    mov r3, #0x96
    bl func_ov008_021aa578
    cmp r0, #0x0
    beq .L_158
    ldr r1, _LIT0
    ldr r0, _LIT1
    ldr r2, [r1, #0x634]
    orr r2, r2, #0x10
    str r2, [r1, #0x634]
    ldrh r1, [r0, #0x58]
    cmp r1, #0x0
    bne .L_150
    ldr r2, _LIT2
    ldrh r1, [r2, #0x4]
    mov r0, r1, lsl #0x18
    movs r0, r0, lsr #0x18
    beq .L_158
    add r0, r0, #0xff
    add r0, r0, #0xff00
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0xff
    and r0, r0, #0xff
    orr r3, r1, r0
    mov r0, #0x1
    mov r1, #0x0
    strh r3, [r2, #0x4]
    bl func_ov008_021ac4d0
    ldr r0, _LIT1
    mov r1, #0x8
    strh r1, [r0, #0x58]
    b .L_158
.L_150:
    sub r1, r1, #0x1
    strh r1, [r0, #0x58]
.L_158:
    mov r0, #0x2
    mov r1, #0x41
    mov r2, #0xa
    mov r3, #0x51
    bl func_ov008_021aa578
    cmp r0, #0x0
    beq .L_1dc
    ldr r0, _LIT1
    ldrh r1, [r0, #0x58]
    cmp r1, #0x0
    bne .L_1d4
    ldr r2, _LIT2
    ldrh r1, [r2, #0x4]
    mov r0, r1, lsl #0x18
    movs r0, r0, lsr #0x18
    beq .L_1dc
    add r0, r0, #0xff
    add r0, r0, #0xff00
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0xff
    and r0, r0, #0xff
    orr r3, r1, r0
    mov r0, #0x1
    mov r1, #0x0
    strh r3, [r2, #0x4]
    bl func_ov008_021ac4d0
    ldr r0, _LIT1
    mov r1, #0x8
    strh r1, [r0, #0x58]
    b .L_1dc
.L_1d4:
    sub r1, r1, #0x1
    strh r1, [r0, #0x58]
.L_1dc:
    mov r0, #0xd6
    mov r1, #0x7e
    mov r2, #0xeb
    mov r3, #0x96
    bl func_ov008_021aa578
    cmp r0, #0x0
    beq .L_278
    ldr r1, _LIT0
    ldr r0, _LIT1
    ldr r2, [r1, #0x634]
    orr r2, r2, #0x20
    str r2, [r1, #0x634]
    ldrh r1, [r0, #0x58]
    cmp r1, #0x0
    bne .L_270
    ldr r2, _LIT2
    ldrh r0, [r0, #0x5a]
    ldrh r3, [r2, #0x4]
    sub r0, r0, #0x6
    mov r1, r3, lsl #0x18
    cmp r0, r1, lsr #0x18
    mov r0, r1, lsr #0x18
    ble .L_278
    add r0, r0, #0x1
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    mov r0, #0x1
    bic r3, r3, #0xff
    and r1, r1, #0xff
    orr r3, r3, r1
    mov r1, r0
    strh r3, [r2, #0x4]
    bl func_ov008_021ac4d0
    ldr r0, _LIT1
    mov r1, #0x8
    strh r1, [r0, #0x58]
    b .L_278
.L_270:
    sub r1, r1, #0x1
    strh r1, [r0, #0x58]
.L_278:
    mov r0, #0xf6
    mov r1, #0x41
    mov r2, #0xfe
    mov r3, #0x51
    bl func_ov008_021aa578
    cmp r0, #0x0
    beq .L_304
    ldr r0, _LIT1
    ldrh r1, [r0, #0x58]
    cmp r1, #0x0
    bne .L_2fc
    ldr r2, _LIT2
    ldrh r0, [r0, #0x5a]
    ldrh r3, [r2, #0x4]
    sub r0, r0, #0x6
    mov r1, r3, lsl #0x18
    cmp r0, r1, lsr #0x18
    mov r0, r1, lsr #0x18
    ble .L_304
    add r0, r0, #0x1
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    mov r0, #0x1
    bic r3, r3, #0xff
    and r1, r1, #0xff
    orr r3, r3, r1
    mov r1, r0
    strh r3, [r2, #0x4]
    bl func_ov008_021ac4d0
    ldr r0, _LIT1
    mov r1, #0x8
    strh r1, [r0, #0x58]
    b .L_304
.L_2fc:
    sub r1, r1, #0x1
    strh r1, [r0, #0x58]
.L_304:
    mov r0, #0x28
    mov r1, #0x7e
    mov r2, #0xd6
    mov r3, #0x96
    bl func_ov008_021aa578
    cmp r0, #0x0
    beq .L_344
    ldr r0, _LIT0
    ldr r1, [r0, #0x634]
    orr r1, r1, #0x100
    str r1, [r0, #0x634]
    ldr r0, [sp, #0x4]
    bl func_ov008_021acd04
    ldr r0, _LIT1
    mov r1, #0x0
    strh r1, [r0, #0x58]
.L_344:
    ldr r0, _LIT1
    ldrh r4, [r0, #0x5a]
    mov r0, #0xf0
    cmp r4, #0x6
    movhi r4, #0x6
    mov r1, r4, lsl #0x1
    bl func_020b3870
    mul r1, r0, r4
    add r2, r0, #0x8
    add r1, r2, r1, lsl #0x1
    sub r2, r1, #0x10
    sub r0, r0, #0x8
    mov r1, #0x24
    mov r3, #0x64
    bl func_ov008_021aa578
    cmp r0, #0x0
    beq .L_3d4
    bl func_02006164
    cmp r0, #0x0
    beq .L_3c8
    ldr r1, _LIT2
    ldrh r2, [r1, #0x4]
    ldrh r3, [r1, #0x6]
    mov r0, r2, lsl #0x10
    mov r2, r2, lsl #0x18
    mov r0, r0, lsr #0x18
    add r0, r0, r2, lsr #0x18
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r2, r3, #0xff
    and r0, r0, #0xff
    orr r0, r2, r0
    strh r0, [r1, #0x6]
.L_3c8:
    ldr r0, [sp, #0x4]
    bl func_ov008_021acdd0
    b .L_3e8
.L_3d4:
    ldr r0, _LIT2
    ldrh r1, [r0, #0x6]
    bic r1, r1, #0xff
    orr r1, r1, #0x1a
    strh r1, [r0, #0x6]
.L_3e8:
    mov r0, #0x2e
    mov r1, #0xa4
    mov r2, #0x48
    mov r3, #0xbe
    bl func_ov008_021aa578
    cmp r0, #0x0
    beq .L_480
    ldr r0, _LIT0
    ldr r1, [r0, #0x634]
    orr r1, r1, #0x4
    str r1, [r0, #0x634]
    bl func_02006164
    cmp r0, #0x0
    beq .L_480
    ldr r1, _LIT2
    mov r0, #0x34
    ldrh r3, [r1, #0x4]
    ldr r1, _LIT3
    mov r2, r3, lsl #0x10
    mov r3, r3, lsl #0x18
    mov r2, r2, lsr #0x18
    add r2, r2, r3, lsr #0x18
    mul r0, r2, r0
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    beq .L_46c
    bl func_ov008_021aceac
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    b .L_480
.L_46c:
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
.L_480:
    mov r0, #0x4a
    mov r1, #0xa4
    mov r2, #0x64
    mov r3, #0xbe
    bl func_ov008_021aa578
    cmp r0, #0x0
    beq .L_500
    ldr r0, _LIT0
    ldr r1, [r0, #0x634]
    orr r1, r1, #0x8
    str r1, [r0, #0x634]
    bl func_02006164
    cmp r0, #0x0
    beq .L_500
    ldr r1, _LIT2
    mov r0, #0x34
    ldrh r3, [r1, #0x4]
    ldr r1, _LIT3
    mov r2, r3, lsl #0x10
    mov r3, r3, lsl #0x18
    mov r2, r2, lsr #0x18
    add r2, r2, r3, lsr #0x18
    mul r0, r2, r0
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    beq .L_500
    bl func_ov008_021acfa0
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
.L_500:
    bl func_ov008_021b1ee0
    cmp r0, #0x0
    addeq sp, sp, #0x8
    ldmeqia sp!, {r4, pc}
    mov r0, #0xe3
    mov r1, #0x0
    mov r2, #0x100
    mov r3, #0x14
    bl func_ov008_021aa578
    cmp r0, #0x0
    addeq sp, sp, #0x8
    ldmeqia sp!, {r4, pc}
    ldr r0, _LIT0
    ldr r1, [r0, #0x634]
    orr r1, r1, #0x400
    str r1, [r0, #0x634]
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov008_021b2780
_LIT1: .word data_ov008_021b2c80
_LIT2: .word data_ov008_021b2dc0
_LIT3: .word data_ov008_021b279c
