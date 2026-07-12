; func_ov002_0229acd0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103fcc
        .extern data_ov002_022cd314
        .extern data_ov002_022cd65c
        .extern data_ov002_022ce870
        .extern data_ov002_022d008c
        .extern data_ov002_022d0170
        .extern data_ov002_022d0e4c
        .extern data_ov002_022d10dc
        .extern data_ov002_022d1320
        .extern data_ov002_022d1330
        .extern data_ov002_022d15b0
        .extern data_ov002_022d1710
        .extern data_ov002_022d1830
        .extern data_ov002_022d1968
        .extern data_ov002_022d19bc
        .extern data_ov002_022d1a04
        .extern data_ov002_022d1a18
        .extern data_ov002_022d1a9c
        .extern func_0202baec
        .extern func_0202e1e0
        .extern func_0203178c
        .extern func_0203737c
        .extern func_ov002_021b939c
        .extern func_ov002_021b9d20
        .extern func_ov002_021b9d68
        .extern func_ov002_021b9db0
        .extern func_ov002_021c9424
        .extern func_ov002_02299c24
        .extern func_ov002_02299f50
        .extern func_ov002_0229a304
        .extern func_ov002_0229a57c
        .extern func_ov002_0229dfac
        .extern func_ov002_0229e53c
        .extern func_ov002_0229f894
        .extern func_ov002_022a567c
        .extern func_ov002_022a5fb8
        .extern func_ov002_022a61e8
        .extern func_ov002_022a6294
        .extern func_ov002_022a6344
        .extern func_ov002_022a63c4
        .extern func_ov002_022a6724
        .extern func_ov002_022a67b0
        .extern func_ov002_022a6af8
        .extern func_ov002_022a7cc4
        .extern func_ov002_022a7e18
        .extern func_ov002_022a7f48
        .extern func_ov002_022a8054
        .extern func_ov002_022a80f0
        .extern func_ov002_022a8198
        .extern func_ov002_022a852c
        .extern func_ov002_022aaa10
        .extern func_ov002_022aab80
        .extern func_ov002_022ac1c0
        .extern func_ov002_022ae884
        .extern func_ov002_022aff20
        .extern func_ov002_022b35ac
        .extern func_ov002_022b35dc
        .extern func_ov002_022b361c
        .extern func_ov002_022b3640
        .extern func_ov002_022b7f8c
        .extern func_ov002_022b8314
        .extern func_ov002_022b8320
        .global func_ov002_0229acd0
        .arm
func_ov002_0229acd0:
    stmdb sp!, {r0, r1, r2, r3}
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x28
    mov r7, r0
    cmp r7, #0x3d
    addls pc, pc, r7, lsl #0x2
    b .L_19f0
    b .L_19f0
    b .L_114
    b .L_df0
    b .L_804
    b .L_618
    b .L_5a8
    b .L_18dc
    b .L_490
    b .L_19c0
    b .L_6bc
    b .L_768
    b .L_788
    b .L_6e8
    b .L_d48
    b .L_d6c
    b .L_19f0
    b .L_c4c
    b .L_c84
    b .L_cec
    b .L_bb0
    b .L_44c
    b .L_be8
    b .L_44c
    b .L_4b8
    b .L_134
    b .L_268
    b .L_3b0
    b .L_29c
    b .L_1144
    b .L_fb4
    b .L_10e8
    b .L_12d8
    b .L_e7c
    b .L_12a0
    b .L_117c
    b .L_1444
    b .L_140c
    b .L_14b0
    b .L_19f0
    b .L_a38
    b .L_838
    b .L_8a8
    b .L_8c8
    b .L_838
    b .L_8a8
    b .L_8c8
    b .L_b44
    b .L_b6c
    b .L_1794
    b .L_afc
    b .L_b24
    b .L_15c4
    b .L_165c
    b .L_174c
    b .L_19f0
    b .L_17b8
    b .L_1810
    b .L_1834
    b .L_1858
    b .L_187c
    b .L_18b8
    b .L_1918
