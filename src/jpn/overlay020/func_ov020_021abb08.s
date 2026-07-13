; func_ov020_021abb08 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern Task_InvokeLocked
        .extern Task_PostLocked
        .extern data_02104e3c
        .extern data_02104e6c
        .extern data_0210586c
        .extern data_ov020_021adce8
        .extern data_ov020_021adf80
        .extern data_ov020_021adf90
        .extern data_ov020_021adfa4
        .extern data_ov020_021adfc8
        .extern data_ov020_021adfcc
        .extern data_ov020_021ae008
        .extern data_ov020_021ae424
        .extern data_ov020_021ae8a8
        .extern func_02001a14
        .extern func_02001ba8
        .extern func_02005910
        .extern func_02005be0
        .extern func_0202ada4
        .extern func_0202adc8
        .extern func_0207ddc8
        .extern func_0207e7d0
        .extern func_0207f050
        .extern func_0207f338
        .extern func_0207f774
        .extern func_0207f79c
        .extern func_0208c7e4
        .extern func_0208cba8
        .extern func_0208cf48
        .extern func_0208cfd4
        .extern func_0208d050
        .extern func_0208d0fc
        .extern func_0208d6c4
        .extern func_0208d7d8
        .extern func_0208d944
        .extern func_020943b0
        .extern func_02094410
        .extern func_020a9828
        .extern func_020b377c
        .extern func_ov020_021aa5ec
        .extern func_ov020_021aa620
        .global func_ov020_021abb08
        .arm
