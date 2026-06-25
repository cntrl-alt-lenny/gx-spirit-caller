; func_020125e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103fcc
        .extern data_02104b88
        .extern data_02104b9a
        .extern data_02104bd0
        .extern data_02104c0c
        .extern data_02104c18
        .extern data_02104e6c
        .extern data_0210586c
        .extern data_021058a9
        .extern data_021058e8
        .extern data_0210596c
        .extern data_ov000_021b2d58
        .extern data_ov000_021b3f28
        .extern func_02000ef8
        .extern func_02007188
        .extern func_020117a8
        .extern func_020119a8
        .extern func_020119e0
        .extern func_02011a48
        .extern func_02011b68
        .extern func_02011c38
        .extern func_02012420
        .extern func_02019504
        .extern func_02019560
        .extern func_0201ac44
        .extern func_0202ada4
        .extern func_0202adc8
        .extern func_0202aeec
        .extern func_0202c06c
        .extern func_02034734
        .extern func_02034768
        .extern func_020aace8
        .extern func_020aad04
        .extern func_020aadcc
        .extern func_ov002_0229ac78
        .extern func_ov003_021ca11c
        .extern func_ov004_021cb438
        .extern func_ov004_021d6de4
        .global func_020125e8
        .arm
func_020125e8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x54
    bl func_02034734
    cmp r0, #0x0
    beq .L_60
    bl func_02034768
    cmp r0, #0x0
    bne .L_60
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0xba0]
    bl func_02034734
    cmp r0, #0x1
    mov r0, #0x4
    mov r1, #0x1
    bne .L_4c
    ldr r2, _LIT1
    bl func_02007188
    b .L_54
.L_4c:
    ldr r2, _LIT2
    bl func_02007188
