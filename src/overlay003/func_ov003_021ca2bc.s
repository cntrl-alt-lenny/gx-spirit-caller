; func_ov003_021ca2bc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020b4728
        .extern data_02102c90
        .extern data_021040ac
        .extern data_02104c68
        .extern data_02104f4c
        .extern data_ov003_021cf0dc
        .extern data_ov003_021cf208
        .extern data_ov003_021cf224
        .extern data_ov003_021cf240
        .extern data_ov003_021cf260
        .extern data_ov003_021cf27c
        .extern data_ov003_021cf298
        .extern data_ov003_021cf2b4
        .extern data_ov003_021cf2c8
        .extern data_ov003_021cf2dc
        .extern data_ov003_021cf2f0
        .extern data_ov003_021cf308
        .extern data_ov003_021cf324
        .extern data_ov003_021cf338
        .extern data_ov003_021cf354
        .extern func_02001bc8
        .extern func_02001d0c
        .extern func_02001d68
        .extern func_02005088
        .extern func_020054a4
        .extern func_02006c0c
        .extern func_02006e1c
        .extern func_02011a3c
        .extern func_02011a7c
        .extern func_02018d1c
        .extern func_02018d58
        .extern func_0201d47c
        .extern func_0201e5b8
        .extern func_0201ef90
        .extern func_0202c0c0
        .extern func_02034784
        .extern func_0208deec
        .extern func_0208df0c
        .extern func_0208e1ac
        .extern func_0208e1cc
        .extern func_0208e200
        .extern func_0208e220
        .extern func_02094504
        .extern func_02094550
        .extern func_020aaddc
        .extern func_ov003_021ca254
        .extern func_ov003_021ccd20
        .extern func_ov003_021ccd80
        .extern func_ov003_021ccdb8
        .extern func_ov003_021ccdf0
        .extern func_ov003_021ccea4
        .global func_ov003_021ca2bc
        .arm
