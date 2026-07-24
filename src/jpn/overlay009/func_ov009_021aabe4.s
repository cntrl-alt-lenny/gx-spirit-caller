; func_ov009_021aabe4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102bb0
        .extern data_ov009_021adaec
        .extern data_ov009_021adb20
        .extern data_ov009_021adb74
        .extern func_02001cec
        .extern func_0200506c
        .extern func_02005488
        .extern func_0202b0ac
        .extern func_0202c06c
        .extern func_0208de58
        .extern func_0208e0c4
        .extern func_0208e118
        .extern OS_SPrintf
        .extern func_02094410
        .extern func_ov009_021ab758
        .global func_ov009_021aabe4
        .arm
func_ov009_021aabe4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x110
    mov r5, r1
    str r0, [sp, #0x8]
    mov r4, r2
    ldr r1, _LIT0
    mov r0, #0x0
    mov r2, #0x28
    bl func_02094410
    bl func_0208e118
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x400
    bl func_02094410
    bl func_0208e0c4
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x400
    bl func_02094410
    ldr r0, [sp, #0x8]
    mov r1, #0x0
    str r1, [r0]
    str r1, [r0, #0x18]
    cmp r5, #0x0
    str r4, [r0, #0x10]
    beq .L_7c
    cmp r5, #0x1
    beq .L_104
    cmp r5, #0x2
    beq .L_130
    b .L_150
.L_7c:
    str r1, [r0, #0x8]
    ldr r0, [r0, #0x10]
    cmp r0, #0xa
    beq .L_a0
    cmp r0, #0xb
    beq .L_c0
    cmp r0, #0xc
    beq .L_d8
    b .L_150
.L_a0:
    add r0, r0, #0x1b8
    bl func_0202c06c
    ldr r2, _LIT1
    mov r1, r0
    ldr r2, [r2]
    add r0, sp, #0x10
    bl OS_SPrintf
    b .L_150
.L_c0:
    add r0, r0, #0x1b8
    bl func_0202c06c
    mov r1, r0
    add r0, sp, #0x10
    bl OS_SPrintf
    b .L_150
.L_d8:
    add r0, r0, #0x1b8
    bl func_0202c06c
    mov r4, r0
    ldr r0, _LIT2
    bl func_ov009_021ab758
    bl func_0202b0ac
    mov r2, r0
    add r0, sp, #0x10
    mov r1, r4
    bl OS_SPrintf
    b .L_150
.L_104:
    mov r1, #0x1
    str r1, [r0, #0x8]
    ldr r0, [r0, #0x10]
    add r0, r0, #0x1b8
    bl func_0202c06c
    ldr r2, _LIT1
    mov r1, r0
    ldr r2, [r2]
    add r0, sp, #0x10
    bl OS_SPrintf
    b .L_150
.L_130:
    mov r1, #0x2
    str r1, [r0, #0x8]
    ldr r0, [r0, #0x10]
    add r0, r0, #0x1b8
    bl func_0202c06c
    mov r1, r0
    add r0, sp, #0x10
    bl OS_SPrintf
.L_150:
    bl func_0208de58
    mov r4, r0
    add r1, r4, #0x2d00
    mov r0, #0x0
    mov r2, #0x1c00
    bl func_02094410
    ldr r0, _LIT3
    mov r1, #0x1c
    mov r2, #0x8
    bl func_02001cec
    mov r3, #0x2
    str r3, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, _LIT3
    add r1, sp, #0x10
    add r2, r4, #0x2d00
    bl func_0200506c
    ldr r0, _LIT3
    ldr r0, [r0, #0xc]
    add r1, r0, #0xc
    ldr r0, [sp, #0x8]
    str r1, [r0, #0x1c]
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    beq .L_1c4
    cmp r0, #0x1
    beq .L_24c
    b .L_324
.L_1c4:
    ldr r0, [sp, #0x8]
    ldr r1, [r0, #0x1c]
    mov r0, #0x1f
    add r2, r1, #0x8
    ldr r1, [sp, #0x8]
    str r2, [r1, #0x1c]
    str r2, [r1, #0x20]
    bl func_0202c06c
    mov r1, r0
    add r0, sp, #0x10
    bl OS_SPrintf
    mov r0, #0x1f
    bl func_0202c06c
    mov r1, #0xc
    bl func_02005488
    rsb r0, r0, #0xe0
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    add r3, r0, #0x2
    ldr r0, [sp, #0x8]
    add r2, r4, #0x2d00
    ldr r1, [r0, #0x1c]
    mov r0, #0xc
    str r1, [sp]
    str r0, [sp, #0x4]
    ldr r0, _LIT3
    add r1, sp, #0x10
    bl func_0200506c
    ldr r0, [sp, #0x8]
    ldr r0, [r0, #0x1c]
    add r1, r0, #0xc
    ldr r0, [sp, #0x8]
    str r1, [r0, #0x1c]
    b .L_324
.L_24c:
    ldr r0, [sp, #0x8]
    ldr r1, [r0, #0x1c]
    mov r0, #0x1d
    add r2, r1, #0x8
    ldr r1, [sp, #0x8]
    str r2, [r1, #0x1c]
    str r2, [r1, #0x20]
    bl func_0202c06c
    mov r1, r0
    add r0, sp, #0x10
    bl OS_SPrintf
    mov r0, #0x1d
    bl func_0202c06c
    mov r1, #0xc
    bl func_02005488
    rsb r0, r0, #0x70
    add r0, r0, r0, lsr #0x1f
    mov r3, r0, asr #0x1
    ldr r0, [sp, #0x8]
    add r2, r4, #0x2d00
    ldr r1, [r0, #0x1c]
    mov r0, #0xc
    str r1, [sp]
    str r0, [sp, #0x4]
    ldr r0, _LIT3
    add r1, sp, #0x10
    bl func_0200506c
    mov r0, #0x1e
    bl func_0202c06c
    mov r1, r0
    add r0, sp, #0x10
    bl OS_SPrintf
    mov r0, #0x1e
    bl func_0202c06c
    mov r1, #0xc
    bl func_02005488
    rsb r0, r0, #0x70
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    add r3, r0, #0x70
    ldr r0, [sp, #0x8]
    add r2, r4, #0x2d00
    ldr r1, [r0, #0x1c]
    mov r0, #0xc
    str r1, [sp]
    str r0, [sp, #0x4]
    ldr r0, _LIT3
    add r1, sp, #0x10
    bl func_0200506c
    ldr r0, [sp, #0x8]
    ldr r0, [r0, #0x1c]
    add r1, r0, #0xc
    ldr r0, [sp, #0x8]
    str r1, [r0, #0x1c]
.L_324:
    bl func_0208e118
    ldr r1, [sp, #0x8]
    add r5, r0, #0x44
    ldr r1, [r1, #0x1c]
    mov r6, #0x0
    mov r0, r1, asr #0x2
    add r0, r1, r0, lsr #0x1d
    mov r2, r1, lsr #0x1f
    rsb r1, r2, r1, lsl #0x1d
    mov r4, r0, asr #0x3
    adds r0, r2, r1, ror #0x1d
    addne r4, r4, #0x1
    mov r2, #0x168
    cmp r4, #0x0
    ble .L_39c
    mov r3, r6
.L_364:
    mov r7, r3
.L_368:
    add r0, r2, #0x1
    mov r1, r7, lsl #0x1
    orr r2, r2, #0x7000
    mov r0, r0, lsl #0x10
    add r7, r7, #0x1
    strh r2, [r5, r1]
    cmp r7, #0x1c
    mov r2, r0, lsr #0x10
    blt .L_368
    add r6, r6, #0x1
    cmp r6, r4
    add r5, r5, #0x40
    blt .L_364
.L_39c:
    bl func_0208e0c4
    add r1, r4, #0x2
    str r1, [sp, #0xc]
    cmp r1, #0x0
    add sl, r0, #0x2
    mov r8, #0x0
    ble .L_470
    ldr r2, _LIT4
    add r6, r4, #0x1
    sub r3, r2, #0x3
    sub ip, r2, #0x6
    sub lr, r2, #0x2
    sub r5, r2, #0x4
    sub r7, r2, #0x7
    mov fp, #0x160
    mov r4, #0x164
.L_3dc:
    mov r9, #0x0
.L_3e0:
    cmp r9, #0x0
    beq .L_3f4
    cmp r9, #0x1d
    beq .L_410
    b .L_42c
.L_3f4:
    cmp r8, #0x0
    moveq r0, r7
    beq .L_444
    cmp r8, r6
    movlt r0, r5
    movge r0, r4
    b .L_444
.L_410:
    cmp r8, #0x0
    moveq r0, fp
    beq .L_444
    cmp r8, r6
    movlt r0, lr
    addge r0, r2, #0x1
    b .L_444
.L_42c:
    cmp r8, #0x0
    moveq r0, ip
    beq .L_444
    cmp r8, r6
    movlt r0, r3
    movge r0, r2
.L_444:
    orr r1, r0, #0x8000
    mov r0, r9, lsl #0x1
    strh r1, [sl, r0]
    add r9, r9, #0x1
    cmp r9, #0x1e
    blt .L_3e0
    ldr r0, [sp, #0xc]
    add r8, r8, #0x1
    add sl, sl, #0x40
    cmp r8, r0
    blt .L_3dc
.L_470:
    ldr r0, [sp, #0x8]
    ldr r1, _LIT5
    ldr r0, [r0, #0x1c]
    ldr r3, _LIT6
    add r2, r0, #0x10
    ldr r0, [sp, #0x8]
    str r2, [r0, #0x1c]
    and r0, r1, r2, lsl #0x10
    str r0, [r3]
    ldr r0, [sp, #0x8]
    sub r2, r3, #0x10
    ldr r0, [r0, #0x1c]
    and r0, r1, r0, lsl #0x10
    str r0, [r3, #0x4]
    ldr r1, [r2]
    ldr r0, [r2]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x3
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
    mov r0, #0x1
    add sp, sp, #0x110
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov009_021adaec
_LIT1: .word data_ov009_021adb74
_LIT2: .word data_ov009_021adb20
_LIT3: .word data_02102bb0
_LIT4: .word 0x00000165
_LIT5: .word 0x01ff0000
_LIT6: .word 0x04001010
