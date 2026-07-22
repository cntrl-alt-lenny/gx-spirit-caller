; func_ov010_021b72c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Copy32
        .extern Fill32
        .extern Task_PostLocked
        .extern data_020c3f4c
        .extern data_021040ac
        .extern data_02104f4c
        .extern data_021067f4
        .extern data_ov000_021b1db4
        .extern data_ov000_021b1ddc
        .extern data_ov010_021b8908
        .extern data_ov010_021b8928
        .extern data_ov010_021b8c2c
        .extern data_ov010_021b9884
        .extern data_ov010_021b9890
        .extern data_ov010_021b98a8
        .extern data_ov010_021b98cc
        .extern data_ov010_021b9a64
        .extern func_02001bc8
        .extern func_02005bfc
        .extern func_0200a7a4
        .extern func_0202adf8
        .extern func_0202c0c0
        .extern func_0207f138
        .extern func_0207f420
        .extern func_0208d030
        .extern func_0208d0bc
        .extern func_0208d138
        .extern func_02094504
        .extern Strlen
        .extern func_020a6afc
        .extern func_ov005_021aaf08
        .extern func_ov005_021aaf6c
        .extern func_ov005_021ab0fc
        .extern func_ov005_021ab260
        .extern func_ov005_021ab274
        .extern func_ov005_021ab2e0
        .extern func_ov005_021ab318
        .extern func_ov005_021ab32c
        .extern func_ov005_021ab354
        .extern func_ov005_021ab384
        .extern func_ov005_021ab3a0
        .extern func_ov005_021ab3b4
        .extern func_ov005_021ab3e8
        .extern func_ov005_021acacc
        .extern func_ov005_021acad4
        .extern func_ov010_021b235c
        .extern func_ov010_021b2864
        .extern func_ov010_021b691c
        .extern func_ov010_021b6a00
        .extern func_ov010_021b6b58
        .extern func_ov010_021b6c00
        .global func_ov010_021b72c0
        .arm
