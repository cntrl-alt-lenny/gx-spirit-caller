; func_ov006_021c3714 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov000_021b1d4c
        .extern data_ov006_021cde2c
        .extern data_ov006_021cdea8
        .extern func_02021660
        .extern func_020216b0
        .extern func_020b3870
        .global func_ov006_021c3714
        .arm
func_ov006_021c3714:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x14
    mov sl, r0
    ldr r0, [sl, #0x64]
    add r4, sl, #0x9c
    add r4, r4, r0, lsl #0x4
    ldr r0, _LIT0
    ldr r9, _LIT1
    str r1, [sp]
    str r2, [sp, #0x4]
    str r3, [sp, #0x8]
    mov r7, #0x0
    orr fp, r0, #0x2
.L_1238:
    cmp r7, #0x0
    blt .L_1258
    cmp r7, #0x1
    bgt .L_1258
    ldr r0, [sp]
    cmp r0, #0x0
    beq .L_14bc
    b .L_1294
.L_1258:
    cmp r7, #0x2
    blt .L_1278
    cmp r7, #0x3
    bgt .L_1278
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_14bc
    b .L_1294
.L_1278:
    cmp r7, #0x4
    blt .L_1294
    cmp r7, #0x7
    bgt .L_1294
    ldr r0, [sp, #0x8]
    cmp r0, #0x0
    beq .L_14bc
.L_1294:
    ldr r0, [sl, #0x4]
    mov r1, #0x5
    mov r2, r7
    bl func_02021660
    mov r5, r0
    cmp r7, #0x4
    mov r6, #0x0
    beq .L_1384
    ldr r0, [r4, #0xc]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    bne .L_12dc
    cmp r7, #0x4
    blt .L_12dc
    cmp r7, #0x7
    bgt .L_12dc
    cmp r7, #0x4
    bne .L_1384
.L_12dc:
    cmp r7, #0x2
    ldr r6, _LIT0
    bne .L_1334
    ldr r0, [sl, #0x58]
    mov r1, r0, lsl #0x2
    ldr r0, _LIT2
    ldrsh r0, [r0, r1]
    cmp r0, #0x0
    beq .L_1314
    cmp r0, #0x1
    beq .L_131c
    cmp r0, #0x2
    beq .L_1324
    b .L_1384
.L_1314:
    mov r6, fp
    b .L_1384
.L_131c:
    mov r6, #0x0
    b .L_1384
.L_1324:
    ldr r0, [sl, #0x64]
    cmp r0, #0x0
    moveq r6, fp
    b .L_1384
.L_1334:
    cmp r7, #0x3
    bne .L_1384
    ldr r0, [sl, #0x58]
    mov r1, r0, lsl #0x2
    ldr r0, _LIT2
    ldrsh r0, [r0, r1]
    cmp r0, #0x0
    beq .L_1368
    cmp r0, #0x1
    beq .L_1370
    cmp r0, #0x2
    beq .L_1378
    b .L_1384
.L_1368:
    mov r6, #0x0
    b .L_1384
.L_1370:
    mov r6, fp
    b .L_1384
.L_1378:
    ldr r0, [sl, #0x64]
    cmp r0, #0x1
    moveq r6, fp
.L_1384:
    ldr r0, [sl, #0x98]
    cmp r7, r0
    ldreq r0, [r9, #0x18]
    streq r0, [sp, #0x10]
    beq .L_13f4
    ldr r0, [r4, #0xc]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    beq .L_13ec
    ldr r0, _LIT3
    ldr r0, [r0, #0x18]
    cmp r0, #0x1
    cmpeq r7, #0x7
    beq .L_13d4
    cmp r0, #0x2
    cmpeq r7, #0x5
    beq .L_13d4
    cmp r0, #0x3
    cmpeq r7, #0x6
    bne .L_13e0
.L_13d4:
    ldr r0, [r9, #0x18]
    str r0, [sp, #0x10]
    b .L_13f4
.L_13e0:
    ldr r0, [r9, #0x10]
    str r0, [sp, #0x10]
    b .L_13f4
.L_13ec:
    ldr r0, [r9, #0x10]
    str r0, [sp, #0x10]
.L_13f4:
    ldrsh r0, [r9]
    ldrsh r8, [r9, #0x2]
    str r0, [sp, #0xc]
    ldr r0, [r4, #0xc]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    beq .L_1434
    cmp r7, #0x7
    bne .L_1434
    ldr r2, [r4, #0x4]
    mov r0, #0x35
    mul r0, r2, r0
    ldr r1, [r4, #0x8]
    sub r1, r1, #0x6
    bl func_020b3870
    add r8, r8, r0
.L_1434:
    mov r0, r5
    tst r6, #0x2
    mov r1, #0x2
    mov r2, r7
    subne r8, r8, #0x1
    bl func_020216b0
    ldr r2, [sp, #0xc]
    mov r0, r5
    mov r1, #0x3
    bl func_020216b0
    mov r2, r8
    mov r0, r5
    mov r1, #0x4
    bl func_020216b0
    ldrsh r2, [r9, #0x8]
    mov r0, r5
    mov r1, #0x11
    bl func_020216b0
    ldrsh r2, [r9, #0xa]
    mov r0, r5
    mov r1, #0x12
    bl func_020216b0
    ldr r2, [r9, #0xc]
    mov r0, r5
    mov r1, #0xc
    bl func_020216b0
    ldr r2, [sp, #0x10]
    mov r0, r5
    mov r1, #0xd
    bl func_020216b0
    mov r0, r5
    mov r2, r6
    mov r1, #0x0
    bl func_020216b0
.L_14bc:
    add r9, r9, #0x1c
    add r7, r7, #0x1
    cmp r7, #0x8
    blt .L_1238
    mov r0, #0x1
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x000001c1
_LIT1: .word data_ov006_021cdea8
_LIT2: .word data_ov006_021cde2c
_LIT3: .word data_ov000_021b1d4c
