; func_ov002_022b1a70 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102bb0
        .extern data_02103fcc
        .extern data_02104e6c
        .extern data_0210586c
        .extern data_ov002_022ca418
        .extern data_ov002_022cc7ec
        .extern func_02001cec
        .extern func_02001d48
        .extern func_02001e3c
        .extern func_02001e74
        .extern func_0200506c
        .extern func_0201174c
        .extern func_0202c06c
        .extern func_0208dd64
        .extern func_0208dfb8
        .extern func_02094410
        .extern func_020a9698
        .extern func_ov002_022b02b8
        .extern func_ov002_022b1764
        .global func_ov002_022b1a70
        .arm
func_ov002_022b1a70:
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
    tst r5, #0x8000
    beq .L_58
    ldr r0, _LIT1
    sub r1, sl, #0x1
    and sl, r1, #0xf
    and r5, r5, r0
.L_58:
    and sl, sl, #0xf
    add r0, sl, #0x60
    add r1, r6, r0, lsl #0x1
    ldrh r0, [r1, #0x94]
    cmp r5, r0
    beq .L_464
    strh r5, [r1, #0x94]
    bl func_0208dd64
    add r1, r0, #0x40
    mov r0, #0x680
    mla r7, sl, r0, r1
    ldr r0, _LIT2
    mov r1, #0x1a
    mov r2, #0x2
    bl func_02001cec
    mov r1, r7
    mov r0, #0x0
    mov r2, #0x680
    bl func_02094410
    cmp r5, #0x1
    bne .L_138
    ldr r0, _LIT0
    ldr r0, [r0, #0xa64]
    and r0, r0, #0x1f00000
    mov r0, r0, lsr #0x14
    cmp r0, #0x4
    bne .L_138
    ldr r1, _LIT3
    ldr r0, _LIT4
    ldrh r1, [r1, #0x98]
    ldr r0, [r0, #0xba4]
    mov r1, r1, lsl #0x2
    add r8, r1, #0x66
    bl func_0201174c
    add r1, r5, #0x38
    mov r4, r0
    add r0, r1, #0x800
    bl func_0202c06c
    mov r2, r0
    add r0, sp, #0x100
    ldr r1, _LIT5
    mov r3, r4
    add r0, r0, #0x16
    str r8, [sp]
    bl func_020a9698
    mov r0, #0x2
    str r0, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    add r1, sp, #0x100
    ldr r0, _LIT2
    add r1, r1, #0x16
    mov r2, r7
    mov r3, #0x1
    bl func_0200506c
    b .L_25c
.L_138:
    cmp r5, #0x75
    bne .L_1b4
    ldr r0, _LIT0
    ldr r0, [r0, #0xa64]
    and r0, r0, #0x1f00000
    mov r0, r0, lsr #0x14
    cmp r0, #0x1
    bne .L_1b4
    add r0, r5, #0x38
    add r0, r0, #0x800
    bl func_0202c06c
    ldr r1, _LIT3
    mov r2, r0
    ldrh r3, [r1, #0x80]
    ldr r1, _LIT5
    add r0, sp, #0x16
    mov r3, r3, lsl #0x2
    add r3, r3, #0x66
    str r3, [sp]
    ldr r3, [r6, #0x58]
    bl func_020a9698
    mov r0, #0x2
    str r0, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, _LIT2
    add r1, sp, #0x16
    mov r2, r7
    mov r3, #0x1
    bl func_0200506c
    b .L_25c
.L_1b4:
    cmp r5, #0x1
    beq .L_1c8
    cmp r5, #0x2
    beq .L_1fc
    b .L_22c
.L_1c8:
    add r0, r5, #0x38
    add r0, r0, #0x800
    bl func_0202c06c
    mov r1, r0
    mov r3, #0x2
    ldr r0, _LIT2
    mov r2, r7
    str r3, [sp]
    mov r4, #0xc
    mov r3, #0x1
    str r4, [sp, #0x4]
    bl func_0200506c
    b .L_25c
.L_1fc:
    ldr r0, _LIT6
    bl func_0202c06c
    mov r1, r0
    mov r3, #0x2
    ldr r0, _LIT2
    mov r2, r7
    str r3, [sp]
    mov r4, #0xc
    mov r3, #0x1
    str r4, [sp, #0x4]
    bl func_0200506c
    b .L_25c
.L_22c:
    add r0, r5, #0x37
    add r0, r0, #0x800
    bl func_0202c06c
    mov r1, r0
    mov r3, #0x2
    ldr r0, _LIT2
    mov r2, r7
    str r3, [sp]
    mov r4, #0xc
    mov r3, #0x1
    str r4, [sp, #0x4]
    bl func_0200506c
.L_25c:
    sub r4, r5, #0x1
    mov r0, #0x0
    cmp r4, #0x1
    str r0, [sp, #0x8]
    movls r0, #0x3
    strls r0, [sp, #0x8]
    bls .L_2a0
    cmp r5, #0x3
    cmpne r5, #0x75
    moveq r0, #0x4
    streq r0, [sp, #0x8]
    beq .L_2a0
    sub r0, r5, #0x4
    bl func_ov002_022b02b8
    cmp r0, #0x0
    movne r0, #0x2
    strne r0, [sp, #0x8]
.L_2a0:
    ldr r0, _LIT2
    bl func_02001e3c
    cmp r0, #0x0
    beq .L_2c8
    ldr r0, _LIT2
    ldr r0, [r0, #0x8]
    cmp r0, #0xb6
    bcs .L_2c8
    cmp r4, #0x1
    bhi .L_360
.L_2c8:
    bl func_0208dfb8
    mov r1, #0x34
    mul r2, sl, r1
    mov r1, r0
    ldr r0, _LIT2
    ldr r3, [sp, #0x8]
    add r1, r1, sl, lsl #0x7
    add r2, r2, #0x2
    bl func_02001e74
    add r0, sl, #0x1
    and sl, r0, #0xf
    add r0, sl, #0x60
    add r0, r6, r0, lsl #0x1
    orr r1, r5, #0x8000
    strh r1, [r0, #0x94]
    bl func_0208dd64
    add r0, r0, #0x40
    mov r2, #0x680
    mla r7, sl, r2, r0
    mov r0, #0x0
    mov r1, r7
    bl func_02094410
    ldr r0, _LIT2
    bl func_02001e3c
    cmp r0, #0x0
    bne .L_354
    mov r0, #0x2
    str r0, [sp]
    mov r1, #0xc
    ldr r0, _LIT2
    str r1, [sp, #0x4]
    ldr r1, [r0, #0x28]
    mov r2, r7
    mov r3, #0x1
    bl func_0200506c
.L_354:
    ldr r0, [sp, #0xc]
    add r0, r0, #0x1
    str r0, [sp, #0xc]
.L_360:
    mov r0, r6
    mov r1, r5
    bl func_ov002_022b1764
    cmp r5, #0x1
    cmpne r5, #0x2
    mov r8, r0
    cmpne r5, #0x75
    beq .L_388
    cmp r8, #0x0
    ble .L_440
.L_388:
    mov r0, #0x0
    bl func_02001d48
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
.L_3c0:
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
    bl func_0200506c
    mov r1, r8
    smull r0, r8, fp, r1
    mov r0, r1, lsr #0x1f
    adds r8, r0, r8, asr #0x2
    sub r9, r9, #0xa
    bne .L_3c0
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d48
.L_440:
    bl func_0208dfb8
    mov r1, #0x34
    mul r2, sl, r1
    mov r1, r0
    ldr r0, _LIT2
    ldr r3, [sp, #0x8]
    add r1, r1, sl, lsl #0x7
    add r2, r2, #0x2
    bl func_02001e74
.L_464:
    ldr r0, [sp, #0xc]
    add sp, sp, #0x218
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_02104e6c
_LIT1: .word 0x00007fff
_LIT2: .word data_02102bb0
_LIT3: .word data_0210586c
_LIT4: .word data_02103fcc
_LIT5: .word data_ov002_022cc7ec
_LIT6: .word 0x000008b7
_LIT7: .word data_ov002_022ca418
_LIT8: .word 0x66666667