.L_114:
    ldr r2, _LIT0
    ldr r1, _LIT1
    add sp, sp, #0x28
    str r2, [r1, #0xdc]
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_134:
    ldr r4, [sp, #0x54]
    ldrh r2, [sp, #0x58]
    mov r0, r4, lsl #0x10
    ldr r1, _LIT2
    mov r0, r0, lsr #0xe
    ldrh r3, [r1, r0]
    mov r0, r4, lsr #0x10
    ldrh r1, [sp, #0x5c]
    mov r0, r0, lsl #0x10
    mov r3, r3, lsl #0x13
    mov r0, r0, lsr #0x10
    strh r2, [sp, #0x26]
    strh r1, [sp, #0x24]
    cmp r0, #0x8
    mov r4, r3, lsr #0x13
    addls pc, pc, r0, lsl #0x2
    b .L_21c
    b .L_19c
    b .L_19c
    b .L_208
    b .L_19c
    b .L_19c
    b .L_208
    b .L_208
    b .L_208
    b .L_208
.L_19c:
    ldrh r0, [sp, #0x24]
    mov r0, r0, lsl #0x1a
    mov r0, r0, lsr #0x1b
    cmp r0, #0xf
    beq .L_208
    ldrh r1, [sp, #0x26]
    sub r3, sp, #0x4
    ldr r0, _LIT3
    strh r1, [r3]
    ldrh r2, [sp, #0x24]
    ldr r1, [r3]
    strh r2, [r3]
    ldr r2, [r3]
    bl func_ov002_022b8320
    ldr r0, _LIT3
    mov r1, #0xc
    mov r2, #0x0
    bl func_ov002_022b7f8c
    ldr r0, _LIT3
    mov r1, r4
    bl func_ov002_022b8314
    ldr r0, _LIT4
    mov r1, r4
    add r2, sp, #0x26
    add r3, sp, #0x24
    bl func_ov002_022a63c4
    b .L_21c
.L_208:
    ldr r0, _LIT4
    add r2, sp, #0x26
    add r3, sp, #0x24
    mov r1, r4
    bl func_ov002_022a6724
.L_21c:
    mov r0, r4
    bl func_0203178c
    cmp r0, #0x0
    beq .L_254
    ldrh r0, [sp, #0x24]
    mov r0, r0, lsl #0x1a
    mov r0, r0, lsr #0x1b
    cmp r0, #0x5
    bcc .L_254
    cmp r0, #0x9
    bhi .L_254
    mov r0, r4
    mov r1, #0x1
    bl func_0202baec
.L_254:
    add sp, sp, #0x28
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_268:
    ldrh r4, [sp, #0x58]
    ldrh r3, [sp, #0x5c]
    ldr r0, _LIT4
    add r1, sp, #0x22
    add r2, sp, #0x20
    strh r4, [sp, #0x22]
    strh r3, [sp, #0x20]
    bl func_ov002_022a67b0
    add sp, sp, #0x28
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_29c:
    ldrh r7, [sp, #0x54]
    ldr r0, _LIT4
    add r4, sp, #0x58
    mov r3, r7, lsl #0x12
    mov r2, r7, lsl #0x1a
    mov r1, r7, lsl #0x1f
    mov r6, r3, lsr #0x18
    mov r5, r2, lsr #0x1b
    mov r8, r1, lsr #0x1f
    mov r1, r8
    mov r2, r5
    mov r3, r6
    strh r7, [sp, #0x1e]
    bl func_ov002_022a61e8
    cmp r0, #0x0
    ldrnesb r1, [r0]
    cmpne r1, #0x0
    ldrne r1, [r4]
    strne r1, [r0, #0xc]
    bne .L_39c
    ldrh r1, [sp, #0x1c]
    mov r0, r8, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x1
    and r0, r0, #0x1
    orr r0, r1, r0
    strh r0, [sp, #0x1c]
    ldrh r1, [sp, #0x1c]
    mov r0, r5, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x3e
    mov r0, r0, lsl #0x1b
    orr r0, r1, r0, lsr #0x1a
    strh r0, [sp, #0x1c]
    mov r0, r6, lsl #0x10
    ldrh r5, [sp, #0x1c]
    ldrh r2, [sp, #0x1e]
    mov r3, r0, lsr #0x10
    bic r5, r5, #0x3fc0
    mov r0, r2, lsl #0x11
    mov r0, r0, lsr #0x1f
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    mov r0, r3, lsl #0x18
    orr r0, r5, r0, lsr #0x12
    strh r0, [sp, #0x1c]
    mov r0, r2, lsl #0x10
    ldrh r3, [sp, #0x1c]
    mov r0, r0, lsr #0x1f
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r2, r3, #0x4000
    mov r1, r1, lsl #0x1f
    orr r1, r2, r1, lsr #0x11
    strh r1, [sp, #0x1c]
    ldrh r2, [sp, #0x1c]
    mov r0, r0, lsl #0x1f
    ldr r1, [r4]
    bic r2, r2, #0x8000
    orr r3, r2, r0, lsr #0x10
    ldr r0, _LIT4
    add r2, sp, #0x1c
    strh r3, [sp, #0x1c]
    bl func_ov002_022a6294
.L_39c:
    add sp, sp, #0x28
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_3b0:
    ldrh r2, [sp, #0x54]
    ldr r0, _LIT4
    add r1, sp, #0x1a
    strh r2, [sp, #0x1a]
    ldr r4, [sp, #0x58]
    bl func_ov002_022a6344
    ldrh r0, [sp, #0x1a]
    mov r1, r0, lsl #0x1a
    mov r1, r1, lsr #0x1b
    cmp r1, #0x4
    bhi .L_438
    mov r0, r0, lsl #0x11
    movs r0, r0, lsr #0x1f
    cmpne r4, #0x0
    beq .L_438
    ldr r0, _LIT3
    mov r1, #0xb
    mov r2, #0x0
    bl func_ov002_022b7f8c
    ldrh r1, [sp, #0x1a]
    ldr r0, _LIT4
    mov r3, #0x0
    mov r2, r1, lsl #0x1a
    mov r4, r1, lsl #0x1f
    mov r1, r4, lsr #0x1f
    mov r2, r2, lsr #0x1b
    bl func_ov002_022a61e8
    cmp r0, #0x0
    ldrnesb r1, [r0]
    cmpne r1, #0x0
    beq .L_438
    ldr r0, [r0, #0xc]
    mov r1, #0x1
    bl func_0202baec
.L_438:
    add sp, sp, #0x28
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_44c:
    ldr r4, [sp, #0x58]
    ldr r3, [sp, #0x54]
    cmp r4, #0xc
    movlt r0, #0x0
    blt .L_478
    ldr r1, _LIT5
    mov r0, #0xb0
    mla r2, r3, r0, r1
    sub r1, r4, #0xc
    mov r0, #0x2c
    mla r0, r1, r0, r2
.L_478:
    bl func_ov002_0229e53c
    add sp, sp, #0x28
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_490:
    ldr r1, [sp, #0x54]
    ldr r2, [sp, #0x58]
    ldr r3, [sp, #0x5c]
    ldr r0, _LIT4
    bl func_ov002_022a5fb8
    add sp, sp, #0x28
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_4b8:
    ldr r5, [sp, #0x54]
    ldr r4, [sp, #0x58]
    mov r1, r5, lsl #0x10
    mov r0, r4, lsl #0x10
    mov r2, r0, lsr #0x10
    mov r0, r1, lsr #0x10
    mov r3, r2, asr #0x8
    mov r0, r0, asr #0x8
    tst r0, #0xff
    and r1, r5, #0xff
    and r2, r4, #0xff
    and r3, r3, #0xff
    beq .L_4f8
    ldr r0, _LIT4
    bl func_ov002_022a6af8
    b .L_57c
.L_4f8:
    ldrh r4, [sp, #0x4]
    mov r0, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r4, #0x1
    and r0, r0, #0x1
    orr r0, r1, r0
    strh r0, [sp, #0x4]
    ldrh r1, [sp, #0x4]
    mov r0, r2, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x3e
    mov r0, r0, lsl #0x1b
    orr r0, r1, r0, lsr #0x1a
    strh r0, [sp, #0x4]
    ldrh r1, [sp, #0x4]
    mov r0, r3, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x3fc0
    mov r0, r0, lsl #0x18
    orr r0, r1, r0, lsr #0x12
    strh r0, [sp, #0x4]
    ldrh r2, [sp, #0x4]
    ldr r1, _LIT6
    ldr r0, _LIT4
    orr r2, r2, #0x4000
    strh r2, [sp, #0x4]
    ldrh r3, [sp, #0x4]
    mov r2, #0x20
    bic r3, r3, #0x8000
    strh r3, [sp, #0x4]
    ldrh r3, [sp, #0x4]
    strh r3, [r1, #0x90]
    str r2, [r0, #0x578]
.L_57c:
    ldr r0, _LIT1
    ldr r1, _LIT1
    ldr r2, [r0, #0xd4]
    add sp, sp, #0x28
    cmp r2, #0x20
    movlt r2, #0x20
    str r2, [r1, #0xd4]
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_5a8:
    ldr r2, [sp, #0x54]
    ldr r0, _LIT7
    mov r1, #0x4
    bl func_ov002_022a567c
    ldr r1, [sp, #0x54]
    ldr r0, _LIT8
    mov r2, #0x7
    bl func_ov002_022b35dc
    ldr r1, [sp, #0x54]
    ldr r0, _LIT9
    mov r2, #0x7
    bl func_ov002_022aff20
    ldr r0, _LIT4
    mov r1, #0x7
    bl func_ov002_022aab80
    ldr r0, _LIT4
    ldr r1, [sp, #0x54]
    mvn r2, #0x0
    mov r3, #0x0
    bl func_ov002_022a5fb8
    ldr r2, _LIT0
    ldr r1, _LIT1
    add sp, sp, #0x28
    str r2, [r1, #0xdc]
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_618:
    ldr r0, [sp, #0x58]
    add r4, sp, #0x54
    cmp r0, #0x3
    add r5, sp, #0x58
    bne .L_64c
    ldr r2, [r4]
    ldr r0, _LIT4
    mov r1, #0x1
    str r2, [r0, #0x628]
    str r1, [r0, #0x620]
    sub r1, r1, #0x2
    str r1, [r0, #0x62c]
    b .L_664
.L_64c:
    ldr r0, _LIT10
    ldr r0, [r0, #0xcf8]
    cmp r0, #0x3
    ldreq r0, _LIT4
    moveq r1, #0x0
    streq r1, [r0, #0x620]
.L_664:
    ldr r1, [r4]
    ldr r2, [r5]
    ldr r0, _LIT8
    bl func_ov002_022b35dc
    ldr r1, [r4]
    ldr r2, [r5]
    ldr r0, _LIT9
    bl func_ov002_022aff20
    ldr r2, [r5]
    ldr r0, _LIT7
    mov r1, #0x3
    bl func_ov002_022a567c
    ldr r1, [r4]
    ldr r0, _LIT4
    mvn r2, #0x0
    mov r3, #0x0
    bl func_ov002_022a5fb8
    add sp, sp, #0x28
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_6bc:
    ldr r2, [sp, #0x54]
    ldr r1, _LIT4
    mov r0, #0x1
    str r2, [r1, #0x628]
    str r0, [r1, #0x620]
    sub r2, r0, #0x2
    str r2, [r1, #0x62c]
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_6e8:
    ldr r0, _LIT4
    ldr r2, _LIT11
    ldr r0, [r0, #0x634]
    ldr r1, [r2]
    cmp r0, #0x4
    movgt r6, #0x2
    ldr r0, _LIT4
    ldr r2, [r2, #0x1c]
    mov r3, #0x0
    add r4, sp, #0x54
    add r5, sp, #0x58
    movle r6, #0x1
    bl func_ov002_022a5fb8
    ldr r0, _LIT7
    mov r2, r6
    mov r1, #0x5
    bl func_ov002_022a567c
    ldr r0, [r5]
    ldr r1, [r4]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r2, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    orr r2, r2, r1, lsr #0x10
    ldr r0, _LIT3
    mov r1, #0x2
    bl func_ov002_022b7f8c
    add sp, sp, #0x28
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_768:
    ldr r0, _LIT4
    mov r1, #0x3
    str r1, [r0, #0x620]
    add sp, sp, #0x28
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_788:
    ldr r2, [sp, #0x54]
    ldr r0, _LIT4
    mov r1, #0x2
    str r1, [r0, #0x620]
    ldr r1, [r0, #0x62c]
    add r5, sp, #0x5c
    cmp r1, #0x0
    movlt r1, #0x0
    strlt r1, [r0, #0x624]
    ldr r0, _LIT4
    mov r3, #0x0
    ldr r1, [r0, #0x624]
    ldr r0, _LIT4
    cmp r1, #0x80
    movge r1, #0x80
    str r1, [r0, #0x624]
    str r2, [r0, #0x62c]
    ldr r1, [r0, #0x628]
    add r4, sp, #0x58
    bl func_ov002_022a5fb8
    ldr r2, [r5]
    cmp r2, #0x0
    blt .L_7f0
    ldr r1, [r4]
    ldr r0, _LIT4
    bl func_ov002_022a852c
.L_7f0:
    add sp, sp, #0x28
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_804:
    ldr r0, _LIT12
    mov r1, #0x1
    bl func_ov002_022ae884
    ldr r0, _LIT4
    bl func_ov002_022a80f0
    ldr r0, _LIT4
    mov r1, #0x1
    bl func_ov002_022a8198
    add sp, sp, #0x28
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_838:
    ldr r0, [sp, #0x5c]
    add r4, sp, #0x54
    mov r1, r0, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r6, r1, lsr #0x10
    add r5, sp, #0x58
    bl func_ov002_021b939c
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    cmp r7, #0x2b
    movne r6, r0
    cmp r7, #0x2b
    moveq r0, #0x1
    movne r0, #0x0
    str r0, [sp]
    ldr r1, [r4]
    ldr r2, [r5]
    ldr r0, _LIT4
    mov r3, r6
    bl func_ov002_022a7cc4
    add sp, sp, #0x28
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_8a8:
    ldr r0, _LIT4
    mov r1, #0x0
    str r1, [r0, #0x5b4]
    add sp, sp, #0x28
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_8c8:
    ldr r0, [sp, #0x5c]
    add r4, sp, #0x54
    mov r1, r0, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r8, r1, lsr #0x10
    add r5, sp, #0x58
    bl func_ov002_021b939c
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r6, r0, lsr #0x10
    cmp r7, #0x2d
    movne r8, r6
    cmp r7, #0x2d
    moveq r0, #0x1
    movne r0, #0x0
    str r0, [sp]
    ldr r1, [r4]
    ldr r2, [r5]
    ldr r0, _LIT4
    mov r3, r8
    bl func_ov002_022a7e18
    ldr r1, [r4]
    ldr r2, [r5]
    ldr r0, _LIT4
    mov r3, r6
    bl func_ov002_022a5fb8
    ldr r0, [r4]
    ldrh r3, [sp, #0x10]
    mov r0, r0, lsl #0x10
    mov r2, r0, lsr #0x10
    ldr r0, [r5]
    ldrh r4, [sp, #0xe]
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    bic r0, r4, #0x1
    strh r0, [sp, #0xe]
    ldrh r4, [sp, #0xe]
    mov r0, r6, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r4, r4, #0x3e
    strh r4, [sp, #0xe]
    bic r3, r3, #0x1
    and r2, r2, #0x1
    orr r2, r3, r2
    strh r2, [sp, #0x10]
    ldrh r2, [sp, #0x10]
    ldrh r4, [sp, #0xe]
    mov r1, r1, lsl #0x1b
    bic r2, r2, #0x3e
    orr r1, r2, r1, lsr #0x1a
    strh r1, [sp, #0x10]
    ldrh r1, [sp, #0x10]
    bic r3, r4, #0x3fc0
    strh r3, [sp, #0xe]
    ldrh r3, [sp, #0xe]
    bic r1, r1, #0x3fc0
    mov r0, r0, lsl #0x18
    bic r2, r3, #0x4000
    orr r0, r1, r0, lsr #0x12
    strh r0, [sp, #0x10]
    ldrh r0, [sp, #0x10]
    strh r2, [sp, #0xe]
    ldrh r2, [sp, #0xe]
    bic r0, r0, #0x4000
    strh r0, [sp, #0x10]
    ldrh r0, [sp, #0x10]
    bic r1, r2, #0x8000
    strh r1, [sp, #0xe]
    bic r0, r0, #0x8000
    strh r0, [sp, #0x10]
    ldrh r1, [sp, #0x10]
    sub r3, sp, #0x4
    ldrh r2, [sp, #0xe]
    strh r1, [r3]
    ldr r1, [r3]
    ldr r0, _LIT3
    strh r2, [r3]
    ldr r2, [r3]
    bl func_ov002_022b8320
    cmp r7, #0x2d
    moveq r2, #0x1
    ldr r0, _LIT3
    movne r2, #0x0
    mov r1, #0x7
    bl func_ov002_022b7f8c
    add sp, sp, #0x28
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_a38:
    mov sl, #0x0
    ldr r7, _LIT4
    add r8, sp, #0x54
    add r9, sp, #0x58
    mov fp, sl
    mov r4, #0x20
    mov r6, sl
.L_a54:
    ldr r0, [r9]
    mov r0, r0, asr sl
    tst r0, #0x1
    beq .L_aa0
    ldr r1, [r8]
    mov r0, r7
    mov r2, r6
    mov r3, sl
    bl func_ov002_022a61e8
    movs r5, r0
    ldrnesb r0, [r5]
    cmpne r0, #0x0
    beq .L_aa0
    ldr r0, [r8]
    mov r1, sl
    mov r2, fp
    bl func_ov002_021c9424
    str r0, [r5, #0xc]
    str r4, [r5, #0x10]
.L_aa0:
    add sl, sl, #0x1
    cmp sl, #0x5
    blt .L_a54
    ldr r1, [r8]
    ldr r0, _LIT4
    mov r2, #0x2
    mov r3, #0x0
    bl func_ov002_022a5fb8
    ldr r0, [r9]
    ldr r1, [r8]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r2, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    orr r2, r2, r1, lsr #0x10
    ldr r0, _LIT3
    mov r1, #0x16
    bl func_ov002_022b7f8c
    add sp, sp, #0x28
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_afc:
    ldr r1, [sp, #0x54]
    ldr r2, [sp, #0x58]
    ldr r3, [sp, #0x5c]
    ldr r0, _LIT13
    bl func_ov002_0229f894
    add sp, sp, #0x28
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_b24:
    ldr r1, [sp, #0x58]
    ldr r0, _LIT13
    bl func_ov002_022ac1c0
    add sp, sp, #0x28
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_b44:
    ldr r1, [sp, #0x54]
    ldr r2, [sp, #0x58]
    ldr r3, [sp, #0x5c]
    ldr r0, _LIT4
    bl func_ov002_022a7f48
    add sp, sp, #0x28
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_b6c:
    ldr r1, [sp, #0x54]
    ldr r2, [sp, #0x58]
    ldr r0, _LIT4
    mov r3, #0x0
    bl func_ov002_022a5fb8
    ldr r1, [sp, #0x5c]
    ldr r0, _LIT4
    bl func_ov002_022a8054
    mov r1, #0x5
    ldr r0, _LIT7
    mov r2, r1
    bl func_ov002_022a567c
    add sp, sp, #0x28
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_bb0:
    ldr r1, [sp, #0x54]
    ldr r0, _LIT4
    mov r2, #0xd
    mov r3, #0x0
    bl func_ov002_022a5fb8
    ldr r0, _LIT3
    mov r1, #0x14
    mov r2, #0x0
    bl func_ov002_022b7f8c
    add sp, sp, #0x28
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_be8:
    ldr r1, [sp, #0x54]
    ldr r2, [sp, #0x58]
    ldr r0, _LIT4
    mov r3, #0x0
    bl func_ov002_022a61e8
    ldrh r2, [r0, #0xa]
    add r1, sp, #0x18
    ldr r0, _LIT4
    strh r2, [sp, #0x18]
    ldrh r3, [r1]
    mov r2, r3, lsl #0x11
    mov r2, r2, lsr #0x1f
    eor r2, r2, #0x1
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bic r3, r3, #0x4000
    mov r2, r2, lsl #0x1f
    orr r2, r3, r2, lsr #0x11
    strh r2, [r1]
    bl func_ov002_022a6344
    add sp, sp, #0x28
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_c4c:
    ldr r2, [sp, #0x54]
    ldr r1, _LIT14
    mov r0, #0xcc
    mla r3, r2, r0, r1
    mov r4, #0x10
    ldr r0, _LIT3
    mov r1, #0x15
    str r4, [r3, #0xb4]
    bl func_ov002_022b7f8c
    add sp, sp, #0x28
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_c84:
    ldr r1, [sp, #0x54]
    ldr r3, [sp, #0x58]
    ldr r0, _LIT4
    mov r2, #0xb
    add r4, sp, #0x54
    add r5, sp, #0x58
    bl func_ov002_022a61e8
    cmp r0, #0x0
    beq .L_cd8
    ldrh r3, [r0, #0xa]
    mov r1, #0x8
    mov r2, #0xb
    orr r3, r3, #0x4000
    strh r3, [sp, #0x16]
    ldrh r3, [sp, #0x16]
    strh r3, [r0, #0xa]
    strh r1, [r0, #0x4]
    ldr r1, [r4]
    ldr r3, [r5]
    ldr r0, _LIT4
    bl func_ov002_022a6af8
.L_cd8:
    add sp, sp, #0x28
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_cec:
    ldr r0, _LIT15
    ldr r1, [sp, #0x54]
    ldr r0, [r0, #0x4]
    add r2, sp, #0x54
    cmp r1, r0
    add r0, sp, #0x58
    beq .L_d14
    ldr r0, [r0]
    cmp r0, #0x0
    beq .L_d1c
.L_d14:
    mov r1, #0x1
    b .L_d20
.L_d1c:
    mov r1, #0x0
.L_d20:
    ldr r2, [r2]
    ldr r3, _LIT14
    mov r0, #0xcc
    mla r0, r2, r0, r3
    bl func_ov002_0229dfac
    add sp, sp, #0x28
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_d48:
    ldr r1, [sp, #0x54]
    ldr r2, [sp, #0x58]
    ldr r0, _LIT8
    bl func_ov002_022b361c
    add sp, sp, #0x28
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_d6c:
    ldr r1, [sp, #0x5c]
    add r2, sp, #0x54
    mov r0, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    and r3, r0, #0xff
    tst r1, #0xff
    add r0, sp, #0x58
    bne .L_ddc
    cmp r3, #0x4
    addls pc, pc, r3, lsl #0x2
    b .L_dcc
    b .L_db0
    b .L_db8
    b .L_dc0
    b .L_dc0
    b .L_dc8
.L_db0:
    mov r3, #0x1
    b .L_dcc
.L_db8:
    mov r3, #0x2
    b .L_dcc
.L_dc0:
    mov r3, #0x3
    b .L_dcc
.L_dc8:
    mov r3, #0x0
.L_dcc:
    ldr r1, [r2]
    ldr r2, [r0]
    ldr r0, _LIT8
    bl func_ov002_022b3640
.L_ddc:
    add sp, sp, #0x28
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_df0:
    ldr r0, [sp, #0x54]
    ldr r1, _LIT15
    cmp r0, #0x1
    moveq r2, #0x1
    ldr r0, _LIT8
    ldr r1, [r1, #0x4]
    movne r2, #0x2
    add r4, sp, #0x54
    add r5, sp, #0x58
    bl func_ov002_022b35ac
    ldr r1, _LIT15
    ldr r0, [r4]
    ldr r1, [r1, #0x4]
    cmp r0, #0x2
    moveq r2, #0x1
    ldr r0, _LIT8
    movne r2, #0x2
    eor r1, r1, #0x1
    bl func_ov002_022b35ac
    ldr r0, _LIT8
    mvn r1, #0x0
    str r1, [r0, #0x40]
    str r1, [r0, #0x3c]
    ldr r2, [r4]
    ldr r0, _LIT3
    mov r1, #0x1b
    bl func_ov002_022b7f8c
    ldr r0, [r4]
    ldr r1, [r5]
    bl func_ov002_0229a57c
    add sp, sp, #0x28
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_e7c:
    ldrh r1, [sp, #0x54]
    ldr r4, [sp, #0x58]
    mov r0, r1, lsl #0x1a
    mov r0, r0, lsr #0x1b
    cmp r0, #0xd
    biceq r0, r1, #0x3e
    strh r1, [sp, #0x14]
    orreq r0, r0, #0x3e
    streqh r0, [sp, #0x14]
    ldrh r1, [sp, #0x14]
    ldr r0, _LIT4
    mov r2, r1, lsl #0x1a
    mov r3, r1, lsl #0x12
    mov r5, r1, lsl #0x1f
    mov r1, r5, lsr #0x1f
    mov r2, r2, lsr #0x1b
    mov r3, r3, lsr #0x18
    bl func_ov002_022a5fb8
    ldr r0, _LIT7
    mov r1, #0x5
    mov r2, #0x0
    bl func_ov002_022a567c
    ldr r0, _LIT3
    mov r1, #0x5
    mov r2, #0x0
    bl func_ov002_022b7f8c
    ldr r0, _LIT3
    mov r1, r4
    bl func_ov002_022b8314
    mov r0, r4
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_f64
    ldrh r0, [sp, #0x14]
    mov r0, r0, lsl #0x1a
    mov r0, r0, lsr #0x1b
    cmp r0, #0x10
    bcs .L_f70
    mov r0, r4
    mov r1, #0x1
    bl func_0202baec
    b .L_f70
_LIT0: .word 0x00002a30
_LIT1: .word data_ov002_022d0e4c
_LIT2: .word data_ov002_022d0170
_LIT3: .word data_ov002_022d1a9c
_LIT4: .word data_ov002_022d1330
_LIT5: .word data_ov002_022d15b0
_LIT6: .word data_ov002_022d1830
_LIT7: .word data_ov002_022d1320
_LIT8: .word data_ov002_022d1a18
_LIT9: .word data_ov002_022d1a04
_LIT10: .word data_ov002_022d008c
_LIT11: .word data_ov002_022cd314
_LIT12: .word data_ov002_022d19bc
_LIT13: .word data_ov002_022d10dc
_LIT14: .word data_ov002_022d1710
_LIT15: .word data_ov002_022cd65c
.L_f64:
    mov r0, r4
    mov r1, #0x1
    bl func_0202baec
.L_f70:
    ldrh r1, [sp, #0x14]
    ldr r0, _LIT15
    ldr r0, [r0, #0x4]
    mov r1, r1, lsl #0x1f
    cmp r0, r1, lsr #0x1f
    bne .L_fa0
    mov r0, r4
    bl func_ov002_02299f50
    cmp r0, #0x0
    ldrne r0, _LIT1
    movne r1, #0x1
    strne r1, [r0, #0xcc]
.L_fa0:
    add sp, sp, #0x28
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_fb4:
    ldr r2, [sp, #0x58]
    ldr r1, [sp, #0x5c]
    mov r0, r2, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    and r5, r0, #0xff
    ldr r0, _LIT2
    mov r1, r1, lsl #0x2
    and r4, r2, #0xff
    ldrh r2, [r0, r1]
    ldr r1, [sp, #0x54]
    ldr r0, _LIT4
    mov r6, r2, lsl #0x13
    mov r2, r4
    mov r3, r5
    mov r6, r6, lsr #0x13
    bl func_ov002_022a5fb8
    ldr r0, [sp, #0x54]
    ldrh r1, [sp, #0xc]
    ldrh r2, [sp, #0xe]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r2, r2, #0x1
    strh r2, [sp, #0xe]
    bic r1, r1, #0x1
    and r0, r0, #0x1
    orr r0, r1, r0
    ldrh r2, [sp, #0xe]
    strh r0, [sp, #0xc]
    ldrh r0, [sp, #0xc]
    bic r1, r2, #0x3e
    strh r1, [sp, #0xe]
    bic r1, r0, #0x3e
    mov r0, r4, lsl #0x1b
    orr r0, r1, r0, lsr #0x1a
    ldrh r2, [sp, #0xe]
    strh r0, [sp, #0xc]
    ldrh r0, [sp, #0xc]
    bic r1, r2, #0x3fc0
    strh r1, [sp, #0xe]
    bic r1, r0, #0x3fc0
    mov r0, r5, lsl #0x18
    orr r0, r1, r0, lsr #0x12
    strh r0, [sp, #0xc]
    ldrh r0, [sp, #0xc]
    ldrh r2, [sp, #0xe]
    sub r3, sp, #0x4
    bic r0, r0, #0x4000
    strh r0, [sp, #0xc]
    ldrh r0, [sp, #0xc]
    bic r1, r2, #0x4000
    strh r1, [sp, #0xe]
    ldrh r1, [sp, #0xe]
    bic r0, r0, #0x8000
    strh r0, [sp, #0xc]
    ldrh r0, [sp, #0xc]
    bic r1, r1, #0x8000
    strh r1, [sp, #0xe]
    strh r0, [r3]
    ldrh r2, [sp, #0xe]
    ldr r1, [r3]
    ldr r0, _LIT3
    strh r2, [r3]
    ldr r2, [r3]
    bl func_ov002_022b8320
    ldr r0, _LIT3
    mov r1, #0xa
    mov r2, #0x0
    bl func_ov002_022b7f8c
    ldr r0, _LIT3
    mov r1, r6
    bl func_ov002_022b8314
    add sp, sp, #0x28
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_10e8:
    ldr r1, [sp, #0x5c]
    ldr r0, _LIT2
    mov r1, r1, lsl #0x2
    ldrh r0, [r0, r1]
    ldr r1, [sp, #0x54]
    ldr r2, [sp, #0x58]
    mov r4, r0, lsl #0x13
    ldr r0, _LIT4
    mov r3, #0x0
    mov r4, r4, lsr #0x13
    bl func_ov002_022a5fb8
    ldr r0, _LIT3
    mov r1, #0x3
    mov r2, #0x0
    bl func_ov002_022b7f8c
    ldr r0, _LIT3
    mov r1, r4
    bl func_ov002_022b8314
    add sp, sp, #0x28
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_1144:
    ldr r1, [sp, #0x54]
    ldr r2, [sp, #0x58]
    ldr r0, _LIT4
    mov r3, #0x0
    bl func_ov002_022a5fb8
    ldr r0, _LIT3
    mov r1, #0x4
    mov r2, #0x0
    bl func_ov002_022b7f8c
    add sp, sp, #0x28
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_117c:
    ldr r2, [sp, #0x54]
    ldr r6, [sp, #0x58]
    mov r0, r2, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r0, asr #0x8
    mov r0, r6, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r7, r0, asr #0x8
    and r4, r2, #0xff
    and r5, r1, #0xff
    ldr r0, _LIT4
    mov r1, r4
    mov r2, r5
    mov r3, #0x0
    and r6, r6, #0xff
    and r7, r7, #0xff
    bl func_ov002_022a5fb8
    ldr r0, _LIT3
    mov r1, #0x6
    mov r2, #0x0
    bl func_ov002_022b7f8c
    ldrh r0, [sp, #0xa]
    ldrh r2, [sp, #0x8]
    sub r3, sp, #0x4
    bic r1, r0, #0x1
    and r0, r4, #0x1
    orr r0, r1, r0
    strh r0, [sp, #0xa]
    bic r2, r2, #0x1
    and r1, r6, #0x1
    orr r1, r2, r1
    strh r1, [sp, #0x8]
    ldrh r0, [sp, #0xa]
    ldrh r2, [sp, #0x8]
    bic r1, r0, #0x3e
    mov r0, r5, lsl #0x1b
    orr r0, r1, r0, lsr #0x1a
    strh r0, [sp, #0xa]
    ldrh r0, [sp, #0xa]
    bic r2, r2, #0x3e
    mov r1, r7, lsl #0x1b
    orr r1, r2, r1, lsr #0x1a
    strh r1, [sp, #0x8]
    ldrh r1, [sp, #0x8]
    bic r0, r0, #0x3fc0
    strh r0, [sp, #0xa]
    ldrh r0, [sp, #0xa]
    bic r1, r1, #0x3fc0
    strh r1, [sp, #0x8]
    ldrh r1, [sp, #0x8]
    bic r0, r0, #0x4000
    strh r0, [sp, #0xa]
    ldrh r0, [sp, #0xa]
    bic r1, r1, #0x4000
    strh r1, [sp, #0x8]
    ldrh r1, [sp, #0x8]
    bic r0, r0, #0x8000
    strh r0, [sp, #0xa]
    ldrh r0, [sp, #0xa]
    bic r1, r1, #0x8000
    strh r1, [sp, #0x8]
    strh r0, [r3]
    ldrh r2, [sp, #0x8]
    ldr r1, [r3]
    ldr r0, _LIT3
    strh r2, [r3]
    ldr r2, [r3]
    bl func_ov002_022b8320
    add sp, sp, #0x28
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_12a0:
    ldr r1, [sp, #0x54]
    ldr r2, [sp, #0x58]
    ldr r3, [sp, #0x5c]
    ldr r0, _LIT4
    bl func_ov002_022a5fb8
    ldr r0, _LIT3
    mov r1, #0x8
    mov r2, #0x0
    bl func_ov002_022b7f8c
    add sp, sp, #0x28
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_12d8:
    ldr r2, [sp, #0x58]
    ldr r1, [sp, #0x5c]
    mov r0, r2, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    and r5, r0, #0xff
    ldr r0, _LIT2
    mov r1, r1, lsl #0x2
    and r4, r2, #0xff
    ldrh r2, [r0, r1]
    ldr r1, [sp, #0x54]
    ldr r0, _LIT4
    mov r6, r2, lsl #0x13
    mov r2, r4
    mov r3, r5
    mov r6, r6, lsr #0x13
    bl func_ov002_022a5fb8
    ldr r0, [sp, #0x54]
    ldrh r1, [sp, #0x6]
    ldrh r2, [sp, #0xe]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r2, r2, #0x1
    strh r2, [sp, #0xe]
    bic r1, r1, #0x1
    and r0, r0, #0x1
    orr r0, r1, r0
    ldrh r2, [sp, #0xe]
    strh r0, [sp, #0x6]
    ldrh r0, [sp, #0x6]
    bic r1, r2, #0x3e
    strh r1, [sp, #0xe]
    bic r1, r0, #0x3e
    mov r0, r4, lsl #0x1b
    orr r0, r1, r0, lsr #0x1a
    ldrh r2, [sp, #0xe]
    strh r0, [sp, #0x6]
    ldrh r0, [sp, #0x6]
    bic r1, r2, #0x3fc0
    strh r1, [sp, #0xe]
    bic r1, r0, #0x3fc0
    mov r0, r5, lsl #0x18
    orr r0, r1, r0, lsr #0x12
    strh r0, [sp, #0x6]
    ldrh r0, [sp, #0x6]
    ldrh r2, [sp, #0xe]
    sub r3, sp, #0x4
    bic r0, r0, #0x4000
    strh r0, [sp, #0x6]
    ldrh r0, [sp, #0x6]
    bic r1, r2, #0x4000
    strh r1, [sp, #0xe]
    ldrh r1, [sp, #0xe]
    bic r0, r0, #0x8000
    strh r0, [sp, #0x6]
    ldrh r0, [sp, #0x6]
    bic r1, r1, #0x8000
    strh r1, [sp, #0xe]
    strh r0, [r3]
    ldrh r2, [sp, #0xe]
    ldr r1, [r3]
    ldr r0, _LIT3
    strh r2, [r3]
    ldr r2, [r3]
    bl func_ov002_022b8320
    ldr r0, _LIT3
    mov r1, #0x9
    mov r2, #0x0
    bl func_ov002_022b7f8c
    ldr r0, _LIT3
    mov r1, r6
    bl func_ov002_022b8314
    add sp, sp, #0x28
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_140c:
    ldr r1, _LIT16
    mov r0, #0x1
    str r0, [r1, #0x20]
    ldr r2, _LIT6
    rsb r3, r0, #0x10000
    strh r3, [r2, #0xec]
    ldr r1, _LIT4
    sub r2, r0, #0x2
    str r2, [r1, #0x618]
    str r2, [r1, #0x61c]
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_1444:
    ldr r0, [sp, #0x5c]
    ldr r1, [sp, #0x54]
    mov r3, r0, lsl #0x2
    mov r0, r1, lsl #0x10
    ldr r2, _LIT2
    mov r0, r0, lsr #0x10
    ldrh r3, [r2, r3]
    mov r2, r0, asr #0x8
    ldr r0, _LIT4
    mov r4, r3, lsl #0x13
    and r1, r1, #0xff
    and r2, r2, #0xff
    mov r3, #0x0
    mov r4, r4, lsr #0x13
    bl func_ov002_022a5fb8
    ldr r2, [sp, #0x58]
    ldr r0, _LIT3
    mov r1, #0xe
    bl func_ov002_022b7f8c
    ldr r0, _LIT3
    mov r1, r4
    bl func_ov002_022b8314
    add sp, sp, #0x28
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_14b0:
    ldr r1, [sp, #0x54]
    ldr r2, [sp, #0x58]
    mov r0, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    and r5, r0, #0xff
    ldr r0, _LIT17
    and r4, r1, #0xff
    cmp r2, #0x0
    movge r8, r2
    rsblt r8, r2, #0x0
    cmp r2, #0x0
    movlt r9, #0x1
    mov r6, #0x0
    ldrh r1, [r0, #0x6]
    movge r9, #0x0
    mov r7, r6
    cmp r1, #0x0
    beq .L_1514
    cmp r1, #0x1
    beq .L_1528
    ldr r0, _LIT18
    cmp r1, r0
    beq .L_1540
    b .L_1554
.L_1514:
    mov r0, r4
    mov r1, r5
    bl func_ov002_021b9d20
    mov r6, r0
    b .L_1554
.L_1528:
    mov r0, r4
    mov r1, r5
    bl func_ov002_021b9d68
    mov r6, r0
    mov r7, #0x1
    b .L_1554
.L_1540:
    mov r0, r4
    mov r1, r5
    bl func_ov002_021b9db0
    mov r6, r0
    mov r7, #0x2
.L_1554:
    ldr r0, _LIT4
    cmp r8, #0x100
    movge r8, #0xff
    cmp r6, #0x100
    movge r6, #0xff
    mov r1, r4
    mov r2, r5
    mov r3, #0x0
    bl func_ov002_022a5fb8
    and r1, r6, #0xff
    and r0, r7, #0xff
    orr r0, r1, r0, lsl #0x8
    mov r0, r0, lsl #0x10
    and r2, r8, #0xff
    and r1, r9, #0xff
    orr r1, r2, r1, lsl #0x8
    mov r0, r0, lsr #0x10
    mov r2, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    orr r2, r2, r1, lsr #0x10
    ldr r0, _LIT3
    mov r1, #0xd
    bl func_ov002_022b7f8c
    add sp, sp, #0x28
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_15c4:
    ldr r1, [sp, #0x5c]
    ldr r0, _LIT2
    mov r1, r1, lsl #0x2
    ldrh r0, [r0, r1]
    ldr r1, [sp, #0x54]
    ldr r2, [sp, #0x58]
    mov r4, r0, lsl #0x13
    ldr r0, _LIT4
    mov r3, #0x0
    mov r4, r4, lsr #0x13
    bl func_ov002_022a5fb8
    ldr r0, _LIT7
    mov r1, #0x5
    mov r2, #0x3
    bl func_ov002_022a567c
    ldr r0, _LIT3
    mov r1, #0x1
    mov r2, #0x0
    bl func_ov002_022b7f8c
    mov r0, r4
    mov r1, #0x1
    bl func_0202baec
    ldr r0, _LIT15
    ldr r1, [sp, #0x54]
    ldr r0, [r0, #0x4]
    cmp r1, r0
    bne .L_1648
    mov r0, r4
    bl func_ov002_02299f50
    cmp r0, #0x0
    ldrne r0, _LIT1
    movne r1, #0x1
    strne r1, [r0, #0xcc]
.L_1648:
    add sp, sp, #0x28
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_165c:
    ldr r1, [sp, #0x58]
    ldrh r6, [sp, #0x54]
    ldr r0, _LIT2
    mov r1, r1, lsl #0x2
    ldrh r1, [r0, r1]
    mov r0, r6, lsl #0x1f
    mov r5, r0, lsr #0x1f
    mov r4, r1, lsl #0x13
    mov r2, r6, lsl #0x1a
    ldr r0, _LIT4
    mov r1, r5
    mov r2, r2, lsr #0x1b
    mov r3, #0x0
    strh r6, [sp, #0x12]
    mov r4, r4, lsr #0x13
    bl func_ov002_022a5fb8
    ldr r0, _LIT7
    mov r1, #0x5
    mov r2, #0x4
    bl func_ov002_022a567c
    ldrh r0, [sp, #0x12]
    mov r1, #0x1
    mov r0, r0, lsl #0x11
    movs r0, r0, lsr #0x1f
    movne r2, #0x1
    ldr r0, _LIT3
    moveq r2, #0x2
    bl func_ov002_022b7f8c
    mov r0, r4
    mov r1, #0x1
    bl func_0202baec
    ldr r0, _LIT15
    ldr r0, [r0, #0x4]
    cmp r5, r0
    bne .L_1700
    mov r0, r4
    bl func_ov002_02299f50
    cmp r0, #0x0
    ldrne r0, _LIT1
    movne r1, #0x1
    strne r1, [r0, #0xcc]
.L_1700:
    ldr r0, _LIT15
    ldr r0, [r0, #0x4]
    eor r0, r0, #0x1
    cmp r5, r0
    bne .L_1738
    ldr r1, _LIT19
    cmp r4, r1
    addne r0, r1, #0x1
    cmpne r4, r0
    addne r0, r1, #0x2
    cmpne r4, r0
    ldreq r0, _LIT20
    moveq r1, #0x1
    streq r1, [r0, #0xbb8]
.L_1738:
    add sp, sp, #0x28
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_174c:
    ldr r1, [sp, #0x58]
    ldr r0, _LIT2
    mov r1, r1, lsl #0x2
    ldrh r1, [r0, r1]
    ldr r2, [sp, #0x5c]
    ldr r0, _LIT3
    mov r3, r1, lsl #0x13
    mov r1, #0x10
    mov r4, r3, lsr #0x13
    bl func_ov002_022b7f8c
    ldr r0, _LIT3
    mov r1, r4
    bl func_ov002_022b8314
    add sp, sp, #0x28
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_1794:
    ldr r2, [sp, #0x54]
    ldr r0, _LIT7
    mov r1, #0x6
    bl func_ov002_022a567c
    add sp, sp, #0x28
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_17b8:
    ldr r3, [sp, #0x58]
    ldr r1, [sp, #0x5c]
    mov r0, r3, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    and r2, r0, #0xff
    and r0, r1, #0xff
    orr r0, r2, r0, lsl #0x8
    mov r0, r0, lsl #0x10
    and r1, r3, #0xff
    mov r0, r0, lsr #0x10
    mov r2, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    orr r2, r2, r1, lsr #0x10
    ldr r0, _LIT3
    mov r1, #0x18
    bl func_ov002_022b7f8c
    add sp, sp, #0x28
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_1810:
    ldr r2, [sp, #0x5c]
    ldr r0, _LIT3
    mov r1, #0x17
    bl func_ov002_022b7f8c
    add sp, sp, #0x28
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_1834:
    ldr r2, [sp, #0x58]
    ldr r0, _LIT3
    mov r1, #0x19
    bl func_ov002_022b7f8c
    add sp, sp, #0x28
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_1858:
    ldr r0, _LIT3
    mov r1, #0x11
    mov r2, #0x0
    bl func_ov002_022b7f8c
    add sp, sp, #0x28
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_187c:
    ldr r1, [sp, #0x5c]
    mov r0, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    tst r0, #0xff
    and r2, r1, #0xff
    ldr r0, _LIT3
    movne r2, #0x5
    mov r1, #0x12
    bl func_ov002_022b7f8c
    add sp, sp, #0x28
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_18b8:
    ldr r0, _LIT3
    mov r1, #0x13
    mov r2, #0x0
    bl func_ov002_022b7f8c
    add sp, sp, #0x28
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_18dc:
    ldr r0, _LIT3
    mov r1, #0xf
    mov r2, #0x0
    bl func_ov002_022b7f8c
    ldr r1, [sp, #0x54]
    ldr r0, _LIT3
    bl func_ov002_022b8314
    ldr r1, [sp, #0x54]
    ldr r0, _LIT4
    bl func_ov002_022aaa10
    add sp, sp, #0x28
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_1918:
    ldr r0, [sp, #0x54]
    mvn r4, #0x0
    cmp r0, #0x0
    beq .L_193c
    cmp r0, #0x1
    beq .L_195c
    cmp r0, #0x2
    moveq r4, #0x9
    b .L_1960
.L_193c:
    ldr r0, _LIT20
    ldr r1, [r0, #0xbb4]
    cmp r1, #0x0
    ble .L_1960
    mov r1, #0x0
    str r1, [r0, #0xbb4]
    mov r4, #0x7
    b .L_1960
.L_195c:
    mov r4, #0x8
.L_1960:
    cmp r4, #0x0
    blt .L_1990
    ldr r0, _LIT1
    ldr r0, [r0, #0xc8]
    cmp r0, #0x0
    beq .L_1980
    mov r0, #0x0
    bl func_ov002_0229a304
.L_1980:
    ldr r0, _LIT7
    mov r1, r4
    mov r2, #0x0
    bl func_ov002_022a567c
.L_1990:
    bl func_ov002_02299c24
    ldr r4, _LIT1
    mov r2, #0x0
    sub r3, r2, #0x1
    mov r1, #0x1
    str r0, [r4, #0xd8]
    bl func_0203737c
    add sp, sp, #0x28
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_19c0:
    bl func_ov002_02299c24
    ldr r4, _LIT1
    mov r2, #0x0
    sub r3, r2, #0x1
    mov r1, #0x1
    str r0, [r4, #0xd8]
    bl func_0203737c
    add sp, sp, #0x28
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_19f0:
    mov r0, #0x0
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
_LIT16: .word data_ov002_022d1968
_LIT17: .word data_ov002_022ce870
_LIT18: .word 0x00001513
_LIT19: .word 0x000019a3
_LIT20: .word data_02103fcc
