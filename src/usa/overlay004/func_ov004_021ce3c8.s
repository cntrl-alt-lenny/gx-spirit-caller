; func_ov004_021ce3c8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102bb0
        .extern data_02103fcc
        .extern data_02104e6c
        .extern data_ov004_02209b28
        .extern data_ov004_02209b40
        .extern data_ov004_02209b58
        .extern data_ov004_02209b70
        .extern data_ov004_0220b2a0
        .extern data_ov004_0220e2a0
        .extern data_ov004_02291388
        .extern func_02001ba8
        .extern func_02001cec
        .extern func_02001e74
        .extern func_02004f3c
        .extern func_02005488
        .extern func_02006bf0
        .extern func_02006e00
        .extern func_0200886c
        .extern func_02009478
        .extern func_0200973c
        .extern func_0201d428
        .extern func_0201e564
        .extern func_0202c06c
        .extern func_02034838
        .extern func_0208c79c
        .extern func_0208dcb4
        .extern func_0208dd64
        .extern func_0208dfb8
        .extern func_0208e2f4
        .extern func_02094410
        .extern func_0209445c
        .extern func_ov004_021c9e10
        .extern func_ov004_021c9eec
        .extern func_ov004_021ca418
        .extern func_ov004_021cddf0
        .extern func_ov004_021ce284
        .extern func_ov004_021d855c
        .extern func_ov004_021d86ac
        .extern func_ov004_021d8be4
        .global func_ov004_021ce3c8
        .arm
