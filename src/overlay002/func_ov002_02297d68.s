; func_ov002_02297d68 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022c9ad0
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern func_ov002_021afbc4
        .extern func_ov002_021afbd4
        .extern func_ov002_021ba294
        .extern func_ov002_021bb068
        .extern func_ov002_021bcf00
        .extern func_ov002_021bd948
        .extern func_ov002_021bdc94
        .extern func_ov002_021c2e34
        .extern func_ov002_0225368c
        .extern func_ov002_02257ab8
        .extern func_ov002_02259774
        .extern func_ov002_02259ee8
        .extern func_ov002_02280980
        .extern func_ov002_02297158
        .global func_ov002_02297d68
        .arm
func_ov002_02297d68:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xf8
    ldr r5, _LIT0
    mov r9, r0
    mov r4, #0x0
.L_14:
    mov r0, r9
    mov r1, r5
    bl func_ov002_02297158
    cmp r0, #0x0
    addne sp, sp, #0xf8
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    add r4, r4, #0x1
    cmp r4, #0x114
    add r5, r5, #0x8
    bcc .L_14
    ldr r1, _LIT1
    mov r0, r9
    mov r2, #0xd
    bl func_ov002_0225368c
    cmp r0, #0x0
    beq .L_d4
    b .L_c8
