; func_ov004_021ce4a8 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102c90
        .extern data_021040ac
        .extern data_02104f4c
        .extern data_ov004_02209d88
        .extern data_ov004_02209da0
        .extern data_ov004_02209db8
        .extern data_ov004_02209dd0
        .extern data_ov004_0220b500
        .extern data_ov004_0220e500
        .extern data_ov004_022915e8
        .extern func_02001bc8
        .extern func_02001d0c
        .extern func_02001e94
        .extern func_02004f58
        .extern func_020054a4
        .extern func_02006c0c
        .extern func_02006e1c
        .extern func_02008888
        .extern func_02009494
        .extern func_02009758
        .extern func_0201d47c
        .extern func_0201e5b8
        .extern func_0202c0c0
        .extern func_02034888
        .extern func_0208c884
        .extern func_0208dd9c
        .extern func_0208de4c
        .extern func_0208e0a0
        .extern func_0208e2f4
        .extern func_02094504
        .extern func_02094550
        .extern func_ov004_021c9ef0
        .extern func_ov004_021c9fcc
        .extern func_ov004_021ca4f8
        .extern func_ov004_021cded0
        .extern func_ov004_021ce364
        .extern func_ov004_021d8648
        .extern func_ov004_021d8798
        .extern func_ov004_021d8cd0
        .global func_ov004_021ce4a8
        .arm
func_ov004_021ce4a8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x7c
    ldr r0, _LIT0
    mov r2, #0x0
    str r2, [r0, #0x6c]
    ldr r1, _LIT1
    str r2, [r0, #0x68]
    ldr r0, [r1, #0xcd0]
    cmp r0, #0x0
    beq .L_380
    ldr r0, _LIT0
    add r0, r0, #0xd4
    add r0, r0, #0x3c00
    bl func_ov004_021ce364
    ldr r1, _LIT2
    cmp r0, #0x0
    str r0, [r1, #0xbac]
    blt .L_370
    mov r1, #0x1c
    ldr r0, _LIT3
    sub r2, r1, #0x2c
    bl func_0208e2f4
    ldr r0, _LIT4
    mov r1, #0x0
    bl func_0208c884
    ldr r0, _LIT5
    bl func_ov004_021d8648
    mov r0, #0xe8
    bl func_0202c0c0
    mov r1, r0
    ldr r0, _LIT5
    mov r2, #0x1
    bl func_ov004_021d8798
    ldr r0, _LIT0
    add r0, r0, #0x128
    add r0, r0, #0x3c00
    bl func_02009494
    ldr r0, _LIT5
    bl func_ov004_021d8cd0
    ldr r0, _LIT4
    mvn r1, #0xf
    bl func_0208c884
    ldr r0, _LIT3
    mov r1, #0x0
    strh r1, [r0]
.L_370:
    ldr r0, _LIT0
    mov r1, #0x0
    add r0, r0, #0x3000
    str r1, [r0, #0xcd0]
.L_380:
    bl func_ov004_021ca4f8
    mov r0, #0x0
    bl func_ov004_021cded0
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
    bl func_02001bc8
    ldr r1, _LIT9
    add r0, sp, #0x5c
    mov r2, #0x20
    bl func_02094550
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
    bl func_0208de4c
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x20
    bl func_02094504
    bl func_0208e0a0
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x800
    bl func_02094504
    ldr r0, _LIT0
    ldr r0, [r0, #0x44]
    cmp r0, #0x0
    beq .L_4a0
    ldrh r3, [r4, #0xc]!
    ldr r0, _LIT10
    mov r1, #0x4
    bic r3, r3, #0x3
    orr r3, r3, #0x2
    mov r2, #0x0
    strh r3, [r4]
    bl func_02006c0c
    mov r5, r0
    add r0, sp, #0x34
    bl func_0201d47c
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
    bl func_0201e5b8
    mov r0, r5
    bl func_02006e1c
.L_4a0:
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
    bl func_0208dd9c
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x40
    bl func_02094504
    ldr r0, _LIT0
    mov r1, #0x4
    ldr r0, [r0, #0x44]
    mov r2, #0x0
    cmp r0, #0x0
    beq .L_508
    ldr r0, _LIT12
    bl func_02006c0c
    b .L_510
.L_508:
    ldr r0, _LIT13
    bl func_02006c0c
.L_510:
    mov r4, r0
    add r0, sp, #0xc
    bl func_0201d47c
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
    bl func_0201e5b8
    mov r0, r4
    bl func_02006e1c
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
    bl func_ov004_021c9fcc
    ldr r0, _LIT5
    bl func_ov004_021d8648
    ldr r0, _LIT0
    ldr r0, [r0, #0x44]
    cmp r0, #0x0
    bne .L_680
    ldr r0, _LIT15
    mov r1, #0x14
    mov r2, #0xc
    bl func_02001d0c
    bl func_0208de4c
    add r4, r0, #0xe20
    add r1, r4, #0x1000
    mov r0, #0x0
    mov r2, #0x1e00
    bl func_02094504
    mov r8, #0x0
    mov r5, #0xc
    ldr fp, _LIT15
    mov sl, #0x3
    mov r6, r8
    mov r7, r5
.L_610:
    add r0, r8, #0xe2
    bl func_0202c0c0
    mov r1, r7
    mov r9, r0
    bl func_020054a4
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
    bl func_02004f58
    add r8, r8, #0x1
    cmp r8, #0x4
    add sl, sl, #0x1a
    blt .L_610
    bl func_0208e0a0
    mov r1, r0
    ldr r0, _LIT15
    add r1, r1, #0x20c
    mov r2, #0xf1
    mov r3, #0x0
    bl func_02001e94
.L_680:
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
    bl func_ov004_021c9ef0
    mov r2, #0x2
    add r1, sp, #0x8
    mov r0, #0x3
    strh r2, [sp, #0x8]
    bl func_02034888
    ldr r0, _LIT0
    ldr r0, [r0, #0x44]
    cmp r0, #0x0
    beq .L_768
    ldr r0, _LIT16
    ldr r0, [r0, #0xa68]
    tst r0, #0x800000
    addne sp, sp, #0x7c
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, #0x2b
    bl func_02009758
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
    bl func_0208c884
    mov r0, #0xe8
    bl func_0202c0c0
    mov r1, r0
    ldr r0, _LIT5
    mov r2, #0x1
    bl func_ov004_021d8798
    bl func_02008888
    ldr r0, _LIT5
    bl func_ov004_021d8cd0
    ldr r0, _LIT4
    mvn r1, #0xf
    bl func_0208c884
    ldr r0, _LIT3
    mov r1, #0x0
    strh r1, [r0]
    add sp, sp, #0x7c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_768:
    mov r0, #0xdf
    bl func_0202c0c0
    mov r1, r0
    ldr r0, _LIT5
    mov r2, #0x0
    bl func_ov004_021d8798
    add sp, sp, #0x7c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov004_0220b500
_LIT1: .word data_ov004_0220e500
_LIT2: .word data_021040ac
_LIT3: .word 0x04001050
_LIT4: .word 0x0400106c
_LIT5: .word data_ov004_022915e8
_LIT6: .word 0x04001000
_LIT7: .word 0x00003860
_LIT8: .word 0x0000779b
_LIT9: .word 0x05000400
_LIT10: .word data_ov004_02209d88
_LIT11: .word 0x0400100e
_LIT12: .word data_ov004_02209da0
_LIT13: .word data_ov004_02209db8
_LIT14: .word data_ov004_02209dd0
_LIT15: .word data_02102c90
_LIT16: .word data_02104f4c
