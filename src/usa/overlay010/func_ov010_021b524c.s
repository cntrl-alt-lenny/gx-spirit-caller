; func_ov010_021b524c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Copy32
        .extern Fill32
        .extern Task_PostLocked
        .extern data_020c3e74
        .extern data_021023bc
        .extern data_02104e6c
        .extern data_ov000_021b1cb4
        .extern data_ov000_021b1cdc
        .extern data_ov010_021b8770
        .extern data_ov010_021b87c0
        .extern data_ov010_021b8b2c
        .extern data_ov010_021b90c0
        .extern data_ov010_021b9160
        .extern func_02001ba8
        .extern func_02005be0
        .extern func_0200a46c
        .extern func_0202c06c
        .extern func_0207f050
        .extern func_0207f338
        .extern func_0208cf48
        .extern func_0208cfd4
        .extern func_0208d050
        .extern func_0208f1c0
        .extern func_0208f20c
        .extern func_0208f280
        .extern func_0209281c
        .extern func_02094410
        .extern func_020a690c
        .extern func_020a6a08
        .extern func_ov000_021ac9cc
        .extern func_ov005_021aae28
        .extern func_ov005_021aae8c
        .extern func_ov005_021ab01c
        .extern func_ov005_021ab180
        .extern func_ov005_021ab24c
        .extern func_ov005_021ab274
        .extern func_ov005_021ab2d4
        .extern func_ov005_021ab308
        .extern func_ov005_021ac9c4
        .extern func_ov010_021b225c
        .extern func_ov010_021b2764
        .extern func_ov010_021b4094
        .extern func_ov010_021b411c
        .extern func_ov010_021b45a8
        .extern func_ov010_021b4650
        .extern func_ov010_021b466c
        .global func_ov010_021b524c
        .arm
