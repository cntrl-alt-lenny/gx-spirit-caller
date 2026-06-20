; func_ov002_022b1bac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102c90
        .extern data_021040ac
        .extern data_02104f4c
        .extern data_0210594c
        .extern data_ov002_022ca528
        .extern data_ov002_022cc8e0
        .extern func_02001d0c
        .extern func_02001d68
        .extern func_02001e5c
        .extern func_02001e94
        .extern func_02005088
        .extern func_02011780
        .extern func_0202c0c0
        .extern func_0208de4c
        .extern func_0208e0a0
        .extern func_02094504
        .extern func_020a978c
        .extern func_ov002_022b03f4
        .extern func_ov002_022b18a0
        .global func_ov002_022b1bac
        .arm
func_ov002_022b1bac:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x218
    mov r5, r2
    mov r6, r0
    mov r0, #0x1
    mov sl, r1
    cmp r5, #0x2
    str r0, [sp, #0xc]
    bne .L_40
    ldr r0, _LIT0
    ldr r0, [r0, #0xa64]
    and r0, r0, #0x1f00000
    movs r0, r0, lsr #0x14
    addeq sp, sp, #0x218
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_40:
    and sl, sl, #0xf
    add r0, sl, #0x60
    add r0, r6, r0, lsl #0x1
    ldrh r0, [r0, #0x94]
    cmp r5, r0
    beq .L_46c
    tst r5, #0x8000
    beq .L_70
    ldr r0, _LIT1
    sub r1, sl, #0x1
    and r5, r5, r0
    and sl, r1, #0xf
.L_70:
    add r0, sl, #0x60
    add r0, r6, r0, lsl #0x1
    strh r5, [r0, #0x94]
    bl func_0208de4c
    add r1, r0, #0x40
    mov r0, #0x680
    mla r7, sl, r0, r1
    ldr r0, _LIT2
    mov r1, #0x1a
    mov r2, #0x2
    bl func_02001d0c
    mov r1, r7
    mov r0, #0x0
    mov r2, #0x680
    bl func_02094504
    cmp r5, #0x1
    bne .L_140
    ldr r0, _LIT0
    ldr r0, [r0, #0xa64]
    and r0, r0, #0x1f00000
    mov r0, r0, lsr #0x14
    cmp r0, #0x4
    bne .L_140
    ldr r1, _LIT3
    ldr r0, _LIT4
    ldrh r1, [r1, #0x98]
    ldr r0, [r0, #0xba4]
    mov r1, r1, lsl #0x2
    add r8, r1, #0x66
    bl func_02011780
    add r1, r5, #0x38
    mov r4, r0
    add r0, r1, #0x800
    bl func_0202c0c0
    mov r2, r0
    add r0, sp, #0x100
    ldr r1, _LIT5
    mov r3, r4
    add r0, r0, #0x16
    str r8, [sp]
    bl func_020a978c
    mov r0, #0x2
    str r0, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    add r1, sp, #0x100
    ldr r0, _LIT2
    add r1, r1, #0x16
    mov r2, r7
    mov r3, #0x1
    bl func_02005088
    b .L_264
.L_140:
    cmp r5, #0x75
    bne .L_1bc
    ldr r0, _LIT0
    ldr r0, [r0, #0xa64]
    and r0, r0, #0x1f00000
    mov r0, r0, lsr #0x14
    cmp r0, #0x1
    bne .L_1bc
    add r0, r5, #0x38
    add r0, r0, #0x800
    bl func_0202c0c0
    ldr r1, _LIT3
    mov r2, r0
    ldrh r3, [r1, #0x80]
    ldr r1, _LIT5
    add r0, sp, #0x16
    mov r3, r3, lsl #0x2
    add r3, r3, #0x66
    str r3, [sp]
    ldr r3, [r6, #0x58]
    bl func_020a978c
    mov r0, #0x2
    str r0, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, _LIT2
    add r1, sp, #0x16
    mov r2, r7
    mov r3, #0x1
    bl func_02005088
    b .L_264
.L_1bc:
    cmp r5, #0x1
    beq .L_1d0
    cmp r5, #0x2
    beq .L_204
    b .L_234
.L_1d0:
    add r0, r5, #0x38
    add r0, r0, #0x800
    bl func_0202c0c0
    mov r1, r0
    mov r3, #0x2
    ldr r0, _LIT2
    mov r2, r7
    str r3, [sp]
    mov r4, #0xc
    mov r3, #0x1
    str r4, [sp, #0x4]
    bl func_02005088
    b .L_264
.L_204:
    ldr r0, _LIT6
    bl func_0202c0c0
    mov r1, r0
    mov r3, #0x2
    ldr r0, _LIT2
    mov r2, r7
    str r3, [sp]
    mov r4, #0xc
    mov r3, #0x1
    str r4, [sp, #0x4]
    bl func_02005088
    b .L_264
.L_234:
    add r0, r5, #0x37
    add r0, r0, #0x800
    bl func_0202c0c0
    mov r1, r0
    mov r3, #0x2
    ldr r0, _LIT2
    mov r2, r7
    str r3, [sp]
    mov r4, #0xc
    mov r3, #0x1
    str r4, [sp, #0x4]
    bl func_02005088
.L_264:
    sub r4, r5, #0x1
    mov r0, #0x0
    cmp r4, #0x1
    str r0, [sp, #0x8]
    movls r0, #0x3
    strls r0, [sp, #0x8]
    bls .L_2a8
    cmp r5, #0x3
    cmpne r5, #0x75
    moveq r0, #0x4
    streq r0, [sp, #0x8]
    beq .L_2a8
    sub r0, r5, #0x4
    bl func_ov002_022b03f4
    cmp r0, #0x0
    movne r0, #0x2
    strne r0, [sp, #0x8]
.L_2a8:
    ldr r0, _LIT2
    bl func_02001e5c
    cmp r0, #0x0
    beq .L_2d0
    ldr r0, _LIT2
    ldr r0, [r0, #0x8]
    cmp r0, #0xb6
    bcs .L_2d0
    cmp r4, #0x1
    bhi .L_368
.L_2d0:
    bl func_0208e0a0
    mov r1, #0x34
    mul r2, sl, r1
    mov r1, r0
    ldr r0, _LIT2
    ldr r3, [sp, #0x8]
    add r1, r1, sl, lsl #0x7
    add r2, r2, #0x2
    bl func_02001e94
    add r0, sl, #0x1
    and sl, r0, #0xf
    add r0, sl, #0x60
    add r0, r6, r0, lsl #0x1
    orr r1, r5, #0x8000
    strh r1, [r0, #0x94]
    bl func_0208de4c
    add r0, r0, #0x40
    mov r2, #0x680
    mla r7, sl, r2, r0
    mov r0, #0x0
    mov r1, r7
    bl func_02094504
    ldr r0, _LIT2
    bl func_02001e5c
    cmp r0, #0x0
    bne .L_35c
    mov r0, #0x2
    str r0, [sp]
    mov r1, #0xc
    ldr r0, _LIT2
    str r1, [sp, #0x4]
    ldr r1, [r0, #0x28]
    mov r2, r7
    mov r3, #0x1
    bl func_02005088
.L_35c:
    ldr r0, [sp, #0xc]
    add r0, r0, #0x1
    str r0, [sp, #0xc]
.L_368:
    mov r0, r6
    mov r1, r5
    bl func_ov002_022b18a0
    cmp r5, #0x1
    cmpne r5, #0x2
    mov r8, r0
    cmpne r5, #0x75
    beq .L_390
    cmp r8, #0x0
    ble .L_448
.L_390:
    mov r0, #0x0
    bl func_02001d68
    ldr r0, _LIT7
    ldr fp, _LIT8
    ldrb r2, [r0]
    ldrb r1, [r0, #0x1]
    ldrb r0, [r0, #0x2]
    mov r9, #0xc2
    strb r2, [sp, #0x10]
    strb r1, [sp, #0x11]
    strb r0, [sp, #0x12]
    and r6, r2, #0xff
    and r5, r1, #0xff
    and r4, r0, #0xff
.L_3c8:
    smull r1, r2, fp, r8
    mov r1, r8, lsr #0x1f
    add r2, r1, r2, asr #0x2
    mov r1, #0xa
    smull r2, r3, r1, r2
    strb r5, [sp, #0x14]
    ldrsb r0, [sp, #0x14]
    sub r2, r8, r2
    strb r6, [sp, #0x13]
    add r0, r0, r2
    strb r0, [sp, #0x14]
    strb r4, [sp, #0x15]
    mov r0, #0x2
    str r0, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, _LIT2
    add r1, sp, #0x13
    mov r2, r7
    mov r3, r9
    bl func_02005088
    mov r1, r8
    smull r0, r8, fp, r1
    mov r0, r1, lsr #0x1f
    adds r8, r0, r8, asr #0x2
    sub r9, r9, #0xa
    bne .L_3c8
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d68
.L_448:
    bl func_0208e0a0
    mov r1, #0x34
    mul r2, sl, r1
    mov r1, r0
    ldr r0, _LIT2
    ldr r3, [sp, #0x8]
    add r1, r1, sl, lsl #0x7
    add r2, r2, #0x2
    bl func_02001e94
.L_46c:
    ldr r0, [sp, #0xc]
    add sp, sp, #0x218
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_02104f4c
_LIT1: .word 0x00007fff
_LIT2: .word data_02102c90
_LIT3: .word data_0210594c
_LIT4: .word data_021040ac
_LIT5: .word data_ov002_022cc8e0
_LIT6: .word 0x000008b7
_LIT7: .word data_ov002_022ca528
_LIT8: .word 0x66666667
