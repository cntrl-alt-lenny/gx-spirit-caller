; func_02024630 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c68cc
        .extern data_0219a8ec
        .extern func_0200bff4
        .extern func_0200c078
        .extern func_0200c23c
        .extern func_0200c284
        .extern func_0200c428
        .extern func_0200c558
        .extern func_0200c65c
        .extern func_0200c6ac
        .extern func_0200c6fc
        .extern func_0200c74c
        .extern func_0200c79c
        .extern func_0200c824
        .extern func_02021cd8
        .extern func_02022290
        .extern func_020224c0
        .extern func_02022644
        .extern func_0202290c
        .extern func_02022d54
        .extern func_02025880
        .extern func_020258c4
        .extern func_02025a10
        .extern func_02025f00
        .extern func_02025fe4
        .extern func_020264f0
        .extern func_0202695c
        .extern func_02026b38
        .extern func_02026d50
        .extern func_02026e38
        .extern func_02026ed8
        .extern func_02026f28
        .extern func_02026f78
        .global func_02024630
        .arm
func_02024630:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x50
    mov r6, r0
    ldr r0, [r6]
    ldr fp, _LIT0
    str r0, [sp]
    add r0, r6, #0x6a
    add r8, r0, #0x100
    add r0, r6, #0xf4
    str r0, [sp, #0x8]
    mvn r0, #0x0
    mov r4, #0x0
    add r5, r6, #0xac
    add r7, r6, #0x100
    str r0, [sp, #0x4]
    b .L_f44
.L_40:
    ldr r0, [r6]
    ldr r2, [r0]
    mov r1, r2, lsr #0x18
    sub r1, r1, #0x40
    cmp r1, #0x2e
    addls pc, pc, r1, lsl #0x2
    b .L_f30
    b .L_118
    b .L_15c
    b .L_1e0
    b .L_22c
    b .L_288
    b .L_310
    b .L_354
    b .L_3f8
    b .L_414
    b .L_430
    b .L_44c
    b .L_468
    b .L_48c
    b .L_4a8
    b .L_530
    b .L_5d8
    b .L_618
    b .L_658
    b .L_69c
    b .L_6e0
    b .L_724
    b .L_768
    b .L_7ac
    b .L_7fc
    b .L_85c
    b .L_8a0
    b .L_900
    b .L_960
    b .L_9c0
    b .L_a20
    b .L_a80
    b .L_acc
    b .L_b20
    b .L_b74
    b .L_b9c
    b .L_c10
    b .L_c60
    b .L_cac
    b .L_d0c
    b .L_d6c
    b .L_dcc
    b .L_e2c
    b .L_eb4
    b .L_f30
    b .L_f30
    b .L_f30
    b .L_f14
.L_118:
    mov r1, r2, lsr #0x10
    mov r2, r2, lsl #0x10
    mov r0, r6
    and r1, r1, #0xff
    mov r2, r2, lsr #0x10
    bl func_020224c0
    ldr r1, [r6]
    mov r3, r0
    ldr r2, [r1, #0x4]
    mov r1, #0x2c
    mla r1, r3, r1, r2
    mov r0, r6
    bl func_020258c4
    ldr r0, [r6]
    add r0, r0, #0x8
    str r0, [r6]
    b .L_f30
.L_15c:
    mov r1, r2, lsr #0x10
    mov r2, r2, lsl #0x10
    mov r0, r6
    and r1, r1, #0xff
    mov r2, r2, lsr #0x10
    bl func_020224c0
    ldr r1, [r6]
    add ip, sp, #0x24
    ldmib r1, {r2, sl}
    ldr r9, [r1, #0xc]
    mov r1, #0x2c
    mla lr, r0, r1, r2
    ldmia lr!, {r0, r1, r2, r3}
    stmia ip!, {r0, r1, r2, r3}
    ldmia lr!, {r0, r1, r2, r3}
    stmia ip!, {r0, r1, r2, r3}
    ldmia lr, {r0, r1, r2}
    stmia ip, {r0, r1, r2}
    cmp sl, #-2147483648
    ldrne r0, [sp, #0x38]
    add r1, sp, #0x24
    addne r0, r0, sl
    strne r0, [sp, #0x38]
    cmp r9, #-2147483648
    ldrne r0, [sp, #0x3c]
    addne r0, r0, r9
    strne r0, [sp, #0x3c]
    mov r0, r6
    bl func_020258c4
    ldr r0, [r6]
    add r0, r0, #0x10
    str r0, [r6]
    b .L_f30
.L_1e0:
    mov r1, r2, lsr #0x10
    mov r2, r2, lsl #0x10
    mov r0, r6
    and r1, r1, #0xff
    mov r2, r2, lsr #0x10
    bl func_020224c0
    ldr r1, [r6]
    mov r9, r0
    ldr sl, [r1, #0x4]
    mov r1, #0x2c
    ldr r2, [sp, #0x4]
    mla r1, r9, r1, sl
    mov r0, r6
    mov r3, r2
    bl func_02025fe4
    ldr r0, [r6]
    add r0, r0, #0x8
    str r0, [r6]
    b .L_f30
.L_22c:
    mov r1, r2, lsr #0x10
    mov r2, r2, lsl #0x10
    mov r0, r6
    and r1, r1, #0xff
    mov r2, r2, lsr #0x10
    bl func_020224c0
    ldr r1, [r6]
    mov r2, r0
    ldr r3, [r1, #0x8]
    ldr sl, [r1, #0x4]
    mov r1, #0x2c
    mov r9, r3, lsl #0x10
    mla r1, r2, r1, sl
    mov r3, r3, lsr #0x10
    mov r3, r3, lsl #0x10
    mov r0, r6
    mov r2, r9, asr #0x10
    mov r3, r3, asr #0x10
    bl func_02025fe4
    ldr r0, [r6]
    add r0, r0, #0xc
    str r0, [r6]
    b .L_f30
.L_288:
    ldrh r0, [r7, #0x6a]
    mov r1, r0, lsl #0x1d
    movs r1, r1, lsr #0x1f
    beq .L_2d8
    mov r0, r0, lsl #0x15
    movs r0, r0, lsr #0x1f
    beq .L_2c0
    mov r0, #0x0
    str r0, [sp, #0x18]
    mov r0, #0x3
    str r0, [sp, #0x20]
    add r0, sp, #0x18
    str r6, [sp, #0x1c]
    bl func_02022d54
.L_2c0:
    mov r0, r6
    bl func_02025a10
    ldr r0, [r6]
    add r0, r0, #0x4
    str r0, [r6]
    b .L_f30
.L_2d8:
    ldr r0, [r6, #0xa4]
    cmp r0, #0x0
    beq .L_2f8
    ldr r0, [r0, #0x60]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    movne r4, #0x1
    bne .L_f30
.L_2f8:
    mov r0, r6
    bl func_020264f0
    ldr r0, [r6]
    add r0, r0, #0x4
    str r0, [r6]
    b .L_f30
.L_310:
    mov r0, r6
    mov r1, r2, lsr #0x10
    and r1, r1, #0xff
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_020224c0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x1f
    ldrh r1, [r8]
    bic r1, r1, #0x2
    orr r0, r1, r0, lsr #0x1e
    strh r0, [r8]
    ldr r0, [r6]
    add r0, r0, #0x4
    str r0, [r6]
    b .L_f30
.L_354:
    mov r1, r2, lsr #0x10
    ldr r2, [r0, #0x4]
    and r1, r1, #0xff
    mov r2, r2, lsl #0x10
    mov r0, r6
    mov r2, r2, lsr #0x10
    bl func_020224c0
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0xc
    str r0, [r5]
    ldr r2, [r6]
    mov r0, r6
    ldmia r2, {r1, r2}
    mov r2, r2, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsl #0x10
    and r1, r1, #0xff
    mov r2, r2, lsr #0x10
    bl func_020224c0
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0xc
    str r0, [r5, #0x4]
    ldr r2, [r6]
    mov r0, r6
    ldr r1, [r2]
    ldr r2, [r2, #0x8]
    mov r1, r1, lsr #0x10
    mov r2, r2, lsl #0x10
    and r1, r1, #0xff
    mov r2, r2, lsr #0x10
    bl func_020224c0
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0xc
    str r0, [r5, #0x8]
    ldr r3, [sp, #0x8]
    ldmia r5, {r0, r1, r2}
    stmia r3, {r0, r1, r2}
    ldr r0, [r6]
    add r0, r0, #0xc
    str r0, [r6]
    b .L_f30
.L_3f8:
    ldr r1, [sp, #0x8]
    mov r0, r6
    mov r2, r5
    bl func_02022644
    cmp r0, #0x0
    movne r4, #0x1
    b .L_f30
.L_414:
    mov r0, r6
    add r1, r6, #0x104
    add r2, r6, #0xb8
    bl func_02022644
    cmp r0, #0x0
    movne r4, #0x1
    b .L_f30
.L_430:
    mov r0, r6
    add r1, r6, #0x114
    add r2, r6, #0xc4
    bl func_02022644
    cmp r0, #0x0
    movne r4, #0x1
    b .L_f30
.L_44c:
    mov r0, r6
    add r1, r6, #0x124
    add r2, r6, #0xd0
    bl func_02022644
    cmp r0, #0x0
    movne r4, #0x1
    b .L_f30
.L_468:
    mov r0, #0x1
    strb r0, [r6, #0x142]
    mov r0, r6
    add r1, r6, #0x134
    add r2, r6, #0xdc
    bl func_02022644
    cmp r0, #0x0
    movne r4, #0x1
    b .L_f30
.L_48c:
    mov r0, r6
    add r1, r6, #0x144
    add r2, r6, #0xe8
    bl func_02022644
    cmp r0, #0x0
    movne r4, #0x1
    b .L_f30
.L_4a8:
    mov r0, r6
    mov r1, r2, lsr #0x14
    and r1, r1, #0xf
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_020224c0
    mov r0, r0, lsl #0x10
    mov r9, r0, asr #0x10
    ldrh r0, [r7, #0x6a]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1f
    bne .L_520
    cmp r9, #0x0
    blt .L_518
    ldr r2, [r6]
    mov r0, r6
    ldmia r2, {r1, r2}
    mov r1, r1, lsr #0x10
    mov r2, r2, lsl #0x10
    and r1, r1, #0xf
    mov r2, r2, lsr #0x10
    bl func_020224c0
    mov r0, r0, lsl #0x10
    mov r2, r0, asr #0x10
    ldr r0, [r6, #0xa4]
    mov r1, r9
    bl func_0200c428
    b .L_520
.L_518:
    ldr r0, [r6, #0xa4]
    bl func_0200c558
.L_520:
    ldr r0, [r6]
    add r0, r0, #0x8
    str r0, [r6]
    b .L_f30
.L_530:
    mov r1, r2, lsr #0x10
    ands r1, r1, #0xf
    beq .L_550
    cmp r1, #0x1
    beq .L_568
    cmp r1, #0x2
    beq .L_5a0
    b .L_5cc
.L_550:
    ldr r0, [r0, #0x4]
    str r0, [r6, #0x74]
    ldr r0, [r6]
    add r0, r0, #0x8
    str r0, [r6]
    b .L_5cc
.L_568:
    mov r0, r6
    mov r1, r2, lsr #0x14
    and r1, r1, #0xf
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_020224c0
    ldr r1, [r6]
    ldr r1, [r1, #0x4]
    ldr r0, [r1, r0, lsl #0x2]
    str r0, [r6, #0x74]
    ldr r0, [r6]
    add r0, r0, #0x8
    str r0, [r6]
    b .L_5cc
.L_5a0:
    mov r0, r6
    mov r1, r2, lsr #0x14
    and r1, r1, #0xf
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_020224c0
    bl func_02022290
    str r0, [r6, #0x74]
    ldr r0, [r6]
    add r0, r0, #0x4
    str r0, [r6]
.L_5cc:
    mov r0, r6
    bl func_02025f00
    b .L_f30
.L_5d8:
    mov r1, r2, lsr #0x10
    mov r2, r2, lsl #0x10
    mov r0, r6
    and r1, r1, #0xff
    mov r2, r2, lsr #0x10
    bl func_020224c0
    ldr r1, [r6]
    ldr r2, [r1, #0x4]
    mov r1, #0x2c
    mla r1, r0, r1, r2
    ldr r0, [r1, #0x4]
    str r0, [r6, #0x6c]
    ldr r0, [r6]
    add r0, r0, #0x8
    str r0, [r6]
    b .L_f30
.L_618:
    mov r1, r2, lsr #0x10
    mov r2, r2, lsl #0x10
    mov r0, r6
    and r1, r1, #0xff
    mov r2, r2, lsr #0x10
    bl func_020224c0
    ldr r1, [r6]
    ldr r2, [r1, #0x4]
    mov r1, #0x2c
    mla r1, r0, r1, r2
    ldr r0, [r1, #0x8]
    str r0, [r6, #0x70]
    ldr r0, [r6]
    add r0, r0, #0x8
    str r0, [r6]
    b .L_f30
.L_658:
    mov r0, r6
    mov r1, r2, lsr #0x10
    and r1, r1, #0xff
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_020224c0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x1f
    ldrh r1, [r8]
    bic r1, r1, #0x8
    orr r0, r1, r0, lsr #0x1c
    strh r0, [r8]
    ldr r0, [r6]
    add r0, r0, #0x4
    str r0, [r6]
    b .L_f30
.L_69c:
    mov r0, r6
    mov r1, r2, lsr #0x10
    and r1, r1, #0xff
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_020224c0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x1f
    ldrh r1, [r8]
    bic r1, r1, #0x10
    orr r0, r1, r0, lsr #0x1b
    strh r0, [r8]
    ldr r0, [r6]
    add r0, r0, #0x4
    str r0, [r6]
    b .L_f30
.L_6e0:
    mov r0, r6
    mov r1, r2, lsr #0x10
    and r1, r1, #0xff
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_020224c0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x1f
    ldrh r1, [r8]
    bic r1, r1, #0x20
    orr r0, r1, r0, lsr #0x1a
    strh r0, [r8]
    ldr r0, [r6]
    add r0, r0, #0x4
    str r0, [r6]
    b .L_f30
.L_724:
    mov r0, r6
    mov r1, r2, lsr #0x10
    and r1, r1, #0xff
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_020224c0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x1f
    ldrh r1, [r8]
    bic r1, r1, #0x40
    orr r0, r1, r0, lsr #0x19
    strh r0, [r8]
    ldr r0, [r6]
    add r0, r0, #0x4
    str r0, [r6]
    b .L_f30
.L_768:
    mov r0, r6
    mov r1, r2, lsr #0x10
    and r1, r1, #0xff
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_020224c0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x1f
    ldrh r1, [r8]
    bic r1, r1, #0x80
    orr r0, r1, r0, lsr #0x18
    strh r0, [r8]
    ldr r0, [r6]
    add r0, r0, #0x4
    str r0, [r6]
    b .L_f30
.L_7ac:
    mov r0, r6
    mov r1, r2, lsr #0x10
    and r1, r1, #0xff
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_020224c0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x1f
    ldrh r1, [r8]
    bic r1, r1, #0x100
    orr r0, r1, r0, lsr #0x17
    strh r0, [r8]
    ldr r0, [r6]
    ldr r0, [r0, #0x4]
    strh r0, [r7, #0x66]
    ldr r0, [r6]
    add r0, r0, #0x8
    str r0, [r6]
    b .L_f30
.L_7fc:
    mov r1, r2, lsr #0x14
    mov r2, r2, lsl #0x10
    mov r0, r6
    and r1, r1, #0xf
    mov r2, r2, lsr #0x10
    bl func_020224c0
    ldr r2, [r6]
    mov r0, r0, lsl #0x10
    ldmia r2, {r1, r2}
    mov r1, r1, lsr #0x10
    mov r2, r2, lsl #0x10
    mov r9, r0, asr #0x10
    mov r0, r6
    and r1, r1, #0xf
    mov r2, r2, lsr #0x10
    bl func_020224c0
    mov r2, r0
    mov r1, r9
    mov r0, r6
    bl func_02026e38
    ldr r0, [r6]
    add r0, r0, #0x8
    str r0, [r6]
    b .L_f30
.L_85c:
    mov r0, r6
    mov r1, r2, lsr #0x10
    and r1, r1, #0xff
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_020224c0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x1f
    ldrh r1, [r8]
    bic r1, r1, #0x200
    orr r0, r1, r0, lsr #0x16
    strh r0, [r8]
    ldr r0, [r6]
    add r0, r0, #0x4
    str r0, [r6]
    b .L_f30
.L_8a0:
    mov r1, r2, lsr #0x14
    mov r2, r2, lsl #0x10
    mov r0, r6
    and r1, r1, #0xf
    mov r2, r2, lsr #0x10
    bl func_020224c0
    ldr r2, [r6]
    mov r0, r0, lsl #0x10
    ldmia r2, {r1, r2}
    mov r1, r1, lsr #0x10
    mov r2, r2, lsl #0x10
    mov r9, r0, asr #0x10
    mov r0, r6
    and r1, r1, #0xf
    mov r2, r2, lsr #0x10
    bl func_020224c0
    mov r2, r0
    ldr r0, [r6, #0xa4]
    mov r1, r9
    bl func_0200c65c
    ldr r0, [r6]
    add r0, r0, #0x8
    str r0, [r6]
    b .L_f30
.L_900:
    mov r1, r2, lsr #0x14
    mov r2, r2, lsl #0x10
    mov r0, r6
    and r1, r1, #0xf
    mov r2, r2, lsr #0x10
    bl func_020224c0
    ldr r2, [r6]
    mov r0, r0, lsl #0x10
    ldmia r2, {r1, r2}
    mov r1, r1, lsr #0x10
    mov r2, r2, lsl #0x10
    mov r9, r0, asr #0x10
    mov r0, r6
    and r1, r1, #0xf
    mov r2, r2, lsr #0x10
    bl func_020224c0
    mov r2, r0
    ldr r0, [r6, #0xa4]
    mov r1, r9
    bl func_0200c6ac
    ldr r0, [r6]
    add r0, r0, #0x8
    str r0, [r6]
    b .L_f30
.L_960:
    mov r1, r2, lsr #0x14
    mov r2, r2, lsl #0x10
    mov r0, r6
    and r1, r1, #0xf
    mov r2, r2, lsr #0x10
    bl func_020224c0
    ldr r2, [r6]
    mov r0, r0, lsl #0x10
    ldmia r2, {r1, r2}
    mov r1, r1, lsr #0x10
    mov r2, r2, lsl #0x10
    mov r9, r0, asr #0x10
    mov r0, r6
    and r1, r1, #0xf
    mov r2, r2, lsr #0x10
    bl func_020224c0
    mov r2, r0
    ldr r0, [r6, #0xa4]
    mov r1, r9
    bl func_0200c6fc
    ldr r0, [r6]
    add r0, r0, #0x8
    str r0, [r6]
    b .L_f30
.L_9c0:
    mov r1, r2, lsr #0x14
    mov r2, r2, lsl #0x10
    mov r0, r6
    and r1, r1, #0xf
    mov r2, r2, lsr #0x10
    bl func_020224c0
    ldr r2, [r6]
    mov r0, r0, lsl #0x10
    ldmia r2, {r1, r2}
    mov r1, r1, lsr #0x10
    mov r2, r2, lsl #0x10
    mov r9, r0, asr #0x10
    mov r0, r6
    and r1, r1, #0xf
    mov r2, r2, lsr #0x10
    bl func_020224c0
    mov r2, r0
    ldr r0, [r6, #0xa4]
    mov r1, r9
    bl func_0200c74c
    ldr r0, [r6]
    add r0, r0, #0x8
    str r0, [r6]
    b .L_f30
.L_a20:
    mov r1, r2, lsr #0x14
    mov r2, r2, lsl #0x10
    mov r0, r6
    and r1, r1, #0xf
    mov r2, r2, lsr #0x10
    bl func_020224c0
    ldr r2, [r6]
    mov r0, r0, lsl #0x10
    ldmia r2, {r1, r2}
    mov r1, r1, lsr #0x10
    mov r2, r2, lsl #0x10
    mov r9, r0, asr #0x10
    mov r0, r6
    and r1, r1, #0xf
    mov r2, r2, lsr #0x10
    bl func_020224c0
    mov r2, r0
    ldr r0, [r6, #0xa4]
    mov r1, r9
    bl func_0200c79c
    ldr r0, [r6]
    add r0, r0, #0x8
    str r0, [r6]
    b .L_f30
.L_a80:
    mov r0, r6
    mov r1, r2, lsr #0x10
    and r1, r1, #0xff
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_020224c0
    mov r1, r0
    ldrh r0, [r7, #0x6a]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1f
    bne .L_abc
    ldr r0, [r6, #0xa4]
    ldr r2, [r6]
    ldr r2, [r2, #0x4]
    bl func_0200c824
.L_abc:
    ldr r0, [r6]
    add r0, r0, #0x8
    str r0, [r6]
    b .L_f30
.L_acc:
    mov r1, r2, lsr #0x10
    ldr r2, [r0, #0x4]
    and r1, r1, #0xf
    mov r2, r2, lsl #0x10
    mov r0, r6
    mov r2, r2, lsr #0x10
    bl func_020224c0
    ldr r2, [r6]
    mov r3, r0
    ldmia r2, {r1, r2}
    mov r2, r2, lsr #0x10
    mov r1, r1, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r0, r6
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    bl func_0202695c
    ldr r0, [r6]
    add r0, r0, #0x8
    str r0, [r6]
    b .L_f30
.L_b20:
    mov r1, r2, lsr #0x10
    ldr r2, [r0, #0x4]
    and r1, r1, #0xff
    mov r2, r2, lsl #0x10
    mov r0, r6
    mov r2, r2, lsr #0x10
    bl func_020224c0
    ldr r1, [r6]
    mov r9, r0
    ldmib r1, {r2, sl}
    mov r3, #0x2c
    mov r1, r2, lsr #0x18
    mov r2, r2, lsr #0x10
    mla r3, r9, r3, sl
    mov r0, r6
    and r2, r2, #0xff
    bl func_02026b38
    ldr r0, [r6]
    add r0, r0, #0xc
    str r0, [r6]
    b .L_f30
.L_b74:
    mov r0, r6
    mov r1, r2, lsr #0x8
    mov r1, r1, lsl #0x18
    mov r1, r1, asr #0x18
    and r2, r2, #0xff
    bl func_02026d50
    ldr r0, [r6]
    add r0, r0, #0x4
    str r0, [r6]
    b .L_f30
.L_b9c:
    mov r1, r2, lsr #0x10
    mov r2, r2, lsl #0x10
    mov r0, r6
    and r1, r1, #0xff
    mov r2, r2, lsr #0x10
    bl func_020224c0
    ldr r1, [r6]
    ldr r2, [r1, #0x4]
    mov r1, #0x2c
    mla r1, r0, r1, r2
    ldrb r0, [r1, #0x10]
    strb r0, [fp, #0x8]
    ldrb r2, [r1, #0x11]
    ldr r0, _LIT1
    ldr r0, [r0, r2, lsl #0x2]
    strh r0, [fp, #0xc]
    ldrb r2, [r1, #0x12]
    ldr r0, _LIT1
    ldr r0, [r0, r2, lsl #0x2]
    strh r0, [fp, #0xe]
    ldrb r0, [r1, #0x13]
    tst r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    str r0, [fp, #0x24]
    ldr r0, [r6]
    add r0, r0, #0x8
    str r0, [r6]
    b .L_f30
.L_c10:
    mov r0, r6
    mov r1, r2, lsr #0x10
    and r1, r1, #0xff
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_020224c0
    mov r1, r0
    ldrh r0, [r7, #0x6a]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1f
    bne .L_c50
    ldr r0, [r6, #0xa4]
    ldr r2, [r6]
    add r3, fp, #0x8
    ldr r2, [r2, #0x4]
    bl func_0200bff4
.L_c50:
    ldr r0, [r6]
    add r0, r0, #0x8
    str r0, [r6]
    b .L_f30
.L_c60:
    mov r0, r6
    mov r1, r2, lsr #0x10
    and r1, r1, #0xff
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_020224c0
    mov r1, r0
    ldrh r0, [r7, #0x6a]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1f
    bne .L_c9c
    ldr r0, [r6, #0xa4]
    ldr r2, [r6]
    ldr r2, [r2, #0x4]
    bl func_0200c23c
.L_c9c:
    ldr r0, [r6]
    add r0, r0, #0x8
    str r0, [r6]
    b .L_f30
.L_cac:
    mov r1, r2, lsr #0x14
    mov r2, r2, lsl #0x10
    mov r0, r6
    and r1, r1, #0xf
    mov r2, r2, lsr #0x10
    bl func_020224c0
    ldr r2, [r6]
    mov r0, r0, lsl #0x10
    ldmia r2, {r1, r2}
    mov r1, r1, lsr #0x10
    mov r2, r2, lsl #0x10
    mov r9, r0, asr #0x10
    mov r0, r6
    and r1, r1, #0xf
    mov r2, r2, lsr #0x10
    bl func_020224c0
    mov r2, r0
    mov r1, r9
    mov r0, r6
    bl func_02026ed8
    ldr r0, [r6]
    add r0, r0, #0x8
    str r0, [r6]
    b .L_f30
.L_d0c:
    mov r1, r2, lsr #0x14
    mov r2, r2, lsl #0x10
    mov r0, r6
    and r1, r1, #0xf
    mov r2, r2, lsr #0x10
    bl func_020224c0
    ldr r2, [r6]
    mov r0, r0, lsl #0x10
    ldmia r2, {r1, r2}
    mov r1, r1, lsr #0x10
    mov r2, r2, lsl #0x10
    mov r9, r0, asr #0x10
    mov r0, r6
    and r1, r1, #0xf
    mov r2, r2, lsr #0x10
    bl func_020224c0
    mov r2, r0
    mov r1, r9
    mov r0, r6
    bl func_02026f28
    ldr r0, [r6]
    add r0, r0, #0x8
    str r0, [r6]
    b .L_f30
.L_d6c:
    mov r1, r2, lsr #0x10
    and r1, r1, #0xff
    ldr r2, [r0, #0x4]
    mov r0, r6
    mov r2, r2, lsr #0x10
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_020224c0
    mov r1, r0
    ldrh r0, [r7, #0x6a]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1f
    bne .L_dbc
    ldr r3, [r6]
    ldr r0, [r6, #0xa4]
    ldr r2, [r3, #0x8]
    ldr r3, [r3, #0x4]
    mov r3, r3, lsl #0x10
    mov r3, r3, lsr #0x10
    bl func_0200c078
.L_dbc:
    ldr r0, [r6]
    add r0, r0, #0xc
    str r0, [r6]
    b .L_f30
.L_dcc:
    mov r1, r2, lsr #0x10
    and r1, r1, #0xff
    ldr r2, [r0, #0x4]
    mov r0, r6
    mov r2, r2, lsr #0x10
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_020224c0
    mov r1, r0
    ldrh r0, [r7, #0x6a]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1f
    bne .L_e1c
    ldr r3, [r6]
    ldr r0, [r6, #0xa4]
    ldr r2, [r3, #0x8]
    ldr r3, [r3, #0x4]
    mov r3, r3, lsl #0x10
    mov r3, r3, lsr #0x10
    bl func_0200c284
.L_e1c:
    ldr r0, [r6]
    add r0, r0, #0xc
    str r0, [r6]
    b .L_f30
.L_e2c:
    mov r1, r2, lsr #0x10
    ldr r2, [r0, #0x4]
    and r1, r1, #0xff
    mov r2, r2, lsl #0x10
    mov r0, r6
    mov r2, r2, lsr #0x10
    bl func_020224c0
    str r0, [sp, #0xc]
    ldr r2, [r6]
    mov r0, r6
    ldmia r2, {r1, r2}
    mov r2, r2, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsl #0x10
    and r1, r1, #0xff
    mov r2, r2, lsr #0x10
    bl func_020224c0
    str r0, [sp, #0x10]
    ldr r2, [r6]
    mov r0, r6
    ldr r1, [r2]
    ldr r2, [r2, #0x8]
    mov r1, r1, lsr #0x10
    mov r2, r2, lsl #0x10
    and r1, r1, #0xff
    mov r2, r2, lsr #0x10
    bl func_020224c0
    str r0, [sp, #0x14]
    add r0, sp, #0xc
    bl func_02026f78
    ldr r0, [r6]
    add r0, r0, #0xc
    str r0, [r6]
    b .L_f30
.L_eb4:
    mov r1, r2, lsr #0x10
    ldr r2, [r0, #0x4]
    and r1, r1, #0xff
    mov r2, r2, lsl #0x10
    mov r0, r6
    mov r2, r2, lsr #0x10
    bl func_020224c0
    strh r0, [r7, #0x62]
    ldr r2, [r6]
    mov r0, r6
    ldmia r2, {r1, r2}
    mov r2, r2, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsl #0x10
    and r1, r1, #0xff
    mov r2, r2, lsr #0x10
    bl func_020224c0
    strh r0, [r7, #0x64]
    ldr r0, [r6]
    add r0, r0, #0x8
    str r0, [r6]
    b .L_f30
_LIT0: .word data_0219a8ec
_LIT1: .word data_020c68cc
.L_f14:
    mov r0, r6
    bl func_02025880
    cmp r0, #0x0
    ldreq r0, [r6]
    movne r4, #0x1
    addeq r0, r0, #0x4
    streq r0, [r6]
.L_f30:
    ldr r1, [r6]
    ldr r0, [sp]
    cmp r1, r0
    movne r0, #0x0
    strne r0, [r6, #0x4]
.L_f44:
    cmp r4, #0x0
    bne .L_f5c
    mov r0, r6
    bl func_02021cd8
    cmp r0, #0x0
    beq .L_40
.L_f5c:
    add r0, r6, #0x100
    ldrh r0, [r0, #0x6a]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    beq .L_1030
    ldrb r0, [r6, #0x103]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    beq .L_f90
    mov r0, r6
    add r1, r6, #0xf4
    add r2, r6, #0xac
    bl func_0202290c
.L_f90:
    ldrb r0, [r6, #0x113]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    beq .L_fb0
    mov r0, r6
    add r1, r6, #0x104
    add r2, r6, #0xb8
    bl func_0202290c
.L_fb0:
    ldrb r0, [r6, #0x123]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    beq .L_fd0
    mov r0, r6
    add r1, r6, #0x114
    add r2, r6, #0xc4
    bl func_0202290c
.L_fd0:
    ldrb r0, [r6, #0x133]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    beq .L_ff0
    mov r0, r6
    add r1, r6, #0x124
    add r2, r6, #0xd0
    bl func_0202290c
.L_ff0:
    ldrb r0, [r6, #0x143]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    beq .L_1010
    mov r0, r6
    add r1, r6, #0x134
    add r2, r6, #0xdc
    bl func_0202290c
.L_1010:
    ldrb r0, [r6, #0x153]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    beq .L_1030
    mov r0, r6
    add r1, r6, #0x144
    add r2, r6, #0xe8
    bl func_0202290c
.L_1030:
    ldr r1, [r6, #0x4]
    mov r0, #0x1
    add r1, r1, #0x1
    str r1, [r6, #0x4]
    add sp, sp, #0x50
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