.L_5c:
    mov r0, #0x0
    bl func_ov002_021afbd4
    mov r4, r0
    mov r0, r9
    mov r1, r4
    bl func_ov002_021ba294
    cmp r0, #0x0
    movlt r3, #0x0
    blt .L_ac
    ldr r3, _LIT2
    ldr r1, _LIT3
    and r2, r9, #0x1
    mla r1, r2, r1, r3
    add r1, r1, #0x260
    ldr r1, [r1, r0, lsl #0x2]
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r3, r0, r1, lsr #0x1f
.L_ac:
    mov r0, r9
    mov r2, r4
    mov r1, #0xd
    bl func_ov002_02259ee8
    add sp, sp, #0xf8
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_c8:
    bl func_ov002_021afbc4
    cmp r0, #0x0
    bgt .L_5c
.L_d4:
    ldr r1, _LIT1
    mov r0, r9
    mov r2, #0xe
    bl func_ov002_0225368c
    cmp r0, #0x0
    beq .L_16c
    b .L_160
.L_f0:
    mov r0, #0x0
    bl func_ov002_021afbd4
    mov r4, r0
    mov r0, r9
    mov r1, r4
    bl func_ov002_021c2e34
    cmp r0, #0x0
    movlt r3, #0x0
    blt .L_144
    ldr r3, _LIT2
    ldr r1, _LIT3
    and r2, r9, #0x1
    mla r1, r2, r1, r3
    add r1, r1, #0x18
    add r1, r1, #0x400
    ldr r1, [r1, r0, lsl #0x2]
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r3, r0, r1, lsr #0x1f
.L_144:
    mov r0, r9
    mov r2, r4
    mov r1, #0xe
    bl func_ov002_02259ee8
    add sp, sp, #0xf8
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_160:
    bl func_ov002_021afbc4
    cmp r0, #0x0
    bgt .L_f0
.L_16c:
    ldr r0, _LIT4
    bl func_ov002_021bb068
    cmp r0, #0x0
    addne sp, sp, #0xf8
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT3
    ldr r0, _LIT2
    and r2, r9, #0x1
    mla sl, r2, r1, r0
    str sl, [sp]
    add r6, sl, #0x30
    rsb r7, r9, #0x1
    mov r8, #0x0
    mov r0, r9, lsl #0x10
    mov r0, r0, lsr #0x10
    and r4, r0, #0x1
    add r0, r1, #0x970
    str r0, [sp, #0x1c]
    ldr r0, _LIT5
    ldr fp, _LIT6
    sub r0, r0, #0x750
    str r0, [sp, #0x38]
    ldr r0, _LIT7
    sub r0, r0, #0x398
    str r0, [sp, #0x10]
    ldr r0, _LIT7
    sub r0, r0, #0x30c
    str r0, [sp, #0x30]
    ldr r0, _LIT7
    sub r0, r0, #0x30c
    str r0, [sp, #0x34]
    ldr r0, _LIT8
    add r0, r0, #0x700
    str r0, [sp, #0x78]
    ldr r0, _LIT8
    add r0, r0, #0x700
    str r0, [sp, #0x74]
    ldr r0, _LIT7
    add r0, r0, #0x344
    str r0, [sp, #0x90]
    ldr r0, _LIT8
    add r0, r0, #0x8c0
    str r0, [sp, #0x88]
    ldr r0, _LIT7
    add r0, r0, #0x344
    str r0, [sp, #0x8c]
    ldr r0, _LIT8
    add r0, r0, #0x8c0
    str r0, [sp, #0x84]
    ldr r0, _LIT9
    sub r0, r0, #0x3
    str r0, [sp, #0x9c]
    ldr r0, _LIT9
    sub r0, r0, #0x7
    str r0, [sp, #0xa0]
    ldr r0, _LIT9
    sub r0, r0, #0xd
    str r0, [sp, #0x98]
    ldr r0, _LIT9
    sub r0, r0, #0x54
    str r0, [sp, #0x94]
    ldr r0, _LIT9
    sub r0, r0, #0x128
    str r0, [sp, #0x80]
    ldr r0, _LIT9
    sub r0, r0, #0x208
    str r0, [sp, #0x7c]
    ldr r0, _LIT9
    sub r0, r0, #0x398
    str r0, [sp, #0x70]
    ldr r0, _LIT9
    sub r0, r0, #0x3f4
    str r0, [sp, #0x68]
    ldr r0, _LIT7
    sub r0, r0, #0x66
    str r0, [sp, #0x64]
    ldr r0, _LIT9
    sub r0, r0, #0x394
    str r0, [sp, #0x58]
    ldr r0, _LIT7
    sub r0, r0, #0x8
    str r0, [sp, #0x54]
    ldr r0, _LIT7
    sub r0, r0, #0x370
    str r0, [sp, #0x20]
    ldr r0, _LIT8
    add r0, r0, #0x8c
    str r0, [sp, #0x14]
    ldr r0, _LIT10
    sub r0, r0, #0x7f
    str r0, [sp, #0x2c]
    ldr r0, _LIT10
    sub r0, r0, #0x7f
    str r0, [sp, #0x28]
    ldr r0, _LIT10
    sub r0, r0, #0x5
    str r0, [sp, #0x3c]
    ldr r0, _LIT10
    sub r0, r0, #0x5
    str r0, [sp, #0x40]
    ldr r0, _LIT10
    sub r0, r0, #0x47
    str r0, [sp, #0x44]
    ldr r0, _LIT10
    add r0, r0, #0x63
    str r0, [sp, #0x8]
    ldr r0, _LIT11
    sub r0, r0, #0x5a
    str r0, [sp, #0xc]
    ldr r0, _LIT11
    sub r0, r0, #0x1d
    str r0, [sp, #0x18]
    ldr r0, _LIT10
    add r0, r0, #0x63
    str r0, [sp, #0x4]
    ldr r0, _LIT10
    add r0, r0, #0x430
    str r0, [sp, #0x48]
    ldr r0, _LIT10
    add r0, r0, #0x430
    str r0, [sp, #0x4c]
    ldr r0, _LIT7
    sub r0, r0, #0x8
    str r0, [sp, #0x50]
    ldr r0, _LIT9
    sub r0, r0, #0x3f4
    str r0, [sp, #0x5c]
    ldr r0, _LIT11
    add r0, r0, #0x2d8
    str r0, [sp, #0x60]
    ldr r0, _LIT11
    add r0, r0, #0x294
    str r0, [sp, #0x6c]
    ldr r0, _LIT11
    sub r0, r0, #0x5
    str r0, [sp, #0x24]
    ldr r0, _LIT11
    sub r0, r0, #0x1f0
    str r0, [sp, #0xa4]
    ldr r0, _LIT9
    sub r0, r0, #0x5a
    str r0, [sp, #0xac]
    ldr r0, _LIT8
    add r0, r0, #0x24
    str r0, [sp, #0xa8]
.L_3b4:
    ldr r1, [r6]
    mov r0, r9
    mov r1, r1, lsl #0x13
    mov r5, r1, lsr #0x13
    mov r1, r8
    bl func_ov002_021bd948
    cmp r0, #0x0
    beq .L_9ac
    mov r0, r9
    mov r1, r8
    bl func_ov002_021bdc94
    cmp r0, #0x0
    beq .L_7b0
    ldr r0, [sp, #0x4]
    cmp r5, r0
    mov r0, #0x0
    bgt .L_50c
    ldr r1, [sp, #0x8]
    cmp r5, r1
    bge .L_688
    ldr r1, _LIT11
    cmp r5, r1
    bgt .L_488
    bge .L_750
    ldr r1, [sp, #0xc]
    cmp r5, r1
    bgt .L_450
    ldr r1, [sp, #0x10]
    cmp r5, r1
    bge .L_688
    ldr r1, _LIT8
    cmp r5, r1
    bgt .L_440
    beq .L_688
    b .L_778
.L_440:
    ldr r1, [sp, #0x14]
    cmp r5, r1
    beq .L_688
    b .L_778
.L_450:
    ldr r1, [sp, #0x18]
    cmp r5, r1
    bgt .L_478
    ldr r1, [sp, #0x1c]
    cmp r5, r1
    bge .L_680
    ldr r1, [sp, #0x20]
    cmp r5, r1
    beq .L_688
    b .L_778
.L_478:
    ldr r1, [sp, #0x24]
    cmp r5, r1
    beq .L_764
    b .L_778
.L_488:
    ldr r1, [sp, #0x28]
    cmp r5, r1
    bgt .L_4d4
    ldr r1, [sp, #0x2c]
    cmp r5, r1
    bge .L_738
    ldr r1, [sp, #0x30]
    cmp r5, r1
    bgt .L_4c4
    ldr r1, [sp, #0x34]
    cmp r5, r1
    bge .L_688
    cmp r5, #0x1200
    beq .L_688
    b .L_778
.L_4c4:
    ldr r1, [sp, #0x38]
    cmp r5, r1
    beq .L_680
    b .L_778
.L_4d4:
    ldr r1, [sp, #0x3c]
    cmp r5, r1
    bgt .L_4fc
    ldr r1, [sp, #0x40]
    cmp r5, r1
    bge .L_688
    ldr r1, [sp, #0x44]
    cmp r5, r1
    beq .L_738
    b .L_778
.L_4fc:
    ldr r1, _LIT10
    cmp r5, r1
    beq .L_688
    b .L_778
.L_50c:
    ldr r1, [sp, #0x48]
    cmp r5, r1
    bgt .L_5e8
    ldr r1, [sp, #0x4c]
    cmp r5, r1
    bge .L_688
    ldr r1, _LIT7
    cmp r5, r1
    bgt .L_5b0
    ldr r1, [sp, #0x50]
    cmp r5, r1
    blt .L_560
    ldr r1, [sp, #0x54]
    cmp r5, r1
    ldrne r1, [sp, #0x58]
    cmpne r5, r1
    beq .L_688
    ldr r1, _LIT7
    cmp r5, r1
    beq .L_680
    b .L_778
.L_560:
    ldr r1, [sp, #0x5c]
    cmp r5, r1
    bgt .L_5a0
    ldr r1, [sp, #0x60]
    cmp r5, r1
    blt .L_590
    ldr r1, [sp, #0x64]
    cmp r5, r1
    ldrne r1, [sp, #0x68]
    cmpne r5, r1
    beq .L_688
    b .L_778
.L_590:
    ldr r1, [sp, #0x6c]
    cmp r5, r1
    beq .L_764
    b .L_778
.L_5a0:
    ldr r1, [sp, #0x70]
    cmp r5, r1
    beq .L_688
    b .L_778
.L_5b0:
    ldr r1, [sp, #0x74]
    cmp r5, r1
    bgt .L_5d8
    ldr r1, [sp, #0x78]
    cmp r5, r1
    bge .L_680
    ldr r1, [sp, #0x7c]
    cmp r5, r1
    beq .L_688
    b .L_778
.L_5d8:
    ldr r1, [sp, #0x80]
    cmp r5, r1
    beq .L_688
    b .L_778
.L_5e8:
    ldr r1, [sp, #0x84]
    cmp r5, r1
    bgt .L_638
    ldr r1, [sp, #0x88]
    cmp r5, r1
    bge .L_688
    ldr r1, [sp, #0x8c]
    cmp r5, r1
    bgt .L_628
    ldr r1, [sp, #0x90]
    cmp r5, r1
    bge .L_688
    ldr r1, [sp, #0x94]
    cmp r5, r1
    beq .L_688
    b .L_778
.L_628:
    ldr r1, [sp, #0x98]
    cmp r5, r1
    beq .L_688
    b .L_778
.L_638:
    ldr r1, _LIT9
    cmp r5, r1
    bgt .L_674
    ldr r1, [sp, #0x9c]
    subs r1, r5, r1
    addpl pc, pc, r1, lsl #0x2
    b .L_664
    b .L_688
    b .L_688
    b .L_688
    b .L_688
.L_664:
    ldr r1, [sp, #0xa0]
    cmp r5, r1
    beq .L_688
    b .L_778
.L_674:
    ldr r1, _LIT5
    cmp r5, r1
    bne .L_778
.L_680:
    mov r0, #0x1
    b .L_778
.L_688:
    mov r1, #0x0
    add r0, sp, #0xe0
    str r1, [r0]
    str r1, [r0, #0x4]
    str r1, [r0, #0x8]
    str r1, [r0, #0xc]
    str r1, [r0, #0x10]
    str r1, [r0, #0x14]
    ldrh r1, [sp, #0xe2]
    mov r0, r8, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x1
    orr r1, r1, r4
    strh r1, [sp, #0xe2]
    ldrh r3, [sp, #0xe2]
    mov r1, r0, lsl #0x1b
    ldrh r0, [sp, #0xe4]
    bic r3, r3, #0x3e
    orr r1, r3, r1, lsr #0x1a
    strh r1, [sp, #0xe2]
    ldr r2, [r6]
    and r1, r0, fp
    mov r0, r2, lsl #0x12
    mov r2, r2, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r2, r2, lsl #0x1
    add r0, r2, r0, lsr #0x1f
    mov r0, r0, lsl #0x10
    ldrh r2, [sp, #0xe2]
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x17
    orr r0, r1, r0, lsr #0x11
    bic r2, r2, #0x3000
    strh r0, [sp, #0xe4]
    orr r2, r2, #0x1000
    add r0, sp, #0xe0
    mov r1, r7
    strh r5, [sp, #0xe0]
    strh r2, [sp, #0xe2]
    bl func_ov002_02257ab8
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    b .L_778
.L_738:
    mov r0, r9
    bl func_ov002_02280980
    cmp r0, #0x0
    movlt r0, #0x1
    movge r0, #0x0
    b .L_778
.L_750:
    ldr r1, [sp]
    ldr r1, [r1, #0xc]
    cmp r1, #0x5
    movcc r0, #0x1
    b .L_778
.L_764:
    mov r0, r7
    bl func_ov002_021bcf00
    cmp r0, #0x1
    movgt r0, #0x1
    movle r0, #0x0
.L_778:
    cmp r0, #0x0
    beq .L_9ac
    ldr r4, _LIT12
    mov r0, r9
    mov r1, r8
    str r9, [r4, #0xd6c]
    mov r5, #0x1
    mov r2, #0x0
    mov r3, #0x5
    str r5, [r4, #0xd54]
    bl func_ov002_02259774
    add sp, sp, #0xf8
    mov r0, r5
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_7b0:
    ldrh r0, [sl, #0x36]
    cmp r0, #0x0
    beq .L_8b0
    ldr r0, [sp, #0xa4]
    cmp r5, r0
    mov r0, #0x0
    bne .L_878
    mov r1, r0
    add r0, sp, #0xc8
    str r1, [r0]
    str r1, [r0, #0x4]
    str r1, [r0, #0x8]
    str r1, [r0, #0xc]
    str r1, [r0, #0x10]
    str r1, [r0, #0x14]
    ldrh r1, [sp, #0xca]
    mov r0, r8, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x1
    orr r1, r1, r4
    strh r1, [sp, #0xca]
    ldrh r3, [sp, #0xca]
    mov r1, r0, lsl #0x1b
    ldrh r0, [sp, #0xcc]
    bic r3, r3, #0x3e
    orr r1, r3, r1, lsr #0x1a
    strh r1, [sp, #0xca]
    ldr r2, [r6]
    and r1, r0, fp
    mov r0, r2, lsl #0x12
    mov r2, r2, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r2, r2, lsl #0x1
    add r0, r2, r0, lsr #0x1f
    mov r0, r0, lsl #0x10
    ldrh r2, [sp, #0xca]
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x17
    orr r0, r1, r0, lsr #0x11
    bic r2, r2, #0x3000
    strh r0, [sp, #0xcc]
    orr r2, r2, #0x1000
    add r0, sp, #0xc8
    mov r1, r7
    strh r5, [sp, #0xc8]
    strh r2, [sp, #0xca]
    bl func_ov002_02257ab8
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
.L_878:
    cmp r0, #0x0
    beq .L_9ac
    ldr r4, _LIT12
    mov r0, r9
    mov r1, r8
    str r9, [r4, #0xd6c]
    mov r5, #0x1
    mov r2, #0x0
    mov r3, #0x8
    str r5, [r4, #0xd54]
    bl func_ov002_02259774
    add sp, sp, #0xf8
    mov r0, r5
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_8b0:
    ldr r0, [sp, #0xa8]
    mov r1, #0x0
    cmp r5, r0
    ldrne r0, [sp, #0xac]
    cmpne r5, r0
    bne .L_974
    mov r1, #0x0
    add r0, sp, #0xb0
    str r1, [r0]
    str r1, [r0, #0x4]
    str r1, [r0, #0x8]
    str r1, [r0, #0xc]
    str r1, [r0, #0x10]
    str r1, [r0, #0x14]
    ldrh r1, [sp, #0xb2]
    mov r0, r8, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x1
    orr r1, r1, r4
    strh r1, [sp, #0xb2]
    ldrh r3, [sp, #0xb2]
    mov r1, r0, lsl #0x1b
    ldrh r0, [sp, #0xb4]
    bic r3, r3, #0x3e
    orr r1, r3, r1, lsr #0x1a
    strh r1, [sp, #0xb2]
    ldr r2, [r6]
    and r1, r0, fp
    mov r0, r2, lsl #0x12
    mov r2, r2, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r2, r2, lsl #0x1
    add r0, r2, r0, lsr #0x1f
    mov r0, r0, lsl #0x10
    ldrh r2, [sp, #0xb2]
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x17
    orr r0, r1, r0, lsr #0x11
    bic r2, r2, #0x3000
    strh r0, [sp, #0xb4]
    orr r2, r2, #0x1000
    add r0, sp, #0xb0
    mov r1, r7
    strh r5, [sp, #0xb0]
    strh r2, [sp, #0xb2]
    bl func_ov002_02257ab8
    cmp r0, #0x0
    movgt r1, #0x1
    movle r1, #0x0
.L_974:
    cmp r1, #0x0
    beq .L_9ac
    ldr r4, _LIT12
    mov r0, r9
    mov r1, r8
    str r9, [r4, #0xd6c]
    mov r5, #0x1
    mov r2, #0x0
    mov r3, #0x9
    str r5, [r4, #0xd54]
    bl func_ov002_02259774
    add sp, sp, #0xf8
    mov r0, r5
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_9ac:
    add r6, r6, #0x14
    add sl, sl, #0x14
    add r8, r8, #0x1
    cmp r8, #0x4
    ble .L_3b4
    mov r0, #0x0
    add sp, sp, #0xf8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022c9ad0
_LIT1: .word 0x0000fffe
_LIT2: .word data_ov002_022cf16c
_LIT3: .word 0x00000868
_LIT4: .word 0x0000166c
_LIT5: .word 0x000019f1
_LIT6: .word 0xffff803f
_LIT7: .word 0x00001533
_LIT8: .word 0x00000ffa
_LIT9: .word 0x000018c2
_LIT10: .word 0x000013b0
_LIT11: .word 0x000011f5
_LIT12: .word data_ov002_022d016c