func_ov010_021b524c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xb4
    ldr r3, _LIT0
    ldr r7, _LIT1
    ldr r0, [r3]
    mov r1, r7
    bic r4, r0, #0x1f00
    mov r0, #0x0
    mov r2, #0x224
    str r4, [r3]
    bl Fill32
    ldr r1, _LIT2
    mov r0, #0x200
    mov r2, #0x400
    bl func_02094410
    ldr r1, _LIT3
    mov r0, #0x0
    mov r2, #0x400
    bl func_02094410
    mov r0, #0x4
    bl func_0208d050
    mov r0, #0x8
    bl func_0208cfd4
    mov r0, #0x80
    bl func_0208cf48
    ldr r3, _LIT4
    ldr r0, _LIT5
    ldrh r4, [r3]
    ldr r1, _LIT6
    mov r2, #0x1f
    and r4, r4, #0x43
    orr r4, r4, #0xd10
    strh r4, [r3]
    ldrh r4, [r3, #0x2]
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
    bl func_02001ba8
    ldr r0, _LIT7
    ldr r1, _LIT8
    mov r2, #0x1f
    bl func_02001ba8
    ldr r4, _LIT9
    add r3, sp, #0x54
    mov r2, #0x10
.L_5bc:
    ldrh r1, [r4]
    ldrh r0, [r4, #0x2]
    add r4, r4, #0x4
    strh r1, [r3]
    strh r0, [r3, #0x2]
    add r3, r3, #0x4
    subs r2, r2, #0x1
    bne .L_5bc
    ldr r1, _LIT10
    mvn r2, #0x0
    ldr r0, [r1]
    str r0, [sp, #0x8]
    str r2, [r1]
    bl func_0208f280
    mov r8, #0x0
    mov r4, #0x20
    mov r9, r8
    mov sl, #0x100
    add r6, sp, #0x94
    add r5, sp, #0x54
    mov fp, r4
.L_610:
    mov r1, r9, lsl #0x1
    add r0, r5, r9, lsl #0x1
    ldrh r1, [r5, r1]
    ldrh r2, [r0, #0x2]
    mov r0, r6
    bl func_02001ba8
    mov r0, r6
    mov r1, r4
    bl func_0209281c
    mov r0, r6
    mov r1, sl
    mov r2, fp
    bl func_0208f20c
    add r9, r9, #0x2
    add sl, sl, #0x20
    add r8, r8, #0x1
    cmp r8, #0x8
    blt .L_610
    bl func_0208f1c0
    ldr r2, _LIT10
    ldr r1, [sp, #0x8]
    mov r0, #0x2
    str r1, [r2]
    bl func_02005be0
    ldr r2, _LIT0
    ldr r0, _LIT11
    ldr r1, [r2]
    and r0, r1, r0
    orr r0, r0, #0x10
    orr r0, r0, #0x200000
    str r0, [r2]
    bl func_0207f338
    add r0, r7, #0x10
    mov r1, #0x0
    mov r2, #0x80
    mov r3, #0x1
    bl func_0207f050
    ldr r3, _LIT4
    mov r1, #0x0
    ldrh r2, [r3]
    ldr r0, _LIT12
    bic r2, r2, #0x40
    strh r2, [r3]
    strb r1, [r3, #0x44]
    strb r1, [r3, #0x45]
    str r0, [r7, #0x2c]
    bl func_ov010_021b225c
    ldr r1, [r7, #0x2c]
    mov r2, #0x0
    add r0, r7, #0x34
    str r2, [r1, #0xc]
    bl func_ov010_021b2764
    add r0, r7, #0x58
    bl func_ov010_021b2764
    ldr r1, _LIT13
    ldr r0, _LIT14
    str r1, [r7, #0x80]
    ldr r1, _LIT15
    str r0, [r7, #0x7c]
    ldrh r3, [r1, #0x10]
    ldrh r2, [r1, #0x12]
    strh r3, [sp, #0xc]
    strh r2, [sp, #0xe]
    ldrh r2, [r1, #0x14]
    ldrh r1, [r1, #0x16]
    strh r2, [sp, #0x10]
    strh r1, [sp, #0x12]
    bl func_ov005_021aae28
    ldr r1, _LIT16
    ldr r0, [r7, #0x7c]
    ldr r1, [r1]
    bl func_ov005_021aae8c
    add r0, sp, #0x34
    add r1, sp, #0x14
    bl func_0200a46c
    ldr r1, _LIT17
    add r0, sp, #0x34
    add r1, r1, #0x68
    add r1, r1, #0x1800
    mov r2, #0x20
    bl Copy32
    ldr r0, _LIT17
    mov r2, #0x20
    add r0, r0, #0x88
    add r1, r0, #0x1800
    add r0, sp, #0x14
    bl Copy32
    ldr r0, [r7, #0x7c]
    mov r9, #0x0
    mov r8, #0x1
    bl func_ov005_021ab01c
    cmp r0, #0x1
    blt .L_81c
    mov r4, r9
    mov fp, r8
    mov r6, r8
    add r5, sp, #0x34
.L_794:
    ldr r0, [r7, #0x7c]
    mov r1, r8
    bl func_ov005_021ab2d4
    mov r1, r8, asr #0x5
    mov r0, r0, asr #0x10
    mov r0, r0, lsl #0x10
    ldr r1, [r5, r1, lsl #0x2]
    and r2, r8, #0x1f
    tst r1, r6, lsl r2
    mov sl, r0, lsr #0x10
    movne r0, r6
    moveq r0, r4
    cmp r0, #0x1
    bne .L_7dc
    ldr r0, [r7, #0x7c]
    mov r1, r8
    mov r2, fp
    bl func_ov005_021ab24c
.L_7dc:
    ldr r0, [r7, #0x7c]
    mov r1, r8
    bl func_ov005_021ab180
    cmp r0, #0x0
    ble .L_800
    ldr r0, [r7, #0x7c]
    mov r1, r8
    mov r2, #0x2
    bl func_ov005_021ab274
.L_800:
    ldr r0, [r7, #0x7c]
    add r8, r8, #0x1
    cmp r9, sl
    movlt r9, sl
    bl func_ov005_021ab01c
    cmp r8, r0
    ble .L_794
.L_81c:
    mov r5, #0x0
    ldr r4, _LIT18
    mov r6, r5
.L_828:
    add r0, r6, #0x8a
    add r0, r0, #0x200
    str r5, [r4, r6, lsl #0x2]
    bl func_0202c06c
    bl func_020a690c
    add r0, r5, r0
    add r0, r0, #0x4
    add r6, r6, #0x1
    cmp r6, #0x28
    bic r5, r0, #0x3
    blt .L_828
    add r0, r9, #0x1
    mov r0, r0, lsl #0x2
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    mov r1, r0
    mov r2, r9, lsl #0x2
    mov r0, #0x0
    str r1, [r7, #0x168]
    bl Fill32
    mov r8, #0x0
    mov r4, r8
    cmp r9, #0x0
    blt .L_8bc
    mov r6, r8
.L_890:
    ldr r2, [r7, #0x168]
    mov r0, r6
    mov r1, r4
    str r8, [r2, r4, lsl #0x2]
    bl func_ov010_021b4094
    add r0, r8, r0
    add r0, r0, #0x4
    add r4, r4, #0x1
    cmp r4, r9
    bic r8, r0, #0x3
    ble .L_890
.L_8bc:
    mov r0, r5
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    mov r1, r0
    mov r2, r5
    mov r0, #0x0
    str r1, [r7, #0x164]
    bl Fill32
    mov r0, r8
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    mov r1, r0
    mov r2, r8
    mov r0, #0x0
    str r1, [r7, #0x16c]
    bl Fill32
    ldr r4, _LIT18
    mov r5, #0x0
.L_90c:
    add r0, r5, #0x8a
    add r0, r0, #0x200
    bl func_0202c06c
    ldr r3, [r7, #0x164]
    ldr r2, [r4, r5, lsl #0x2]
    mov r1, r0
    add r0, r3, r2
    bl func_020a6a08
    add r5, r5, #0x1
    cmp r5, #0x28
    blt .L_90c
    cmp r9, #0x0
    mov r5, #0x0
    blt .L_970
    mov r4, r5
.L_948:
    ldr r0, [r7, #0x168]
    ldr r3, [r7, #0x16c]
    ldr r1, [r0, r5, lsl #0x2]
    mov r0, r4
    mov r2, r5
    add r1, r3, r1
    bl func_ov010_021b411c
    add r5, r5, #0x1
    cmp r5, r9
    ble .L_948
.L_970:
    mov r1, #0xf
    ldr r0, _LIT19
    str r1, [sp]
    str r0, [sp, #0x4]
    ldr r0, [r7, #0x80]
    ldr r1, [r7, #0x7c]
    add r2, sp, #0xc
    mov r3, #0x0
    bl func_ov005_021ab308
    ldr r2, [r7, #0x80]
    ldr r1, _LIT20
    ldrh r0, [r2, #0x5c]
    bic r0, r0, #0x3c0
    orr r0, r0, #0x100
    strh r0, [r2, #0x5c]
    ldr r0, [r7, #0x80]
    bl func_ov005_021ac9c4
    ldr r0, [r7, #0x80]
    ldr r1, _LIT21
    bl func_ov000_021ac9cc
    mov r0, #0x0
    str r0, [r7, #0x4]
    mov r0, #0x1
    add sp, sp, #0xb4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x04001000
_LIT1: .word data_ov010_021b9160
_LIT2: .word 0x07000400
_LIT3: .word 0x05000400
_LIT4: .word 0x04001008
_LIT5: .word 0x05000420
_LIT6: .word 0x000003ff
_LIT7: .word 0x050005c0
_LIT8: .word 0x00007c1f
_LIT9: .word data_ov010_021b87c0
_LIT10: .word data_021023bc
_LIT11: .word 0xffcfffef
_LIT12: .word data_ov010_021b8b2c
_LIT13: .word data_ov000_021b1cdc
_LIT14: .word data_ov000_021b1cb4
_LIT15: .word data_ov010_021b8770
_LIT16: .word data_020c3e74
_LIT17: .word data_02104e6c
_LIT18: .word data_ov010_021b90c0
_LIT19: .word func_ov010_021b466c
_LIT20: .word func_ov010_021b45a8
_LIT21: .word func_ov010_021b4650
