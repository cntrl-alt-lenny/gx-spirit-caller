; func_020aeeac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c3b8c
        .extern data_02102838
        .extern data_021aa460
        .extern func_020b005c
        .extern func_020b18c4
        .extern func_020b1964
        .extern func_020b1e0c
        .extern func_020b1e88
        .extern func_020b21ec
        .extern func_020b23a0
        .extern func_020b2978
        .extern func_020b2a10
        .extern func_020b30e4
        .extern func_020b3c78
        .global func_020aeeac
        .arm
func_020aeeac:
    stmdb sp!, {r0, r1, r2, r3}
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x80
    ldr r8, [sp, #0xb4]
    ldr r6, [sp, #0xac]
    ldr r0, [sp, #0xb0]
    bic r9, r8, #-2147483648
    orrs r1, r9, r0
    ldr r7, [sp, #0xa8]
    bic r4, r6, #-2147483648
    addeq sp, sp, #0x80
    moveq r0, #0x0
    ldreq r1, _LIT0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    addeq sp, sp, #0x10
    bxeq lr
    ldr r1, _LIT1
    cmp r4, r1
    bgt .L_70
    bne .L_58
    cmp r7, #0x0
    bne .L_70
.L_58:
    ldr r1, _LIT1
    cmp r9, r1
    bgt .L_70
    bne .L_94
    cmp r0, #0x0
    beq .L_94
.L_70:
    ldr r0, [sp, #0xa8]
    ldr r1, [sp, #0xac]
    ldr r2, [sp, #0xb0]
    ldr r3, [sp, #0xb4]
    bl func_020b1964
    add sp, sp, #0x80
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_94:
    cmp r6, #0x0
    mov r5, #0x0
    bge .L_fc
    ldr r1, _LIT2
    cmp r9, r1
    movge r5, #0x2
    bge .L_fc
    sub r1, r1, #0x3500000
    cmp r9, r1
    blt .L_fc
    ldr r1, _LIT3
    add r1, r1, r9, asr #0x14
    cmp r1, #0x14
    ble .L_e4
    rsb r2, r1, #0x34
    mov r1, r0, lsr r2
    cmp r0, r1, lsl r2
    andeq r1, r1, #0x1
    rsbeq r5, r1, #0x2
    b .L_fc
.L_e4:
    cmp r0, #0x0
    rsbeq r2, r1, #0x14
    moveq r1, r9, asr r2
    cmpeq r9, r1, lsl r2
    andeq r1, r1, #0x1
    rsbeq r5, r1, #0x2
.L_fc:
    cmp r0, #0x0
    bne .L_258
    ldr r1, _LIT1
    cmp r9, r1
    bne .L_1b0
    add r0, r4, #0x100000
    add r0, r0, #-1073741824
    orrs r0, r0, r7
    bne .L_144
    ldr r0, [sp, #0xb0]
    ldr r1, [sp, #0xb4]
    mov r2, r0
    mov r3, r1
    bl func_020b23a0
    add sp, sp, #0x80
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_144:
    sub r0, r1, #0x40000000
    cmp r4, r0
    blt .L_174
    cmp r8, #0x0
    ldrge r0, [sp, #0xb0]
    ldrge r1, [sp, #0xb4]
    movlt r0, #0x0
    add sp, sp, #0x80
    movlt r1, r0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_174:
    cmp r8, #0x0
    mov r0, #0x0
    addge sp, sp, #0x80
    movge r1, r0
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    addge sp, sp, #0x10
    bxge lr
    ldr r2, [sp, #0xb0]
    ldr r3, [sp, #0xb4]
    mov r1, r0
    bl func_020b23a0
    add sp, sp, #0x80
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_1b0:
    sub r0, r1, #0x40000000
    cmp r9, r0
    bne .L_1fc
    cmp r8, #0x0
    ldrge r0, [sp, #0xa8]
    ldrge r1, [sp, #0xac]
    addge sp, sp, #0x80
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    addge sp, sp, #0x10
    bxge lr
    ldr r2, [sp, #0xa8]
    ldr r3, [sp, #0xac]
    sub r1, r1, #0x40000000
    mov r0, #0x0
    bl func_020b3c78
    add sp, sp, #0x80
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_1fc:
    cmp r8, #0x40000000
    bne .L_228
    ldr r0, [sp, #0xa8]
    ldr r1, [sp, #0xac]
    mov r2, r0
    mov r3, r1
    bl func_020b1e88
    add sp, sp, #0x80
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_228:
    ldr r0, _LIT4
    cmp r8, r0
    bne .L_258
    cmp r6, #0x0
    blt .L_258
    ldr r0, [sp, #0xa8]
    ldr r1, [sp, #0xac]
    bl func_020b21ec
    add sp, sp, #0x80
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_258:
    ldr r0, [sp, #0xa8]
    ldr r1, [sp, #0xac]
    bl func_020b005c
    str r0, [sp, #0x70]
    str r1, [sp, #0x74]
    cmp r7, #0x0
    bne .L_35c
    ldr r0, _LIT1
    cmp r4, r0
    cmpne r4, #0x0
    subne r0, r0, #0x40000000
    cmpne r4, r0
    bne .L_35c
    ldr r2, [sp, #0x70]
    ldr r3, [sp, #0x74]
    str r2, [sp, #0x78]
    str r3, [sp, #0x7c]
    cmp r8, #0x0
    bge .L_2b8
    ldr r1, _LIT0
    mov r0, #0x0
    bl func_020b3c78
    str r0, [sp, #0x78]
    str r1, [sp, #0x7c]
.L_2b8:
    cmp r6, #0x0
    bge .L_344
    add r0, r4, #0x100000
    add r0, r0, #-1073741824
    orrs r0, r0, r5
    bne .L_320
    ldr r0, [sp, #0x78]
    ldr r1, [sp, #0x7c]
    mov r2, r0
    mov r3, r1
    bl func_020b23a0
    mov r4, r0
    mov r5, r1
    ldr r0, [sp, #0x78]
    ldr r1, [sp, #0x7c]
    mov r2, r0
    mov r3, r1
    bl func_020b23a0
    mov r2, r0
    mov r3, r1
    mov r0, r4
    mov r1, r5
    bl func_020b3c78
    str r0, [sp, #0x78]
    str r1, [sp, #0x7c]
    b .L_344
.L_320:
    cmp r5, #0x1
    bne .L_344
    mov r0, #0x0
    ldr r2, [sp, #0x78]
    ldr r3, [sp, #0x7c]
    mov r1, r0
    bl func_020b23a0
    str r0, [sp, #0x78]
    str r1, [sp, #0x7c]
.L_344:
    ldr r0, [sp, #0x78]
    ldr r1, [sp, #0x7c]
    add sp, sp, #0x80
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_35c:
    mov r0, r6, asr #0x1f
    add r7, r0, #0x1
    orrs r0, r7, r5
    bne .L_394
    ldr r0, _LIT5
    ldr r1, _LIT6
    ldr r0, [r0]
    mov r2, #0x21
    str r2, [r1]
    bl func_020b30e4
    add sp, sp, #0x80
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_394:
    ldr r3, _LIT7
    cmp r9, r3
    ble .L_698
    add r0, r3, #0x2100000
    cmp r9, r0
    ble .L_404
    ldr r1, _LIT8
    cmp r4, r1
    bgt .L_3d8
    cmp r8, #0x0
    mov r0, #0x0
    addlt r1, r1, #0x40000001
    add sp, sp, #0x80
    movge r1, r0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_3d8:
    add r0, r1, #0x1
    cmp r4, r0
    blt .L_404
    cmp r8, #0x0
    mov r0, #0x0
    addgt r1, r1, #0x40000001
    add sp, sp, #0x80
    movle r1, r0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_404:
    ldr r2, _LIT8
    cmp r4, r2
    bge .L_430
    cmp r8, #0x0
    mov r0, #0x0
    addlt r1, r2, #0x40000001
    add sp, sp, #0x80
    movge r1, r0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_430:
    add r0, r2, #0x1
    cmp r4, r0
    ble .L_45c
    cmp r8, #0x0
    mov r0, #0x0
    addgt r1, r2, #0x40000001
    add sp, sp, #0x80
    movle r1, r0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_45c:
    ldr r0, [sp, #0xa8]
    ldr r1, [sp, #0xac]
    add r3, r2, #0x1
    mov r2, #0x0
    bl func_020b23a0
    mov r2, r0
    mov r3, r1
    str r0, [sp, #0x50]
    str r1, [sp, #0x54]
    bl func_020b1e88
    mov r6, r1
    mov r4, r0
    ldr r2, [sp, #0x50]
    ldr r3, [sp, #0x54]
    ldr r1, _LIT9
    mov r0, #0x0
    bl func_020b1e88
    mov r2, r0
    mov r3, r1
    ldr r0, _LIT10
    sub r1, r0, #0x15800000
    bl func_020b23a0
    mov r2, r0
    mov r3, r1
    ldr r0, [sp, #0x50]
    ldr r1, [sp, #0x54]
    bl func_020b1e88
    mov r2, r0
    mov r3, r1
    mov r0, #0x0
    ldr r1, _LIT4
    bl func_020b23a0
    mov r2, r0
    mov r0, r4
    mov r3, r1
    mov r1, r6
    bl func_020b1e88
    mov r6, r0
    mov r8, r1
    mov r0, #0x60000000
    ldr r1, _LIT11
    ldr r2, [sp, #0x50]
    ldr r3, [sp, #0x54]
    bl func_020b1e88
    mov r4, r0
    mov r9, r1
    ldr r0, _LIT12
    ldr r1, _LIT13
    ldr r2, [sp, #0x50]
    ldr r3, [sp, #0x54]
    bl func_020b1e88
    mov fp, r0
    mov sl, r1
    ldr r0, _LIT14
    ldr r1, _LIT11
    mov r2, r6
    mov r3, r8
    bl func_020b1e88
    mov r2, r0
    mov r3, r1
    mov r0, fp
    mov r1, sl
    bl func_020b23a0
    mov r6, r0
    mov r8, r1
    mov r0, r4
    mov r1, r9
    mov r2, r6
    mov r3, r8
    bl func_020b1964
    mov r2, r4
    mov r3, r9
    str r1, [sp, #0x5c]
    mov r0, #0x0
    str r0, [sp, #0x58]
    bl func_020b23a0
    mov r2, r0
    mov r0, r6
    mov r3, r1
    mov r1, r8
    bl func_020b23a0
    mov r4, r0
    mov r8, r1
    b .L_bf4
_LIT0: .word 0x3ff00000
_LIT1: .word 0x7ff00000
_LIT2: .word 0x43400000
_LIT3: .word 0xfffffc01
_LIT4: .word 0x3fe00000
_LIT5: .word data_02102838
_LIT6: .word data_021aa460
_LIT7: .word 0x41e00000
_LIT8: .word 0x3fefffff
_LIT9: .word 0x3fd00000
_LIT10: .word 0x55555555
_LIT11: .word 0x3ff71547
_LIT12: .word 0xf85ddf44
_LIT13: .word 0x3e54ae0b
_LIT14: .word 0x652b82fe
_LIT15: .word 0x0003988e
_LIT16: .word 0x000bb67a
_LIT17: .word data_020c3b8c+0x10
_LIT18: .word 0x4a454eef
_LIT19: .word 0x3fca7e28
_LIT20: .word 0x93c9db65
_LIT21: .word 0x3fcd864a
_LIT22: .word 0xa91d4101
_LIT23: .word 0x3fd17460
_LIT24: .word 0x518f264d
_LIT25: .word 0x3fd55555
_LIT26: .word 0xdb6fabff
_LIT27: .word 0x3fdb6db6
_LIT28: .word 0x33333303
_LIT29: .word 0x3fe33333
_LIT30: .word 0x40080000
_LIT31: .word 0x3feec709
_LIT32: .word 0x145b01f5
_LIT33: .word 0xbe3e2fe0
_LIT34: .word 0xdc3a03fd
_LIT35: .word data_020c3b8c+0x20
_LIT36: .word data_020c3b8c
_LIT37: .word 0x40900000
_LIT38: .word 0x8800759c
_LIT39: .word 0x7e37e43c
_LIT40: .word 0x3c971547
_LIT41: .word 0x3f6f3400
_LIT42: .word 0xc2f8f359
_LIT43: .word 0x01a56e1f
_LIT44: .word 0x3fe62e43
_LIT45: .word 0xfefa39ef
_LIT46: .word 0x3fe62e42
_LIT47: .word 0x0ca86c39
_LIT48: .word 0xbe205c61
_LIT49: .word 0x72bea4d0
_LIT50: .word 0x3e663769
_LIT51: .word 0xc5d26bf1
_LIT52: .word 0xbebbbd41
_LIT53: .word 0xaf25de2c
_LIT54: .word 0x3f11566a
_LIT55: .word 0x16bebd93
_LIT56: .word 0xbf66c16c
_LIT57: .word 0x5555553e
_LIT58: .word 0x3fc55555
.L_698:
    cmp r4, #0x100000
    mov r6, #0x0
    bge .L_6c8
    ldr r0, [sp, #0x70]
    ldr r1, [sp, #0x74]
    mov r2, r6
    add r3, r3, #0x1600000
    bl func_020b1e88
    mov r4, r1
    str r0, [sp, #0x70]
    str r4, [sp, #0x74]
    sub r6, r6, #0x35
.L_6c8:
    ldr r0, _LIT3
    ldr r1, _LIT15
    and r2, r4, r0, lsr #0xc
    add r0, r0, r4, asr #0x14
    orr r9, r2, #0xff00000
    cmp r2, r1
    add r6, r6, r0
    orr r9, r9, #0x30000000
    movle r8, #0x0
    ble .L_708
    ldr r0, _LIT16
    cmp r2, r0
    movlt r8, #0x1
    addge r6, r6, #0x1
    subge r9, r9, #0x100000
    movge r8, #0x0
.L_708:
    ldr r2, _LIT17
    ldr r0, [sp, #0x70]
    add r1, r2, r8, lsl #0x3
    ldr r3, [r1, #0x4]
    ldr r2, [r2, r8, lsl #0x3]
    mov r1, r9
    str r9, [sp, #0x74]
    bl func_020b23a0
    ldr r2, _LIT17
    mov sl, r0
    add r3, r2, r8, lsl #0x3
    mov r4, r1
    ldr r0, [sp, #0x70]
    ldr r2, [r2, r8, lsl #0x3]
    ldr r3, [r3, #0x4]
    mov r1, r9
    bl func_020b1964
    mov r3, r1
    mov r2, r0
    ldr r1, _LIT0
    mov r0, #0x0
    bl func_020b3c78
    str r1, [sp, #0x24]
    mov fp, r0
    ldr r3, [sp, #0x24]
    mov r0, sl
    mov r1, r4
    mov r2, fp
    bl func_020b1e88
    mov r2, r9, asr #0x1
    orr r2, r2, #0x20000000
    mov r9, r1
    add r2, r2, #0x80000
    add r1, r2, r8, lsl #0x12
    ldr r2, _LIT17
    str r0, [sp, #0x28]
    add r3, r2, r8, lsl #0x3
    mov r0, #0x0
    ldr r2, [r2, r8, lsl #0x3]
    ldr r3, [r3, #0x4]
    str r9, [sp, #0x4c]
    str r1, [sp, #0x44]
    str r0, [sp, #0x48]
    str r0, [sp, #0x40]
    bl func_020b23a0
    mov r2, r0
    mov r3, r1
    ldr r0, [sp, #0x70]
    ldr r1, [sp, #0x74]
    bl func_020b23a0
    str r0, [sp, #0x2c]
    str r1, [sp, #0x1c]
    ldr r0, [sp, #0x48]
    ldr r2, [sp, #0x40]
    ldr r3, [sp, #0x44]
    mov r1, r9
    bl func_020b1e88
    mov r2, r0
    mov r3, r1
    mov r0, sl
    mov r1, r4
    bl func_020b23a0
    mov sl, r0
    mov r4, r1
    ldr r2, [sp, #0x2c]
    ldr r3, [sp, #0x1c]
    ldr r0, [sp, #0x48]
    mov r1, r9
    bl func_020b1e88
    mov r2, r0
    mov r3, r1
    mov r0, sl
    mov r1, r4
    bl func_020b23a0
    mov r3, r1
    mov r2, r0
    ldr r1, [sp, #0x24]
    mov r0, fp
    bl func_020b1e88
    str r0, [sp, #0x30]
    ldr r0, [sp, #0x28]
    str r1, [sp, #0x14]
    mov r1, r9
    mov r2, r0
    mov r3, r9
    bl func_020b1e88
    mov r4, r0
    mov sl, r1
    mov r2, r4
    mov r3, sl
    bl func_020b1e88
    str r0, [sp, #0x34]
    mov fp, r1
    ldr r0, _LIT18
    ldr r1, _LIT19
    mov r2, r4
    mov r3, sl
    bl func_020b1e88
    mov r2, r0
    mov r3, r1
    ldr r0, _LIT20
    ldr r1, _LIT21
    bl func_020b1964
    mov r2, r0
    mov r3, r1
    mov r0, r4
    mov r1, sl
    bl func_020b1e88
    mov r2, r0
    mov r3, r1
    ldr r0, _LIT22
    ldr r1, _LIT23
    bl func_020b1964
    mov r2, r0
    mov r3, r1
    mov r0, r4
    mov r1, sl
    bl func_020b1e88
    mov r2, r0
    mov r3, r1
    ldr r0, _LIT24
    ldr r1, _LIT25
    bl func_020b1964
    mov r2, r0
    mov r3, r1
    mov r0, r4
    mov r1, sl
    bl func_020b1e88
    mov r2, r0
    mov r3, r1
    ldr r0, _LIT26
    ldr r1, _LIT27
    bl func_020b1964
    mov r2, r0
    mov r3, r1
    mov r0, r4
    mov r1, sl
    bl func_020b1e88
    mov r2, r0
    mov r3, r1
    ldr r0, _LIT28
    ldr r1, _LIT29
    bl func_020b1964
    mov r2, r0
    mov r3, r1
    ldr r0, [sp, #0x34]
    mov r1, fp
    bl func_020b1e88
    mov r4, r0
    mov sl, r1
    ldr r0, [sp, #0x48]
    ldr r2, [sp, #0x28]
    mov r1, r9
    mov r3, r9
    bl func_020b1964
    mov r2, r0
    mov r3, r1
    ldr r0, [sp, #0x30]
    ldr r1, [sp, #0x14]
    bl func_020b1e88
    mov r2, r0
    mov r3, r1
    mov r0, r4
    mov r1, sl
    bl func_020b1964
    mov r4, r0
    ldr r0, [sp, #0x48]
    mov sl, r1
    mov r1, r9
    mov r2, r0
    mov r3, r1
    bl func_020b1e88
    str r1, [sp, #0xc]
    mov fp, r0
    ldr r1, _LIT30
    ldr r3, [sp, #0xc]
    mov r0, #0x0
    mov r2, fp
    bl func_020b1964
    mov r2, r4
    mov r3, sl
    bl func_020b1964
    mov r0, #0x0
    ldr r3, _LIT30
    mov r2, r0
    str r1, [sp, #0x44]
    str r0, [sp, #0x40]
    bl func_020b23a0
    ldr r3, [sp, #0xc]
    mov r2, fp
    bl func_020b23a0
    mov r2, r0
    mov r3, r1
    mov r0, r4
    mov r1, sl
    bl func_020b23a0
    str r0, [sp, #0x38]
    str r1, [sp, #0x4]
    ldr r0, [sp, #0x48]
    ldr r2, [sp, #0x40]
    ldr r3, [sp, #0x44]
    mov r1, r9
    bl func_020b1e88
    mov r4, r0
    mov sl, r1
    ldr r0, [sp, #0x30]
    ldr r1, [sp, #0x14]
    ldr r2, [sp, #0x40]
    ldr r3, [sp, #0x44]
    bl func_020b1e88
    str r0, [sp, #0x3c]
    mov fp, r1
    ldr r0, [sp, #0x38]
    ldr r1, [sp, #0x4]
    ldr r2, [sp, #0x28]
    mov r3, r9
    bl func_020b1e88
    mov r2, r0
    mov r3, r1
    ldr r0, [sp, #0x3c]
    mov r1, fp
    bl func_020b1964
    mov r9, r0
    mov fp, r1
    mov r0, r4
    mov r1, sl
    mov r2, r9
    mov r3, fp
    bl func_020b1964
    mov r0, #0x0
    mov r2, r4
    mov r3, sl
    str r1, [sp, #0x6c]
    str r0, [sp, #0x68]
    bl func_020b23a0
    mov r2, r0
    mov r3, r1
    mov r0, r9
    mov r1, fp
    bl func_020b23a0
    mov sl, r1
    mov fp, r0
    ldr r1, _LIT31
    ldr r2, [sp, #0x68]
    ldr r3, [sp, #0x6c]
    mov r0, #-536870912
    bl func_020b1e88
    mov r4, r0
    mov r9, r1
    ldr r0, _LIT32
    ldr r1, _LIT33
    ldr r2, [sp, #0x68]
    ldr r3, [sp, #0x6c]
    bl func_020b1e88
    mov r2, fp
    mov r3, sl
    mov fp, r0
    mov sl, r1
    ldr r0, _LIT34
    ldr r1, _LIT31
    bl func_020b1e88
    mov r2, r0
    mov r3, r1
    mov r0, fp
    mov r1, sl
    bl func_020b1964
    mov r2, r0
    mov r3, r1
    ldr r0, _LIT35
    add r1, r0, r8, lsl #0x3
    ldr r0, [r0, r8, lsl #0x3]
    ldr r1, [r1, #0x4]
    bl func_020b1964
    mov fp, r0
    mov sl, r1
    mov r0, r6
    bl func_020b1e0c
    str r0, [sp, #0x50]
    str r1, [sp, #0x54]
    mov r0, r4
    mov r1, r9
    mov r2, fp
    mov r3, sl
    bl func_020b1964
    ldr r2, _LIT36
    add r3, r2, r8, lsl #0x3
    ldr r2, [r2, r8, lsl #0x3]
    ldr r3, [r3, #0x4]
    bl func_020b1964
    mov r2, r0
    mov r3, r1
    ldr r0, [sp, #0x50]
    ldr r1, [sp, #0x54]
    bl func_020b1964
    str r1, [sp, #0x5c]
    mov r0, #0x0
    str r0, [sp, #0x58]
    ldr r2, [sp, #0x50]
    ldr r3, [sp, #0x54]
    bl func_020b23a0
    ldr r2, _LIT36
    add r3, r2, r8, lsl #0x3
    ldr r2, [r2, r8, lsl #0x3]
    ldr r3, [r3, #0x4]
    bl func_020b23a0
    mov r2, r4
    mov r3, r9
    bl func_020b23a0
    mov r2, r0
    mov r0, fp
    mov r3, r1
    mov r1, sl
    bl func_020b23a0
    mov r4, r0
    mov r8, r1
.L_bf4:
    sub r0, r5, #0x1
    ldr r1, [sp, #0xb4]
    orrs r0, r7, r0
    ldr r5, _LIT0
    mov r2, #0x0
    ldr r0, [sp, #0xb0]
    mov r3, r1
    mov r6, #0x0
    subeq r5, r5, #-2147483648
    str r1, [sp, #0x64]
    str r2, [sp, #0x60]
    bl func_020b23a0
    mov r2, r0
    mov r3, r1
    ldr r0, [sp, #0x58]
    ldr r1, [sp, #0x5c]
    bl func_020b1e88
    mov r7, r0
    mov r9, r1
    ldr r0, [sp, #0xb0]
    ldr r1, [sp, #0xb4]
    mov r2, r4
    mov r3, r8
    bl func_020b1e88
    mov r2, r0
    mov r3, r1
    mov r0, r7
    mov r1, r9
    bl func_020b1964
    mov r7, r0
    mov r8, r1
    ldr r0, [sp, #0x60]
    ldr r1, [sp, #0x64]
    ldr r2, [sp, #0x58]
    ldr r3, [sp, #0x5c]
    bl func_020b1e88
    mov r2, r0
    mov r3, r1
    mov r0, r7
    mov r1, r8
    str r2, [sp, #0x68]
    str r3, [sp, #0x6c]
    bl func_020b1964
    mov r9, r1
    ldr r2, _LIT37
    str r0, [sp, #0x78]
    str r9, [sp, #0x7c]
    cmp r9, r2
    blt .L_d80
    add r1, r9, #0xf700000
    add r1, r1, #-1342177280
    orrs r0, r1, r0
    beq .L_d00
    ldr r0, _LIT38
    ldr r1, _LIT39
    mov r2, r6
    mov r3, r5
    bl func_020b1e88
    mov r2, r0
    mov r3, r1
    ldr r0, _LIT38
    ldr r1, _LIT39
    bl func_020b1e88
    add sp, sp, #0x80
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_d00:
    ldr r0, _LIT14
    ldr r1, _LIT40
    mov r2, r7
    mov r3, r8
    bl func_020b1964
    mov r4, r0
    mov sl, r1
    ldr r0, [sp, #0x78]
    ldr r2, [sp, #0x68]
    ldr r3, [sp, #0x6c]
    mov r1, r9
    bl func_020b23a0
    mov r2, r0
    mov r3, r1
    mov r0, r4
    mov r1, sl
    bl func_020b2978
    bls .L_e34
    ldr r0, _LIT38
    ldr r1, _LIT39
    mov r2, r6
    mov r3, r5
    bl func_020b1e88
    mov r2, r0
    mov r3, r1
    ldr r0, _LIT38
    ldr r1, _LIT39
    bl func_020b1e88
    add sp, sp, #0x80
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_d80:
    bic r3, r9, #-2147483648
    add r2, r2, #0xcc00
    cmp r3, r2
    blt .L_e34
    ldr r2, _LIT41
    add r2, r9, r2
    orrs r2, r2, r0
    beq .L_dd8
    ldr r0, _LIT42
    ldr r1, _LIT43
    mov r2, r6
    mov r3, r5
    bl func_020b1e88
    mov r2, r0
    mov r3, r1
    ldr r0, _LIT42
    ldr r1, _LIT43
    bl func_020b1e88
    add sp, sp, #0x80
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_dd8:
    ldr r2, [sp, #0x68]
    ldr r3, [sp, #0x6c]
    bl func_020b23a0
    mov r2, r0
    mov r3, r1
    mov r0, r7
    mov r1, r8
    bl func_020b2a10
    bhi .L_e34
    ldr r0, _LIT42
    ldr r1, _LIT43
    mov r2, r6
    mov r3, r5
    bl func_020b1e88
    mov r2, r0
    mov r3, r1
    ldr r0, _LIT42
    ldr r1, _LIT43
    bl func_020b1e88
    add sp, sp, #0x80
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_e34:
    ldr r0, _LIT3
    bic r3, r9, #-2147483648
    ldr r1, _LIT4
    add r2, r0, r3, asr #0x14
    cmp r3, r1
    mov r4, #0x0
    ble .L_eb0
    mov r1, #0x100000
    add r2, r2, #0x1
    add r2, r9, r1, asr r2
    bic r3, r2, #-2147483648
    add r0, r0, r3, asr #0x14
    sub r3, r1, #0x1
    mvn r3, r3, asr r0
    sub r1, r1, #0x1
    and r1, r2, r1
    and r2, r2, r3
    str r2, [sp, #0x54]
    str r4, [sp, #0x50]
    orr r1, r1, #0x100000
    rsb r0, r0, #0x14
    mov r4, r1, asr r0
    cmp r9, #0x0
    ldr r0, [sp, #0x68]
    ldr r1, [sp, #0x6c]
    ldr r2, [sp, #0x50]
    ldr r3, [sp, #0x54]
    rsblt r4, r4, #0x0
    bl func_020b23a0
    str r0, [sp, #0x68]
    str r1, [sp, #0x6c]
.L_eb0:
    ldr r2, [sp, #0x68]
    ldr r3, [sp, #0x6c]
    mov r0, r7
    mov r1, r8
    bl func_020b1964
    mov r3, r1
    mov r0, #0x0
    ldr r1, _LIT44
    mov r2, r0
    str r3, [sp, #0x54]
    str r0, [sp, #0x50]
    bl func_020b1e88
    mov r9, r0
    mov sl, r1
    ldr r0, [sp, #0x50]
    ldr r1, [sp, #0x54]
    ldr r2, [sp, #0x68]
    ldr r3, [sp, #0x6c]
    bl func_020b23a0
    mov r2, r0
    mov r0, r7
    mov r3, r1
    mov r1, r8
    bl func_020b23a0
    mov r2, r0
    mov r3, r1
    ldr r0, _LIT45
    ldr r1, _LIT46
    bl func_020b1e88
    mov r7, r0
    mov r8, r1
    ldr r0, _LIT47
    ldr r1, _LIT48
    ldr r2, [sp, #0x50]
    ldr r3, [sp, #0x54]
    bl func_020b1e88
    mov r2, r0
    mov r0, r7
    mov r3, r1
    mov r1, r8
    bl func_020b1964
    mov r7, r0
    mov r8, r1
    mov r0, r9
    mov r1, sl
    mov r2, r7
    mov r3, r8
    bl func_020b1964
    mov r2, r9
    mov r3, sl
    str r0, [sp, #0x78]
    str r1, [sp, #0x7c]
    bl func_020b23a0
    mov r2, r0
    mov r3, r1
    mov r0, r7
    mov r1, r8
    bl func_020b23a0
    mov r8, r0
    mov r9, r1
    ldr r0, [sp, #0x78]
    ldr r1, [sp, #0x7c]
    mov r2, r0
    mov r3, r1
    bl func_020b1e88
    mov r2, r0
    str r2, [sp, #0x50]
    mov r3, r1
    str r3, [sp, #0x54]
    ldr r0, _LIT49
    ldr r1, _LIT50
    bl func_020b1e88
    mov r2, r0
    mov r3, r1
    ldr r0, _LIT51
    ldr r1, _LIT52
    bl func_020b1964
    mov r2, r0
    mov r3, r1
    ldr r0, [sp, #0x50]
    ldr r1, [sp, #0x54]
    bl func_020b1e88
    mov r2, r0
    mov r3, r1
    ldr r0, _LIT53
    ldr r1, _LIT54
    bl func_020b1964
    mov r2, r0
    mov r3, r1
    ldr r0, [sp, #0x50]
    ldr r1, [sp, #0x54]
    bl func_020b1e88
    mov r2, r0
    mov r3, r1
    ldr r0, _LIT55
    ldr r1, _LIT56
    bl func_020b1964
    mov r2, r0
    mov r3, r1
    ldr r0, [sp, #0x50]
    ldr r1, [sp, #0x54]
    bl func_020b1e88
    mov r2, r0
    mov r3, r1
    ldr r0, _LIT57
    ldr r1, _LIT58
    bl func_020b1964
    mov r2, r0
    mov r3, r1
    ldr r0, [sp, #0x50]
    ldr r1, [sp, #0x54]
    bl func_020b1e88
    mov r2, r0
    mov r3, r1
    ldr r0, [sp, #0x78]
    ldr r1, [sp, #0x7c]
    bl func_020b23a0
    mov r2, r0
    str r2, [sp, #0x58]
    mov r3, r1
    str r3, [sp, #0x5c]
    ldr r0, [sp, #0x78]
    ldr r1, [sp, #0x7c]
    bl func_020b1e88
    mov r7, r0
    mov sl, r1
    ldr r0, [sp, #0x58]
    ldr r1, [sp, #0x5c]
    mov r2, #0x0
    mov r3, #0x40000000
    bl func_020b23a0
    mov r2, r0
    mov r0, r7
    mov r3, r1
    mov r1, sl
    bl func_020b3c78
    mov r7, r0
    mov sl, r1
    ldr r0, [sp, #0x78]
    ldr r1, [sp, #0x7c]
    mov r2, r8
    mov r3, r9
    bl func_020b1e88
    mov r2, r0
    mov r0, r8
    mov r3, r1
    mov r1, r9
    bl func_020b1964
    mov r2, r0
    mov r0, r7
    mov r3, r1
    mov r1, sl
    bl func_020b23a0
    ldr r2, [sp, #0x78]
    ldr r3, [sp, #0x7c]
    bl func_020b23a0
    mov r3, r1
    mov r2, r0
    ldr r1, _LIT0
    mov r0, #0x0
    bl func_020b23a0
    add r3, r1, r4, lsl #0x14
    mov r2, r3, asr #0x14
    str r0, [sp, #0x78]
    cmp r2, #0x0
    str r1, [sp, #0x7c]
    addgt r0, sp, #0x78
    strgt r3, [r0, #0x4]
    bgt .L_1164
    mov r2, r4
    bl func_020b18c4
    str r0, [sp, #0x78]
    str r1, [sp, #0x7c]
.L_1164:
    ldr r2, [sp, #0x78]
    ldr r3, [sp, #0x7c]
    mov r0, r6
    mov r1, r5
    bl func_020b1e88
    add sp, sp, #0x80
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
