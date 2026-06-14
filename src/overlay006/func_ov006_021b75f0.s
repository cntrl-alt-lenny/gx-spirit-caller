; func_ov006_021b75f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern func_020059b0
        .extern func_ov006_021b7240
        .extern func_ov006_021b81dc
        .extern func_ov006_021b8544
        .extern func_ov006_021b8fa8
        .extern func_ov006_021b9010
        .extern func_ov006_021b9a00
        .global func_ov006_021b75f0
        .arm
func_ov006_021b75f0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x14
    ldr r4, [sp, #0x38]
    mov r9, r0
    str r4, [sp, #0x38]
    mov fp, r1
    mov sl, r2
    str r3, [sp, #0x4]
    str r4, [sp]
    bl func_ov006_021b7240
    cmp r0, #0x0
    addeq sp, sp, #0x14
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    add r0, r9, sl, lsl #0x1
    add r1, r9, fp, lsl #0x1
    add r0, r0, #0x62
    add r0, r0, #0xc600
    add r1, r1, #0x62
    str r0, [sp, #0xc]
    add r0, r1, #0xc600
    str r0, [sp, #0x8]
    mov r6, #0x0
.L_6fc:
    cmp r6, fp
    cmpne r6, sl
    bne .L_a3c
    mov r0, r9
    mov r1, r6
    bl func_ov006_021b81dc
    ldr r1, [sp, #0x4]
    mov r0, #0x0
    str r0, [sp, #0x10]
    mov r2, r1
    mov r0, r6
    strh r2, [sp, #0x10]
    bl func_ov006_021b9a00
    cmp r0, #0x0
    beq .L_a3c
    cmp r6, sl
    bne .L_850
    cmp sl, #0x4
    addls pc, pc, sl, lsl #0x2
    b .L_798
    b .L_760
    b .L_76c
    b .L_778
    b .L_784
    b .L_790
.L_760:
    add r0, r9, #0x198
    add r5, r0, #0x9800
    b .L_798
.L_76c:
    add r0, r9, #0x358
    add r5, r0, #0xb000
    b .L_798
.L_778:
    add r0, r9, #0x158
    add r5, r0, #0xb800
    b .L_798
.L_784:
    add r0, r9, #0x358
    add r5, r0, #0xbc00
    b .L_798
.L_790:
    add r0, r9, #0x58
    add r5, r0, #0xc400
.L_798:
    ldr r0, [sp, #0xc]
    mov r1, sl
    ldrh r4, [r0]
    mov r0, r9
    bl func_ov006_021b8fa8
    cmp r4, #0x0
    mov r0, #0x0
    ble .L_7d8
    ldr r3, _LIT0
    mov r2, r4, lsl #0x10
    str r3, [sp]
    add r0, sp, #0x10
    mov r1, r5
    mov r2, r2, lsr #0x10
    mov r3, #0x4
    bl func_020059b0
.L_7d8:
    cmp r0, r4
    bge .L_a30
    add r1, r5, r0, lsl #0x2
    ldrb r3, [r1, #0x2]
    ldr r2, [sp, #0x38]
    sub r2, r3, r2
    cmp r2, #0x0
    bgt .L_848
    cmp sl, #0x0
    addeq r2, r9, #0x6000
    ldreq r2, [r2, #0x298]
    cmpeq r2, #0x0
    moveq r0, #0x0
    streqb r0, [r1, #0x2]
    beq .L_a30
    add r2, r0, #0x1
    cmp r2, r4
    bge .L_838
.L_820:
    ldr r1, [r5, r2, lsl #0x2]
    add r0, r5, r2, lsl #0x2
    add r2, r2, #0x1
    str r1, [r0, #-4]
    cmp r2, r4
    blt .L_820
.L_838:
    ldr r0, [sp, #0xc]
    sub r1, r4, #0x1
    strh r1, [r0]
    b .L_a30
.L_848:
    strb r2, [r1, #0x2]
    b .L_a30
.L_850:
    cmp r6, fp
    bne .L_a30
    cmp fp, #0x4
    addls pc, pc, fp, lsl #0x2
    b .L_8b0
    b .L_878
    b .L_884
    b .L_890
    b .L_89c
    b .L_8a8
.L_878:
    add r0, r9, #0x198
    add r5, r0, #0x9800
    b .L_8b0
.L_884:
    add r0, r9, #0x358
    add r5, r0, #0xb000
    b .L_8b0
.L_890:
    add r0, r9, #0x158
    add r5, r0, #0xb800
    b .L_8b0
.L_89c:
    add r0, r9, #0x358
    add r5, r0, #0xbc00
    b .L_8b0
.L_8a8:
    add r0, r9, #0x58
    add r5, r0, #0xc400
.L_8b0:
    ldr r0, [sp, #0x8]
    mov r1, fp
    ldrh r7, [r0]
    mov r0, r9
    bl func_ov006_021b8fa8
    cmp r7, #0x0
    mov r0, #0x0
    ble .L_8f0
    ldr r3, _LIT0
    mov r2, r7, lsl #0x10
    str r3, [sp]
    add r0, sp, #0x10
    mov r1, r5
    mov r2, r2, lsr #0x10
    mov r3, #0x4
    bl func_020059b0
.L_8f0:
    cmp r0, r7
    blt .L_a10
    cmp r7, #0x0
    bne .L_920
    ldr r0, [sp, #0x4]
    mov r1, #0x1
    strh r0, [r5]
    ldr r0, [sp, #0x38]
    strb r0, [r5, #0x2]
    ldr r0, [sp, #0x8]
    strh r1, [r0]
    b .L_a30
.L_920:
    ldr r0, _LIT1
    add r1, sp, #0x10
    ldr r8, [r0, #0x28]
    add r0, r5, r8, lsl #0x2
    bl func_ov006_021b9010
    cmp r0, #0x0
    bge .L_998
    sub r4, r7, #0x1
    b .L_948
.L_944:
    add r8, r8, #0x1
.L_948:
    cmp r8, r4
    bge .L_968
    add r0, r8, #0x1
    add r0, r5, r0, lsl #0x2
    add r1, sp, #0x10
    bl func_ov006_021b9010
    cmp r0, #0x0
    blt .L_944
.L_968:
    sub r3, r7, #0x1
    add r2, r8, #0x1
    cmp r3, r2
    blt .L_990
.L_978:
    ldr r1, [r5, r3, lsl #0x2]
    add r0, r5, r3, lsl #0x2
    str r1, [r0, #0x4]
    sub r3, r3, #0x1
    cmp r3, r2
    bge .L_978
.L_990:
    add r8, r8, #0x1
    b .L_9e8
.L_998:
    add r4, sp, #0x10
    b .L_9a4
.L_9a0:
    sub r8, r8, #0x1
.L_9a4:
    cmp r8, #0x0
    ble .L_9c4
    sub r0, r8, #0x1
    mov r1, r4
    add r0, r5, r0, lsl #0x2
    bl func_ov006_021b9010
    cmp r0, #0x0
    bgt .L_9a0
.L_9c4:
    sub r2, r7, #0x1
    cmp r2, r8
    blt .L_9e8
.L_9d0:
    ldr r1, [r5, r2, lsl #0x2]
    add r0, r5, r2, lsl #0x2
    str r1, [r0, #0x4]
    sub r2, r2, #0x1
    cmp r2, r8
    bge .L_9d0
.L_9e8:
    ldr r0, [sp, #0x4]
    mov r1, r8, lsl #0x2
    strh r0, [r5, r1]
    ldr r0, [sp, #0x38]
    add r1, r5, r8, lsl #0x2
    strb r0, [r1, #0x2]
    ldr r0, [sp, #0x8]
    add r1, r7, #0x1
    strh r1, [r0]
    b .L_a30
.L_a10:
    add r2, r5, r0, lsl #0x2
    ldrb r1, [r2, #0x2]
    ldr r0, [sp, #0x38]
    add r0, r1, r0
    cmp r0, #0x9
    movge r0, #0x9
    strgeb r0, [r2, #0x2]
    strltb r0, [r2, #0x2]
.L_a30:
    mov r0, r9
    mov r1, r6
    bl func_ov006_021b8544
.L_a3c:
    add r6, r6, #0x1
    cmp r6, #0x5
    blt .L_6fc
    mov r0, #0x1
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word func_ov006_021b9010
_LIT1: .word data_021040ac
