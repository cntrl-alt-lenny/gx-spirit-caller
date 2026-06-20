; func_ov002_0225702c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd744
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern func_ov002_021b0df8
        .extern func_ov002_021c3cf0
        .extern func_ov002_021d50fc
        .extern func_ov002_021d5228
        .extern func_ov002_021d600c
        .extern func_ov002_021e27c0
        .extern func_ov002_021e28b4
        .extern func_ov002_021e2bd4
        .extern func_ov002_021e2c5c
        .extern func_ov002_021fe3d4
        .extern func_ov002_022537f8
        .extern func_ov002_022539a0
        .extern func_ov002_02253bec
        .extern func_ov002_02253ea4
        .extern func_ov002_02254154
        .extern func_ov002_022547c4
        .extern func_ov002_0225490c
        .extern func_ov002_02254a84
        .extern func_ov002_02254d94
        .extern func_ov002_02255148
        .extern func_ov002_022551d4
        .extern func_ov002_02255344
        .extern func_ov002_02255454
        .extern func_ov002_022555a4
        .extern func_ov002_0225585c
        .extern func_ov002_022558ec
        .extern func_ov002_02255998
        .extern func_ov002_02255c04
        .extern func_ov002_02255d70
        .extern func_ov002_02255e54
        .extern func_ov002_02255f6c
        .extern func_ov002_02256084
        .extern func_ov002_02256108
        .extern func_ov002_022561e0
        .extern func_ov002_022563f0
        .extern func_ov002_022564dc
        .extern func_ov002_022565c4
        .extern func_ov002_02256720
        .extern func_ov002_0225680c
        .extern func_ov002_022568a8
        .extern func_ov002_02256a50
        .extern func_ov002_02256ac8
        .extern func_ov002_02256bd8
        .extern func_ov002_02256cf0
        .extern func_ov002_02256e1c
        .global func_ov002_0225702c
        .arm
