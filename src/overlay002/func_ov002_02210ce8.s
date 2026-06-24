; func_ov002_02210ce8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd744
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern data_ov002_022d0e6c
        .extern func_0202b100
        .extern func_ov002_021ae400
        .extern func_ov002_021ae484
        .extern func_ov002_021ae664
        .extern func_ov002_021af9d0
        .extern func_ov002_021afb74
        .extern func_ov002_021b00d0
        .extern func_ov002_021c8470
        .extern func_ov002_021ca2b8
        .extern func_ov002_021d8288
        .extern func_ov002_021de408
        .extern func_ov002_021deb28
        .extern func_ov002_021df818
        .extern func_ov002_021e286c
        .extern func_ov002_02210bf0
        .extern func_ov002_0225368c
        .extern func_ov002_022536e8
        .extern func_ov002_02257878
        .extern func_ov002_0225935c
        .extern func_ov002_022593f4
        .extern func_ov002_0226b22c
        .extern func_ov002_0227adb8
        .extern func_ov002_0229ce5c
        .global func_ov002_02210ce8
        .arm
func_ov002_02210ce8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x300
    mov r8, r0
    ldrh r1, [r8, #0x4]
    mov r1, r1, lsl #0x1d
    movs r1, r1, lsr #0x1f
    addne sp, sp, #0x300
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r1, _LIT0
    ldr r1, [r1, #0x5a8]
    cmp r1, #0x78
    bgt .L_94
    bge .L_24c
    cmp r1, #0x6d
    bgt .L_88
    subs r0, r1, #0x5f
    addpl pc, pc, r0, lsl #0x2
    b .L_45c
    b .L_420
    b .L_3f8
    b .L_3b0
    b .L_45c
    b .L_384
    b .L_35c
    b .L_45c
    b .L_45c
    b .L_45c
    b .L_45c
    b .L_45c
    b .L_45c
    b .L_45c
    b .L_45c
    b .L_324
.L_88:
    cmp r1, #0x77
    beq .L_2bc
    b .L_45c
.L_94:
    cmp r1, #0x7f
    bgt .L_ac
    bge .L_f8
    cmp r1, #0x7e
    beq .L_128
    b .L_45c
.L_ac:
    cmp r1, #0x80
    bne .L_45c
    ldrh r1, [r8, #0x2]
    ldr r0, _LIT1
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x1
    bne .L_e4
    mov r0, #0x2
    bl func_ov002_021b00d0
    ldr r1, _LIT2
    str r0, [r1, #0xd44]
    b .L_ec
.L_e4:
    mov r0, #0x38
    bl func_ov002_021ae664
.L_ec:
    add sp, sp, #0x300
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_f8:
    ldrh r1, [r8, #0x2]
    ldr r0, _LIT2
    mov r2, #0x1
    mov r4, r1, lsl #0x1f
    mov r1, r1, lsl #0x1a
    ldr r3, [r0, #0xd44]
    mov r0, r4, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_0226b22c
    add sp, sp, #0x300
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_128:
    ldr r1, _LIT3
    ldrh r1, [r1, #0xb2]
    cmp r1, #0x0
    beq .L_1b0
    ldrh r1, [r8, #0x2]
    mov r2, #0x1f
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    mov r1, r1, lsl #0x4
    mov r1, r2, lsl r1
    bl func_ov002_021de408
    ldrh r0, [r8, #0x2]
    ldrh r1, [r8]
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_022536e8
    cmp r0, #0x0
    ble .L_240
    ldrh r0, [r8, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca2b8
    cmp r0, #0x0
    beq .L_240
    ldr r1, _LIT4
    mov r0, r8
    bl func_ov002_02257878
    cmp r0, #0x0
    beq .L_240
    add sp, sp, #0x300
    mov r0, #0x78
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_1b0:
    mov r6, #0x0
    ldr r4, _LIT5
    ldr r9, _LIT6
    mov r5, r6
    mov r7, r6
.L_1c4:
    ldrh r0, [r8, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r2, r0, #0x1
    mla r1, r2, r9, r4
    add r1, r1, r7
    ldr r1, [r1, #0x30]
    mov r1, r1, lsl #0x13
    movs r1, r1, lsr #0x13
    beq .L_1f8
    mov r1, r5
    bl func_ov002_021c8470
    add r6, r6, r0
.L_1f8:
    add r5, r5, #0x1
    cmp r5, #0x5
    add r7, r7, #0x14
    blt .L_1c4
    ldrh r1, [r8, #0x2]
    mov r2, #0x1f
    mov r0, r8
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    mov r1, r1, lsl #0x4
    mov r1, r2, lsl r1
    bl func_ov002_021de408
    ldrh r1, [r8, #0x2]
    mov r0, r8
    mov r2, r6, asr #0x1
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_021df818
.L_240:
    add sp, sp, #0x300
    mov r0, #0xa
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_24c:
    ldrh r1, [r8, #0x2]
    ldr r0, _LIT1
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x1
    bne .L_278
    ldr r0, _LIT2
    mov r1, #0x0
    str r1, [r0, #0xd44]
    b .L_2b0
.L_278:
    ldr r0, _LIT7
    bl func_0202b100
    mov r2, r0
    add r0, sp, #0x100
    mov r1, #0x39
    bl func_ov002_0229ce5c
    ldr r0, _LIT8
    bl func_0202b100
    mov r2, r0
    add r0, sp, #0x200
    add r1, sp, #0x100
    bl func_ov002_0229ce5c
    add r0, sp, #0x200
    bl func_ov002_021ae484
.L_2b0:
    add sp, sp, #0x300
    mov r0, #0x77
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_2bc:
    ldr r0, _LIT2
    ldr r0, [r0, #0xd44]
    cmp r0, #0x0
    addeq sp, sp, #0x300
    moveq r0, #0xa
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r0, _LIT7
    bl func_0202b100
    mov r2, r0
    add r0, sp, #0x0
    mov r1, #0x13
    bl func_ov002_0229ce5c
    ldrh r0, [r8, #0x2]
    add r1, sp, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    ldrh r0, [r8, #0x2]
    ldr r2, _LIT4
    mov r1, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0225935c
    add sp, sp, #0x300
    mov r0, #0x6d
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_324:
    bl func_ov002_022593f4
    cmp r0, #0x0
    addeq sp, sp, #0x300
    moveq r0, #0x77
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r0, _LIT2
    ldr r2, [r0, #0xd74]
    ldr r1, [r0, #0xd78]
    ldr r0, [r0, #0xd70]
    add r1, r2, r1
    bl func_ov002_021deb28
    add sp, sp, #0x300
    mov r0, #0x64
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_35c:
    ldrh r0, [r8, #0x2]
    ldrh r2, [r8]
    mov r1, #0x6
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x0
    bl func_ov002_021af9d0
    add sp, sp, #0x300
    mov r0, #0x63
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_384:
    bl func_ov002_021afb74
    ldrh r3, [r8, #0x2]
    mov r1, r0
    mov r2, #0x1
    mov r0, r3, lsl #0x1f
    mov r3, r2
    mov r0, r0, lsr #0x1f
    bl func_ov002_0227adb8
    add sp, sp, #0x300
    mov r0, #0x61
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_3b0:
    ldrh r0, [r8, #0x2]
    ldr r1, _LIT8
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0225368c
    cmp r0, #0x0
    addle sp, sp, #0x300
    movle r0, #0xa
    ldmleia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldrh r0, [r8, #0x2]
    mov r1, #0x3c
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    add sp, sp, #0x300
    mov r0, #0x60
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_3f8:
    ldrh r0, [r8, #0x2]
    ldr r2, _LIT8
    mov r1, #0x6
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x0
    bl func_ov002_021af9d0
    add sp, sp, #0x300
    mov r0, #0x5f
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_420:
    bl func_ov002_021afb74
    ldrh r2, [r8, #0x2]
    mov r1, r0
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021d8288
    cmp r0, #0x0
    beq .L_450
    ldrh r0, [r8, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e286c
.L_450:
    add sp, sp, #0x300
    mov r0, #0xa
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_45c:
    mov r0, #0x0
    add sp, sp, #0x300
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022cd744
_LIT2: .word data_ov002_022d016c
_LIT3: .word data_ov002_022d0e6c
_LIT4: .word func_ov002_02210bf0
_LIT5: .word data_ov002_022cf16c
_LIT6: .word 0x00000868
_LIT7: .word 0x00000fc9
_LIT8: .word 0x0000146e
