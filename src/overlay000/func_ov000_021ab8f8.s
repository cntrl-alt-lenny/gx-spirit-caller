; func_ov000_021ab8f8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov000_021c7530
        .extern func_0208c884
        .extern func_0208e2f4
        .extern func_0208e318
        .extern func_ov000_021ab258
        .extern func_ov000_021ab474
        .extern func_ov000_021ab798
        .extern func_ov000_021ab850
        .global func_ov000_021ab8f8
        .arm
func_ov000_021ab8f8:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    bl func_ov000_021ab798
    ldr r6, _LIT0
    mov r4, #0x0
.L_10:
    ldr r0, [r6, #0xc]
    mov r1, r0, lsl #0x18
    mov r2, r1, lsr #0x18
    mov r0, r0, lsl #0x10
    cmp r2, r0, lsr #0x18
    beq .L_84
    cmp r4, #0x0
    beq .L_3c
    cmp r4, #0x1
    beq .L_54
    b .L_68
.L_3c:
    mov r1, #0x4000000
    ldr r0, [r1]
    bic r0, r0, #0x1f00
    orr r0, r0, r2, lsl #0x8
    str r0, [r1]
    b .L_68
.L_54:
    ldr r1, _LIT1
    ldr r0, [r1]
    bic r0, r0, #0x1f00
    orr r0, r0, r2, lsl #0x8
    str r0, [r1]
.L_68:
    ldr r1, [r6, #0xc]
    mov r0, r1, lsl #0x18
    mov r0, r0, lsr #0x18
    bic r1, r1, #0xff00
    mov r0, r0, lsl #0x18
    orr r0, r1, r0, lsr #0x10
    str r0, [r6, #0xc]
.L_84:
    ldr r0, [r6]
    mov r1, r0, lsl #0x11
    movs r1, r1, lsr #0x1f
    beq .L_f0
    bic r5, r0, #0x4000
    mov r3, r5, lsl #0x6
    mov r2, r5, lsl #0xb
    mov r1, r5, lsl #0x12
    mov r0, r5, lsl #0x19
    str r5, [r6]
    mov r5, r3, lsr #0x1b
    mov r3, r2, lsr #0x1b
    mov r2, r1, lsr #0x19
    cmp r4, #0x0
    mov r1, r0, lsr #0x19
    beq .L_d0
    cmp r4, #0x1
    beq .L_e0
    b .L_218
.L_d0:
    ldr r0, _LIT2
    str r5, [sp]
    bl func_0208e318
    b .L_218
.L_e0:
    ldr r0, _LIT3
    str r5, [sp]
    bl func_0208e318
    b .L_218
.L_f0:
    mov r2, r0, lsl #0x6
    mov r1, r0, lsl #0xb
    ldr r0, [r6, #0x4]
    mov r5, r2, lsr #0x1b
    mov r3, r1, lsr #0x1b
    mov r1, r0, lsl #0x16
    orr r0, r3, r5, lsl #0x5
    mov r1, r1, lsr #0x16
    mov r0, r0, lsl #0x10
    cmp r1, r0, lsr #0x10
    beq .L_218
    cmp r4, #0x0
    beq .L_130
    cmp r4, #0x1
    beq .L_148
    b .L_160
.L_130:
    ldr r0, _LIT2
    ldrh r0, [r0]
    bic r0, r0, #0x40
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    b .L_164
.L_148:
    ldr r0, _LIT3
    ldrh r0, [r0]
    bic r0, r0, #0x40
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    b .L_164
.L_160:
    mov r0, #0x0
.L_164:
    cmp r0, #0x40
    beq .L_1b4
    ldr r0, [r6]
    cmp r4, #0x0
    mov r1, r0, lsl #0x12
    mov r0, r0, lsl #0x19
    mov r2, r1, lsr #0x19
    mov r1, r0, lsr #0x19
    beq .L_194
    cmp r4, #0x1
    beq .L_1a4
    b .L_1dc
.L_194:
    ldr r0, _LIT2
    str r5, [sp]
    bl func_0208e318
    b .L_1dc
.L_1a4:
    ldr r0, _LIT3
    str r5, [sp]
    bl func_0208e318
    b .L_1dc
.L_1b4:
    cmp r4, #0x0
    beq .L_1d0
    cmp r4, #0x1
    ldreq r0, _LIT4
    orreq r1, r3, r5, lsl #0x8
    streqh r1, [r0]
    b .L_1dc
.L_1d0:
    ldr r0, _LIT5
    orr r1, r3, r5, lsl #0x8
    strh r1, [r0]
.L_1dc:
    ldr r2, [r6]
    mov r0, #0x400
    mov r1, r2, lsl #0x6
    mov r1, r1, lsr #0x1b
    mov r2, r2, lsl #0xb
    mov r1, r1, lsl #0x5
    rsb r0, r0, #0x0
    orr r1, r1, r2, lsr #0x1b
    ldr r3, [r6, #0x4]
    mov r1, r1, lsl #0x10
    mov r2, r0, lsr #0x16
    and r3, r3, r0
    and r0, r2, r1, lsr #0x10
    orr r0, r3, r0
    str r0, [r6, #0x4]
.L_218:
    ldr r3, [r6, #0x8]
    mov r0, r3, lsl #0x17
    movs r0, r0, lsr #0x1f
    beq .L_2dc
    bic r2, r3, #0x100
    mov r0, r2, lsl #0x16
    str r2, [r6, #0x8]
    movs r0, r0, lsr #0x1f
    beq .L_29c
    cmp r4, #0x0
    beq .L_254
    cmp r4, #0x1
    ldreq r0, _LIT3
    ldreqh r0, [r0]
    b .L_25c
.L_254:
    ldr r0, _LIT2
    ldrh r0, [r0]
.L_25c:
    ldr r0, [r6, #0x8]
    cmp r4, #0x0
    mov r0, r0, lsl #0x10
    mov r1, r0, asr #0x1a
    beq .L_27c
    cmp r4, #0x1
    beq .L_288
    b .L_290
.L_27c:
    ldr r0, _LIT6
    bl func_0208c884
    b .L_290
.L_288:
    ldr r0, _LIT7
    bl func_0208c884
.L_290:
    mov r0, r4
    bl func_ov000_021ab850
    b .L_388
.L_29c:
    ldr r1, [r6, #0x8]
    mov r0, r2, lsl #0x18
    mov r1, r1, lsl #0x10
    cmp r4, #0x0
    mov r2, r1, asr #0x1a
    mov r1, r0, lsr #0x18
    beq .L_2c4
    cmp r4, #0x1
    beq .L_2d0
    b .L_388
.L_2c4:
    ldr r0, _LIT2
    bl func_0208e2f4
    b .L_388
.L_2d0:
    ldr r0, _LIT3
    bl func_0208e2f4
    b .L_388
.L_2dc:
    ldr r0, [r6, #0x8]
    mov r1, r0, lsl #0x10
    mov r2, r1, asr #0x1a
    mov r0, r0, lsl #0xa
    cmp r2, r0, asr #0x1a
    beq .L_388
    mov r0, r3, lsl #0x16
    movs r0, r0, lsr #0x1f
    beq .L_33c
    cmp r4, #0x0
    beq .L_314
    cmp r4, #0x1
    beq .L_324
    b .L_330
.L_314:
    ldr r0, _LIT6
    mov r1, r2
    bl func_0208c884
    b .L_330
.L_324:
    ldr r0, _LIT7
    mov r1, r2
    bl func_0208c884
.L_330:
    mov r0, r4
    bl func_ov000_021ab850
    b .L_36c
.L_33c:
    mov r0, r3, lsl #0x18
    cmp r4, #0x0
    mov r1, r0, lsr #0x18
    beq .L_358
    cmp r4, #0x1
    beq .L_364
    b .L_36c
.L_358:
    ldr r0, _LIT2
    bl func_0208e2f4
    b .L_36c
.L_364:
    ldr r0, _LIT3
    bl func_0208e2f4
.L_36c:
    ldr r1, [r6, #0x8]
    mov r0, r1, lsl #0x10
    mov r0, r0, asr #0x1a
    bic r1, r1, #0x3f0000
    mov r0, r0, lsl #0x1a
    orr r0, r1, r0, lsr #0xa
    str r0, [r6, #0x8]
.L_388:
    ldr r0, [r6]
    add r7, r6, #0x18
    bic r0, r0, #0x8000
    str r0, [r6]
    mov r5, #0x0
.L_39c:
    ldr r1, [r7]
    mov r0, r1, lsl #0x1a
    movs r0, r0, lsr #0x1f
    beq .L_3d8
    ldr r0, [r6, #0x28]
    mov r2, r1, lsl #0x1b
    mov r3, r0, lsl #0x15
    mov r0, r4
    mov r1, r5
    mov r2, r2, lsr #0x1b
    mov r3, r3, lsr #0x1b
    bl func_ov000_021ab258
    ldr r0, [r7]
    bic r0, r0, #0x20
    str r0, [r7]
.L_3d8:
    add r5, r5, #0x1
    cmp r5, #0x2
    add r7, r7, #0xc
    blt .L_39c
    ldr r0, [r6, #0x28]
    mov r1, r0, lsl #0x1d
    mov r1, r1, lsr #0x1d
    mov r0, r0, lsl #0x1a
    cmp r1, r0, lsr #0x1d
    beq .L_424
    mov r0, r4
    bl func_ov000_021ab474
    ldr r1, [r6, #0x28]
    mov r0, r1, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bic r1, r1, #0x38
    mov r0, r0, lsl #0x1d
    orr r0, r1, r0, lsr #0x1a
    str r0, [r6, #0x28]
.L_424:
    add r4, r4, #0x1
    cmp r4, #0x2
    add r6, r6, #0x2c
    blt .L_10
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov000_021c7530
_LIT1: .word 0x04001000
_LIT2: .word 0x04000050
_LIT3: .word 0x04001050
_LIT4: .word 0x04001052
_LIT5: .word 0x04000052
_LIT6: .word 0x0400006c
_LIT7: .word 0x0400106c