func_ov010_021b72c0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x30
    ldr r3, _LIT0
    ldr r7, _LIT1
    ldr r0, [r3]
    mov r1, r7
    bic r0, r0, #0x1f00
    str r0, [r3]
    mov r0, #0x0
    mov r2, #0x35c
    strh r0, [r3, #0x50]
    bl Fill32
    ldr r3, _LIT2
    mvn r4, #0x0
    ldr r1, _LIT3
    mov r0, #0x200
    mov r2, #0x400
    str r4, [r3, #0x1c]
    bl func_02094504
    ldr r1, _LIT4
    mov r0, #0x0
    mov r2, #0x400
    bl func_02094504
    mov r0, #0x4
    bl func_0208d138
    mov r0, #0x8
    bl func_0208d0bc
    mov r0, #0x80
    bl func_0208d030
    ldr r3, _LIT5
    ldr r0, _LIT6
    ldrh r2, [r3]
    add r1, r0, #0x77
    ldr r0, _LIT7
    and r2, r2, #0x43
    orr r2, r2, #0xd10
    strh r2, [r3]
    ldrh r4, [r3, #0x2]
    mov r2, #0xff
    and r4, r4, #0x43
    orr r4, r4, #0xf00
    strh r4, [r3, #0x2]
    ldrh r4, [r3, #0x4]
    and r4, r4, #0x43
    orr r4, r4, #0x388
    orr r4, r4, #0x1c00
    strh r4, [r3, #0x4]
    ldrh r4, [r3, #0x6]
    and r4, r4, #0x43
    orr r4, r4, #0x388
    orr r4, r4, #0x1c00
    strh r4, [r3, #0x6]
    bl func_02001bc8
    ldr r0, _LIT8
    ldr r1, _LIT9
    mov r2, #0x100
    bl func_02001bc8
    ldr r0, _LIT10
    bl func_0202adf8
    ldr r0, _LIT11
    ldr r1, _LIT2
    ldr r2, [r0, #0x4]
    mov r0, #0x2
    mov r2, r2, lsl #0x1d
    mov r2, r2, lsr #0x1d
    str r2, [r1, #0x1e0]
    bl func_02005bfc
    ldr r2, _LIT0
    ldr r0, _LIT12
    ldr r1, [r2]
    and r0, r1, r0
    orr r0, r0, #0x10
    orr r0, r0, #0x200000
    str r0, [r2]
    bl func_0207f420
    ldr r0, _LIT13
    mov r1, #0x0
    mov r2, #0x80
    mov r3, #0x1
    bl func_0207f138
    ldr r4, _LIT5
    mov r2, #0x0
    ldrh r3, [r4]
    ldr r0, _LIT14
    ldr r1, _LIT2
    bic r3, r3, #0x40
    strh r3, [r4]
    strb r2, [r4, #0x44]
    strb r2, [r4, #0x45]
    str r0, [r1, #0x40]
    bl func_ov010_021b235c
    ldr r0, _LIT15
    bl func_ov010_021b2864
    ldr r0, _LIT16
    ldr r1, _LIT2
    ldr r2, _LIT17
    str r0, [r1, #0x90]
    str r2, [r1, #0x94]
    ldr r1, _LIT18
    ldrh r3, [r1, #0x8]
    ldrh r2, [r1, #0xa]
    strh r3, [sp, #0x8]
    strh r2, [sp, #0xa]
    ldrh r2, [r1, #0xc]
    ldrh r1, [r1, #0xe]
    strh r2, [sp, #0xc]
    strh r1, [sp, #0xe]
    bl func_ov005_021aaf08
    ldr r0, _LIT2
    ldr r1, _LIT19
    ldr r0, [r0, #0x90]
    ldr r1, [r1]
    bl func_ov005_021aaf6c
    add r0, sp, #0x10
    bl func_0200a7a4
    ldr r1, _LIT20
    add r0, sp, #0x10
    mov r2, #0x8
    bl Copy32
    ldr r0, _LIT2
    mov fp, #0x1
    ldr r0, [r0, #0x90]
    bl func_ov005_021ab0fc
    cmp r0, #0x1
    blt .L_a54
.L_868:
    ldr r0, [r7, #0x84]
    mov r1, fp
    bl func_ov005_021ab3a0
    ldr r0, [r7, #0x84]
    mov r1, fp
    bl func_ov005_021ab3b4
    ldr r0, _LIT2
    mov r1, fp
    ldr r0, [r0, #0x90]
    bl func_ov005_021ab3b4
    mov r2, r0, lsl #0x10
    ldr r0, [r7, #0x84]
    mov r1, fp
    mov r5, r2, lsr #0x10
    bl func_ov005_021ab260
    cmp r0, #0x0
    bne .L_a1c
    add r0, sp, #0x10
    mov r4, r5, asr #0x5
    and r1, r5, #0x1f
    mov r6, #0x1
    mov r5, r6, lsl r1
    ldr r0, [r0, r4, lsl #0x2]
    mov r1, fp
    tst r5, r0
    ldr r0, [r7, #0x84]
    moveq r6, #0x0
    bl func_ov005_021ab318
    mov r8, r0
    cmp r6, #0x1
    bne .L_a1c
    ldr r0, [r7, #0x84]
    mov r1, fp
    mov r2, #0x1
    bl func_ov005_021ab32c
    cmp r8, #0x0
    beq .L_924
    mov r6, #0x1
.L_900:
    ldr r0, [r7, #0x84]
    mov r1, r8
    mov r2, r6
    bl func_ov005_021ab32c
    ldr r0, [r7, #0x84]
    mov r1, r8
    bl func_ov005_021ab318
    movs r8, r0
    bne .L_900
.L_924:
    ldr r0, [r7, #0x84]
    mov r1, fp
    bl func_ov005_021ab318
    ldr r1, _LIT11
    mov sl, r0
    add r0, r1, r4, lsl #0x2
    add r0, r0, #0x1000
    ldr r0, [r0, #0x8b0]
    mov r2, #0x8
    tst r5, r0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    ldr r0, [r7, #0x84]
    mov r1, fp
    bne .L_96c
    bl func_ov005_021ab32c
    b .L_970
.L_96c:
    bl func_ov005_021ab354
.L_970:
    cmp sl, #0x0
    beq .L_a1c
    mov r4, #0x1
    add r6, sp, #0x24
    mov r5, #0x8
.L_984:
    ldr r0, [r7, #0x84]
    mov r1, sl
    mov r2, r6
    mov r8, #0x0
    bl func_ov005_021ab274
    movs r9, r0
    beq .L_9e8
.L_9a0:
    ldr r0, [r7, #0x84]
    mov r1, r9
    mov r2, r5
    bl func_ov005_021ab384
    cmp r0, #0x0
    beq .L_9d4
    ldr r0, [r7, #0x84]
    mov r1, r9
    mov r2, r4
    bl func_ov005_021ab384
    cmp r0, #0x0
    movne r8, #0x1
    bne .L_9e8
.L_9d4:
    ldr r0, [r7, #0x84]
    mov r1, r6
    bl func_ov005_021ab2e0
    movs r9, r0
    bne .L_9a0
.L_9e8:
    cmp r8, #0x1
    ldr r0, [r7, #0x84]
    mov r2, #0x8
    mov r1, sl
    bne .L_a04
    bl func_ov005_021ab32c
    b .L_a08
.L_a04:
    bl func_ov005_021ab354
.L_a08:
    ldr r0, [r7, #0x84]
    mov r1, sl
    bl func_ov005_021ab318
    movs sl, r0
    bne .L_984
.L_a1c:
    ldr r0, [r7, #0x84]
    mov r1, fp
    bl func_ov005_021ab260
    cmp r0, #0x0
    ble .L_a40
    ldr r0, [r7, #0x84]
    mov r1, fp
    mov r2, #0x2
    bl func_ov005_021ab354
.L_a40:
    ldr r0, [r7, #0x84]
    add fp, fp, #0x1
    bl func_ov005_021ab0fc
    cmp fp, r0
    ble .L_868
.L_a54:
    mov r4, #0x0
    mov r5, r4
.L_a5c:
    add r0, r5, #0x3e4
    add r1, r7, r5, lsl #0x2
    add r0, r0, #0x400
    str r4, [r1, #0x210]
    bl func_0202c0c0
    bl Strlen
    add r0, r4, r0
    add r0, r0, #0x4
    add r5, r5, #0x1
    cmp r5, #0x4d
    bic r4, r0, #0x3
    blt .L_a5c
    mov r0, r4
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    mov r1, r0
    mov r2, r4
    mov r0, #0x0
    str r1, [r7, #0x344]
    bl Fill32
    ldr r0, _LIT21
    mov r6, #0x0
    add r4, sp, #0x18
    ldmia r0, {r0, r1, r2}
    stmia r4, {r0, r1, r2}
    mov r5, r6
.L_ac8:
    ldr r0, [r4, r5, lsl #0x2]
    add r1, r7, r5, lsl #0x2
    str r6, [r1, #0x348]
    bl func_0202c0c0
    bl Strlen
    add r0, r6, r0
    add r0, r0, #0x4
    add r5, r5, #0x1
    cmp r5, #0x3
    bic r6, r0, #0x3
    blt .L_ac8
    mov r0, r6
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    mov r1, r0
    mov r2, r6
    mov r0, #0x0
    str r1, [r7, #0x354]
    bl Fill32
    mov r4, #0x0
.L_b1c:
    add r0, r4, #0x3e4
    add r0, r0, #0x400
    bl func_0202c0c0
    add r1, r7, r4, lsl #0x2
    ldr r3, [r7, #0x344]
    ldr r2, [r1, #0x210]
    mov r1, r0
    add r0, r3, r2
    bl func_020a6afc
    add r4, r4, #0x1
    cmp r4, #0x4d
    blt .L_b1c
    mov r5, #0x0
    add r4, sp, #0x18
.L_b54:
    ldr r0, [r4, r5, lsl #0x2]
    bl func_0202c0c0
    add r1, r7, r5, lsl #0x2
    ldr r3, [r7, #0x354]
    ldr r2, [r1, #0x348]
    mov r1, r0
    add r0, r3, r2
    bl func_020a6afc
    add r5, r5, #0x1
    cmp r5, #0x3
    blt .L_b54
    mov r1, #0xf
    ldr r0, _LIT22
    str r1, [sp]
    str r0, [sp, #0x4]
    ldr r0, [r7, #0x88]
    ldr r1, [r7, #0x84]
    add r2, sp, #0x8
    mov r3, #0x0
    bl func_ov005_021ab3e8
    ldr r2, [r7, #0x88]
    ldr r1, _LIT23
    ldrh r0, [r2, #0x5c]
    bic r0, r0, #0x3c0
    orr r0, r0, #0x80
    strh r0, [r2, #0x5c]
    ldr r0, [r7, #0x88]
    bl func_ov005_021acacc
    ldr r0, [r7, #0x88]
    ldr r1, _LIT24
    bl func_ov005_021acad4
    ldr r0, _LIT25
    ldr r0, [r0, #0xb9c]
    cmp r0, #0x0
    beq .L_cd4
    ldr r0, [r7, #0x84]
    mov r5, #0x0
    mov r4, #0x1
    bl func_ov005_021ab0fc
    cmp r0, #0x1
    blt .L_c6c
    ldr r6, _LIT25
    ldr r8, _LIT2
.L_c00:
    ldr r0, [r7, #0x84]
    mov r1, r4
    bl func_ov005_021ab3a0
    mov r9, r0
    ldr r0, [r7, #0x84]
    mov r1, r4
    bl func_ov005_021ab3b4
    ldr r0, [r8, #0x90]
    mov r1, r4
    bl func_ov005_021ab3b4
    mov r0, r0, lsl #0x10
    cmp r9, #0x0
    mov r1, r0, lsr #0x10
    beq .L_c58
    ldr r0, [r6, #0xb8c]
    cmp r1, r0
    bne .L_c58
    ldr r0, [r7, #0x84]
    mov r1, r4
    bl func_ov010_021b691c
    add r5, r5, r0
    b .L_c6c
.L_c58:
    ldr r0, [r7, #0x84]
    add r4, r4, #0x1
    bl func_ov005_021ab0fc
    cmp r4, r0
    ble .L_c00
.L_c6c:
    ldr r0, [r7, #0x84]
    bl func_ov005_021ab0fc
    cmp r4, r0
    bgt .L_cc8
    ldr r0, [r7, #0x84]
    mov r1, r4
    bl func_ov005_021ab318
    movs r6, r0
    beq .L_cc8
    mov r4, #0x2
.L_c94:
    ldr r0, [r7, #0x84]
    mov r1, r6
    mov r2, r4
    bl func_ov005_021ab32c
    ldr r0, [r7, #0x84]
    mov r1, r6
    bl func_ov010_021b691c
    add r5, r5, r0
    ldr r0, [r7, #0x84]
    mov r1, r6
    bl func_ov005_021ab318
    movs r6, r0
    bne .L_c94
.L_cc8:
    ldr r0, _LIT25
    mov r1, #0x0
    str r1, [r0, #0xb9c]
.L_cd4:
    mov r0, #0x0
    str r0, [r7]
    mov r0, #0x1
    add sp, sp, #0x30
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x04001000
_LIT1: .word data_ov010_021b9890
_LIT2: .word data_ov010_021b9884
_LIT3: .word 0x07000400
_LIT4: .word 0x05000400
_LIT5: .word 0x04001008
_LIT6: .word 0x00001f88
_LIT7: .word 0x05000420
_LIT8: .word 0x050005a0
_LIT9: .word 0x00001fff
_LIT10: .word data_ov010_021b9a64
_LIT11: .word data_02104f4c
_LIT12: .word 0xffcfffef
_LIT13: .word data_ov010_021b98a8
_LIT14: .word data_ov010_021b8c2c
_LIT15: .word data_ov010_021b98cc
_LIT16: .word data_ov000_021b1db4
_LIT17: .word data_ov000_021b1ddc
_LIT18: .word data_ov010_021b8908
_LIT19: .word data_020c3f4c
_LIT20: .word data_021067f4
_LIT21: .word data_ov010_021b8928
_LIT22: .word func_ov010_021b6a00
_LIT23: .word func_ov010_021b6b58
_LIT24: .word func_ov010_021b6c00
_LIT25: .word data_021040ac
