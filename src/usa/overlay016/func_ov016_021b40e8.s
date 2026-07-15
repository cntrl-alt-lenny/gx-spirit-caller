; func_ov016_021b40e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104acc
        .extern data_02104e6c
        .extern data_ov016_021b8c8c
        .extern data_ov016_021b9024
        .extern data_ov016_021b902e
        .extern data_ov016_021b9038
        .extern data_ov016_021b9042
        .extern data_ov016_021b904c
        .extern data_ov016_021ba9e4
        .extern data_ov016_021baad8
        .extern func_02005d90
        .extern func_02006190
        .extern func_020943b0
        .extern func_ov016_021b277c
        .extern func_ov016_021b3398
        .extern func_ov016_021b5000
        .extern func_ov016_021b5034
        .extern func_ov016_021b523c
        .extern func_ov016_021b52c0
        .extern func_ov016_021b52d0
        .global func_ov016_021b40e8
        .arm
func_ov016_021b40e8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x20
    mov sl, r0
    ldr r1, [sl]
    cmp r1, #0x1
    addne sp, sp, #0x20
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r2, _LIT0
    mov r1, #0x2
    ldr r7, [r2, #0x8]
    mov r2, #0x2d
    str r2, [sp]
    mov r4, #0x0
    str r4, [sp, #0x4]
    sub r2, r1, #0x3
    mov r3, #0xd
    str r4, [sp, #0x8]
    bl func_ov016_021b5000
    mov r0, #0x74
    stmia sp, {r0, r4}
    mov r1, #0x1
    mov r0, sl
    sub r2, r1, #0x2
    mov r3, #0xd
    str r4, [sp, #0x8]
    bl func_ov016_021b5000
    ldr r0, _LIT1
    mov r2, #0x17
    ldrh r0, [r0, #0x52]
    tst r0, #0x200
    beq .L_88
    cmp r7, #0x0
    moveq r2, #0x18
.L_88:
    mov r0, #0x90
    str r0, [sp]
    mov r1, #0x0
    str r1, [sp, #0x4]
    mov r0, sl
    mov r3, #0x6
    str r1, [sp, #0x8]
    bl func_ov016_021b5000
    ldr r0, _LIT1
    mov r2, #0x19
    ldrh r0, [r0, #0x52]
    tst r0, #0x100
    beq .L_c4
    cmp r7, #0x0
    moveq r2, #0x1a
.L_c4:
    mov r0, #0x90
    str r0, [sp]
    mov r1, #0x0
    str r1, [sp, #0x4]
    mov r0, sl
    str r1, [sp, #0x8]
    mov r3, #0xec
    bl func_ov016_021b5000
    ldmib sl, {r1, r2}
    orr r3, r2, #0x0
    orr r2, r1, #0x0
    mov r0, sl
    mov r1, #0x0
    bl func_ov016_021b5034
    ldr r2, [sl, #0x10]
    ldr r1, [sl, #0xc]
    orr r3, r2, #0x0
    orr r2, r1, #0x0
    mov r0, sl
    mov r1, #0x1
    bl func_ov016_021b5034
    ldr r0, [sl, #0x14]
    ldr r1, _LIT2
    rsb r3, r0, #0xb
    add r0, r3, r3, lsl #0x4
    rsb r2, r0, #0xda
    mov r0, r3, asr #0x1
    add r0, r3, r0, lsr #0x1e
    mov r0, r0, asr #0x2
    sub r0, r2, r0, lsl #0x2
    sub r0, r0, #0x2
    mov r0, r0, lsl #0x17
    orr r0, r1, r0, lsr #0x7
    str r0, [sp, #0xc]
    mov r0, #0x80
    strh r0, [sp, #0x10]
    mov r0, #0x1
    mov r1, #0x0
    bl func_02005d90
    mov r1, r0
    add r0, sp, #0xc
    mov r2, #0x6
    bl func_020943b0
    ldr r1, _LIT3
    ldr r4, _LIT4
    ldrh r0, [r1, #0x2]
    ldrh r2, [r1]
    ldrh r3, [r1, #0x4]
    strh r0, [sp, #0x16]
    strh r2, [sp, #0x14]
    ldrh r2, [r1, #0x6]
    mov r0, r4
    mov r5, #0x28
    strh r3, [sp, #0x18]
    strh r2, [sp, #0x1a]
    ldrh r1, [r1, #0x8]
    strh r1, [sp, #0x1c]
    bl func_ov016_021b277c
    cmp r0, #0x0
    beq .L_1bc
    cmp r7, #0x0
    addeq r5, r5, #0x1
.L_1bc:
    ldr r0, _LIT5
    mov r2, r5
    mov r3, r4
    mov r1, #0x0
    bl func_ov016_021b3398
    ldr r5, _LIT6
    mov r4, #0x14
    mov r0, r5
    bl func_ov016_021b277c
    cmp r0, #0x0
    beq .L_1f0
    cmp r7, #0x0
    addeq r4, r4, #0x1
.L_1f0:
    ldr r0, _LIT5
    mov r2, r4
    mov r3, r5
    mov r1, #0x0
    bl func_ov016_021b3398
    ldr r5, _LIT7
    mov r4, #0x16
    mov r0, r5
    bl func_ov016_021b277c
    cmp r0, #0x0
    beq .L_224
    cmp r7, #0x0
    addeq r4, r4, #0x1
.L_224:
    ldr r0, _LIT5
    mov r2, r4
    mov r3, r5
    mov r1, #0x0
    bl func_ov016_021b3398
    ldr r0, _LIT8
    ldr r4, _LIT9
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    moveq r5, #0x18
    mov r0, r4
    movne r5, #0x1c
    bl func_ov016_021b277c
    cmp r0, #0x0
    beq .L_26c
    cmp r7, #0x0
    addeq r5, r5, #0x1
.L_26c:
    ldr r0, _LIT5
    mov r2, r5
    mov r3, r4
    mov r1, #0x0
    bl func_ov016_021b3398
    ldr r0, _LIT8
    ldr r4, _LIT10
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    moveq r5, #0x1a
    movne r0, r0, lsl #0x1
    addne r5, r0, #0x1c
    mov r0, r4
    bl func_ov016_021b277c
    cmp r0, #0x0
    beq .L_2b8
    cmp r7, #0x0
    addeq r5, r5, #0x1
.L_2b8:
    ldr r0, _LIT5
    mov r2, r5
    mov r3, r4
    mov r1, #0x0
    bl func_ov016_021b3398
    mov r6, #0x0
    ldr r5, _LIT4
    mov r8, r6
    mov fp, #0xa
.L_2dc:
    add r0, r6, #0x5
    mul r4, r0, fp
    add r0, r5, r4
    mov r9, r8
    bl func_ov016_021b277c
    cmp r0, #0x0
    beq .L_300
    cmp r7, #0x0
    addeq r9, r8, #0x1
.L_300:
    ldr r0, _LIT5
    mov r1, #0x0
    mov r2, r9
    add r3, r5, r4
    bl func_ov016_021b3398
    add r6, r6, #0x1
    cmp r6, #0xa
    add r8, r8, #0x2
    blt .L_2dc
    bl func_02006190
    cmp r0, #0x0
    cmpeq r7, #0x0
    bne .L_53c
    mov r0, sl
    bl func_ov016_021b523c
    mov r1, r0
    mov r0, sl
    bl func_ov016_021b52c0
    ldr r2, _LIT4
    mov r1, #0xa
    mla r4, r0, r1, r2
    cmp r0, #0x3
    bne .L_48c
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    ldr r2, _LIT11
    sub r0, r0, #0x5
    and r0, r0, #0xff
    sub r1, r1, #0x5
    orr r0, r0, #0x4000
    mov r1, r1, lsl #0x17
    orr r0, r0, #-1073741824
    orr r3, r0, r1, lsr #0x7
    mov r0, #0x2
    mov r1, #0x0
    str r3, [sp, #0xc]
    strh r2, [sp, #0x10]
    bl func_02005d90
    mov r1, r0
    add r0, sp, #0xc
    mov r2, #0x6
    bl func_020943b0
    ldrh r1, [r4]
    ldrh r0, [r4, #0x2]
    ldr r2, _LIT12
    sub r1, r1, #0x5
    add r0, r0, #0x19
    mov r1, r1, lsl #0x17
    and r0, r0, #0xff
    orr r3, r0, r1, lsr #0x7
    mov r0, #0x2
    mov r1, #0x0
    str r3, [sp, #0xc]
    strh r2, [sp, #0x10]
    bl func_02005d90
    mov r1, r0
    add r0, sp, #0xc
    mov r2, #0x6
    bl func_020943b0
    ldr r0, _LIT13
    ldrh r2, [r4]
    ldrh r1, [r4, #0x2]
    strh r0, [sp, #0x10]
    add r2, r2, #0x1b
    add r0, r1, #0x19
    and r0, r0, #0xff
    orr r0, r0, #0x4000
    mov r2, r2, lsl #0x17
    orr r0, r0, #0x40000000
    orr r0, r0, r2, lsr #0x7
    str r0, [sp, #0xc]
    mov r0, #0x2
    mov r1, #0x0
    bl func_02005d90
    mov r1, r0
    add r0, sp, #0xc
    mov r2, #0x6
    bl func_020943b0
    ldr r0, _LIT11
    ldrh r2, [r4]
    ldrh r1, [r4, #0x2]
    strh r0, [sp, #0x10]
    sub r2, r2, #0x5
    add r0, r1, #0x21
    and r0, r0, #0xff
    orr r0, r0, #0x4000
    mov r2, r2, lsl #0x17
    orr r0, r0, #-1073741824
    orr r0, r0, r2, lsr #0x7
    orr r0, r0, #0x20000000
    str r0, [sp, #0xc]
    mov r0, #0x2
    mov r1, #0x0
    bl func_02005d90
    mov r1, r0
    add r0, sp, #0xc
    mov r2, #0x6
    bl func_020943b0
    b .L_520
.L_48c:
    cmp r0, #0x4
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    bne .L_4e0
    sub r0, r0, #0x5
    sub r1, r1, #0x5
    and r0, r0, #0xff
    ldr r2, _LIT11
    mov r1, r1, lsl #0x17
    orr r0, r0, #-1073741824
    orr r3, r0, r1, lsr #0x7
    mov r0, #0x2
    mov r1, #0x0
    str r3, [sp, #0xc]
    strh r2, [sp, #0x10]
    bl func_02005d90
    mov r1, r0
    add r0, sp, #0xc
    mov r2, #0x6
    bl func_020943b0
    b .L_520
.L_4e0:
    sub r0, r0, #0x5
    sub r1, r1, #0x5
    and r0, r0, #0xff
    ldr r2, _LIT14
    mov r1, r1, lsl #0x17
    orr r0, r0, #-1073741824
    orr r3, r0, r1, lsr #0x7
    mov r0, #0x2
    mov r1, #0x0
    str r3, [sp, #0xc]
    strh r2, [sp, #0x10]
    bl func_02005d90
    mov r1, r0
    add r0, sp, #0xc
    mov r2, #0x6
    bl func_020943b0
.L_520:
    ldr r4, _LIT15
    ldr r1, _LIT16
    add r2, sp, #0x14
    mov r0, sl
    mov r3, #0x5
    str r4, [sp]
    bl func_ov016_021b52d0
.L_53c:
    mov r0, #0x1
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov016_021baad8
_LIT1: .word data_02104acc
_LIT2: .word 0x80000083
_LIT3: .word data_ov016_021b8c8c
_LIT4: .word data_ov016_021b9024
_LIT5: .word data_ov016_021ba9e4
_LIT6: .word data_ov016_021b902e
_LIT7: .word data_ov016_021b9038
_LIT8: .word data_02104e6c
_LIT9: .word data_ov016_021b9042
_LIT10: .word data_ov016_021b904c
_LIT11: .word 0x000042b8
_LIT12: .word 0x000042ba
_LIT13: .word 0x000042bb
_LIT14: .word 0x000042a8
_LIT15: .word 0x00600100
_LIT16: .word 0x05000696
