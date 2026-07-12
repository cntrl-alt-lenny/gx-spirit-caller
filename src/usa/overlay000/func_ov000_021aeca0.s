; func_ov000_021aeca0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020bee8c
        .extern data_02104e6c
        .extern data_ov000_021c74ac
        .extern data_ov000_021c74e4
        .extern func_02001da4
        .extern func_02001e3c
        .extern func_02001e64
        .extern func_02005598
        .extern func_0201ea4c
        .extern func_0207fc40
        .extern func_02094410
        .extern func_ov000_021ab3dc
        .extern func_ov000_021ab40c
        .extern func_ov000_021ab4f8
        .extern func_ov000_021ab5a8
        .extern func_ov000_021ae10c
        .extern func_ov000_021ae870
        .global func_ov000_021aeca0
        .arm
func_ov000_021aeca0:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x28
    ldr r0, _LIT0
    ldr r4, _LIT1
    ldr r0, [r0, #0x2a4]
    mov r0, r0, lsl #0x1
    mov r5, r0, lsr #0x18
    bl func_ov000_021ae870
    cmp r5, #0x6
    addls pc, pc, r5, lsl #0x2
    b .L_564
    b .L_564
    b .L_48
    b .L_11c
    b .L_2b4
    b .L_188
    b .L_198
    b .L_208
.L_48:
    ldr r0, [r4, #0x270]
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    add r6, r0, #0x10
    cmp r6, #0xff
    movgt r6, #0xff
    bgt .L_6c
    cmp r6, #0x0
    movlt r6, #0x0
.L_6c:
    mov r0, #0x1
    mov r1, #0xe
    mov r2, #0x2
    bl func_ov000_021ab5a8
    mov r0, #0x1
    mov r1, #0x4
    mov r2, #0x33
    bl func_ov000_021ab4f8
    mov r0, #0x1
    mov r1, #0x4
    bl func_ov000_021ab3dc
    mov r1, r6, asr #0x1
    mul r0, r1, r1
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    rsb r0, r0, r1, lsl #0x7
    mov r1, r0, lsl #0x6
    mov r0, r1, asr #0xc
    add r0, r1, r0, lsr #0x13
    mov r2, r0, asr #0xd
    sub r3, r2, #0x40
    ldr r0, _LIT2
    ldr r2, _LIT3
    and r0, r0, r3, lsl #0x10
    str r0, [r2]
    str r0, [r2, #0x4]
    ldr r0, [r4, #0x270]
    and r1, r6, #0xff
    bic r0, r0, #0xff
    orr r0, r0, r1
    str r0, [r4, #0x270]
    cmp r6, #0xff
    bne .L_100
    bic r0, r0, #0xff
    str r0, [r4, #0x270]
    add r5, r5, #0x1
    b .L_564
.L_100:
    cmp r6, #0x0
    bne .L_564
    mov r0, #0x1
    mov r1, #0xc
    bl func_ov000_021ab40c
    mov r5, #0x0
    b .L_564
.L_11c:
    ldr r0, [r4, #0x270]
    ldr ip, [r4, #0x274]
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    add r0, r0, #0x20
    cmp r0, #0xff
    mov r1, ip, lsl #0x19
    addgt r5, r5, #0x1
    movgt r0, #0xff
    movs r1, r1, lsr #0x1f
    bne .L_170
    ldr r2, _LIT4
    mov r3, r0, lsl #0x2
    smull r1, r6, r2, r3
    add r6, r6, r0, lsl #0x2
    mov r1, r3, lsr #0x1f
    add r6, r1, r6, asr #0x7
    bic r2, ip, #0x380
    mov r1, r6, lsl #0x1d
    orr r1, r2, r1, lsr #0x16
    str r1, [r4, #0x274]
.L_170:
    ldr r1, [r4, #0x270]
    and r0, r0, #0xff
    bic r1, r1, #0xff
    orr r0, r1, r0
    str r0, [r4, #0x270]
    b .L_564
.L_188:
    ldr r0, [r4, #0x270]
    add r5, r5, #0x1
    bic r0, r0, #0xff
    str r0, [r4, #0x270]
.L_198:
    ldr r0, [r4, #0x270]
    ldr ip, [r4, #0x274]
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    add r0, r0, #0x20
    cmp r0, #0xff
    mov r1, ip, lsl #0x19
    addgt r5, r5, #0x1
    movgt r0, #0xff
    movs r1, r1, lsr #0x1f
    bne .L_1f0
    ldr r2, _LIT4
    mov r3, r0, lsl #0x2
    smull r1, r6, r2, r3
    add r6, r6, r0, lsl #0x2
    mov r1, r3, lsr #0x1f
    add r6, r1, r6, asr #0x7
    rsb r1, r6, #0x4
    bic r2, ip, #0x380
    mov r1, r1, lsl #0x1d
    orr r1, r2, r1, lsr #0x16
    str r1, [r4, #0x274]
.L_1f0:
    ldr r1, [r4, #0x270]
    and r0, r0, #0xff
    bic r1, r1, #0xff
    orr r0, r1, r0
    str r0, [r4, #0x270]
    b .L_564
.L_208:
    ldr r0, [r4, #0x270]
    mov r1, #0xe
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    subs r6, r0, #0x10
    mov r0, #0x1
    mov r2, #0x2
    movmi r6, #0x0
    bl func_ov000_021ab5a8
    mov r0, #0x1
    mov r1, #0x4
    mov r2, #0x33
    bl func_ov000_021ab4f8
    mov r0, #0x1
    mov r1, #0x4
    bl func_ov000_021ab3dc
    mov r1, r6, asr #0x1
    mul r0, r1, r1
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    rsb r0, r0, r1, lsl #0x7
    mov r1, r0, lsl #0x6
    mov r0, r1, asr #0xc
    add r0, r1, r0, lsr #0x13
    mov r2, r0, asr #0xd
    sub r3, r2, #0x40
    ldr r0, _LIT2
    ldr r2, _LIT3
    and r0, r0, r3, lsl #0x10
    str r0, [r2]
    str r0, [r2, #0x4]
    ldr r0, [r4, #0x270]
    and r1, r6, #0xff
    bic r0, r0, #0xff
    orr r0, r0, r1
    str r0, [r4, #0x270]
    cmp r6, #0x0
    bne .L_564
    mov r0, #0x1
    mov r1, #0xc
    bl func_ov000_021ab40c
    mov r5, #0x0
    b .L_564
.L_2b4:
    ldr r0, [r4, #0x274]
    mov r0, r0, lsl #0x2
    movs r1, r0, lsr #0x18
    beq .L_34c
    ldr r0, [r4, #0x278]
    ldr r3, _LIT5
    mov r0, r0, lsl #0x18
    subs r1, r1, r0, lsr #0x18
    movmi r1, #0x0
    mul r6, r1, r3
    ldr r0, [r4, #0x278]
    ldr r2, _LIT4
    mov lr, r0, lsl #0x10
    smull r0, ip, r2, r6
    mov r0, lr, lsr #0x18
    mul lr, r0, r1
    umull r2, r0, lr, r2
    add ip, r6, ip
    mov r2, r6, lsr #0x1f
    add ip, r2, ip, asr #0x7
    mov r2, ip, lsl #0x10
    mov r2, r2, lsr #0x10
    mov r6, r2, asr #0x4
    ldr r2, _LIT6
    mov r6, r6, lsl #0x2
    ldrsh r6, [r2, r6]
    mov r0, r0, lsr #0x7
    mov r2, r3, lsr #0xa
    mul r3, r0, r6
    ldr r0, _LIT3
    and r2, r2, r3, lsr #0xc
    str r2, [r0]
    str r2, [r0, #0x4]
    ldr r2, [r4, #0x274]
    mov r0, r1, lsl #0x18
    bic r1, r2, #0x3fc00000
    orr r0, r1, r0, lsr #0x2
    str r0, [r4, #0x274]
.L_34c:
    ldr r0, [r4, #0x274]
    mov r1, #0xc
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    mov r0, #0x1
    beq .L_36c
    bl func_ov000_021ab3dc
    b .L_370
.L_36c:
    bl func_ov000_021ab40c
.L_370:
    add r0, r4, #0x1ac
    bl func_02005598
    add r0, r4, #0x1ac
    bl func_02001e64
    cmp r0, #0x0
    bne .L_3a8
    add r0, r4, #0x1ac
    bl func_02001e3c
    cmp r0, #0x0
    bne .L_3a8
    ldr r0, [r4, #0x270]
    orr r0, r0, #0x100
    str r0, [r4, #0x270]
    b .L_3b4
.L_3a8:
    ldr r0, [r4, #0x270]
    bic r0, r0, #0x100
    str r0, [r4, #0x270]
.L_3b4:
    add r0, r4, #0x1ac
    bl func_02001e64
    cmp r0, #0x0
    bne .L_3d8
    add r0, r4, #0x1ac
    bl func_02001e3c
    cmp r0, #0x0
    moveq r6, #0x1
    beq .L_3dc
.L_3d8:
    mov r6, #0x0
.L_3dc:
    cmp r6, #0x0
    bne .L_410
    ldr r0, _LIT7
    ldr r1, [r4, #0x270]
    ldr r0, [r0, #0x4]
    bic r1, r1, #0x200
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    str r1, [r4, #0x270]
    moveq r1, #0x5
    movne r1, #0x2
    add r0, r4, #0x1ac
    bl func_02001da4
.L_410:
    bl func_ov000_021ae10c
    ldr r0, [r4, #0x270]
    mov r0, r0, lsl #0x16
    movs r0, r0, lsr #0x1f
    beq .L_47c
    cmp r6, #0x0
    add r0, r4, #0x1ac
    beq .L_43c
    mov r1, #0x0
    bl func_02001da4
    b .L_498
.L_43c:
    bl func_02001e3c
    cmp r0, #0x0
    bne .L_498
    ldr r1, [r4, #0x1d8]
    mov r0, #0x0
    mov r2, #0x1880
    bl func_02094410
    mov r0, #0x200
    ldr r1, [r4, #0x1cc]
    rsb r0, r0, #0x0
    and r1, r1, r0
    mov r0, r1, lsl #0xe
    mov r0, r0, lsr #0x17
    str r1, [r4, #0x1cc]
    str r0, [r4, #0x1b8]
    b .L_498
.L_47c:
    ldr r0, [r4, #0x1c8]
    mov r0, r0, lsl #0x18
    movs r0, r0, lsr #0x18
    beq .L_498
    add r0, r4, #0x1ac
    mov r1, #0x5
    bl func_02001da4
.L_498:
    ldr r0, [r4, #0x26c]
    mov r0, r0, lsl #0x17
    mov r0, r0, lsr #0x1e
    cmp r0, #0x1
    beq .L_564
    ldr r0, [r4, #0x270]
    mov r0, r0, lsl #0x14
    movs r0, r0, lsr #0x1f
    beq .L_4dc
    add r0, r4, #0x1ac
    bl func_02001e64
    cmp r0, #0x0
    bne .L_4ec
    add r0, r4, #0x1ac
    bl func_02001e3c
    cmp r0, #0x0
    bne .L_4ec
.L_4dc:
    ldr r0, [r4, #0x270]
    mov r0, r0, lsl #0x15
    movs r0, r0, lsr #0x1f
    beq .L_564
.L_4ec:
    ldr r0, [r4, #0x270]
    mov r3, #0xe7000
    mov r0, r0, lsl #0x15
    movs r0, r0, lsr #0x1f
    movne r0, #0x2
    moveq r0, #0x1
    add r0, r4, r0, lsl #0x2
    ldr r6, [r0, #0x8]
    mov r2, #0xa8000
    mov r0, r6
    mov r1, #0x1000
    str r3, [sp, #0x20]
    str r2, [sp, #0x24]
    bl func_0207fc40
    mov r3, #0x0
    str r3, [sp]
    str r3, [sp, #0x4]
    mov r0, #0x11
    str r0, [sp, #0x8]
    str r3, [sp, #0xc]
    mov r0, #0x1c000
    str r0, [sp, #0x10]
    mov r0, #0x600
    str r0, [sp, #0x14]
    str r3, [sp, #0x18]
    add r2, sp, #0x20
    mov r1, r6
    mov r0, #0x2
    str r3, [sp, #0x1c]
    bl func_0201ea4c
.L_564:
    ldr r2, [r4, #0x26c]
    ldr r0, _LIT8
    and r1, r5, #0xff
    and r2, r2, r0
    mov r0, r1, lsl #0x18
    orr r0, r2, r0, lsr #0x1
    str r0, [r4, #0x26c]
    add sp, sp, #0x28
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov000_021c74ac
_LIT1: .word data_ov000_021c74e4
_LIT2: .word 0x01ff0000
_LIT3: .word 0x04001018
_LIT4: .word 0x80808081
_LIT5: .word 0x0007fff8
_LIT6: .word data_020bee8c
_LIT7: .word data_02104e6c
_LIT8: .word 0x807fffff