func_ov002_0225702c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r0, _LIT0
    ldr r0, [r0, #0xd3c]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    bl func_ov002_021b0df8
    ldr r0, _LIT0
    ldr r1, [r0, #0xd0c]
    cmp r1, #0x0
    beq .L_138
    ldr r1, [r0, #0xcec]
    ldr r0, _LIT1
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x2
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_138:
    bl func_ov002_021e2bd4
    bl func_ov002_021fe3d4
    cmp r0, #0x0
    bne .L_4cc
    bl func_ov002_022537f8
    cmp r0, #0x0
    bne .L_4cc
    bl func_ov002_02254154
    cmp r0, #0x0
    bne .L_4cc
    mvn r0, #0x0
    mov r1, #0x0
    bl func_ov002_02253ea4
    bl func_ov002_02255e54
    cmp r0, #0x0
    bne .L_4cc
    bl func_ov002_02255f6c
    cmp r0, #0x0
    bne .L_4cc
    bl func_ov002_02256ac8
    cmp r0, #0x0
    bne .L_4cc
    bl func_ov002_02256e1c
    cmp r0, #0x0
    bne .L_4cc
    bl func_ov002_02256108
    cmp r0, #0x0
    bne .L_4cc
    bl func_ov002_02255344
    cmp r0, #0x0
    bne .L_4cc
    bl func_ov002_0225490c
    cmp r0, #0x0
    bne .L_4cc
    bl func_ov002_02254d94
    cmp r0, #0x0
    bne .L_4cc
    bl func_ov002_02255c04
    cmp r0, #0x0
    bne .L_4cc
    bl func_ov002_02255454
    cmp r0, #0x0
    bne .L_4cc
    bl func_ov002_022551d4
    cmp r0, #0x0
    bne .L_4cc
    bl func_ov002_022547c4
    cmp r0, #0x0
    bne .L_4cc
    bl func_ov002_022555a4
    cmp r0, #0x0
    bne .L_4cc
    bl func_ov002_02255d70
    cmp r0, #0x0
    bne .L_4cc
    bl func_ov002_022563f0
    cmp r0, #0x0
    bne .L_4cc
    bl func_ov002_022564dc
    cmp r0, #0x0
    bne .L_4cc
    bl func_ov002_022565c4
    cmp r0, #0x0
    bne .L_4cc
    bl func_ov002_02256720
    cmp r0, #0x0
    bne .L_4cc
    ldr r0, _LIT2
    bl func_ov002_022539a0
    cmp r0, #0x0
    bne .L_4cc
    ldr r0, _LIT3
    bl func_ov002_02253bec
    cmp r0, #0x0
    bne .L_4cc
    ldr r0, _LIT4
    bl func_ov002_02253bec
    cmp r0, #0x0
    bne .L_4cc
    ldr r0, _LIT5
    bl func_ov002_02253bec
    cmp r0, #0x0
    bne .L_4cc
    ldr r0, _LIT6
    bl func_ov002_02253bec
    cmp r0, #0x0
    bne .L_4cc
    ldr r0, _LIT7
    bl func_ov002_02253bec
    cmp r0, #0x0
    bne .L_4cc
    ldr r0, _LIT8
    bl func_ov002_022539a0
    cmp r0, #0x0
    bne .L_4cc
    bl func_ov002_02256a50
    cmp r0, #0x0
    bne .L_4cc
    bl func_ov002_02256084
    cmp r0, #0x0
    bne .L_4cc
    bl func_ov002_02256bd8
    cmp r0, #0x0
    bne .L_4cc
    bl func_ov002_022568a8
    cmp r0, #0x0
    bne .L_4cc
    bl func_ov002_022561e0
    cmp r0, #0x0
    bne .L_4cc
    bl func_ov002_02254a84
    cmp r0, #0x0
    bne .L_4cc
    bl func_ov002_02256cf0
    cmp r0, #0x0
    bne .L_4cc
    ldr r0, _LIT0
    ldr r0, [r0, #0xd0]
    tst r0, #0x1
    bne .L_368
    bl func_ov002_0225680c
    cmp r0, #0x0
    bne .L_4cc
    bl func_ov002_02255148
    cmp r0, #0x0
    bne .L_4cc
    bl func_ov002_0225585c
    cmp r0, #0x0
    bne .L_4cc
    ldr r0, _LIT9
    bl func_ov002_02255998
    cmp r0, #0x0
    bne .L_4cc
    ldr r0, _LIT10
    bl func_ov002_02255998
    cmp r0, #0x0
    bne .L_4cc
    bl func_ov002_022558ec
    cmp r0, #0x0
    bne .L_4cc
.L_368:
    mov r8, #0x0
    ldr r4, _LIT11
    ldr r9, _LIT12
    ldr sl, _LIT0
    mov r5, r8
    mov r6, #0x1
.L_380:
    ldr r0, [sl, #0xcec]
    eor r7, r0, r8
    mov r0, r7
    bl func_ov002_021c3cf0
    cmp r0, #0x0
    mov r0, r7
    beq .L_3a8
    mov r1, r6
    bl func_ov002_021e27c0
    b .L_3d0
.L_3a8:
    mov r1, r5
    bl func_ov002_021e27c0
    and r1, r7, #0x1
    mla r0, r1, r9, r4
    ldr r0, [r0, #0x11c]
    mov r0, r0, lsr #0x2
    tst r0, #0x1
    beq .L_3d0
    mov r0, r7
    bl func_ov002_021e28b4
.L_3d0:
    add r8, r8, #0x1
    cmp r8, #0x2
    blt .L_380
    ldr r5, _LIT11
    ldr r4, _LIT0
    ldr fp, _LIT12
    mov r9, #0x0
.L_3ec:
    ldr r0, [r4, #0xcec]
    mov r6, #0x0
    eor sl, r0, r9
    and r0, sl, #0x1
    mla r8, r0, fp, r5
    add r7, r8, #0x30
.L_404:
    ldr r0, [r7]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_454
    ldrh r0, [r8, #0x38]
    cmp r0, #0x0
    bne .L_42c
    mov r0, sl
    mov r1, r6
    bl func_ov002_021d600c
.L_42c:
    mov r0, sl
    mov r1, r6
    bl func_ov002_021d5228
    cmp r0, #0x0
    bne .L_4cc
    mov r0, sl
    mov r1, r6
    bl func_ov002_021d50fc
    cmp r0, #0x0
    bne .L_4cc
.L_454:
    add r6, r6, #0x1
    cmp r6, #0x5
    add r7, r7, #0x14
    add r8, r8, #0x14
    blt .L_404
    add r9, r9, #0x1
    cmp r9, #0x2
    blt .L_3ec
    ldr r0, _LIT13
    bl func_ov002_02253bec
    cmp r0, #0x0
    bne .L_4cc
    ldr r0, _LIT14
    bl func_ov002_02253bec
    cmp r0, #0x0
    bne .L_4cc
    ldr r0, _LIT15
    bl func_ov002_02253bec
    cmp r0, #0x0
    bne .L_4cc
    ldr r0, _LIT16
    bl func_ov002_02253bec
    cmp r0, #0x0
    bne .L_4cc
    bl func_ov002_021e2c5c
    ldr r1, _LIT0
    mov r0, #0x0
    str r0, [r1, #0xd3c]
    str r0, [r1, #0xd40]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_4cc:
    bl func_ov002_021e2c5c
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word data_ov002_022cd744
_LIT2: .word 0x000016da
_LIT3: .word 0x0000142c
_LIT4: .word 0x000017a4
_LIT5: .word 0x0000151a
_LIT6: .word 0x00001574
_LIT7: .word 0x00001a51
_LIT8: .word 0x000018b2
_LIT9: .word 0x0000158b
_LIT10: .word 0x0000160f
_LIT11: .word data_ov002_022cf16c
_LIT12: .word 0x00000868
_LIT13: .word 0x00001762
_LIT14: .word 0x0000186b
_LIT15: .word 0x00001862
_LIT16: .word 0x00001875
