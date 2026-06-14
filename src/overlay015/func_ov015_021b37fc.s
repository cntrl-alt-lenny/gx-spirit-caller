; func_ov015_021b37fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Copy32
        .extern Fill32
        .extern Task_InvokeLocked
        .extern Task_PostLocked
        .extern data_02102c90
        .extern data_02104f4c
        .extern data_ov015_021b5e28
        .extern data_ov015_021b5e44
        .extern data_ov015_021b6828
        .extern data_ov015_021b6880
        .extern func_02001c98
        .extern func_02001d0c
        .extern func_02001d68
        .extern func_02001e40
        .extern func_02004fb8
        .extern func_02005210
        .extern func_020054a4
        .extern func_0200a2f4
        .extern func_02019528
        .extern func_0202adf8
        .extern func_0208df40
        .extern func_020945f4
        .extern func_ov005_021ab3b4
        .extern func_ov015_021b23f4
        .extern func_ov015_021b2450
        .extern func_ov015_021b2db8
        .extern func_ov015_021b2ddc
        .extern func_ov015_021b30f0
        .extern func_ov015_021b3614
        .extern func_ov015_021b3718
        .extern func_ov015_021b3ecc
        .global func_ov015_021b37fc
        .arm
func_ov015_021b37fc:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x20
    mov r6, r0
    sub r0, r6, #0x1
    mov r9, r1
    ldr r4, _LIT0
    bl func_0200a2f4
    ldr r1, _LIT1
    mov r5, r0
    ldr r0, [r1, #0x890]
    mov r1, r6
    bl func_ov005_021ab3b4
    bl func_0208df40
    mov r1, #0x0
    mov fp, r0
    mov r0, r6
    mov r2, r1
    bl func_ov015_021b3ecc
    str r0, [sp, #0x8]
    ldrh r0, [r5]
    mov r1, #0x0
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    bl func_ov015_021b3614
    mov r6, r0
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    mov r2, r6
    mov r6, r0
    mov r0, #0x0
    mov r1, r6
    bl Fill32
    ldrh r0, [r5]
    mov r1, r6
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    bl func_ov015_021b3614
    ldr r0, _LIT2
    bl func_0202adf8
    ldr r1, _LIT3
    ldr r0, _LIT1
    ldr r1, [r1, #0x4]
    mov r2, #0x1a
    mov r1, r1, lsl #0x1d
    mov r1, r1, lsr #0x1d
    str r1, [r0, #0xa58]
    ldr r1, _LIT4
    mov r0, #0x0
    strh r2, [r1, #0x8]
    mov r1, r6
    bl func_ov015_021b3718
    mov r7, r0
    add r0, r7, #0x1
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    add r2, r7, #0x1
    mov r7, r0
    mov r1, #0x0
    bl func_020945f4
    mov r0, r7
    mov r1, r6
    bl func_ov015_021b3718
    ldr r0, _LIT5
    ldrh r0, [r0]
    strh r0, [sp, #0xc]
    ldrh r0, [sp, #0xc]
    strh r0, [sp, #0xe]
    mov r0, #0x4
    mov r1, #0x0
    mov r2, #0x800
    bl func_ov015_021b2db8
    ldrh r0, [sp, #0xe]
    orr r0, r0, #0x80
    strh r0, [sp, #0xe]
    ldr r0, _LIT5
    ldrh ip, [sp, #0xe]
    ldrh r1, [r0]
    ldr r0, _LIT6
    mov r2, ip, lsl #0x12
    and sl, r1, #0x43
    mov r1, ip, lsl #0x1a
    mov r3, r1, lsr #0x1c
    mov r1, ip, lsl #0x13
    mov lr, r2, lsr #0x1f
    mov r2, r1, lsr #0x1b
    mov r1, ip, lsl #0x18
    mov ip, ip, lsl #0x10
    mov ip, ip, lsr #0x1e
    mov r1, r1, lsr #0x1f
    orr sl, sl, ip, lsl #0xe
    orr r1, sl, r1, lsl #0x7
    orr r1, r1, r2, lsl #0x8
    orr r1, r1, r3, lsl #0x2
    orr r2, r1, lr, lsl #0xd
    ldr r1, _LIT5
    strh r2, [r1]
    mov r2, #0x1dc0000
    str r2, [r1, #0x8]
    ldr r1, _LIT4
    mov r2, #0x100
    ldrh r1, [r1, #0x8]
    bl func_02001d0c
    ldr r0, _LIT3
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d68
    mov r0, #0xe
    str r0, [sp]
    ldr r0, _LIT6
    ldr r1, [sp, #0x8]
    mov r2, #0x4
    mov r3, #0x1
    bl func_02004fb8
    ldr r0, _LIT6
    add r1, sp, #0x1c
    add r2, sp, #0x18
    bl func_02001e40
    mov r0, #0xe
    str r0, [sp]
    ldr r3, [sp, #0x18]
    ldr r0, _LIT6
    mov r1, r7
    mov r2, #0x4
    add r3, r3, #0x11
    bl func_02004fb8
    ldr r0, _LIT6
    add r1, sp, #0x1c
    add r2, sp, #0x18
    bl func_02001e40
    ldrh r0, [r5, #0x4]
    mov r0, r0, lsl #0x16
    mov r0, r0, lsr #0x19
    cmp r0, #0x0
    beq .L_368
    bl func_02019528
    mov r1, #0xc
    mov sl, r0
    bl func_020054a4
    add r1, r4, #0x900
    ldrh r1, [r1, #0xec]
    mov r2, r1, lsl #0x3
    sub r1, r2, #0x3
    cmp r0, r1
    sublt r0, r2, r0
    sublt r8, r0, #0x2
    mov r0, #0xc
    str r0, [sp]
    ldr r3, [sp, #0x18]
    movge r8, #0x4
    ldr r0, _LIT6
    mov r1, sl
    mov r2, r8
    add r3, r3, #0x11
    bl func_02004fb8
    ldr r0, _LIT6
    add r1, sp, #0x1c
    add r2, sp, #0x18
    bl func_02001e40
.L_368:
    ldr r1, [sp, #0x18]
    add r0, r4, #0x900
    add r1, r1, #0x15
    mov r1, r1, asr #0x3
    strh r1, [r0, #0xee]
    ldr r0, [r9]
    cmp r0, #0x0
    beq .L_394
    bl Task_InvokeLocked
    mov r0, #0x0
    str r0, [r9]
.L_394:
    add r0, r4, #0x900
    ldrh r3, [r0, #0xec]
    ldrh r0, [r0, #0xee]
    mov r1, #0x4
    mov r2, #0x0
    mul r0, r3, r0
    mov sl, r0, lsl #0x6
    mov r0, sl
    bl Task_PostLocked
    str r0, [r9]
    mov r1, r0
    mov r2, sl
    mov r0, #0x0
    bl Fill32
    add r2, r4, #0x900
    ldrh r1, [r2, #0xec]
    ldrh r2, [r2, #0xee]
    ldr r0, _LIT6
    bl func_02001d0c
    mov r0, #0xc
    mov r1, #0x1
    bl func_02001c98
    mov r0, #0x1
    str r0, [sp]
    mov r0, #0xe
    str r0, [sp, #0x4]
    ldr r1, [sp, #0x8]
    ldr r0, _LIT6
    ldr r2, [r9]
    mov r3, #0x4
    bl func_02005210
    ldr r0, _LIT6
    add r1, sp, #0x1c
    add r2, sp, #0x18
    bl func_02001e40
    mov r0, #0xf
    mov r1, #0x1
    bl func_02001c98
    ldr r1, [sp, #0x18]
    mov r0, #0xe
    add r1, r1, #0x11
    str r1, [sp]
    str r0, [sp, #0x4]
    ldr r0, _LIT6
    ldr r2, [r9]
    mov r1, r7
    mov r3, #0x4
    bl func_02005210
    ldr r0, _LIT6
    add r1, sp, #0x1c
    add r2, sp, #0x18
    bl func_02001e40
    ldr r0, [sp, #0x1c]
    cmp r0, #0x4
    ldrle sl, [sp, #0x18]
    ldrgt r0, [sp, #0x18]
    addgt sl, r0, #0xe
    ldrh r0, [r5, #0x4]
    mov r0, r0, lsl #0x16
    movs r0, r0, lsr #0x19
    beq .L_4d8
    bl func_02019528
    ldr r2, [sp, #0x18]
    mov r1, #0xc
    add r2, r2, #0x11
    str r2, [sp]
    str r1, [sp, #0x4]
    mov r1, r0
    ldr r2, [r9]
    ldr r0, _LIT6
    mov r3, r8
    bl func_02005210
    ldr r0, _LIT6
    add r1, sp, #0x1c
    add r2, sp, #0x18
    bl func_02001e40
    ldr r0, [sp, #0x1c]
    cmp r0, #0x4
    ldrle sl, [sp, #0x18]
    ldrgt r0, [sp, #0x18]
    addgt sl, r0, #0xc
.L_4d8:
    mov r0, r7
    bl Task_InvokeLocked
    mov r2, #0x0
    mvn r1, #0x0
.L_4e8:
    add r0, r4, r2, lsl #0x1
    add r0, r0, #0x900
    add r2, r2, #0x1
    strh r1, [r0, #0xf0]
    cmp r2, #0x20
    blt .L_4e8
    sub r2, sl, #0x97
    add r0, r4, #0xa00
    mov r1, #0x0
    strh r1, [r0, #0x30]
    strh r1, [r0, #0x32]
    str r2, [sp, #0x18]
    cmp r2, #0x0
    ldr r0, [r4, #0x848]
    ble .L_52c
    bl func_ov015_021b2450
    b .L_534
.L_52c:
    mov r2, r1
    bl func_ov015_021b2450
.L_534:
    ldr r0, [r4, #0x848]
    mov r1, #0x0
    bl func_ov015_021b23f4
    mov r1, fp
    add r3, r4, #0xa00
    mov r5, #0x1
    mov r0, #0x0
    mov r2, #0x40
    strh r5, [r3, #0x34]
    strh r0, [r3, #0x36]
    bl Fill32
    add r0, r4, #0x900
    ldrh r2, [r0, #0xec]
    ldr r0, [r9]
    add r1, fp, #0x40
    mov r2, r2, lsl #0xb
    bl Copy32
    mov r0, #0x4
    bl func_ov015_021b2ddc
    add r0, r4, #0x900
    ldrh r3, [r0, #0xee]
    ldrh r1, [r0, #0xec]
    mov r2, r5
    mov r0, #0x0
    cmp r3, #0x20
    movcs r3, #0x20
    strh r2, [sp, #0x10]
    strh r0, [sp, #0x12]
    strh r1, [sp, #0x14]
    strh r3, [sp, #0x16]
    add r1, sp, #0x10
    mov r0, #0x4
    mov r2, #0x1
    mov r3, #0x0
    bl func_ov015_021b30f0
    ldrsh r1, [sp, #0x16]
    mov r2, #0x0
    cmp r1, #0x0
    ble .L_5e8
.L_5d0:
    add r0, r4, r2, lsl #0x1
    add r0, r0, #0x900
    strh r2, [r0, #0xf0]
    add r2, r2, #0x1
    cmp r2, r1
    blt .L_5d0
.L_5e8:
    mov r0, r6
    bl Task_InvokeLocked
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov015_021b5e44
_LIT1: .word data_ov015_021b5e28
_LIT2: .word data_ov015_021b6880
_LIT3: .word data_02104f4c
_LIT4: .word data_ov015_021b6828
_LIT5: .word 0x04001008
_LIT6: .word data_02102c90