func_ov003_021ca2bc:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x630
    ldr r5, _LIT0
    add r4, sp, #0xd0
    str r0, [sp, #0x18]
    ldmia r5!, {r0, r1, r2, r3}
    stmia r4!, {r0, r1, r2, r3}
    ldmia r5, {r0, r1}
    stmia r4, {r0, r1}
    ldr r0, _LIT1
    mov r1, #0x5000000
    mov r2, #0x20
    bl func_02094550
    ldr r1, _LIT2
    add r0, sp, #0xe8
    mov r2, #0x0
    bl func_02001bc8
    ldr r1, _LIT3
    add r0, sp, #0xe8
    mov r2, #0x20
    bl func_02094550
    add r0, sp, #0x108
    bl func_0201d47c
    ldr r0, _LIT4
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    str r0, [sp, #0x108]
    add r0, sp, #0x78
    ldrh r1, [r0, #0xa4]
    mov r0, #0x180
    str r0, [sp, #0x114]
    bic r0, r1, #0xf
    orr r1, r0, #0x3
    add r0, sp, #0x78
    strh r1, [r0, #0xa4]
    mov r1, #0x60
    strh r1, [r0, #0xa0]
    add r0, sp, #0x108
    bl func_0201e5b8
    ldr r0, [sp, #0x108]
    bl func_02006e1c
    ldr r1, _LIT5
    add r0, sp, #0x108
    ldr r1, [r1, #0xc3c]
    eor r9, r1, #0x1
    bl func_0201d47c
    ldr r0, _LIT6
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    str r0, [sp, #0x108]
    add r0, sp, #0x78
    ldrh r1, [r0, #0xa4]
    mov r0, #0x200
    str r0, [sp, #0x114]
    bic r0, r1, #0xf
    orr r1, r0, #0x2
    add r0, sp, #0x78
    strh r1, [r0, #0xa4]
    mov r1, #0x0
    ldrh r2, [r0, #0xa4]
    strh r1, [r0, #0xa0]
    orr r1, r2, #0x10
    strh r1, [r0, #0xa4]
    ldr r1, [sp, #0x120]
    add r0, sp, #0x108
    bic r1, r1, #0x1c000
    orr r1, r1, #0x8000
    bic r1, r1, #0x7f
    orr r1, r1, #0xd
    bic r1, r1, #0x3f80
    orr r1, r1, #0x180
    str r1, [sp, #0x120]
    bl func_0201e5b8
    ldr r1, [sp, #0x120]
    add r0, sp, #0x78
    ldrh r2, [r0, #0xa6]
    bic r0, r1, #0x1c000
    orr r0, r0, #0x1c000
    bic r0, r0, #0x3f80
    orr r3, r2, #0x8000
    orr r2, r0, #0x400
    add r1, sp, #0x78
    add r0, sp, #0x108
    strh r3, [r1, #0xa6]
    str r2, [sp, #0x120]
    bl func_0201e5b8
    ldr r0, _LIT7
    ldr r0, [r0, r9, lsl #0x2]
    cmp r0, #0x0
    bne .L_1a8
    ldr r1, [sp, #0x120]
    add r0, sp, #0x78
    ldrh r2, [r0, #0xa6]
    bic r0, r1, #0x1c000
    orr r0, r0, #0x1c000
    bic r0, r0, #0x3f80
    orr r3, r2, #0x8000
    orr r2, r0, #0x680
    add r1, sp, #0x78
    add r0, sp, #0x108
    strh r3, [r1, #0xa6]
    str r2, [sp, #0x120]
    bl func_0201e5b8
    b .L_230
.L_1a8:
    ldr r0, [sp, #0x108]
    bl func_02006e1c
    add r0, sp, #0x108
    bl func_0201d47c
    ldr r0, _LIT8
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    add r1, sp, #0x78
    ldrh r2, [r1, #0xa4]
    ldr r1, [sp, #0x120]
    str r0, [sp, #0x108]
    bic r0, r2, #0xf
    orr r2, r0, #0x2
    add r0, sp, #0x78
    bic r1, r1, #0x1c000
    strh r2, [r0, #0xa4]
    orr r0, r1, #0x1c000
    bic r1, r0, #0x7f
    add r0, sp, #0x78
    ldrh r2, [r0, #0xa4]
    orr r0, r1, #0xd
    mov r1, #0xe80
    str r1, [sp, #0x114]
    bic r0, r0, #0x3f80
    orr r4, r2, #0x10
    orr r2, r0, #0x680
    add r1, sp, #0x78
    mov r3, #0x0
    add r0, sp, #0x108
    strh r4, [r1, #0xa4]
    strh r3, [r1, #0xa0]
    str r2, [sp, #0x120]
    bl func_0201e5b8
.L_230:
    ldr r0, [sp, #0x108]
    bl func_02006e1c
    mov r5, #0x2
    bl func_0208e1cc
    mov r6, r0
    ldr r0, _LIT9
    mov r1, #0x6
    mov r2, r5
    bl func_02001d0c
    ldr r0, _LIT10
    bl func_0202c0c0
    mov r4, r0
    bl func_0208df0c
    add r2, r0, #0x1a80
    mov r0, #0x3
    str r0, [sp]
    mov r0, #0xa
    str r0, [sp, #0x4]
    ldr r0, _LIT9
    mov r1, r4
    mov r3, r5
    bl func_02005088
    mov r0, r5
    str r0, [sp]
    mov r0, #0x1
    str r0, [sp, #0x4]
    ldr r0, [sp, #0x18]
    add r1, r6, #0xde
    mov r2, #0xd4
    mov r3, #0x6
    bl func_ov003_021ccd20
    bl func_0208e1cc
    add r4, r0, #0x1e
    ldr r0, _LIT9
    mov r1, #0x6
    mov r2, r5
    bl func_02001d0c
    ldr r0, _LIT11
    bl func_0202c0c0
    mov r6, r0
    bl func_0208df0c
    add r2, r0, #0x1c00
    mov r0, #0x3
    str r0, [sp]
    mov r0, #0xa
    str r0, [sp, #0x4]
    ldr r0, _LIT9
    mov r1, r6
    mov r3, r5
    bl func_02005088
    mov r0, r5
    str r0, [sp]
    mov r0, #0x1
    str r0, [sp, #0x4]
    ldr r0, [sp, #0x18]
    add r1, r4, #0x200
    mov r2, #0xe0
    mov r3, #0x6
    bl func_ov003_021ccd20
    ldr r0, _LIT7
    ldr r0, [r0, r9, lsl #0x2]
    cmp r0, #0x0
    bne .L_3a0
    bl func_0208e1cc
    add r4, r0, #0x5e
    ldr r0, _LIT9
    mov r1, #0x6
    mov r2, r5
    bl func_02001d0c
    ldr r0, _LIT12
    bl func_0202c0c0
    mov r5, r0
    bl func_0208df0c
    add r2, r0, #0x1d80
    mov r0, #0x3
    str r0, [sp]
    mov r0, #0xa
    str r0, [sp, #0x4]
    ldr r0, _LIT9
    mov r1, r5
    mov r3, #0x2
    bl func_02005088
    mov r0, #0x2
    str r0, [sp]
    mov r0, #0x1
    str r0, [sp, #0x4]
    ldr r0, [sp, #0x18]
    add r1, r4, #0x300
    mov r2, #0xec
    mov r3, #0x6
    bl func_ov003_021ccd20
    b .L_434
.L_3a0:
    bl func_0208e1cc
    mov r4, r0
    ldr r0, _LIT9
    mov r1, #0x6
    mov r2, #0x3
    bl func_02001d0c
    bl func_0208df0c
    add r1, r0, #0x1f00
    mov r0, #0x0
    mov r2, #0x240
    bl func_02094504
    ldr r0, _LIT13
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    mov r0, #0x6d0
    addeq r5, r5, #0x8
    bl func_0202c0c0
    mov r6, r0
    bl func_0208df0c
    add r2, r0, #0x1f00
    mov r0, #0xa
    str r0, [sp]
    str r0, [sp, #0x4]
    ldr r0, _LIT9
    mov r1, r6
    mov r3, r5
    bl func_02005088
    mov r0, #0x3
    str r0, [sp]
    mov r0, #0x1
    str r0, [sp, #0x4]
    ldr r0, [sp, #0x18]
    add r1, r4, #0x35c
    mov r2, #0xf8
    mov r3, #0x6
    bl func_ov003_021ccd20
.L_434:
    mov sl, #0x0
    bl func_0208e1cc
    add r0, r0, #0x5a
    str r0, [sp, #0x70]
    ldr r0, [sp, #0x18]
    mov r1, #0x1
    bl func_ov003_021ccd80
    mov r4, r0
    ldr r0, _LIT9
    mov r1, #0x14
    mov r2, #0x2
    bl func_02001d0c
    mov r0, r4
    mov r1, #0xc
    bl func_020054a4
    cmp r0, #0x8e
    ble .L_55c
    mov r5, sl
    mov r0, r4
    mov r6, r5
    bl func_020aaddc
    cmp r0, #0x0
    bls .L_50c
    add r8, sp, #0xb0
    mov r7, r4
    add fp, sp, #0x7c
.L_49c:
    ldrb r0, [r7]
    cmp r0, #0x20
    str r0, [sp, #0x7c]
    addeq r5, r5, #0x6
    beq .L_4c0
    mov r0, fp
    mov r1, #0xc
    bl func_020054a4
    add r5, r5, r0
.L_4c0:
    cmp r5, #0x86
    blt .L_4ec
    add r2, sp, #0xb0
    mov r1, #0x2e
    strb r1, [r2, r6]
    add r0, r6, #0x1
    strb r1, [r2, r0]
    add r0, r6, #0x2
    mov r1, #0x0
    strb r1, [r2, r0]
    b .L_50c
.L_4ec:
    ldr r1, [sp, #0x7c]
    mov r0, r4
    add r6, r6, #0x1
    strb r1, [r8], #0x1
    add r7, r7, #0x1
    bl func_020aaddc
    cmp r6, r0
    bcc .L_49c
.L_50c:
    add r0, sp, #0xb0
    mov r1, #0xc
    bl func_020054a4
    rsb r1, r0, #0x90
    cmp r1, #0x14
    addge sl, sl, #0x14
    rsblt r0, r0, #0x8e
    addlt sl, sl, r0
    bl func_0208df0c
    mov r3, r0
    mov r2, #0x1
    str r2, [sp]
    mov r4, #0xc
    add r2, r3, #0x2140
    ldr r0, _LIT9
    add r1, sp, #0xb0
    add r3, sl, #0x6
    str r4, [sp, #0x4]
    bl func_02005088
    b .L_59c
.L_55c:
    rsb r1, r0, #0x90
    cmp r1, #0x14
    addge sl, sl, #0x14
    rsblt r0, r0, #0x8e
    addlt sl, sl, r0
    bl func_0208df0c
    mov r3, r0
    mov r2, #0x1
    mov r1, r4
    str r2, [sp]
    mov r4, #0xc
    add r2, r3, #0x2140
    ldr r0, _LIT9
    add r3, sl, #0x6
    str r4, [sp, #0x4]
    bl func_02005088
.L_59c:
    ldr r1, [sp, #0x70]
    mov r2, #0x2
    str r2, [sp]
    mov r4, #0x0
    ldr r0, [sp, #0x18]
    add r1, r1, #0x100
    add r2, r2, #0x108
    mov r3, #0x14
    str r4, [sp, #0x4]
    bl func_ov003_021ccd20
    bl func_0208e1cc
    add r6, r0, #0x9a
    ldr r0, [sp, #0x18]
    mov r1, #0x1
    bl func_ov003_021ccdb8
    mov r5, r0
    ldr r0, _LIT9
    mov r1, #0x14
    mov r2, #0x2
    bl func_02001d0c
    mov r0, r5
    mov r1, #0xc
    bl func_020054a4
    cmp r0, #0x90
    ble .L_614
    mov r0, r4
    bl func_0202c0c0
    mov r1, #0xc
    mov r5, r0
    bl func_020054a4
.L_614:
    rsb r1, r0, #0x90
    cmp r1, #0x14
    addge r4, r4, #0x14
    rsblt r0, r0, #0x8e
    addlt r4, r4, r0
    bl func_0208df0c
    mov r3, r0
    mov r2, #0x1
    mov r1, r5
    str r2, [sp]
    mov r5, #0xc
    add r2, r3, #0x2640
    ldr r0, _LIT9
    add r3, r4, #0x6
    str r5, [sp, #0x4]
    bl func_02005088
    mov r2, #0x2
    str r2, [sp]
    mov r1, #0x0
    str r1, [sp, #0x4]
    ldr r0, [sp, #0x18]
    add r1, r6, #0x200
    add r2, r2, #0x130
    mov r3, #0x14
    bl func_ov003_021ccd20
    ldr r0, _LIT7
    mov r1, #0x1
    ldr r0, [r0, r9, lsl #0x2]
    cmp r0, #0x0
    bne .L_744
    ldr r0, [sp, #0x18]
    mov r6, #0x0
    bl func_ov003_021ccdf0
    mov r5, r0
    bl func_0208e1cc
    add r4, r0, #0xda
    ldr r0, _LIT9
    mov r1, #0x14
    mov r2, #0x2
    bl func_02001d0c
    mov r0, r5
    mov r1, #0xc
    bl func_020054a4
    cmp r0, #0x90
    ble .L_6dc
    mov r0, r6
    bl func_0202c0c0
    mov r1, #0xc
    mov r5, r0
    bl func_020054a4
.L_6dc:
    rsb r1, r0, #0x90
    cmp r1, #0x14
    addge r6, r6, #0x14
    rsblt r0, r0, #0x8e
    addlt r6, r6, r0
    bl func_0208df0c
    mov r3, r0
    mov r2, #0x1
    mov r1, r5
    str r2, [sp]
    mov r5, #0xc
    add r2, r3, #0x2b40
    ldr r0, _LIT9
    add r3, r6, #0x6
    str r5, [sp, #0x4]
    bl func_02005088
    mov r2, #0x2
    str r2, [sp]
    mov r5, #0x0
    ldr r0, [sp, #0x18]
    add r1, r4, #0x300
    add r2, r2, #0x158
    mov r3, #0x14
    str r5, [sp, #0x4]
    bl func_ov003_021ccd20
    b .L_804
.L_744:
    ldr r0, [sp, #0x18]
    bl func_ov003_021ccdb8
    bl func_02011a3c
    bl func_02011a7c
    bl func_02018d1c
    mov r4, r0
    cmp r4, #0x5
    mov r0, #0x0
    movgt r4, #0x5
    bl func_02001d68
    add r0, sp, #0xd0
    ldr r6, [r0, r4, lsl #0x2]
    bl func_0208e1cc
    add r4, r0, #0x6a
    ldr r0, _LIT9
    mov r1, #0xa
    mov r2, #0x3
    bl func_02001d0c
    mov r0, r6
    mov r1, #0xc
    bl func_020054a4
    mov r5, r0
    bl func_0208df0c
    rsb r2, r5, #0x50
    add r2, r2, r2, lsr #0x1f
    mov r3, r2, asr #0x1
    add r2, r0, #0x3040
    mov r0, #0x9
    str r0, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, _LIT9
    mov r1, r6
    bl func_02005088
    mov r0, #0x3
    str r0, [sp]
    mov r0, #0x0
    str r0, [sp, #0x4]
    ldr r0, [sp, #0x18]
    ldr r2, _LIT14
    add r1, r4, #0x300
    mov r3, #0xa
    bl func_ov003_021ccd20
    ldr r0, _LIT13
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d68
.L_804:
    add r0, sp, #0x108
    bl func_0201d47c
    ldr r0, _LIT15
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    mov r3, #0x40
    add r1, sp, #0x78
    ldrh r1, [r1, #0xa4]
    str r0, [sp, #0x108]
    sub r2, r3, #0x41
    bic r4, r1, #0xf
    add r1, sp, #0x78
    add r0, sp, #0x108
    strh r4, [r1, #0xa4]
    str r3, [sp, #0x114]
    strh r3, [r1, #0xa0]
    str r2, [sp, #0x110]
    bl func_0201e5b8
    ldr r0, [sp, #0x108]
    bl func_02006e1c
    bl func_0208e220
    ldr r1, _LIT16
    mov r2, #0x0
.L_864:
    add r2, r2, #0x1
    cmp r2, #0x300
    strh r1, [r0], #0x2
    blt .L_864
    ldr r3, _LIT17
    mov r4, #0x140
    str r4, [r3]
    ldr r0, _LIT1
    ldr r1, _LIT18
    mov r2, #0x20
    str r4, [r3, #0x4]
    bl func_02094550
    ldr r1, _LIT2
    add r0, sp, #0xe8
    mov r2, #0x0
    bl func_02001bc8
    ldr r1, _LIT19
    add r0, sp, #0xe8
    mov r2, #0x20
    bl func_02094550
    ldr r0, _LIT13
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d68
    add r0, sp, #0x108
    bl func_0201d47c
    ldr r0, _LIT20
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    str r0, [sp, #0x108]
    add r0, sp, #0x78
    ldrh r1, [r0, #0xa4]
    mov r0, #0x180
    str r0, [sp, #0x114]
    bic r0, r1, #0xf
    orr r1, r0, #0x8
    add r0, sp, #0x78
    strh r1, [r0, #0xa4]
    mov r1, #0x60
    strh r1, [r0, #0xa0]
    add r0, sp, #0x108
    bl func_0201e5b8
    ldr r0, [sp, #0x108]
    bl func_02006e1c
    ldr r1, _LIT5
    add r0, sp, #0x108
    ldr r8, [r1, #0xc3c]
    bl func_0201d47c
    ldr r0, _LIT21
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    str r0, [sp, #0x108]
    add r0, sp, #0x78
    ldrh r1, [r0, #0xa4]
    mov r0, #0x200
    str r0, [sp, #0x114]
    bic r0, r1, #0xf
    orr r1, r0, #0x7
    add r0, sp, #0x78
    strh r1, [r0, #0xa4]
    mov r1, #0x0
    ldrh r2, [r0, #0xa4]
    strh r1, [r0, #0xa0]
    orr r1, r2, #0x10
    strh r1, [r0, #0xa4]
    ldr r0, [sp, #0x120]
    bic r0, r0, #0x1c000
    orr r0, r0, #0x8000
    bic r0, r0, #0x7f
    orr r0, r0, #0xd
    bic r0, r0, #0x3f80
    orr r0, r0, #0x180
    str r0, [sp, #0x120]
    add r0, sp, #0x108
    bl func_0201e5b8
    add r0, sp, #0x78
    ldrh r2, [r0, #0xa6]
    ldr r1, [sp, #0x120]
    bic r0, r1, #0x1c000
    orr r0, r0, #0x1c000
    bic r0, r0, #0x3f80
    orr r3, r2, #0x8000
    orr r2, r0, #0x400
    add r1, sp, #0x78
    add r0, sp, #0x108
    strh r3, [r1, #0xa6]
    str r2, [sp, #0x120]
    bl func_0201e5b8
    ldr r0, _LIT7
    ldr r0, [r0, r8, lsl #0x2]
    cmp r0, #0x0
    bne .L_a18
    ldr r1, [sp, #0x120]
    add r0, sp, #0x78
    ldrh r2, [r0, #0xa6]
    bic r0, r1, #0x1c000
    orr r0, r0, #0x1c000
    bic r0, r0, #0x3f80
    orr r3, r2, #0x8000
    orr r2, r0, #0x680
    add r1, sp, #0x78
    add r0, sp, #0x108
    strh r3, [r1, #0xa6]
    str r2, [sp, #0x120]
    bl func_0201e5b8
    b .L_aa0
.L_a18:
    ldr r0, [sp, #0x108]
    bl func_02006e1c
    add r0, sp, #0x108
    bl func_0201d47c
    ldr r0, _LIT8
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    add r1, sp, #0x78
    ldrh r2, [r1, #0xa4]
    ldr r1, [sp, #0x120]
    str r0, [sp, #0x108]
    bic r0, r2, #0xf
    orr r2, r0, #0x7
    add r0, sp, #0x78
    bic r1, r1, #0x1c000
    strh r2, [r0, #0xa4]
    orr r0, r1, #0x1c000
    bic r1, r0, #0x7f
    add r0, sp, #0x78
    ldrh r2, [r0, #0xa4]
    orr r0, r1, #0xd
    mov r1, #0xe80
    str r1, [sp, #0x114]
    bic r0, r0, #0x3f80
    orr r4, r2, #0x10
    orr r2, r0, #0x680
    add r1, sp, #0x78
    mov r3, #0x0
    add r0, sp, #0x108
    strh r4, [r1, #0xa4]
    strh r3, [r1, #0xa0]
    str r2, [sp, #0x120]
    bl func_0201e5b8
.L_aa0:
    ldr r0, [sp, #0x108]
    bl func_02006e1c
    mov r9, #0x2
    bl func_0208e1ac
    mov r5, r0
    ldr r0, _LIT9
    mov r1, #0x6
    mov r2, r9
    bl func_02001d0c
    ldr r0, _LIT10
    bl func_0202c0c0
    mov r4, r0
    bl func_0208deec
    add r2, r0, #0x1a80
    mov r0, #0x3
    str r0, [sp]
    mov r0, #0xa
    str r0, [sp, #0x4]
    ldr r0, _LIT9
    mov r1, r4
    mov r3, r9
    bl func_02005088
    mov r0, r9
    str r0, [sp]
    mov r0, #0x1
    str r0, [sp, #0x4]
    ldr r0, [sp, #0x18]
    add r1, r5, #0xde
    mov r2, #0xd4
    mov r3, #0x6
    bl func_ov003_021ccd20
    bl func_0208e1ac
    add r4, r0, #0x1e
    ldr r0, _LIT9
    mov r1, #0x6
    mov r2, r9
    bl func_02001d0c
    ldr r0, _LIT11
    bl func_0202c0c0
    mov r5, r0
    bl func_0208deec
    add r2, r0, #0x1c00
    mov r0, #0x3
    str r0, [sp]
    mov r0, #0xa
    str r0, [sp, #0x4]
    ldr r0, _LIT9
    mov r1, r5
    mov r3, r9
    bl func_02005088
    mov r0, r9
    str r0, [sp]
    mov r0, #0x1
    str r0, [sp, #0x4]
    ldr r0, [sp, #0x18]
    add r1, r4, #0x200
    mov r2, #0xe0
    mov r3, #0x6
    bl func_ov003_021ccd20
    ldr r0, _LIT7
    ldr r0, [r0, r8, lsl #0x2]
    cmp r0, #0x0
    bne .L_c10
    bl func_0208e1ac
    add r4, r0, #0x5e
    ldr r0, _LIT9
    mov r1, #0x6
    mov r2, r9
    bl func_02001d0c
    ldr r0, _LIT12
    bl func_0202c0c0
    mov r5, r0
    bl func_0208deec
    add r2, r0, #0x1d80
    mov r0, #0x3
    str r0, [sp]
    mov r0, #0xa
    str r0, [sp, #0x4]
    ldr r0, _LIT9
    mov r1, r5
    mov r3, r9
    bl func_02005088
    mov r0, r9
    str r0, [sp]
    mov r0, #0x1
    str r0, [sp, #0x4]
    ldr r0, [sp, #0x18]
    add r1, r4, #0x300
    mov r2, #0xec
    mov r3, #0x6
    bl func_ov003_021ccd20
    b .L_ca4
.L_c10:
    bl func_0208e1ac
    mov r4, r0
    ldr r0, _LIT9
    mov r1, #0x6
    mov r2, #0x3
    bl func_02001d0c
    bl func_0208deec
    add r1, r0, #0x1f00
    mov r0, #0x0
    mov r2, #0x240
    bl func_02094504
    ldr r0, _LIT13
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    mov r0, #0x6d0
    addeq r9, r9, #0x8
    bl func_0202c0c0
    mov r5, r0
    bl func_0208deec
    add r2, r0, #0x1f00
    mov r0, #0xa
    str r0, [sp]
    str r0, [sp, #0x4]
    ldr r0, _LIT9
    mov r1, r5
    mov r3, r9
    bl func_02005088
    mov r0, #0x3
    str r0, [sp]
    mov r0, #0x1
    str r0, [sp, #0x4]
    ldr r0, [sp, #0x18]
    add r1, r4, #0x35c
    mov r2, #0xf8
    mov r3, #0x6
    bl func_ov003_021ccd20
.L_ca4:
    bl func_0208e1ac
    add r0, r0, #0x5a
    str r0, [sp, #0x74]
    ldr r0, [sp, #0x18]
    mov r1, #0x0
    bl func_ov003_021ccd80
    mov sl, r0
    ldr r0, _LIT9
    mov r1, #0x14
    mov r2, #0x2
    bl func_02001d0c
    mov r0, sl
    mov r1, #0xc
    bl func_020054a4
    cmp r0, #0x8e
    ble .L_dc8
    mov r4, #0x0
    mov r0, sl
    mov r5, r4
    bl func_020aaddc
    cmp r0, #0x0
    bls .L_d78
    add r7, sp, #0x90
    mov r6, sl
    add fp, sp, #0x78
.L_d08:
    ldrb r0, [r6]
    cmp r0, #0x20
    str r0, [sp, #0x78]
    addeq r4, r4, #0x6
    beq .L_d2c
    mov r0, fp
    mov r1, #0xc
    bl func_020054a4
    add r4, r4, r0
.L_d2c:
    cmp r4, #0x86
    blt .L_d58
    add r2, sp, #0x90
    mov r1, #0x2e
    strb r1, [r2, r5]
    add r0, r5, #0x1
    strb r1, [r2, r0]
    add r0, r5, #0x2
    mov r1, #0x0
    strb r1, [r2, r0]
    b .L_d78
.L_d58:
    ldr r1, [sp, #0x78]
    mov r0, sl
    add r5, r5, #0x1
    strb r1, [r7], #0x1
    add r6, r6, #0x1
    bl func_020aaddc
    cmp r5, r0
    bcc .L_d08
.L_d78:
    add r0, sp, #0x90
    mov r1, #0xc
    bl func_020054a4
    rsb r1, r0, #0x90
    cmp r1, #0x14
    addge r9, r9, #0x14
    rsblt r0, r0, #0x8e
    addlt r9, r9, r0
    bl func_0208deec
    mov r3, r0
    mov r2, #0x1
    str r2, [sp]
    mov r4, #0xc
    add r2, r3, #0x2140
    ldr r0, _LIT9
    add r1, sp, #0x90
    add r3, r9, #0x6
    str r4, [sp, #0x4]
    bl func_02005088
    b .L_e08
.L_dc8:
    rsb r1, r0, #0x90
    cmp r1, #0x14
    addge r9, r9, #0x14
    rsblt r0, r0, #0x8e
    addlt r9, r9, r0
    bl func_0208deec
    mov r3, r0
    mov r2, #0x1
    str r2, [sp]
    mov r4, #0xc
    add r2, r3, #0x2140
    ldr r0, _LIT9
    mov r1, sl
    add r3, r9, #0x6
    str r4, [sp, #0x4]
    bl func_02005088
.L_e08:
    ldr r1, [sp, #0x74]
    mov r2, #0x2
    str r2, [sp]
    mov r4, #0x0
    ldr r0, [sp, #0x18]
    add r1, r1, #0x100
    add r2, r2, #0x108
    mov r3, #0x14
    str r4, [sp, #0x4]
    bl func_ov003_021ccd20
    bl func_0208e1ac
    add r6, r0, #0x9a
    ldr r0, [sp, #0x18]
    mov r1, r4
    bl func_ov003_021ccdb8
    mov r5, r0
    ldr r0, _LIT9
    mov r1, #0x14
    mov r2, #0x2
    bl func_02001d0c
    mov r0, r5
    mov r1, #0xc
    bl func_020054a4
    cmp r0, #0x90
    ble .L_e80
    mov r0, r4
    bl func_0202c0c0
    mov r1, #0xc
    mov r5, r0
    bl func_020054a4
.L_e80:
    rsb r1, r0, #0x90
    cmp r1, #0x14
    addge r4, r4, #0x14
    rsblt r0, r0, #0x8e
    addlt r4, r4, r0
    bl func_0208deec
    mov r3, r0
    mov r2, #0x1
    mov r1, r5
    str r2, [sp]
    mov r5, #0xc
    add r2, r3, #0x2640
    ldr r0, _LIT9
    add r3, r4, #0x6
    str r5, [sp, #0x4]
    bl func_02005088
    mov r2, #0x2
    str r2, [sp]
    mov r1, #0x0
    str r1, [sp, #0x4]
    ldr r0, [sp, #0x18]
    add r1, r6, #0x200
    add r2, r2, #0x130
    mov r3, #0x14
    bl func_ov003_021ccd20
    ldr r0, _LIT7
    ldr r0, [r0, r8, lsl #0x2]
    cmp r0, #0x0
    bne .L_1008
    mov r6, #0x0
    ldr r0, [sp, #0x18]
    mov r1, r6
    bl func_ov003_021ccdf0
    mov r5, r0
    bl func_0208e1ac
    add r4, r0, #0xda
    ldr r0, _LIT9
    mov r1, #0x14
    mov r2, #0x2
    bl func_02001d0c
    mov r0, r5
    mov r1, #0xc
    bl func_020054a4
    cmp r0, #0x90
    ble .L_f48
    mov r0, r6
    bl func_0202c0c0
    mov r1, #0xc
    mov r5, r0
    bl func_020054a4
.L_f48:
    rsb r1, r0, #0x90
    cmp r1, #0x14
    addge r6, r6, #0x14
    rsblt r0, r0, #0x8e
    addlt r6, r6, r0
    bl func_0208deec
    mov r3, r0
    mov r2, #0x1
    mov r1, r5
    str r2, [sp]
    mov r5, #0xc
    add r2, r3, #0x2b40
    ldr r0, _LIT9
    add r3, r6, #0x6
    str r5, [sp, #0x4]
    bl func_02005088
    mov r2, #0x2
    str r2, [sp]
    mov r5, #0x0
    ldr r0, [sp, #0x18]
    add r1, r4, #0x300
    add r2, r2, #0x158
    mov r3, #0x14
    str r5, [sp, #0x4]
    bl func_ov003_021ccd20
    b .L_10b8
_LIT0: .word data_ov003_021cf0dc
_LIT1: .word data_020b4728
_LIT2: .word 0x000003ff
_LIT3: .word 0x05000020
_LIT4: .word data_ov003_021cf208
_LIT5: .word data_021040ac
_LIT6: .word data_ov003_021cf224
_LIT7: .word data_02104c68
_LIT8: .word data_ov003_021cf240
_LIT9: .word data_02102c90
_LIT10: .word 0x000006cc
_LIT11: .word 0x000006cd
_LIT12: .word 0x000006ce
_LIT13: .word data_02104f4c
_LIT14: .word 0x00000182
_LIT15: .word data_ov003_021cf260
_LIT16: .word 0x0000200a
_LIT17: .word 0x04000014
_LIT18: .word 0x05000400
_LIT19: .word 0x05000420
_LIT20: .word data_ov003_021cf27c
_LIT21: .word data_ov003_021cf298
.L_1008:
    bl func_02018d58
    mov r4, r0
    cmp r4, #0x5
    mov r0, #0x0
    movgt r4, #0x5
    bl func_02001d68
    add r0, sp, #0xd0
    ldr r6, [r0, r4, lsl #0x2]
    bl func_0208e1ac
    add r4, r0, #0x6a
    ldr r0, _LIT9
    mov r1, #0xa
    mov r2, #0x3
    bl func_02001d0c
    mov r0, r6
    mov r1, #0xc
    bl func_020054a4
    mov r5, r0
    bl func_0208deec
    rsb r2, r5, #0x50
    add r2, r2, r2, lsr #0x1f
    mov r3, r2, asr #0x1
    add r2, r0, #0x3040
    mov r0, #0x9
    str r0, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, _LIT9
    mov r1, r6
    bl func_02005088
    mov r0, #0x3
    str r0, [sp]
    mov r0, #0x0
    str r0, [sp, #0x4]
    ldr r0, [sp, #0x18]
    ldr r2, _LIT14
    add r1, r4, #0x300
    mov r3, #0xa
    bl func_ov003_021ccd20
    ldr r0, _LIT13
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d68
.L_10b8:
    add r0, sp, #0x108
    bl func_0201d47c
    ldr r0, _LIT15
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    mov r3, #0x40
    add r1, sp, #0x78
    sub r2, r3, #0x41
    ldrh r1, [r1, #0xa4]
    str r0, [sp, #0x108]
    str r3, [sp, #0x114]
    bic r0, r1, #0xf
    orr r4, r0, #0x5
    add r1, sp, #0x78
    add r0, sp, #0x108
    strh r4, [r1, #0xa4]
    strh r3, [r1, #0xa0]
    str r2, [sp, #0x110]
    bl func_0201e5b8
    ldr r0, [sp, #0x108]
    bl func_02006e1c
    bl func_0208e200
    ldr r1, _LIT16
    mov r2, #0x0
.L_111c:
    add r2, r2, #0x1
    cmp r2, #0x300
    strh r1, [r0], #0x2
    blt .L_111c
    ldr r0, _LIT22
    mov r1, #0x140
    str r1, [r0]
    str r1, [r0, #0x4]
    add r6, sp, #0x530
    add r5, sp, #0x570
    add r4, sp, #0x5b0
    add r3, sp, #0x5f0
    add r1, sp, #0x130
    mov r0, #0x0
    mov r2, #0x400
    str r6, [sp, #0x80]
    str r5, [sp, #0x84]
    str r4, [sp, #0x88]
    str r3, [sp, #0x8c]
    bl func_02094504
    ldr r0, _LIT9
    mov r1, #0x10
    mov r2, #0x2
    bl func_02001d0c
    mov r0, #0xcd
    bl func_0202c0c0
    mov r3, #0x2
    mov r1, r0
    str r3, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, _LIT9
    add r2, sp, #0x130
    bl func_02005088
    mov r3, #0x6400000
    mov r6, #0x0
    mov r0, r3
    add r0, r0, #0x400
    mov r2, #0x6600000
    str r0, [sp, #0x58]
    add r0, r2, #0x400
    mov r7, r6
    mov r8, r6
    add fp, r3, #0x400
    str r0, [sp, #0x5c]
    str r0, [sp, #0x60]
.L_11d4:
    mov r0, r8, lsl #0x8
    add r5, r0, r0, lsr #0x1f
    add r0, sp, #0x130
    add r4, r7, r7, lsr #0x1f
    add r9, r0, r5, asr #0x1
    mov r0, r9
    add r1, fp, r4, asr #0x1
    mov r2, #0x80
    bl func_02094550
    add r0, sp, #0x330
    add sl, r0, r5, asr #0x1
    add r0, r6, #0x1
    mov r0, r0, lsl #0x8
    add r5, r0, r0, lsr #0x1f
    ldr r1, [sp, #0x58]
    mov r0, sl
    add r1, r1, r5, asr #0x1
    mov r2, #0x80
    bl func_02094550
    ldr r1, [sp, #0x5c]
    mov r0, r9
    add r1, r1, r4, asr #0x1
    mov r2, #0x80
    bl func_02094550
    ldr r1, [sp, #0x60]
    mov r0, sl
    add r1, r1, r5, asr #0x1
    mov r2, #0x80
    bl func_02094550
    add r6, r6, #0x2
    add r7, r7, #0x200
    add r8, r8, #0x1
    cmp r6, #0x8
    blt .L_11d4
    add r1, sp, #0x130
    mov r0, #0x0
    mov r2, #0x400
    bl func_02094504
    ldr r0, _LIT9
    mov r1, #0x10
    mov r2, #0x2
    bl func_02001d0c
    mov r0, #0xce
    bl func_0202c0c0
    mov r3, #0x2
    mov r1, r0
    str r3, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, _LIT9
    add r2, sp, #0x130
    bl func_02005088
    mov r3, #0x6400000
    mov r6, #0x0
    mov r0, r3
    add r0, r0, #0x800
    mov r2, #0x6600000
    str r0, [sp, #0x64]
    add r0, r2, #0x800
    mov r7, r6
    mov r8, r6
    add fp, r3, #0x800
    str r0, [sp, #0x68]
    str r0, [sp, #0x6c]
.L_12d4:
    mov r0, r8, lsl #0x8
    add r5, r0, r0, lsr #0x1f
    add r0, sp, #0x130
    add r4, r7, r7, lsr #0x1f
    add r9, r0, r5, asr #0x1
    mov r0, r9
    add r1, fp, r4, asr #0x1
    mov r2, #0x80
    bl func_02094550
    add r0, sp, #0x330
    add sl, r0, r5, asr #0x1
    add r0, r6, #0x1
    mov r0, r0, lsl #0x8
    add r5, r0, r0, lsr #0x1f
    ldr r1, [sp, #0x64]
    mov r0, sl
    add r1, r1, r5, asr #0x1
    mov r2, #0x80
    bl func_02094550
    ldr r1, [sp, #0x68]
    mov r0, r9
    add r1, r1, r4, asr #0x1
    mov r2, #0x80
    bl func_02094550
    ldr r1, [sp, #0x6c]
    mov r0, sl
    add r1, r1, r5, asr #0x1
    mov r2, #0x80
    bl func_02094550
    add r6, r6, #0x2
    add r7, r7, #0x200
    add r8, r8, #0x1
    cmp r6, #0x8
    blt .L_12d4
    ldr r0, _LIT1
    ldr r1, _LIT23
    mov r2, #0x20
    bl func_02094550
    ldr r0, _LIT1
    ldr r1, _LIT24
    mov r2, #0x20
    bl func_02094550
    ldr r1, _LIT2
    add r0, sp, #0xe8
    mov r2, #0x0
    bl func_02001bc8
    ldr r1, _LIT25
    add r0, sp, #0xe8
    mov r2, #0x20
    bl func_02094550
    ldr r1, _LIT26
    add r0, sp, #0xe8
    mov r2, #0x20
    bl func_02094550
    ldr r0, [sp, #0x18]
    mov r5, #0x0
    add fp, r0, #0x11c
    add r0, r0, #0xf4
    str r0, [sp, #0x54]
    ldr r0, [sp, #0x18]
    add r4, sp, #0x80
    add r0, r0, #0xf0
    str r0, [sp, #0x50]
    ldr r0, [sp, #0x18]
    add r0, r0, #0xec
    str r0, [sp, #0x4c]
    ldr r0, [sp, #0x18]
    add r6, r0, #0xe4
    add r0, r0, #0xd4
    str r0, [sp, #0x48]
    ldr r0, [sp, #0x18]
    add r0, r0, #0xd0
    str r0, [sp, #0x44]
    ldr r0, [sp, #0x18]
    add r0, r0, #0xcc
    str r0, [sp, #0x40]
    ldr r0, [sp, #0x18]
    add r7, r0, #0xc4
    add r0, r0, #0xc0
    str r0, [sp, #0x3c]
    ldr r0, [sp, #0x18]
    add r0, r0, #0xbc
    str r0, [sp, #0x38]
    ldr r0, [sp, #0x18]
    add r0, r0, #0xb8
    str r0, [sp, #0x34]
    ldr r0, [sp, #0x18]
    add r8, r0, #0x50
    add r0, r0, #0x40
    str r0, [sp, #0x30]
    ldr r0, [sp, #0x18]
    add r0, r0, #0x3c
    str r0, [sp, #0x2c]
    ldr r0, [sp, #0x18]
    add r0, r0, #0x38
    str r0, [sp, #0x28]
    ldr r0, [sp, #0x18]
    add r9, r0, #0x70
    add r0, r0, #0x60
    str r0, [sp, #0x24]
    ldr r0, [sp, #0x18]
    add r0, r0, #0x5c
    str r0, [sp, #0x20]
    ldr r0, [sp, #0x18]
    add r0, r0, #0x58
    str r0, [sp, #0x1c]
.L_147c:
    ldr r0, [sp, #0x18]
    cmp r5, #0x0
    movgt sl, #0x1
    mov r1, r5
    movle sl, #0x2
    bl func_ov003_021ccea4
    ldr r1, _LIT27
    mov r0, r4
    bl func_ov003_021ca254
    mov r0, #0xa0
    stmia sp, {r0, sl}
    str r4, [sp, #0x8]
    mov r0, #0x0
    str r0, [sp, #0xc]
    mov r0, #0x20
    str r0, [sp, #0x10]
    ldr r0, [sp, #0x4c]
    ldr r1, [sp, #0x50]
    ldr r2, [sp, #0x54]
    mov r3, #0x3400
    str fp, [sp, #0x14]
    bl func_0201ef90
    ldr r1, _LIT28
    mov r0, r4
    bl func_ov003_021ca254
    mov r0, #0x40
    stmia sp, {r0, sl}
    str r4, [sp, #0x8]
    mov r0, #0x0
    str r0, [sp, #0xc]
    mov r0, #0x40
    str r0, [sp, #0x10]
    ldr r0, [sp, #0x40]
    ldr r1, [sp, #0x44]
    ldr r2, [sp, #0x48]
    mov r3, #0x2000
    str r6, [sp, #0x14]
    bl func_0201ef90
    ldr r1, _LIT29
    mov r0, r4
    bl func_ov003_021ca254
    mov r0, #0x80
    stmia sp, {r0, sl}
    str r4, [sp, #0x8]
    mov r0, #0x0
    str r0, [sp, #0xc]
    mov r0, #0x20
    str r0, [sp, #0x10]
    ldr r0, [sp, #0x34]
    ldr r1, [sp, #0x38]
    ldr r2, [sp, #0x3c]
    mov r3, #0x2800
    str r7, [sp, #0x14]
    bl func_0201ef90
    ldr r1, _LIT30
    mov r0, r4
    bl func_ov003_021ca254
    mov r0, #0xc0
    stmia sp, {r0, sl}
    str r4, [sp, #0x8]
    mov r0, #0x0
    str r0, [sp, #0xc]
    mov r0, #0x40
    str r0, [sp, #0x10]
    ldr r0, [sp, #0x28]
    ldr r1, [sp, #0x2c]
    ldr r2, [sp, #0x30]
    mov r3, #0x4c00
    str r8, [sp, #0x14]
    bl func_0201ef90
    ldr r1, _LIT31
    mov r0, r4
    bl func_ov003_021ca254
    mov r0, #0x100
    stmia sp, {r0, sl}
    str r4, [sp, #0x8]
    mov r0, #0x0
    str r0, [sp, #0xc]
    mov r0, #0x40
    str r0, [sp, #0x10]
    ldr r0, [sp, #0x1c]
    ldr r1, [sp, #0x20]
    ldr r2, [sp, #0x24]
    mov r3, #0x5600
    str r9, [sp, #0x14]
    bl func_0201ef90
    ldr r0, [sp, #0x54]
    add r5, r5, #0x1
    add r0, r0, #0x6c
    str r0, [sp, #0x54]
    ldr r0, [sp, #0x50]
    add fp, fp, #0x6c
    add r0, r0, #0x6c
    str r0, [sp, #0x50]
    ldr r0, [sp, #0x4c]
    add r6, r6, #0x6c
    add r0, r0, #0x6c
    str r0, [sp, #0x4c]
    ldr r0, [sp, #0x48]
    add r7, r7, #0x6c
    add r0, r0, #0x6c
    str r0, [sp, #0x48]
    ldr r0, [sp, #0x44]
    add r8, r8, #0x40
    add r0, r0, #0x6c
    str r0, [sp, #0x44]
    ldr r0, [sp, #0x40]
    add r9, r9, #0x40
    add r0, r0, #0x6c
    str r0, [sp, #0x40]
    ldr r0, [sp, #0x3c]
    cmp r5, #0x2
    add r0, r0, #0x6c
    str r0, [sp, #0x3c]
    ldr r0, [sp, #0x38]
    add r0, r0, #0x6c
    str r0, [sp, #0x38]
    ldr r0, [sp, #0x34]
    add r0, r0, #0x6c
    str r0, [sp, #0x34]
    ldr r0, [sp, #0x30]
    add r0, r0, #0x40
    str r0, [sp, #0x30]
    ldr r0, [sp, #0x2c]
    add r0, r0, #0x40
    str r0, [sp, #0x2c]
    ldr r0, [sp, #0x28]
    add r0, r0, #0x40
    str r0, [sp, #0x28]
    ldr r0, [sp, #0x24]
    add r0, r0, #0x40
    str r0, [sp, #0x24]
    ldr r0, [sp, #0x20]
    add r0, r0, #0x40
    str r0, [sp, #0x20]
    ldr r0, [sp, #0x1c]
    add r0, r0, #0x40
    str r0, [sp, #0x1c]
    blt .L_147c
    ldr r1, _LIT32
    add r0, sp, #0x80
    bl func_ov003_021ca254
    mov r2, #0x0
    str r2, [sp]
    mov r1, #0x2
    str r1, [sp, #0x4]
    add r0, sp, #0x80
    str r0, [sp, #0x8]
    str r2, [sp, #0xc]
    mov r0, #0x40
    str r0, [sp, #0x10]
    ldr r0, [sp, #0x18]
    ldr r1, [sp, #0x18]
    add r4, r0, #0x30
    ldr r2, [sp, #0x18]
    add r0, r0, #0x1c
    add r1, r1, #0x20
    add r2, r2, #0x24
    mov r3, #0xc00
    str r4, [sp, #0x14]
    bl func_0201ef90
    add r0, sp, #0x108
    bl func_0201d47c
    bl func_02034784
    cmp r0, #0x2
    ldreq r0, _LIT33
    ldrne r0, _LIT34
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    add r1, sp, #0x78
    ldrh r1, [r1, #0xa4]
    str r0, [sp, #0x108]
    mov r3, #0x0
    bic r0, r1, #0xf
    orr r1, r0, #0x4
    add r0, sp, #0x78
    strh r1, [r0, #0xa4]
    ldrh r1, [r0, #0xa4]
    add r0, sp, #0x108
    str r3, [sp, #0x110]
    orr r2, r1, #0x10
    add r1, sp, #0x78
    strh r2, [r1, #0xa4]
    str r3, [sp, #0x114]
    strh r3, [r1, #0xa0]
    bl func_0201e5b8
    add r0, sp, #0x78
    ldrh r1, [r0, #0xa4]
    add r0, sp, #0x108
    bic r1, r1, #0xf
    orr r2, r1, #0x9
    add r1, sp, #0x78
    strh r2, [r1, #0xa4]
    bl func_0201e5b8
    ldr r0, [sp, #0x108]
    bl func_02006e1c
    ldr r0, [sp, #0x18]
    mvn r1, #0xaf
    mov r2, #0x4000000
    str r1, [r0, #0x18]
    ldr r0, [r2]
    add r1, r2, #0x1000
    bic r0, r0, #0x1f00
    orr r0, r0, #0x1f00
    str r0, [r2]
    ldr r0, [r1]
    ldr r5, _LIT35
    bic r0, r0, #0x1f00
    orr r0, r0, #0x1f00
    str r0, [r1]
    ldr r3, [r2]
    ldrh r0, [r2, #0x48]
    and r3, r3, #0x1f00
    bic r0, r0, #0x3f
    orr r0, r0, r3, lsr #0x8
    strh r0, [r2, #0x48]
    ldr r3, [r1]
    ldrh r0, [r2, #0x4a]
    and r3, r3, #0x1f00
    mov r4, r3, lsr #0x8
    bic r3, r0, #0x3f
    bic r0, r4, #0x10
    orr r0, r3, r0
    orr r0, r0, #0x20
    strh r0, [r2, #0x4a]
    ldr r3, [r2]
    ldrh r0, [r5]
    and r3, r3, #0x1f00
    bic r0, r0, #0x3f
    orr r0, r0, r3, lsr #0x8
    strh r0, [r5]
    ldr r3, [r1]
    ldrh r0, [r5, #0x2]
    and r3, r3, #0x1f00
    mov r4, r3, lsr #0x8
    bic r3, r0, #0x3f
    bic r0, r4, #0x10
    orr r0, r3, r0
    orr r0, r0, #0x20
    strh r0, [r5, #0x2]
    mov r3, #0x80
    strh r3, [r2, #0x40]
    mov r0, #0xc0
    strh r0, [r2, #0x44]
    strh r3, [r5, #-8]
    strh r0, [r5, #-4]
    ldr r3, [r2]
    mov r0, #0x1
    bic r3, r3, #0xe000
    orr r3, r3, #0x2000
    str r3, [r2]
    ldr r2, [r1]
    bic r2, r2, #0xe000
    orr r2, r2, #0x2000
    str r2, [r1]
    add sp, sp, #0x630
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT22: .word 0x04001014
_LIT23: .word 0x05000340
_LIT24: .word 0x05000740
_LIT25: .word 0x05000360
_LIT26: .word 0x05000760
_LIT27: .word data_ov003_021cf2b4
_LIT28: .word data_ov003_021cf2c8
_LIT29: .word data_ov003_021cf2dc
_LIT30: .word data_ov003_021cf2f0
_LIT31: .word data_ov003_021cf308
_LIT32: .word data_ov003_021cf324
_LIT33: .word data_ov003_021cf338
_LIT34: .word data_ov003_021cf354
_LIT35: .word 0x04001048
