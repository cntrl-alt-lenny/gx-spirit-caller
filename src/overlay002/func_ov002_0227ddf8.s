; func_ov002_0227ddf8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern data_ov002_022cd524
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern data_ov002_022cf17c
        .extern data_ov002_022cf1a2
        .extern func_ov002_021bb068
        .extern func_ov002_021bbf50
        .extern func_ov002_021bcf00
        .extern func_ov002_021c3bdc
        .extern func_ov002_021c3c50
        .extern func_ov002_021c8470
        .extern func_ov002_021ca3f0
        .extern func_ov002_021feb08
        .extern func_ov002_0223f6c4
        .extern func_ov002_022536e8
        .extern func_ov002_022576d8
        .extern func_ov002_02257ab8
        .extern func_ov002_0227b090
        .extern func_ov002_0227db10
        .extern func_ov002_0227dce4
        .extern func_ov002_0227dd6c
        .extern func_ov002_02280df4
        .extern func_ov002_0228c864
        .extern func_ov002_0228dde0
        .extern func_ov002_02296fa4
        .global func_ov002_0227ddf8
        .arm
func_ov002_0227ddf8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x2c
    mov r4, r0
    ldrh r3, [r4, #0x2]
    ldr r1, _LIT0
    ldr ip, _LIT1
    mov r2, r3, lsl #0x11
    mov r3, r3, lsl #0x1f
    mov r2, r2, lsr #0x1f
    eor r5, r2, r3, lsr #0x1f
    str r5, [r1]
    ldrh r1, [r4]
    cmp r1, ip
    bgt .L_7e8
    bge .L_c54
    ldr r3, _LIT2
    cmp r1, r3
    bgt .L_708
    bge .L_da4
    ldr r2, _LIT3
    cmp r1, r2
    bgt .L_674
    sub r3, r2, #0x2
    cmp r1, r3
    blt .L_620
    mov r0, r3
    cmp r1, r0
    cmpne r1, r2
    beq .L_c0c
    b .L_ecc
.L_620:
    cmp r1, #0x1200
    bgt .L_650
    bge .L_9fc
    ldr r0, _LIT4
    cmp r1, r0
    bgt .L_640
    beq .L_99c
    b .L_ecc
.L_640:
    add r0, r0, #0xab
    cmp r1, r0
    beq .L_b74
    b .L_ecc
.L_650:
    sub r0, r2, #0xa2
    cmp r1, r0
    bgt .L_664
    beq .L_c54
    b .L_ecc
.L_664:
    sub r0, r2, #0x92
    cmp r1, r0
    beq .L_9b8
    b .L_ecc
.L_674:
    add r6, r2, #0x35
    cmp r1, r6
    bgt .L_6d0
    mov r0, r6
    cmp r1, r0
    bge .L_c54
    add r0, r2, #0x7
    cmp r1, r0
    bgt .L_6a0
    beq .L_c0c
    b .L_ecc
.L_6a0:
    add r0, r2, #0xd
    cmp r1, r0
    bgt .L_ecc
    add r0, r2, #0x9
    cmp r1, r0
    blt .L_ecc
    addne r0, r2, #0xa
    cmpne r1, r0
    addne r0, r2, #0xd
    cmpne r1, r0
    beq .L_c0c
    b .L_ecc
.L_6d0:
    add r6, r2, #0xae
    cmp r1, r6
    bgt .L_6f8
    mov r3, r6
    cmp r1, r3
    bge .L_a24
    add r0, r2, #0x68
    cmp r1, r0
    beq .L_c54
    b .L_ecc
.L_6f8:
    sub r0, r3, #0x19
    cmp r1, r0
    beq .L_b04
    b .L_ecc
.L_708:
    ldr r2, _LIT5
    cmp r1, r2
    bgt .L_77c
    bge .L_e20
    add r0, r3, #0xf2
    cmp r1, r0
    bgt .L_74c
    bge .L_c54
    add r0, r3, #0x6b
    cmp r1, r0
    bgt .L_73c
    beq .L_c54
    b .L_ecc
.L_73c:
    add r0, r3, #0xcf
    cmp r1, r0
    beq .L_bd4
    b .L_ecc
.L_74c:
    sub r0, r2, #0x76
    cmp r1, r0
    bgt .L_76c
    bge .L_a54
    sub r0, r2, #0xbb
    cmp r1, r0
    beq .L_c54
    b .L_ecc
.L_76c:
    sub r0, r2, #0x2
    cmp r1, r0
    beq .L_c80
    b .L_ecc
.L_77c:
    sub r3, ip, #0x25
    cmp r1, r3
    bgt .L_7b8
    bge .L_b90
    add r3, r2, #0x90
    cmp r1, r3
    bgt .L_7a8
    add r2, r2, #0x90
    cmp r1, r2
    beq .L_e48
    b .L_ecc
.L_7a8:
    add r0, r2, #0xf8
    cmp r1, r0
    beq .L_c54
    b .L_ecc
.L_7b8:
    add r0, r2, #0x118
    cmp r1, r0
    bgt .L_7d8
    bge .L_c54
    sub r0, ip, #0x24
    cmp r1, r0
    beq .L_c80
    b .L_ecc
.L_7d8:
    sub r0, ip, #0x21
    cmp r1, r0
    beq .L_c54
    b .L_ecc
.L_7e8:
    ldr r2, _LIT6
    cmp r1, r2
    bgt .L_8c4
    bge .L_dec
    add r0, ip, #0x60
    cmp r1, r0
    bgt .L_860
    bge .L_c54
    add r0, ip, #0x1f
    cmp r1, r0
    bgt .L_83c
    bge .L_c80
    add r0, ip, #0x4
    cmp r1, r0
    bgt .L_82c
    beq .L_c54
    b .L_ecc
.L_82c:
    sub r0, r2, #0x178
    cmp r1, r0
    beq .L_c54
    b .L_ecc
.L_83c:
    add r0, ip, #0x36
    cmp r1, r0
    bgt .L_850
    beq .L_c54
    b .L_ecc
.L_850:
    add r0, ip, #0x5a
    cmp r1, r0
    beq .L_c80
    b .L_ecc
.L_860:
    sub r0, r2, #0x6b
    cmp r1, r0
    bgt .L_894
    bge .L_c54
    sub r0, r2, #0xa4
    cmp r1, r0
    bgt .L_884
    beq .L_bb8
    b .L_ecc
.L_884:
    sub r0, r2, #0x90
    cmp r1, r0
    beq .L_c0c
    b .L_ecc
.L_894:
    sub r0, r2, #0x35
    cmp r1, r0
    bgt .L_8b4
    bge .L_c54
    sub r0, r2, #0x4b
    cmp r1, r0
    beq .L_c0c
    b .L_ecc
.L_8b4:
    sub r0, r2, #0x1d
    cmp r1, r0
    beq .L_d2c
    b .L_ecc
.L_8c4:
    add r0, r2, #0xe9
    cmp r1, r0
    bgt .L_938
    bge .L_e78
    add r0, r2, #0x4f
    cmp r1, r0
    bgt .L_908
    bge .L_c80
    add r0, r2, #0x41
    cmp r1, r0
    bgt .L_8f8
    beq .L_c54
    b .L_ecc
.L_8f8:
    add r0, r2, #0x47
    cmp r1, r0
    beq .L_b3c
    b .L_ecc
.L_908:
    add r0, r2, #0x96
    cmp r1, r0
    bgt .L_928
    bge .L_c54
    add r0, r2, #0x50
    cmp r1, r0
    beq .L_c80
    b .L_ecc
.L_928:
    add r0, r2, #0xdd
    cmp r1, r0
    beq .L_e84
    b .L_ecc
.L_938:
    add r0, ip, #0x290
    cmp r1, r0
    bgt .L_96c
    bge .L_da4
    add r0, r2, #0xea
    cmp r1, r0
    bgt .L_95c
    beq .L_e78
    b .L_ecc
.L_95c:
    add r0, r2, #0xeb
    cmp r1, r0
    beq .L_e78
    b .L_ecc
.L_96c:
    ldr r0, _LIT7
    cmp r1, r0
    bgt .L_98c
    bge .L_e78
    sub r0, r0, #0x1
    cmp r1, r0
    beq .L_e78
    b .L_ecc
.L_98c:
    add r0, r0, #0x1
    cmp r1, r0
    beq .L_e78
    b .L_ecc
.L_99c:
    mov r0, r5
    bl func_ov002_021bbf50
    cmp r0, #0x1
    movgt r0, #0x1
    add sp, sp, #0x2c
    movle r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_9b8:
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT8
    ldr r3, _LIT9
    mov r2, r1, lsl #0x1f
    mov r2, r2, lsr #0x1f
    and r4, r2, #0x1
    mov r1, r1, lsl #0x1a
    mov r2, r1, lsr #0x1b
    mov r1, #0x14
    mul r1, r2, r1
    mla r0, r4, r0, r3
    ldrh r0, [r1, r0]
    add sp, sp, #0x2c
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_9fc:
    ldrh r1, [r4, #0x2]
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_02257ab8
    cmp r0, #0x0
    movgt r0, #0x1
    add sp, sp, #0x2c
    movle r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_a24:
    ldrh r1, [r4, #0x2]
    mvn r2, #0x0
    mov r3, #0x0
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_02280df4
    cmp r0, #0x0
    movge r0, #0x1
    add sp, sp, #0x2c
    movlt r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_a54:
    ldr r6, _LIT10
    ldmia r6, {r2, r3}
    cmp r2, r3
    beq .L_af8
    ldrh r5, [r4, #0x2]
    ldrh r7, [r4, #0x4]
    ldr r0, _LIT11
    mov r1, r5, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r4, _LIT8
    and r8, r1, #0x1
    mov r5, r5, lsl #0x1a
    mla sl, r8, r4, r0
    mov r8, r5, lsr #0x1b
    mov r5, #0x14
    mul r9, r8, r5
    add r8, sl, #0x30
    ldr r8, [r8, r9]
    mov r9, r7, lsl #0x11
    mov r7, r8, lsl #0x2
    mov r7, r7, lsr #0x18
    mov r8, r8, lsl #0x12
    mov r7, r7, lsl #0x1
    mov r9, r9, lsr #0x17
    add r7, r7, r8, lsr #0x1f
    cmp r9, r7
    addne sp, sp, #0x2c
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
    cmp r1, r2
    bne .L_af8
    and r1, r3, #0x1
    mla r0, r1, r4, r0
    ldr r1, [r6, #0x20]
    mla r0, r1, r5, r0
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    addne sp, sp, #0x2c
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_af8:
    add sp, sp, #0x2c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_b04:
    ldrh r2, [r4, #0x2]
    ldr r0, _LIT8
    ldr r1, _LIT11
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    and r2, r2, #0x1
    mul r0, r2, r0
    ldr r1, [r1, r0]
    sub r0, r3, #0x330
    cmp r1, r0
    movge r0, #0x1
    add sp, sp, #0x2c
    movlt r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_b3c:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca3f0
    cmp r0, #0x0
    addeq sp, sp, #0x2c
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r0, _LIT12
    bl func_ov002_021bb068
    cmp r0, #0x0
    addne sp, sp, #0x2c
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_b74:
    mov r0, r4
    bl func_ov002_021feb08
    cmp r0, #0x0
    moveq r0, #0x1
    add sp, sp, #0x2c
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_b90:
    ldrh r1, [r4, #0x2]
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_02257ab8
    cmp r0, #0x0
    movgt r0, #0x1
    add sp, sp, #0x2c
    movle r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_bb8:
    rsb r0, r5, #0x1
    bl func_ov002_021bcf00
    cmp r0, #0x0
    movgt r0, #0x1
    add sp, sp, #0x2c
    movle r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_bd4:
    ldrh r2, [r4, #0x2]
    ldr r0, _LIT8
    ldr r1, _LIT11
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    and r2, r2, #0x1
    mla r0, r2, r0, r1
    ldr r0, [r0, #0xf8]
    add sp, sp, #0x2c
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_c0c:
    ldr r1, _LIT13
    rsb r0, r5, #0x1
    bl func_ov002_0227dd6c
    cmp r0, #0x0
    addne sp, sp, #0x2c
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
    mov r0, r4
    bl func_ov002_0223f6c4
    mov r2, r0
    ldrh r1, [r4]
    mov r0, r5
    bl func_ov002_022536e8
    cmp r0, #0x0
    movgt r0, #0x1
    add sp, sp, #0x2c
    movle r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_c54:
    mov r0, r4
    bl func_ov002_0223f6c4
    mov r2, r0
    ldrh r1, [r4]
    mov r0, r5
    bl func_ov002_022536e8
    cmp r0, #0x0
    movgt r0, #0x1
    add sp, sp, #0x2c
    movle r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_c80:
    ldrh r0, [r4, #0x2]
    mov r6, #0x0
    mov r1, r0, lsl #0x1a
    mov r2, r0, lsl #0x1f
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021c8470
    rsb sl, r5, #0x1
    ldr r3, _LIT11
    ldr r1, _LIT8
    and r2, sl, #0x1
    mla r9, r2, r1, r3
    mov r7, r0
    add r8, r9, #0x30
    mov r5, r6
    add r4, sp, #0x0
.L_cc0:
    ldr r0, [r8]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_d04
    mov r0, sl
    mov r1, r5
    mov r2, r4
    bl func_ov002_0227b090
    ldrh r0, [r9, #0x36]
    cmp r0, #0x0
    ldrne r0, [sp, #0x18]
    ldreq r0, [sp, #0x14]
    cmp r7, r0
    addgt sp, sp, #0x2c
    movgt r0, #0x1
    ldmgtia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
    add r6, r6, #0x1
.L_d04:
    add r5, r5, #0x1
    cmp r5, #0x4
    add r8, r8, #0x14
    add r9, r9, #0x14
    ble .L_cc0
    cmp r6, #0x0
    moveq r0, #0x1
    add sp, sp, #0x2c
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_d2c:
    ldr r0, _LIT8
    and r2, r5, #0x1
    mul r1, r2, r0
    ldr r0, _LIT14
    mov r4, #0x0
    ldr r0, [r0, r1]
    cmp r0, #0x0
    bls .L_d98
    ldr r0, _LIT11
    mov r5, r4
    add r7, r0, r1
    add r6, r7, #0x120
.L_d5c:
    ldr r0, [r6]
    mov r1, r5
    mov r0, r0, lsl #0x13
    mov r2, r5
    mov r0, r0, lsr #0x13
    bl func_ov002_0227db10
    cmp r0, #0x0
    addne sp, sp, #0x2c
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r0, [r7, #0xc]
    add r4, r4, #0x1
    cmp r4, r0
    add r6, r6, #0x4
    bcc .L_d5c
.L_d98:
    add sp, sp, #0x2c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_da4:
    mov r0, r4
    bl func_ov002_0223f6c4
    mov r2, r0
    ldrh r1, [r4]
    mov r0, r5
    bl func_ov002_022536e8
    cmp r0, #0x0
    beq .L_de0
    mov r0, r5
    bl func_ov002_021c3bdc
    cmp r0, #0x2
    movlt r0, #0x1
    add sp, sp, #0x2c
    movge r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_de0:
    add sp, sp, #0x2c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_dec:
    ldr r1, _LIT8
    and r2, r5, #0x1
    mul r3, r2, r1
    ldr r1, _LIT15
    ldr r1, [r1, r3]
    cmp r1, #0x1
    addeq sp, sp, #0x2c
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
    mov r1, #0x0
    bl func_ov002_02296fa4
    add sp, sp, #0x2c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_e20:
    ldr r0, _LIT8
    and r1, r5, #0x1
    mul r2, r1, r0
    ldr r0, _LIT15
    add sp, sp, #0x2c
    ldr r0, [r0, r2]
    cmp r0, #0x5
    movcs r0, #0x1
    movcc r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_e48:
    bl func_ov002_022576d8
    ldrh r3, [r4, #0x2]
    mov r1, r0
    ldr r2, _LIT16
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0228c864
    cmp r0, #0x0
    movge r0, #0x1
    add sp, sp, #0x2c
    movlt r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_e78:
    add sp, sp, #0x2c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_e84:
    ldrh r0, [r4, #0x2]
    mov r1, #0x5
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c3c50
    cmp r0, #0x0
    addne sp, sp, #0x2c
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c3bdc
    cmp r0, #0x3
    movge r0, #0x1
    add sp, sp, #0x2c
    movlt r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_ecc:
    mov r0, #0x1
    add sp, sp, #0x2c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov002_022cd524
_LIT1: .word 0x00001807
_LIT2: .word 0x000014c4
_LIT3: .word 0x00001335
_LIT4: .word 0x000010d6
_LIT5: .word 0x000016cd
_LIT6: .word 0x00001984
_LIT7: .word 0x00001b4d
_LIT8: .word 0x00000868
_LIT9: .word data_ov002_022cf1a2
_LIT10: .word data_ov002_022cd3f4
_LIT11: .word data_ov002_022cf16c
_LIT12: .word 0x00001398
_LIT13: .word func_ov002_0227dce4
_LIT14: .word data_ov002_022cf178
_LIT15: .word data_ov002_022cf17c
_LIT16: .word func_ov002_0228dde0
