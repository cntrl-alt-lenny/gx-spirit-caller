; func_ov002_02278780 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd300
        .extern data_ov002_022cd318
        .extern data_ov002_022cd744
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf170
        .extern data_ov002_022d016c
        .extern data_ov002_022d0250
        .extern func_0202e2f8
        .extern func_ov002_021ae638
        .extern func_ov002_021b947c
        .extern func_ov002_021bad58
        .extern func_ov002_021c8470
        .extern func_ov002_021c848c
        .extern func_ov002_021c9df0
        .extern func_ov002_021d479c
        .extern func_ov002_021d59cc
        .extern func_ov002_021d90c0
        .extern func_ov002_021e276c
        .extern func_ov002_021e30b4
        .extern func_ov002_021fe3d4
        .extern func_ov002_0226b00c
        .extern func_ov002_022862cc
        .global func_ov002_02278780
        .arm
func_ov002_02278780:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0xc
    ldr r4, _LIT0
    ldr r0, [r4, #0x18]
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    cmp r0, #0x9
    addls pc, pc, r0, lsl #0x2
    b .L_1824
    b .L_980
    b .L_ab8
    b .L_bf0
    b .L_1824
    b .L_1824
    b .L_1824
    b .L_1824
    b .L_1824
    b .L_e14
    b .L_eb8
.L_980:
    ldr r0, [r4]
    mov r1, r0, lsl #0x18
    mov r1, r1, lsr #0x1e
    cmp r1, #0x2
    bne .L_a88
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c9df0
    cmp r0, #0x0
    bne .L_9b8
    ldr r0, [r4]
    bic r0, r0, #0xc0
    str r0, [r4]
    b .L_a88
.L_9b8:
    ldr r5, [r4]
    ldr r1, _LIT1
    mov r0, r5, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, [r1, r0, lsl #0x2]
    cmp r1, #0x1
    bne .L_a0c
    add r1, r4, #0x10
    str r1, [sp]
    mov r1, #0x1
    str r1, [sp, #0x4]
    ldr r1, [r4]
    ldrb r3, [r4, #0x8]
    mov r4, r1, lsl #0x9
    mov r2, r1, lsl #0x1a
    mov r1, r4, lsr #0x11
    mov r2, r2, lsr #0x1f
    bl func_ov002_022862cc
    ldr r1, _LIT2
    str r0, [r1, #0xd44]
    b .L_a88
.L_a0c:
    mov r1, r5, lsr #0x17
    movs r1, r1, lsr #0x1
    bne .L_a70
    ldr r1, _LIT3
    and r2, r0, #0x1
    mul r3, r2, r1
    ldr r2, _LIT4
    ldr r1, _LIT5
    and r5, r5, r2
    ldr r3, [r1, r3]
    ldr r1, _LIT6
    add r0, r0, r3, lsl #0x1
    orr r0, r5, r0, lsl #0x17
    mov r3, r0, lsr #0x17
    mov r7, r3, lsl #0x2
    mov r3, r0, lsl #0x9
    ldrh r6, [r1, r7]
    mov r3, r3, lsr #0x11
    mov r3, r3, lsl #0x10
    mov r5, r2, lsr #0xa
    and r6, r6, r2, lsl #0xd
    and r2, r5, r3, lsr #0x10
    orr r2, r6, r2
    str r0, [r4]
    strh r2, [r1, r7]
.L_a70:
    ldr r1, [r4]
    mov r0, #0xf7
    mov r2, r1, lsl #0x1a
    mov r1, r1, lsr #0x17
    mov r2, r2, lsr #0x1f
    bl func_ov002_021ae638
.L_a88:
    ldr r3, _LIT7
    add sp, sp, #0xc
    ldr r2, [r3]
    mov r0, #0x0
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_ab8:
    ldr r1, [r4]
    mov r0, r1, lsl #0x18
    mov r0, r0, lsr #0x1e
    cmp r0, #0x2
    bne .L_af4
    ldr r0, _LIT2
    bic r1, r1, #0xc0
    ldr r0, [r0, #0xd44]
    mov r0, r0, lsl #0x1e
    orr r1, r1, r0, lsr #0x18
    mov r0, r1, lsl #0x18
    movs r0, r0, lsr #0x1e
    str r1, [r4]
    orreq r0, r1, #0x20
    streq r0, [r4]
.L_af4:
    ldr r0, [r4]
    mov r0, r0, lsl #0x1a
    movs r0, r0, lsr #0x1f
    beq .L_b80
    ldr r0, _LIT0
    ldrh r0, [r0, #0x4]
    and r0, r0, #0x10
    cmp r0, #0x0
    ldr r0, [r4]
    movgt r1, #0x1
    movle r1, #0x0
    mov r0, r0, lsl #0x1f
    teq r1, r0, lsr #0x1f
    movne r1, #0x8000
    moveq r1, #0x0
    ldrh r0, [r4, #0x4]
    orr r5, r1, #0x60
    tst r0, #0x1
    ldr r0, [r4]
    movne r3, #0x1
    mov r1, r0, lsl #0x9
    moveq r3, #0x0
    mov r0, r0, lsl #0x18
    mov r2, r0, lsr #0x1e
    mov r1, r1, lsr #0x11
    add r3, r3, #0x5
    mov r0, r5, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r3, r3, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r3, r3, lsr #0x10
    bl func_ov002_021d479c
.L_b80:
    ldr r1, [r4]
    ldr r0, _LIT8
    mov r2, r1, lsl #0x9
    mov r2, r2, lsr #0x11
    cmp r2, r0
    bne .L_bc0
    ldr r0, _LIT0
    ldrh r0, [r0, #0x4]
    tst r0, #0x20
    beq .L_bc0
    mov r0, r1, lsl #0x1f
    mov r2, #0x1
    ldr r1, _LIT9
    mov r3, r2
    mov r0, r0, lsr #0x1f
    bl func_ov002_0226b00c
.L_bc0:
    ldr r3, _LIT7
    add sp, sp, #0xc
    ldr r2, [r3]
    mov r0, #0x0
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_bf0:
    ldr r0, [r4]
    mov r0, r0, lsl #0x9
    mov r0, r0, lsr #0x11
    bl func_0202e2f8
    cmp r0, #0x0
    beq .L_c74
    ldr r0, [r4]
    ldr r1, [r4]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    movne r0, #0x8000
    moveq r0, #0x0
    orr r2, r0, #0x48
    mov r0, r1, lsl #0x18
    mov r0, r0, lsr #0x1e
    mov r3, r0, lsl #0x1
    mov r5, r1, lsl #0x1b
    mov r0, r1, lsl #0x9
    mov r4, r1, lsl #0x1a
    mov r1, r0, lsr #0x11
    mov r0, r2, lsl #0x10
    mov r2, r1, lsl #0x10
    orr r1, r3, r4, lsr #0x1f
    mov r5, r5, lsr #0x1c
    orr r1, r1, r5, lsl #0x4
    and r1, r1, #0xff
    mov r1, r1, lsl #0x18
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r3, #0x0
    bl func_ov002_021d479c
    b .L_df4
.L_c74:
    ldr r1, [r4]
    ldr r0, _LIT10
    mov r2, r1, lsl #0x9
    cmp r0, r2, lsr #0x11
    mov r2, r2, lsr #0x11
    mov r5, #0x0
    bne .L_cac
    mov r0, r1, lsl #0x1f
    mov r1, r2, lsl #0x10
    mov r3, r5
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x10
    mov r2, #0x1
    bl func_ov002_021e276c
.L_cac:
    ldrh r0, [r4, #0x4]
    tst r0, #0x1
    beq .L_d7c
    ldr r0, [r4]
    ldr r1, _LIT11
    mov r0, r0, lsl #0x9
    cmp r1, r0, lsr #0x11
    mov r2, r0, lsr #0x11
    bcc .L_d08
    cmp r2, r1
    bcs .L_d34
    ldr r0, _LIT12
    cmp r2, r0
    bhi .L_cf8
    bcs .L_d34
    sub r0, r0, #0x1c4
    cmp r2, r0
    beq .L_d34
    b .L_d7c
.L_cf8:
    add r0, r0, #0xf9
    cmp r2, r0
    beq .L_d34
    b .L_d7c
.L_d08:
    ldr r0, _LIT13
    cmp r2, r0
    bhi .L_d28
    bcs .L_d6c
    add r0, r1, #0xf2
    cmp r2, r0
    beq .L_d4c
    b .L_d7c
.L_d28:
    add r0, r0, #0x7c
    cmp r2, r0
    bne .L_d7c
.L_d34:
    ldr r0, [r4]
    mov r0, r0, lsr #0x17
    bl func_ov002_021b947c
    mov r0, r0, lsl #0x10
    mov r5, r0, lsr #0x10
    b .L_d7c
.L_d4c:
    ldr r1, _LIT14
    ldr r0, _LIT9
    ldr r1, [r1, #0x6a8]
    cmp r1, r0
    movgt r1, r0
    mov r0, r1, lsl #0x10
    mov r5, r0, lsr #0x10
    b .L_d7c
.L_d6c:
    ldr r0, _LIT14
    ldr r0, [r0, #0x6a4]
    mov r0, r0, lsl #0x10
    mov r5, r0, lsr #0x10
.L_d7c:
    ldrh r0, [r4, #0x4]
    ldr r7, [r4]
    mov r3, r5
    and r0, r0, #0x1
    cmp r0, #0x0
    mov r2, r7, lsl #0x1f
    mov r5, r2, lsr #0x1f
    mov r0, r7, lsl #0x1b
    mov r4, r0, lsr #0x1c
    movgt r1, #0x1
    mov r0, r7, lsl #0x1a
    and r5, r5, #0x1
    mov r4, r4, lsl #0x1b
    movle r1, #0x0
    orr r4, r5, r4, lsr #0x1a
    mov r6, r0, lsr #0x1f
    mov r2, r7, lsl #0x18
    mov r0, r2, lsr #0x1e
    orr r1, r4, r1, lsl #0x6
    mov r2, r7, lsr #0x17
    mov r2, r2, lsl #0x10
    mov r5, r6, lsl #0x1f
    mov r4, r0, lsl #0x1f
    orr r0, r1, r5, lsr #0x11
    orr r0, r0, r4, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r0, #0x2d
    bl func_ov002_021d479c
.L_df4:
    ldr r1, _LIT0
    add sp, sp, #0xc
    ldr r2, [r1, #0x18]
    mov r0, #0x0
    bic r2, r2, #0xff
    orr r2, r2, #0x8
    str r2, [r1, #0x18]
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_e14:
    ldr r5, [r4]
    ldr r0, _LIT3
    mov r1, r5, lsl #0x1f
    mov r3, r1, lsr #0x1f
    ldr r1, _LIT15
    and r2, r3, #0x1
    mla r1, r2, r0, r1
    mov r0, r5, lsl #0x1b
    mov r5, r0, lsr #0x1c
    mov r0, #0x14
    mla r0, r5, r0, r1
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    addeq sp, sp, #0xc
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    cmp r3, #0x0
    movne r1, #0x8000
    ldr r0, _LIT0
    moveq r1, #0x0
    orr r1, r1, #0x45
    ldrh r2, [r0, #0x4]
    mov r0, r1, lsl #0x10
    mov r1, r5, lsl #0x10
    ldrb r3, [r4, #0x8]
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021d479c
    ldr r3, _LIT7
    add sp, sp, #0xc
    ldr r2, [r3]
    mov r0, #0x0
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_eb8:
    bl func_ov002_021fe3d4
    cmp r0, #0x0
    addne sp, sp, #0xc
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, pc}
    ldrh r2, [r4, #0x6]
    ldr r0, _LIT16
    cmp r2, r0
    bgt .L_1038
    bge .L_11ec
    ldr r3, _LIT17
    cmp r2, r3
    bgt .L_f88
    bge .L_1270
    ldr r1, _LIT18
    cmp r2, r1
    bgt .L_f44
    bge .L_124c
    sub r0, r1, #0x9d
    cmp r2, r0
    bgt .L_f20
    bge .L_1270
    sub r0, r1, #0x234
    cmp r2, r0
    beq .L_11c4
    b .L_141c
.L_f20:
    sub r0, r1, #0x77
    cmp r2, r0
    bgt .L_f34
    beq .L_11ec
    b .L_141c
.L_f34:
    sub r0, r1, #0x27
    cmp r2, r0
    beq .L_11ec
    b .L_141c
.L_f44:
    add r0, r1, #0x77
    cmp r2, r0
    bgt .L_f64
    bge .L_12d0
    add r0, r1, #0x4c
    cmp r2, r0
    beq .L_1270
    b .L_141c
.L_f64:
    add r0, r1, #0xcf
    cmp r2, r0
    bgt .L_f78
    beq .L_1270
    b .L_141c
.L_f78:
    add r0, r1, #0xfb
    cmp r2, r0
    beq .L_1270
    b .L_141c
.L_f88:
    sub r1, r0, #0xf5
    cmp r2, r1
    bgt .L_ff8
    bge .L_1270
    rsb r0, r0, #0x3140
    cmp r2, r0
    bgt .L_fd4
    ldr r0, _LIT19
    cmp r2, r0
    blt .L_fc4
    beq .L_1298
    add r0, r0, #0x4
    cmp r2, r0
    beq .L_11c4
    b .L_141c
.L_fc4:
    sub r0, r0, #0x13
    cmp r2, r0
    beq .L_1270
    b .L_141c
.L_fd4:
    ldr r0, _LIT20
    cmp r2, r0
    bgt .L_fe8
    beq .L_1298
    b .L_141c
.L_fe8:
    add r0, r0, #0x3c
    cmp r2, r0
    beq .L_1298
    b .L_141c
.L_ff8:
    sub r1, r0, #0x6d
    cmp r2, r1
    bgt .L_1018
    bge .L_1310
    sub r0, r0, #0xdc
    cmp r2, r0
    beq .L_11ec
    b .L_141c
.L_1018:
    cmp r2, #0x1900
    bgt .L_1028
    beq .L_1270
    b .L_141c
.L_1028:
    add r0, r3, #0x2a0
    cmp r2, r0
    beq .L_1270
    b .L_141c
.L_1038:
    add r1, r0, #0xf1
    cmp r2, r1
    bgt .L_112c
    bge .L_11ec
    add r1, r0, #0x8d
    cmp r2, r1
    bgt .L_10c4
    bge .L_1214
    add r1, r0, #0x25
    cmp r2, r1
    bgt .L_1098
    bge .L_11ec
    add r1, r0, #0x3
    cmp r2, r1
    bgt .L_141c
    add r1, r0, #0x1
    cmp r2, r1
    blt .L_141c
    addne r1, r0, #0x2
    cmpne r2, r1
    addne r0, r0, #0x3
    cmpne r2, r0
    beq .L_11ec
    b .L_141c
.L_1098:
    add r1, r0, #0x67
    cmp r2, r1
    bgt .L_10b4
    add r0, r0, #0x67
    cmp r2, r0
    beq .L_12f0
    b .L_141c
.L_10b4:
    add r0, r0, #0x8c
    cmp r2, r0
    beq .L_1214
    b .L_141c
.L_10c4:
    add r1, r0, #0xc1
    cmp r2, r1
    bgt .L_10e4
    bge .L_11c4
    add r0, r0, #0xc0
    cmp r2, r0
    beq .L_11c4
    b .L_141c
.L_10e4:
    add r1, r0, #0xc2
    cmp r2, r1
    bgt .L_1100
    add r0, r0, #0xc2
    cmp r2, r0
    beq .L_11c4
    b .L_141c
.L_1100:
    add r1, r0, #0xc6
    cmp r2, r1
    bgt .L_141c
    add r1, r0, #0xc3
    cmp r2, r1
    blt .L_141c
    beq .L_11c4
    add r0, r0, #0xc6
    cmp r2, r0
    beq .L_1370
    b .L_141c
.L_112c:
    ldr r1, _LIT21
    cmp r2, r1
    bgt .L_1180
    bge .L_1298
    sub r0, r1, #0x61
    cmp r2, r0
    bgt .L_115c
    bge .L_1270
    sub r0, r1, #0x77
    cmp r2, r0
    beq .L_13cc
    b .L_141c
.L_115c:
    sub r0, r1, #0x6
    cmp r2, r0
    bgt .L_1170
    beq .L_1298
    b .L_141c
.L_1170:
    sub r0, r1, #0x5
    cmp r2, r0
    beq .L_1298
    b .L_141c
.L_1180:
    add r0, r1, #0x18
    cmp r2, r0
    bgt .L_11a0
    bge .L_1270
    add r0, r1, #0x1
    cmp r2, r0
    beq .L_1298
    b .L_141c
.L_11a0:
    add r0, r1, #0x19
    cmp r2, r0
    bgt .L_11b4
    beq .L_1270
    b .L_141c
.L_11b4:
    add r0, r1, #0x4b
    cmp r2, r0
    beq .L_1270
    b .L_141c
.L_11c4:
    mov r0, #0x0
    str r0, [sp]
    ldr r0, [r4]
    mov r3, #0x5
    mov r5, r0, lsl #0x1f
    mov r1, r0, lsl #0x1b
    mov r0, r5, lsr #0x1f
    mov r1, r1, lsr #0x1c
    bl func_ov002_021d59cc
    b .L_141c
.L_11ec:
    mov r0, #0x0
    str r0, [sp]
    ldr r0, [r4]
    mov r3, #0x3
    mov r5, r0, lsl #0x1f
    mov r1, r0, lsl #0x1b
    mov r0, r5, lsr #0x1f
    mov r1, r1, lsr #0x1c
    bl func_ov002_021d59cc
    b .L_141c
.L_1214:
    ldr r0, _LIT0
    ldrh r0, [r0, #0x4]
    tst r0, #0x20
    beq .L_141c
    mov r0, #0x0
    str r0, [sp]
    ldr r0, [r4]
    mov r3, #0x3
    mov r5, r0, lsl #0x1f
    mov r1, r0, lsl #0x1b
    mov r0, r5, lsr #0x1f
    mov r1, r1, lsr #0x1c
    bl func_ov002_021d59cc
    b .L_141c
.L_124c:
    mov r3, #0x1
    str r3, [sp]
    ldr r0, [r4]
    mov r5, r0, lsl #0x1f
    mov r1, r0, lsl #0x1b
    mov r0, r5, lsr #0x1f
    mov r1, r1, lsr #0x1c
    bl func_ov002_021d59cc
    b .L_141c
.L_1270:
    mov r0, #0x0
    str r0, [sp]
    ldr r0, [r4]
    mov r3, #0x2
    mov r5, r0, lsl #0x1f
    mov r1, r0, lsl #0x1b
    mov r0, r5, lsr #0x1f
    mov r1, r1, lsr #0x1c
    bl func_ov002_021d59cc
    b .L_141c
.L_1298:
    mov r0, #0x0
    str r0, [sp]
    ldr r1, [r4]
    mov r3, #0x3
    mov r0, r1, lsl #0x9
    mov r0, r0, lsr #0x11
    mov r5, r1, lsl #0x1f
    mov r1, r1, lsl #0x1b
    mov r2, r0, lsl #0x10
    mov r0, r5, lsr #0x1f
    mov r1, r1, lsr #0x1c
    mov r2, r2, lsr #0x10
    bl func_ov002_021d59cc
    b .L_141c
.L_12d0:
    ldr r1, [r4]
    mov r0, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsl #0x1b
    mov r1, r1, lsr #0x1c
    rsb r2, r0, #0x1
    bl func_ov002_021d90c0
    b .L_141c
.L_12f0:
    ldr r0, [r4]
    mov r2, #0x1
    mov r3, r0, lsl #0x1f
    mov r1, r0, lsl #0x1b
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1c
    bl func_ov002_021d90c0
    b .L_141c
.L_1310:
    mov r0, #0x0
    str r0, [sp]
    ldr r0, [r4]
    mov r3, #0x3
    mov r1, r0, lsl #0x1b
    mov r5, r0, lsl #0x1f
    mov r0, r5, lsr #0x1f
    mov r1, r1, lsr #0x1c
    bl func_ov002_021d59cc
    ldr r0, [r4]
    mov r1, r0, lsl #0x1b
    mov r2, r0, lsl #0x1f
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x1c
    bl func_ov002_021c848c
    ldr r1, [r4]
    mov r2, r0, lsl #0x10
    mov r3, r1, lsl #0x1f
    mov r0, r3, lsr #0x1f
    mov r3, r2, lsr #0x10
    ldrh r1, [r4, #0x6]
    mov r2, #0x1
    bl func_ov002_021e276c
    b .L_141c
.L_1370:
    ldr r0, [r4]
    mov r1, r0, lsl #0x1b
    mov r2, r0, lsl #0x1f
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x1c
    bl func_ov002_021c8470
    add r0, r0, r0, lsr #0x1f
    ldr r1, _LIT9
    mov r2, r0, asr #0x1
    cmp r1, r0, asr #0x1
    movlt r2, r1
    mov r0, r2, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [sp]
    ldr r0, [r4]
    ldrh r2, [r4, #0x6]
    mov r1, r0, lsl #0x1b
    mov r3, r0, lsl #0x1f
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1c
    mov r3, #0x2
    bl func_ov002_021d59cc
    b .L_141c
.L_13cc:
    ldr r0, _LIT2
    ldr r1, [r4]
    ldr r0, [r0, #0xcec]
    mov r1, r1, lsl #0x1f
    cmp r0, r1, lsr #0x1f
    mov r0, r1, lsr #0x1f
    movne r1, #0x1
    moveq r1, #0x0
    add r1, r1, #0x1
    mov r3, #0x0
    and r1, r1, #0xff
    str r3, [sp]
    mov r1, r1, lsl #0x4
    ldr r3, [r4]
    orr r1, r1, #0x2
    mov r5, r3, lsl #0x1b
    mov r3, r1, lsl #0x10
    mov r1, r5, lsr #0x1c
    mov r3, r3, lsr #0x10
    bl func_ov002_021d59cc
.L_141c:
    ldr r0, [r4]
    mov r2, r0, lsl #0x1f
    mov r1, r0, lsl #0x1b
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x1c
    bl func_ov002_021bad58
    cmp r0, #0x0
    beq .L_17f4
    ldr r1, [r4]
    ldr r0, _LIT22
    mov r1, r1, lsl #0x9
    cmp r0, r1, lsr #0x11
    mov r1, r1, lsr #0x11
    mov r2, #0x0
    bcc .L_1570
    cmp r1, r0
    bcs .L_1648
    sub r3, r0, #0xc7
    cmp r1, r3
    bhi .L_1504
    bcs .L_1648
    sub r3, r0, #0x310
    cmp r1, r3
    bhi .L_14ac
    sub r0, r0, #0x310
    cmp r1, r0
    bcs .L_1648
    ldr r0, _LIT23
    cmp r1, r0
    bhi .L_149c
    beq .L_1648
    b .L_16c8
.L_149c:
    add r0, r0, #0xd7
    cmp r1, r0
    beq .L_1648
    b .L_16c8
.L_14ac:
    sub r3, r0, #0x190
    cmp r1, r3
    bhi .L_14d4
    sub r0, r0, #0x190
    cmp r1, r0
    bcs .L_1648
    ldr r0, _LIT24
    cmp r1, r0
    beq .L_1648
    b .L_16c8
.L_14d4:
    ldr r3, _LIT25
    cmp r1, r3
    bhi .L_16c8
    sub r0, r3, #0x4
    cmp r1, r0
    bcc .L_16c8
    beq .L_1650
    sub r0, r3, #0x3
    cmp r1, r0
    cmpne r1, r3
    beq .L_1648
    b .L_16c8
.L_1504:
    sub r3, r0, #0x43
    cmp r1, r3
    bhi .L_1540
    bcs .L_1648
    sub r3, r0, #0xa0
    cmp r1, r3
    bhi .L_1530
    sub r0, r0, #0xa0
    cmp r1, r0
    beq .L_1664
    b .L_16c8
.L_1530:
    sub r0, r0, #0x84
    cmp r1, r0
    beq .L_1648
    b .L_16c8
.L_1540:
    sub r3, r0, #0x5
    cmp r1, r3
    bhi .L_1560
    bcs .L_1648
    sub r0, r0, #0x1e
    cmp r1, r0
    beq .L_1648
    b .L_16c8
.L_1560:
    sub r0, r0, #0x1
    cmp r1, r0
    beq .L_1648
    b .L_16c8
.L_1570:
    add r3, r0, #0x1e8
    cmp r1, r3
    bhi .L_15ec
    bcs .L_1648
    ldr r5, _LIT26
    cmp r1, r5
    bhi .L_15bc
    bcs .L_1664
    add r3, r0, #0x50
    cmp r1, r3
    bhi .L_15ac
    add r0, r0, #0x50
    cmp r1, r0
    beq .L_1664
    b .L_16c8
.L_15ac:
    sub r0, r5, #0x73
    cmp r1, r0
    beq .L_1678
    b .L_16c8
.L_15bc:
    add r0, r5, #0x2a
    cmp r1, r0
    bhi .L_15dc
    bcs .L_1648
    add r0, r5, #0x19
    cmp r1, r0
    beq .L_1648
    b .L_16c8
.L_15dc:
    add r0, r5, #0x72
    cmp r1, r0
    beq .L_16a0
    b .L_16c8
.L_15ec:
    ldr r3, _LIT13
    cmp r1, r3
    bhi .L_1620
    bcs .L_16a0
    sub r0, r3, #0x49
    cmp r1, r0
    bhi .L_1610
    beq .L_16b8
    b .L_16c8
.L_1610:
    sub r0, r3, #0x26
    cmp r1, r0
    beq .L_1664
    b .L_16c8
.L_1620:
    add r0, r3, #0x44
    cmp r1, r0
    bhi .L_163c
    bcs .L_1664
    cmp r1, #0x1a80
    beq .L_1648
    b .L_16c8
.L_163c:
    add r0, r3, #0x63
    cmp r1, r0
    bne .L_16c8
.L_1648:
    mov r2, #0x1
    b .L_16c8
.L_1650:
    ldr r0, _LIT0
    ldrh r0, [r0, #0x4]
    tst r0, #0x20
    movne r2, #0x1
    b .L_16c8
.L_1664:
    ldrh r0, [r4, #0x6]
    cmp r0, r1
    moveq r2, #0x1
    movne r2, #0x0
    b .L_16c8
.L_1678:
    ldrh r0, [r4, #0x6]
    cmp r0, r1
    bne .L_1698
    ldr r0, _LIT0
    ldrh r0, [r0, #0x4]
    tst r0, #0x20
    moveq r2, #0x1
    beq .L_16c8
.L_1698:
    mov r2, #0x0
    b .L_16c8
.L_16a0:
    ldr r0, _LIT0
    ldrh r0, [r0, #0x4]
    tst r0, #0x1
    movne r2, #0x1
    moveq r2, #0x0
    b .L_16c8
.L_16b8:
    ldrh r1, [r4, #0x6]
    sub r0, r3, #0x42
    cmp r1, r0
    moveq r2, #0x1
.L_16c8:
    cmp r2, #0x0
    beq .L_17f4
    ldr r5, [r4]
    ldr r2, _LIT15
    mov r0, r5, lsl #0x1f
    mov r6, r0, lsr #0x1f
    mov r0, r5, lsl #0x1b
    mov r1, r0, lsr #0x1c
    mov r3, #0x14
    mul ip, r1, r3
    ldr r0, _LIT3
    and r6, r6, #0x1
    mla lr, r6, r0, r2
    mov r0, r5, lsl #0x18
    ldr r2, [sp, #0x8]
    add lr, lr, #0x30
    bic r2, r2, #0x200
    orr r2, r2, r6, lsl #0x9
    ldr lr, [lr, ip]
    mov r0, r0, lsr #0x1e
    mov ip, lr, lsl #0x2
    ldr r5, _LIT0
    bic r2, r2, #0x3c00
    mov r1, r1, lsl #0x1c
    orr r1, r2, r1, lsr #0x12
    orr r1, r1, #0x8000
    bic r7, r1, #0x4000
    mov r6, r0, lsl #0x1f
    mov ip, ip, lsr #0x18
    ldrh r5, [r5, #0x4]
    mov r2, lr, lsl #0x12
    mov r0, ip, lsl #0x1
    add r2, r0, r2, lsr #0x1f
    and r5, r5, #0x1
    cmp r5, #0x0
    ldr r1, _LIT27
    orr r6, r7, r6, lsr #0x11
    sub r0, r3, #0x214
    and r3, r6, r0
    and r0, r2, r1
    orr r0, r3, r0
    bic r0, r0, #0x10000
    str r0, [sp, #0x8]
    movgt r2, #0x1
    ldr r5, [r4]
    ldr r1, [sp, #0x8]
    ldrb r0, [r4, #0x9]
    mov r3, r5, lsl #0x1f
    mov r3, r3, lsr #0x1f
    mov r4, r3, lsl #0x1f
    mov r3, r5, lsl #0x1b
    and r4, r4, #-2147483648
    mov r3, r3, lsr #0x1c
    mov r5, r5, lsl #0x9
    orr r4, r4, #0x200000
    mov r3, r3, lsl #0x10
    movle r2, #0x0
    bic ip, r1, #0x20000
    mov r1, r2, lsl #0x1f
    orr r1, ip, r1, lsr #0xe
    bic r1, r1, #0xc0000
    mov r0, r0, lsl #0x1e
    orr r2, r1, r0, lsr #0xc
    mov r0, r2, lsl #0x17
    mov r0, r0, lsr #0x17
    mov r1, r0, lsl #0x10
    mov r5, r5, lsr #0x11
    orr r4, r4, #0x10000000
    and r3, r3, #0x1f0000
    mov r0, r5, lsl #0x10
    orr r3, r4, r3
    orr r0, r3, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    str r2, [sp, #0x8]
    bl func_ov002_021e30b4
.L_17f4:
    ldr r3, _LIT7
    add sp, sp, #0xc
    ldr r2, [r3]
    mov r0, #0x0
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_1824:
    mov r0, #0x1
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022cd300
_LIT1: .word data_ov002_022cd744
_LIT2: .word data_ov002_022d016c
_LIT3: .word 0x00000868
_LIT4: .word 0x007fffff
_LIT5: .word data_ov002_022cf170
_LIT6: .word data_ov002_022d0250
_LIT7: .word data_ov002_022cd318
_LIT8: .word 0x000014d5
_LIT9: .word 0x0000ffff
_LIT10: .word 0x00001578
_LIT11: .word 0x00001809
_LIT12: .word 0x00001636
_LIT13: .word 0x00001a4e
_LIT14: .word data_ov002_022ce288
_LIT15: .word data_ov002_022cf16c
_LIT16: .word 0x0000196b
_LIT17: .word 0x000016a4
_LIT18: .word 0x0000151e
_LIT19: .word 0x000017d1
_LIT20: .word 0x00001822
_LIT21: .word 0x00001adc
_LIT22: .word 0x0000180c
_LIT23: .word 0x000012b1
_LIT24: .word 0x0000164a
_LIT25: .word 0x000016fb
_LIT26: .word 0x0000197d
_LIT27: .word 0x000001ff