.L_54:
    add sp, sp, #0x54
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_60:
    ldr r0, _LIT0
    ldr r1, [r0, #0xba0]
    cmp r1, #0x5
    addls pc, pc, r1, lsl #0x2
    b .L_650
    b .L_8c
    b .L_2dc
    b .L_314
    b .L_340
    b .L_5dc
    b .L_608
.L_8c:
    bl func_02034734
    cmp r0, #0x0
    bne .L_2b4
    ldr r0, _LIT0
    ldr r0, [r0, #0xb88]
    cmp r0, #0x3
    beq .L_2b4
    add r0, sp, #0x18
    bl func_0202ada4
    mov r0, #0x0
    bl func_0202adc8
    ldr r6, _LIT0
    mov r9, #0x0
    ldr r4, _LIT3
    ldr r5, _LIT4
    ldr r7, _LIT5
    mov fp, r9
    mov r8, r6
    str r6, [sp, #0x4]
    str r6, [sp]
    str r6, [sp, #0x10]
    str r6, [sp, #0x14]
    str r6, [sp, #0xc]
    str r6, [sp, #0x8]
.L_ec:
    ldr r0, [sp]
    add r0, r0, r9, lsl #0x2
    ldr sl, [r0, #0xbc4]
    cmp sl, #0x0
    blt .L_1cc
    bne .L_124
    ldr r1, _LIT6
    mov r0, r9
    bl func_02012420
    ldr r0, _LIT7
    ldrh r1, [r0, #0x52]
    ldr r0, [sp, #0x8]
    str r1, [r0, #0xba4]
    b .L_1cc
.L_124:
    bl func_020117a8
    cmp sl, r0
    bge .L_180
    mov r0, sl
    bl func_020119a8
    mov r1, r0
    mov r0, r4
    bl func_02011b68
    mov r0, sl
    bl func_020119e0
    mov r1, r0
    mov r0, r5
    bl func_020aad04
    ldr r1, _LIT8
    mov r0, sl
    ldr r1, [r1, #0x4]
    mov r1, r1, lsl #0x1d
    mov r1, r1, lsr #0x1d
    strb r1, [r6, #0xc02]
    bl func_02011a48
    ldr r1, [sp, #0xc]
    str r0, [r1, #0xba4]
    b .L_1cc
.L_180:
    ldr r1, [sp, #0x10]
    mov r0, r4
    ldr r1, [r1, #0xc38]
    add r1, r1, fp
    bl func_02011c38
    ldr r0, _LIT9
    bl func_0202c06c
    mov r1, r0
    mov r0, r5
    bl func_020aad04
    ldr r0, _LIT8
    ldr r2, [r0, #0x4]
    ldr r0, _LIT7
    ldrh r1, [r0, #0x52]
    mov r0, r2, lsl #0x1d
    mov r0, r0, lsr #0x1d
    strb r0, [r6, #0xc02]
    ldr r0, [sp, #0x14]
    str r1, [r0, #0xba4]
.L_1cc:
    ldr r0, [sp, #0x4]
    add r0, r0, r9, lsl #0x2
    ldr r0, [r0, #0xbbc]
    cmp r0, #0x0
    bne .L_204
    ldr r1, _LIT10
    mov r0, r7
    bl func_020aad04
    ldr r0, _LIT8
    ldrb r0, [r0, #0xa3c]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    strb r0, [r6, #0xbcc]
    b .L_26c
.L_204:
    ldreq sl, _LIT10
    beq .L_21c
    add r0, r0, #0x178
    add r0, r0, #0x400
    bl func_0202c06c
    mov sl, r0
.L_21c:
    mov r0, sl
    bl func_020aace8
    cmp r0, #0x18
    mov r1, sl
    mov r0, r7
    bls .L_254
    mov r2, #0x18
    bl func_020aadcc
    mov r0, #0x2e
    strb r0, [r8, #0xbe4]
    strb r0, [r8, #0xbe5]
    mov r0, #0x0
    strb r0, [r8, #0xbe6]
    b .L_258
.L_254:
    bl func_020aad04
.L_258:
    ldr r0, _LIT8
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    strb r0, [r6, #0xbcc]
.L_26c:
    add r4, r4, #0x108
    add r5, r5, #0x1a
    add r6, r6, #0x1
    add fp, fp, #0x3e8
    add r7, r7, #0x1a
    add r8, r8, #0x1a
    add r9, r9, #0x1
    cmp r9, #0x2
    blt .L_ec
    ldr r1, _LIT0
    ldr r0, [r1, #0xc38]
    cmp r0, #0x0
    bne .L_2b0
    ldr r0, [r1, #0x38]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [r1, #0xc38]
.L_2b0:
    bl func_0202aeec
.L_2b4:
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0xb90]
    str r1, [r0, #0xb98]
    str r1, [r0, #0xb94]
    str r1, [r0, #0xb9c]
    str r1, [r0, #0xbb8]
    ldr r1, [r0, #0xba0]
    add r1, r1, #0x1
    str r1, [r0, #0xba0]
.L_2dc:
    ldr r0, _LIT0
    ldr r1, [r0, #0xba0]
    add r1, r1, #0x1
    str r1, [r0, #0xba0]
    ldr r0, [r0, #0xc48]
    cmp r0, #0x2
    blt .L_314
    ldr r2, _LIT11
    mov r0, #0x3
    mov r1, #0x1
    bl func_02007188
    add sp, sp, #0x54
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_314:
    mov r0, #0x2
    ldr r2, _LIT12
    sub r1, r0, #0x3
    bl func_02007188
    ldr r1, _LIT0
    add sp, sp, #0x54
    ldr r2, [r1, #0xba0]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xba0]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_340:
    ldr r1, [r0, #0xb88]
    cmp r1, #0x3
    beq .L_4cc
    ldr r1, [r0, #0xc3c]
    ldr r0, _LIT13
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x1
    beq .L_4cc
    bl func_02034734
    cmp r0, #0x0
    bne .L_39c
    ldr r1, _LIT0
    ldr r0, _LIT14
    ldr r2, [r1, #0xc3c]
    rsb r2, r2, #0x1
    ldr r0, [r0, r2, lsl #0x2]
    cmp r0, #0x0
    beq .L_4b8
    ldr r1, [r1, #0xe5c]
    mov r2, #0x1
    sub r1, r1, #0x1
    bl func_02019504
    b .L_4b8
.L_39c:
    ldr r1, _LIT8
    ldr r3, _LIT15
    ldr r1, [r1, #0xa7c]
    ldr r0, _LIT16
    mov r1, r1, lsl #0x16
    cmp r0, r1, lsr #0x16
    ldr r2, [r3]
    movhi r4, #0x1
    mov r0, #0x400
    movls r4, #0x0
    mov r1, r2, lsl #0x16
    rsb r0, r0, #0x0
    add r1, r4, r1, lsr #0x16
    and r2, r2, r0
    and r1, r1, r0, lsr #0x16
    orr r2, r2, r1
    ldr r1, _LIT0
    str r2, [r3]
    ldr r1, [r1, #0xe5c]
    cmp r1, #0x1
    beq .L_404
    cmp r1, #0x2
    beq .L_448
    cmp r1, #0x3
    beq .L_488
    b .L_4b8
.L_404:
    ldr r1, _LIT8
    ldr r3, _LIT15
    ldr r1, [r1, #0xa7c]
    ldr r2, [r3]
    mov r1, r1, lsl #0xc
    mov r1, r1, lsr #0x16
    cmp r1, r0, lsr #0x16
    movcc r4, #0x1
    movcs r4, #0x0
    mov r1, r2, lsl #0xc
    ldr r0, _LIT17
    add r1, r4, r1, lsr #0x16
    and r2, r2, r0
    mov r0, r1, lsl #0x16
    orr r0, r2, r0, lsr #0xc
    str r0, [r3]
    b .L_4b8
.L_448:
    ldr r0, _LIT8
    ldr r2, _LIT15
    ldr r0, [r0, #0xa7c]
    ldr r1, [r2]
    mov r0, r0, lsl #0x4
    mov r0, r0, lsr #0x18
    cmp r0, #0xff
    movcc r3, #0x1
    mov r0, r1, lsl #0x4
    movcs r3, #0x0
    add r0, r3, r0, lsr #0x18
    bic r1, r1, #0xff00000
    mov r0, r0, lsl #0x18
    orr r0, r1, r0, lsr #0x4
    str r0, [r2]
    b .L_4b8
.L_488:
    ldr r0, _LIT8
    ldr r2, _LIT15
    ldr r0, [r0, #0xa7c]
    mov r0, r0, lsr #0x1c
    cmp r0, #0xf
    movcc r3, #0x1
    ldr r0, [r2]
    movcs r3, #0x0
    bic r1, r0, #-268435456
    add r0, r3, r0, lsr #0x1c
    orr r0, r1, r0, lsl #0x1c
    str r0, [r2]
.L_4b8:
    ldr r1, _LIT0
    ldr r0, [r1, #0x38]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [r1, #0xc38]
.L_4cc:
    ldr r0, _LIT0
    ldr r1, [r0, #0xb9c]
    cmp r1, #0x0
    beq .L_594
    mov r1, #0x0
    str r1, [r0, #0xba0]
    bl func_02034734
    cmp r0, #0x0
    beq .L_524
    bl func_02034734
    cmp r0, #0x1
    mov r0, #0x4
    mov r1, #0x1
    bne .L_510
    ldr r2, _LIT1
    bl func_02007188
    b .L_518
.L_510:
    ldr r2, _LIT2
    bl func_02007188
.L_518:
    add sp, sp, #0x54
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_524:
    ldr r0, _LIT0
    ldr r1, [r0, #0xb88]
    cmp r1, #0x3
    bne .L_550
    ldr r2, _LIT18
    mov r0, #0x5
    mov r1, #0xa
    bl func_02007188
    add sp, sp, #0x54
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_550:
    ldr r1, [r0, #0xc3c]
    ldr r0, _LIT14
    rsb r1, r1, #0x1
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x0
    beq .L_56c
    bl func_0201ac44
.L_56c:
    ldr r0, _LIT0
    ldr r0, [r0, #0xb9c]
    sub r0, r0, #0x1
    bl func_02019560
    bl func_02000ef8
    cmp r0, #0x0
    movne r0, #0x0
    add sp, sp, #0x54
    moveq r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_594:
    ldr r1, [r0, #0xb90]
    add r1, r1, #0x1
    str r1, [r0, #0xb90]
    cmp r1, #0x3
    bcs .L_5b4
    ldr r0, [r0, #0xbb4]
    cmp r0, #0x0
    bne .L_5c0
.L_5b4:
    ldr r0, _LIT0
    mov r1, #0x2
    str r1, [r0, #0xb88]
.L_5c0:
    ldr r1, _LIT0
    add sp, sp, #0x54
    ldr r2, [r1, #0xba0]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xba0]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_5dc:
    ldr r2, _LIT19
    mov r0, #0x5
    mov r1, #0x6
    bl func_02007188
    ldr r1, _LIT0
    add sp, sp, #0x54
    ldr r2, [r1, #0xba0]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xba0]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_608:
    mov r1, #0x1
    str r1, [r0, #0xba0]
    bl func_02034734
    cmp r0, #0x0
    beq .L_644
    bl func_02034734
    cmp r0, #0x1
    mov r0, #0x4
    mov r1, #0x1
    bne .L_63c
    ldr r2, _LIT1
    bl func_02007188
    b .L_644
.L_63c:
    ldr r2, _LIT2
    bl func_02007188
.L_644:
    add sp, sp, #0x54
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_650:
    mov r0, #0x1
    add sp, sp, #0x54
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_02103fcc
_LIT1: .word func_ov004_021cb438
_LIT2: .word func_ov004_021d6de4
_LIT3: .word data_02104c18
_LIT4: .word data_02104bd0
_LIT5: .word data_02104b9a
_LIT6: .word data_0210596c
_LIT7: .word data_0210586c
_LIT8: .word data_02104e6c
_LIT9: .word 0x000008cb
_LIT10: .word data_021058a9
_LIT11: .word func_ov003_021ca11c
_LIT12: .word func_ov002_0229ac78
_LIT13: .word data_02104c0c
_LIT14: .word data_02104b88
_LIT15: .word data_021058e8
_LIT16: .word 0x000003ff
_LIT17: .word 0xfff003ff
_LIT18: .word data_ov000_021b3f28
_LIT19: .word data_ov000_021b2d58