func_ov004_021ce3c8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x7c
    ldr r0, _LIT0
    mov r2, #0x0
    str r2, [r0, #0x6c]
    ldr r1, _LIT1
    str r2, [r0, #0x68]
    ldr r0, [r1, #0xcd0]
    cmp r0, #0x0
    beq .L_c4
    ldr r0, _LIT0
    add r0, r0, #0xd4
    add r0, r0, #0x3c00
    bl func_ov004_021ce284
    ldr r1, _LIT2
    cmp r0, #0x0
    str r0, [r1, #0xbac]
    blt .L_b4
    mov r1, #0x1c
    ldr r0, _LIT3
    sub r2, r1, #0x2c
    bl func_0208e2f4
    ldr r0, _LIT4
    mov r1, #0x0
    bl func_0208c79c
    ldr r0, _LIT5
    bl func_ov004_021d855c
    mov r0, #0xe8
    bl func_0202c06c
    mov r1, r0
    ldr r0, _LIT5
    mov r2, #0x1
    bl func_ov004_021d86ac
    ldr r0, _LIT0
    add r0, r0, #0x128
    add r0, r0, #0x3c00
    bl func_02009478
    ldr r0, _LIT5
    bl func_ov004_021d8be4
    ldr r0, _LIT4
    mvn r1, #0xf
    bl func_0208c79c
    ldr r0, _LIT3
    mov r1, #0x0
    strh r1, [r0]
.L_b4:
    ldr r0, _LIT0
    mov r1, #0x0
    add r0, r0, #0x3000
    str r1, [r0, #0xcd0]
.L_c4:
    bl func_ov004_021ca418
    mov r0, #0x0
    bl func_ov004_021cddf0
    ldr r4, _LIT6
    add r0, sp, #0x5c
    ldr r2, [r4]
    ldr r1, [r4]
    and r2, r2, #0x1f00
    mov r3, r2, lsr #0x8
    bic r2, r1, #0x1f00
    bic r1, r3, #0xf
    orr r3, r2, r1, lsl #0x8
    ldr r1, _LIT7
    ldr r2, _LIT8
    str r3, [r4]
    bl func_02001ba8
    ldr r1, _LIT9
    add r0, sp, #0x5c
    mov r2, #0x20
    bl func_0209445c
    add r2, r4, #0xc
    ldrh r1, [r2]
    mov r0, #0x0
    bic r1, r1, #0x3
    orr r1, r1, #0x1
    strh r1, [r2]
    str r0, [r2, #0xc]
    ldrh r0, [r2]
    and r0, r0, #0x43
    orr r0, r0, #0x8
    orr r0, r0, #0x400
    strh r0, [r2]
    bl func_0208dd64
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x20
    bl func_02094410
    bl func_0208dfb8
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x800
    bl func_02094410
    ldr r0, _LIT0
    ldr r0, [r0, #0x44]
    cmp r0, #0x0
    beq .L_1e4
    ldrh r3, [r4, #0xc]!
    ldr r0, _LIT10
    mov r1, #0x4
    bic r3, r3, #0x3
    orr r3, r3, #0x2
    mov r2, #0x0
    strh r3, [r4]
    bl func_02006bf0
    mov r5, r0
    add r0, sp, #0x34
    bl func_0201d428
    ldrh r0, [sp, #0x48]
    mov r3, #0x40
    mov r2, #0x0
    bic r0, r0, #0xf
    orr r4, r0, #0x7
    mov r1, #0x100
    add r0, sp, #0x34
    str r5, [sp, #0x34]
    strh r4, [sp, #0x48]
    str r3, [sp, #0x40]
    str r2, [sp, #0x3c]
    strh r1, [sp, #0x44]
    bl func_0201e564
    mov r0, r5
    bl func_02006e00
.L_1e4:
    ldr r2, _LIT11
    mov r0, #0x0
    ldrh r1, [r2]
    bic r1, r1, #0x3
    orr r1, r1, #0x3
    strh r1, [r2]
    str r0, [r2, #0xe]
    ldrh r0, [r2]
    and r0, r0, #0x43
    orr r0, r0, #0x284
    orr r0, r0, #0x400
    strh r0, [r2]
    bl func_0208dcb4
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x40
    bl func_02094410
    ldr r0, _LIT0
    mov r1, #0x4
    ldr r0, [r0, #0x44]
    mov r2, #0x0
    cmp r0, #0x0
    beq .L_24c
    ldr r0, _LIT12
    bl func_02006bf0
    b .L_254
.L_24c:
    ldr r0, _LIT13
    bl func_02006bf0
.L_254:
    mov r4, r0
    add r0, sp, #0xc
    bl func_0201d428
    ldrh r0, [sp, #0x20]
    ldr r1, [sp, #0x24]
    mov r3, #0x0
    bic r0, r0, #0xf
    orr r0, r0, #0x8
    strh r0, [sp, #0x20]
    bic r1, r1, #0x1c000
    orr r2, r1, #0xc000
    ldrh r0, [sp, #0x20]
    mov r5, #0x40
    str r4, [sp, #0xc]
    orr r1, r0, #0x10
    add r0, sp, #0xc
    str r5, [sp, #0x18]
    str r3, [sp, #0x14]
    str r2, [sp, #0x24]
    strh r1, [sp, #0x20]
    strh r3, [sp, #0x1c]
    bl func_0201e564
    mov r0, r4
    bl func_02006e00
    ldr r3, _LIT6
    mov r0, #0x1
    ldr r2, [r3]
    ldr r1, [r3]
    and r2, r2, #0x1f00
    mov r4, r2, lsr #0x8
    bic r2, r1, #0x1f00
    orr r1, r4, #0xc
    orr r1, r2, r1, lsl #0x8
    str r1, [r3]
    str r0, [sp]
    ldr r0, _LIT0
    ldr r1, _LIT14
    add r0, r0, #0xf90
    add r0, r0, #0x5000
    mov r2, #0x2
    mov r3, #0xc00
    bl func_ov004_021c9eec
    ldr r0, _LIT5
    bl func_ov004_021d855c
    ldr r0, _LIT0
    ldr r0, [r0, #0x44]
    cmp r0, #0x0
    bne .L_3c4
    ldr r0, _LIT15
    mov r1, #0x14
    mov r2, #0xc
    bl func_02001cec
    bl func_0208dd64
    add r4, r0, #0xe20
    add r1, r4, #0x1000
    mov r0, #0x0
    mov r2, #0x1e00
    bl func_02094410
    mov r8, #0x0
    mov r5, #0xc
    ldr fp, _LIT15
    mov sl, #0x3
    mov r6, r8
    mov r7, r5
.L_354:
    add r0, r8, #0xe2
    bl func_0202c06c
    mov r1, r7
    mov r9, r0
    bl func_02005488
    rsb r0, r0, #0xa0
    add r0, r0, r0, lsr #0x1f
    mov r3, r0, asr #0x1
    cmp r3, #0x0
    movle r3, r6
    str sl, [sp]
    mov r0, fp
    mov r1, r9
    add r2, r4, #0x1000
    add r3, r3, #0x1
    str r5, [sp, #0x4]
    bl func_02004f3c
    add r8, r8, #0x1
    cmp r8, #0x4
    add sl, sl, #0x1a
    blt .L_354
    bl func_0208dfb8
    mov r1, r0
    ldr r0, _LIT15
    add r1, r1, #0x20c
    mov r2, #0xf1
    mov r3, #0x0
    bl func_02001e74
.L_3c4:
    mov r3, #0x0
    ldr r1, _LIT0
    sub r2, r3, #0x1
    mov r0, #0xe9
    str r3, [r1, #0x238]
    str r3, [r1, #0x230]
    str r3, [r1, #0x22c]
    str r3, [r1, #0x220]
    str r3, [r1, #0x228]
    str r3, [r1, #0x224]
    str r3, [r1, #0x234]
    str r2, [r1, #0x84]
    bl func_ov004_021c9e10
    mov r2, #0x2
    add r1, sp, #0x8
    mov r0, #0x3
    strh r2, [sp, #0x8]
    bl func_02034838
    ldr r0, _LIT0
    ldr r0, [r0, #0x44]
    cmp r0, #0x0
    beq .L_4ac
    ldr r0, _LIT16
    ldr r0, [r0, #0xa68]
    tst r0, #0x800000
    addne sp, sp, #0x7c
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, #0x2b
    bl func_0200973c
    ldr r3, _LIT16
    mov r1, #0x1c
    ldr r2, [r3, #0xa68]
    ldr r0, _LIT3
    orr r2, r2, #0x800
    orr r4, r2, #0x800000
    sub r2, r1, #0x2c
    str r4, [r3, #0xa68]
    bl func_0208e2f4
    ldr r0, _LIT4
    mov r1, #0x0
    bl func_0208c79c
    mov r0, #0xe8
    bl func_0202c06c
    mov r1, r0
    ldr r0, _LIT5
    mov r2, #0x1
    bl func_ov004_021d86ac
    bl func_0200886c
    ldr r0, _LIT5
    bl func_ov004_021d8be4
    ldr r0, _LIT4
    mvn r1, #0xf
    bl func_0208c79c
    ldr r0, _LIT3
    mov r1, #0x0
    strh r1, [r0]
    add sp, sp, #0x7c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_4ac:
    mov r0, #0xdf
    bl func_0202c06c
    mov r1, r0
    ldr r0, _LIT5
    mov r2, #0x0
    bl func_ov004_021d86ac
    add sp, sp, #0x7c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov004_0220b2a0
_LIT1: .word data_ov004_0220e2a0
_LIT2: .word data_02103fcc
_LIT3: .word 0x04001050
_LIT4: .word 0x0400106c
_LIT5: .word data_ov004_02291388
_LIT6: .word 0x04001000
_LIT7: .word 0x00003860
_LIT8: .word 0x0000779b
_LIT9: .word 0x05000400
_LIT10: .word data_ov004_02209b28
_LIT11: .word 0x0400100e
_LIT12: .word data_ov004_02209b40
_LIT13: .word data_ov004_02209b58
_LIT14: .word data_ov004_02209b70
_LIT15: .word data_02102bb0
_LIT16: .word data_02104e6c