func_ov020_021abb08:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x1c
    mov r1, #0x4000000
    ldr r0, [r1]
    ldr r7, _LIT0
    bic r0, r0, #0x1f00
    str r0, [r1]
    add r3, r1, #0x1000
    ldr r0, [r3]
    ldr r2, _LIT1
    bic r4, r0, #0x1f00
    mov r1, r7
    mov r0, #0x0
    str r4, [r3]
    bl Fill32
    ldr r1, _LIT2
    ldr r0, _LIT3
    ldr r1, [r1, #0x1c]
    mov r2, #0x4
    bl func_0207ddc8
    ldr r0, _LIT4
    bl func_0207f79c
    ldr r0, _LIT5
    bl func_0207f774
    bl func_02005910
    ldr r0, _LIT6
    bl func_0208d0fc
    mov r0, #0x0
    mov r1, #0x6800000
    mov r2, #0xa4000
    bl func_02094410
    bl func_0208cba8
    ldr r0, _LIT7
    bl func_0207e7d0
    mov r0, #0x200
    mov r1, #0x7000000
    mov r2, #0x400
    bl func_02094410
    mov r0, #0x200
    ldr r1, _LIT8
    mov r2, #0x400
    bl func_02094410
    mov r0, #0x0
    mov r1, #0x5000000
    mov r2, #0x400
    bl func_02094410
    mov r0, #0x0
    ldr r1, _LIT9
    mov r2, #0x400
    bl func_02094410
    mov r0, #0x1
    bl func_0208d944
    mov r0, #0x2
    bl func_0208d7d8
    mov r0, #0x4
    bl func_0208d050
    mov r0, #0x8
    bl func_0208cfd4
    mov r0, #0x40
    bl func_0208d6c4
    mov r0, #0x80
    bl func_0208cf48
    ldr r1, _LIT10
    ldrh r0, [r1]
    bic r0, r0, #0x8000
    strh r0, [r1]
    mov r1, #0x0
    mov r2, r1
    mov r0, #0x1
    bl func_0208c7e4
    ldr r1, _LIT11
    ldr r0, _LIT12
    ldrh r3, [r1]
    add r2, r0, #0x304
    add r5, r1, #0x1000
    and r3, r3, #0x43
    orr r3, r3, #0x3e80
    strh r3, [r1]
    ldrh r6, [r1, #0x2]
    mov r3, r2
    ldr r4, _LIT13
    and r0, r6, #0x43
    orr r0, r0, #0x104
    orr r0, r0, #0x3c00
    strh r0, [r1, #0x2]
    ldrh r6, [r1, #0x4]
    mov r0, #0xc
    and r6, r6, #0x43
    orr r6, r6, #0xc
    orr r6, r6, #0x1c00
    strh r6, [r1, #0x4]
    ldrh r6, [r1, #0x6]
    and r6, r6, #0x43
    orr r2, r6, r2
    strh r2, [r1, #0x6]
    ldrh r1, [r5]
    and r1, r1, #0x43
    orr r1, r1, r3
    strh r1, [r5]
    ldrh r1, [r4]
    and r1, r1, #0x43
    orr r1, r1, #0x1e80
    strh r1, [r4]
    bl func_02001a14
    ldr r0, _LIT14
    ldr r1, _LIT15
    ldr r2, _LIT16
    bl func_02001ba8
    ldr r0, _LIT17
    ldr r1, _LIT18
    ldr r2, _LIT16
    bl func_02001ba8
    ldr r0, _LIT19
    ldr r1, _LIT15
    ldr r2, _LIT16
    bl func_02001ba8
    ldr r0, _LIT20
    bl func_0202ada4
    ldr r0, _LIT21
    ldr r1, _LIT22
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    str r0, [r1, #0x4c]
    bl func_0202adc8
    mov r0, #0x1
    bl func_02005be0
    mov r0, #0x2
    bl func_02005be0
    mov r3, #0x4000000
    ldr r1, [r3]
    ldr r0, _LIT23
    add r2, r3, #0x1000
    and r1, r1, r0
    orr r1, r1, #0x10
    orr r1, r1, #0x200000
    str r1, [r3]
    ldr r1, [r2]
    and r0, r1, r0
    orr r0, r0, #0x10
    orr r0, r0, #0x200000
    str r0, [r2]
    bl func_0207f338
    mov r1, #0x0
    ldr r0, _LIT24
    mov r3, r1
    mov r2, #0x80
    bl func_0207f050
    ldr r0, _LIT25
    mov r1, #0x0
    mov r2, #0x80
    mov r3, #0x1
    bl func_0207f050
    ldr r0, _LIT21
    ldr r1, _LIT22
    ldr r0, [r0, #0xa64]
    mov r3, #0x0
    and r0, r0, #0x1f00000
    mov r0, r0, lsr #0x14
    str r3, [r1, #0x48]
    cmp r0, #0x8
    bne .L_2ac
    ldr r0, _LIT26
    ldrh r0, [r0, #0xb8]
    cmp r0, #0x1
    beq .L_2a8
    cmp r0, #0x2
    movne r3, #0x3
    moveq r3, #0xa
    b .L_2ac
.L_2a8:
    mov r3, #0x5
.L_2ac:
    cmp r3, #0x0
    mov r2, #0x0
    ble .L_2d4
    mov r1, #0x3
.L_2bc:
    add r0, r7, r2, lsl #0x1
    add r0, r0, #0x800
    add r2, r2, #0x1
    strh r1, [r0, #0xcc]
    cmp r2, r3
    blt .L_2bc
.L_2d4:
    cmp r2, #0xa
    bge .L_2f8
    mov r1, #0x4
.L_2e0:
    add r0, r7, r2, lsl #0x1
    add r0, r0, #0x800
    add r2, r2, #0x1
    strh r1, [r0, #0xcc]
    cmp r2, #0xa
    blt .L_2e0
.L_2f8:
    mov r4, #0xa
    ldr r6, _LIT27
    mov r9, #0x0
    mov r5, r4
.L_308:
    bl func_020a9828
    mov r1, r0, lsr #0x1f
    smull r2, r8, r6, r0
    add r8, r1, r8, asr #0x2
    smull r1, r2, r4, r8
    sub r8, r0, r1
    bl func_020a9828
    add r1, r7, r8, lsl #0x1
    add r3, r1, #0x800
    add r9, r9, #0x1
    mov r1, r0, lsr #0x1f
    smull r2, r8, r6, r0
    add r8, r1, r8, asr #0x2
    smull r1, r2, r5, r8
    sub r8, r0, r1
    add r0, r7, r8, lsl #0x1
    add r0, r0, #0x800
    ldrh r2, [r3, #0xcc]
    cmp r9, #0x64
    ldrh r1, [r0, #0xcc]
    strh r1, [r3, #0xcc]
    strh r2, [r0, #0xcc]
    blt .L_308
    add r0, r7, #0x24c
    add r0, r0, #0x800
    bl func_ov020_021aa5ec
    add r3, sp, #0x10
    mov r2, #0x0
    mov r0, #0x20c
    mov r1, #0x4
    str r2, [r3]
    str r2, [r3, #0x4]
    str r2, [r3, #0x8]
    bl Task_PostLocked
    mov fp, r0
    mov r4, #0x1
    ldr r0, _LIT21
    ldr r5, _LIT28
    mov r3, fp
    mov r2, r4
.L_3a8:
    cmp r4, #0x51
    and r1, r4, #0x1f
    blt .L_3e8
    cmp r4, #0x55
    bgt .L_3e8
    mov r6, r4, asr #0x5
    add r6, r0, r6, lsl #0x2
    add r6, r6, #0x1000
    mvn r8, r2, lsl r1
    ldr r1, [r6, #0xab8]
    and r1, r1, r8
    str r1, [r6, #0xab8]
    ldr r1, [r6, #0xae0]
    and r1, r1, r8
    str r1, [r6, #0xae0]
    b .L_410
.L_3e8:
    mov r6, r4, asr #0x5
    add r6, r0, r6, lsl #0x2
    add r6, r6, #0x1000
    ldr r6, [r6, #0xab8]
    tst r6, r2, lsl r1
    bne .L_410
    strh r4, [r3], #0x2
    ldr r1, [sp, #0x10]
    add r1, r1, #0x1
    str r1, [sp, #0x10]
.L_410:
    add r4, r4, #0x1
    cmp r4, r5
    blt .L_3a8
    ldr r0, [sp, #0x10]
    cmp r0, #0xa
    bge .L_47c
    mov r1, #0x1
    ldr r6, _LIT21
    ldr r2, _LIT28
    mov r0, r1
.L_438:
    mov r4, r1, asr #0x5
    add r4, r6, r4, lsl #0x2
    add r4, r4, #0x1000
    ldr r5, [r4, #0xab8]
    and r8, r1, #0x1f
    tst r5, r0, lsl r8
    beq .L_470
    ldr r4, [r4, #0xae0]
    tst r4, r0, lsl r8
    bne .L_470
    strh r1, [r3], #0x2
    ldr r4, [sp, #0x14]
    add r4, r4, #0x1
    str r4, [sp, #0x14]
.L_470:
    add r1, r1, #0x1
    cmp r1, r2
    blt .L_438
.L_47c:
    ldr r1, [sp, #0x10]
    ldr r0, [sp, #0x14]
    add r0, r1, r0
    cmp r0, #0xa
    bge .L_4e4
    mov r1, #0x1
    ldr r6, _LIT21
    ldr r2, _LIT28
    mov r0, r1
.L_4a0:
    mov r4, r1, asr #0x5
    add r4, r6, r4, lsl #0x2
    add r4, r4, #0x1000
    ldr r5, [r4, #0xab8]
    and r8, r1, #0x1f
    tst r5, r0, lsl r8
    beq .L_4d8
    ldr r4, [r4, #0xae0]
    tst r4, r0, lsl r8
    beq .L_4d8
    strh r1, [r3], #0x2
    ldr r4, [sp, #0x18]
    add r4, r4, #0x1
    str r4, [sp, #0x18]
.L_4d8:
    add r1, r1, #0x1
    cmp r1, r2
    blt .L_4a0
.L_4e4:
    mov r9, #0x0
    mov sl, fp
    add r6, sp, #0x10
    mov r5, r9
.L_4f4:
    ldr r0, [r6, r9, lsl #0x2]
    cmp r0, #0x0
    beq .L_548
    mov r8, r5
.L_504:
    bl func_020a9828
    ldr r1, [r6, r9, lsl #0x2]
    bl func_020b377c
    mov r4, r1, lsl #0x1
    bl func_020a9828
    ldr r1, [r6, r9, lsl #0x2]
    bl func_020b377c
    mov r2, r1, lsl #0x1
    add r8, r8, #0x1
    cmp r8, #0x20c
    ldrh r1, [sl, r4]
    ldrh r0, [sl, r2]
    strh r0, [sl, r4]
    strh r1, [sl, r2]
    blt .L_504
    ldr r0, [r6, r9, lsl #0x2]
    add sl, sl, r0, lsl #0x1
.L_548:
    add r9, r9, #0x1
    cmp r9, #0x3
    blt .L_4f4
    add r1, r7, #0x1d4
    mov r0, fp
    add r1, r1, #0x800
    mov r2, #0x14
    bl func_020943b0
    mov r4, #0xa
    ldr r6, _LIT27
    mov r8, #0x0
    mov r5, r4
.L_578:
    bl func_020a9828
    mov r1, r0, lsr #0x1f
    smull r2, r3, r6, r0
    add r3, r1, r3, asr #0x2
    smull r1, r2, r4, r3
    sub r3, r0, r1
    mov r9, r3, lsl #0x10
    bl func_020a9828
    add r1, r7, r9, lsr #0xf
    add r3, r1, #0x900
    add r8, r8, #0x1
    mov r1, r0, lsr #0x1f
    smull r2, r9, r6, r0
    add r9, r1, r9, asr #0x2
    cmp r8, #0x64
    smull r1, r2, r5, r9
    sub r9, r0, r1
    mov r0, r9, lsl #0x10
    add r0, r7, r0, lsr #0xf
    add r0, r0, #0x900
    ldrh r2, [r3, #0xd4]
    ldrh r1, [r0, #0xd4]
    strh r1, [r3, #0xd4]
    strh r2, [r0, #0xd4]
    blt .L_578
    ldr r0, _LIT29
    mov r6, #0x0
    ldrh r3, [r0]
    ldrh r2, [r0, #0x2]
    ldrh r1, [r0, #0x4]
    ldrh r0, [r0, #0x6]
    strh r3, [sp]
    strh r2, [sp, #0x2]
    strh r1, [sp, #0x4]
    strh r0, [sp, #0x6]
.L_604:
    add r0, r7, r6, lsl #0x1
    add r0, r0, #0x900
    ldrh r0, [r0, #0xd4]
    mov r1, #0x2
    mov r2, #0x0
    bl func_ov020_021aa620
    cmp r0, #0x0
    beq .L_63c
    bl func_020a9828
    add r1, r7, r6, lsl #0x3
    and r2, r0, #0x1
    add r0, r1, #0x900
    strh r2, [r0, #0xe8]
    b .L_64c
.L_63c:
    add r0, r7, r6, lsl #0x3
    add r0, r0, #0x900
    mov r1, #0x0
    strh r1, [r0, #0xe8]
.L_64c:
    add r0, r7, r6, lsl #0x1
    add r0, r0, #0x900
    ldrh r0, [r0, #0xd4]
    mov r1, #0x6
    mov r2, #0x0
    bl func_ov020_021aa620
    cmp r0, #0x0
    beq .L_6f4
    ldrh r3, [sp]
    ldrh r2, [sp, #0x2]
    ldrh r1, [sp, #0x4]
    ldrh r0, [sp, #0x6]
    add r4, sp, #0x8
    strh r3, [sp, #0x8]
    strh r2, [sp, #0xa]
    strh r1, [sp, #0xc]
    strh r0, [sp, #0xe]
    mov r5, #0x0
.L_694:
    bl func_020a9828
    and r0, r0, #0x3
    mov r8, r0, lsl #0x10
    bl func_020a9828
    and r0, r0, #0x3
    mov r0, r0, lsl #0x10
    mov r3, r8, lsr #0xf
    mov r1, r0, lsr #0xf
    add r5, r5, #0x1
    ldrh r2, [r4, r3]
    ldrh r0, [r4, r1]
    cmp r5, #0x64
    strh r0, [r4, r3]
    strh r2, [r4, r1]
    blt .L_694
    ldrh r1, [sp, #0x8]
    add r0, r7, r6, lsl #0x3
    add r0, r0, #0x900
    ldrh r2, [sp, #0xa]
    strh r1, [r0, #0xea]
    ldrh r1, [sp, #0xc]
    strh r2, [r0, #0xec]
    strh r1, [r0, #0xee]
    b .L_714
.L_6f4:
    add r0, r7, r6, lsl #0x3
    add r0, r0, #0x900
    mov r1, #0x2
    strh r1, [r0, #0xea]
    mov r1, #0x3
    strh r1, [r0, #0xec]
    mov r1, #0x4
    strh r1, [r0, #0xee]
.L_714:
    add r6, r6, #0x1
    cmp r6, #0xa
    blt .L_604
    mov r0, fp
    bl Task_InvokeLocked
    mov r0, #0x1
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov020_021adfc8
_LIT1: .word 0x00000a54
_LIT2: .word data_02104e3c
_LIT3: .word data_ov020_021adf80
_LIT4: .word data_ov020_021adfa4
_LIT5: .word data_ov020_021adf90
_LIT6: .word 0x000001ff
_LIT7: .word data_ov020_021ae8a8
_LIT8: .word 0x07000400
_LIT9: .word 0x05000400
_LIT10: .word 0x04000304
_LIT11: .word 0x04000008
_LIT12: .word 0x00001c0c
_LIT13: .word 0x0400100e
_LIT14: .word 0x050001e0
_LIT15: .word 0x00007fff
_LIT16: .word 0x00000421
_LIT17: .word 0x050001c0
_LIT18: .word 0x00003def
_LIT19: .word 0x050005e0
_LIT20: .word data_ov020_021adfcc
_LIT21: .word data_02104e6c
_LIT22: .word data_ov020_021adf80
_LIT23: .word 0xffcfffef
_LIT24: .word data_ov020_021ae008
_LIT25: .word data_ov020_021ae424
_LIT26: .word data_0210586c
_LIT27: .word 0x66666667
_LIT28: .word 0x00000106
_LIT29: .word data_ov020_021adce8
