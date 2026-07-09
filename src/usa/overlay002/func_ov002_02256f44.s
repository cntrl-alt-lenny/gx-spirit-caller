; func_ov002_02256f44 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd664
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_ov002_021b0d18
        .extern func_ov002_021c3c10
        .extern func_ov002_021d500c
        .extern func_ov002_021d5138
        .extern func_ov002_021d5f1c
        .extern func_ov002_021e26d0
        .extern func_ov002_021e27c4
        .extern func_ov002_021e2ae4
        .extern func_ov002_021e2b6c
        .extern func_ov002_021fe2e4
        .extern func_ov002_02253710
        .extern func_ov002_022538b8
        .extern func_ov002_02253b04
        .extern func_ov002_02253dbc
        .extern func_ov002_0225406c
        .extern func_ov002_022546dc
        .extern func_ov002_02254824
        .extern func_ov002_0225499c
        .extern func_ov002_02254cac
        .extern func_ov002_02255060
        .extern func_ov002_022550ec
        .extern func_ov002_0225525c
        .extern func_ov002_0225536c
        .extern func_ov002_022554bc
        .extern func_ov002_02255774
        .extern func_ov002_02255804
        .extern func_ov002_022558b0
        .extern func_ov002_02255b1c
        .extern func_ov002_02255c88
        .extern func_ov002_02255d6c
        .extern func_ov002_02255e84
        .extern func_ov002_02255f9c
        .extern func_ov002_02256020
        .extern func_ov002_022560f8
        .extern func_ov002_02256308
        .extern func_ov002_022563f4
        .extern func_ov002_022564dc
        .extern func_ov002_02256638
        .extern func_ov002_02256724
        .extern func_ov002_022567c0
        .extern func_ov002_02256968
        .extern func_ov002_022569e0
        .extern func_ov002_02256af0
        .extern func_ov002_02256c08
        .extern func_ov002_02256d34
        .global func_ov002_02256f44
        .arm
func_ov002_02256f44:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r0, _LIT0
    ldr r0, [r0, #0xd3c]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    bl func_ov002_021b0d18
    ldr r0, _LIT0
    ldr r1, [r0, #0xd0c]
    cmp r1, #0x0
    beq .L_44
    ldr r1, [r0, #0xcec]
    ldr r0, _LIT1
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x2
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_44:
    bl func_ov002_021e2ae4
    bl func_ov002_021fe2e4
    cmp r0, #0x0
    bne .L_3d8
    bl func_ov002_02253710
    cmp r0, #0x0
    bne .L_3d8
    bl func_ov002_0225406c
    cmp r0, #0x0
    bne .L_3d8
    mvn r0, #0x0
    mov r1, #0x0
    bl func_ov002_02253dbc
    bl func_ov002_02255d6c
    cmp r0, #0x0
    bne .L_3d8
    bl func_ov002_02255e84
    cmp r0, #0x0
    bne .L_3d8
    bl func_ov002_022569e0
    cmp r0, #0x0
    bne .L_3d8
    bl func_ov002_02256d34
    cmp r0, #0x0
    bne .L_3d8
    bl func_ov002_02256020
    cmp r0, #0x0
    bne .L_3d8
    bl func_ov002_0225525c
    cmp r0, #0x0
    bne .L_3d8
    bl func_ov002_02254824
    cmp r0, #0x0
    bne .L_3d8
    bl func_ov002_02254cac
    cmp r0, #0x0
    bne .L_3d8
    bl func_ov002_02255b1c
    cmp r0, #0x0
    bne .L_3d8
    bl func_ov002_0225536c
    cmp r0, #0x0
    bne .L_3d8
    bl func_ov002_022550ec
    cmp r0, #0x0
    bne .L_3d8
    bl func_ov002_022546dc
    cmp r0, #0x0
    bne .L_3d8
    bl func_ov002_022554bc
    cmp r0, #0x0
    bne .L_3d8
    bl func_ov002_02255c88
    cmp r0, #0x0
    bne .L_3d8
    bl func_ov002_02256308
    cmp r0, #0x0
    bne .L_3d8
    bl func_ov002_022563f4
    cmp r0, #0x0
    bne .L_3d8
    bl func_ov002_022564dc
    cmp r0, #0x0
    bne .L_3d8
    bl func_ov002_02256638
    cmp r0, #0x0
    bne .L_3d8
    ldr r0, _LIT2
    bl func_ov002_022538b8
    cmp r0, #0x0
    bne .L_3d8
    ldr r0, _LIT3
    bl func_ov002_02253b04
    cmp r0, #0x0
    bne .L_3d8
    ldr r0, _LIT4
    bl func_ov002_02253b04
    cmp r0, #0x0
    bne .L_3d8
    ldr r0, _LIT5
    bl func_ov002_02253b04
    cmp r0, #0x0
    bne .L_3d8
    ldr r0, _LIT6
    bl func_ov002_02253b04
    cmp r0, #0x0
    bne .L_3d8
    ldr r0, _LIT7
    bl func_ov002_02253b04
    cmp r0, #0x0
    bne .L_3d8
    ldr r0, _LIT8
    bl func_ov002_022538b8
    cmp r0, #0x0
    bne .L_3d8
    bl func_ov002_02256968
    cmp r0, #0x0
    bne .L_3d8
    bl func_ov002_02255f9c
    cmp r0, #0x0
    bne .L_3d8
    bl func_ov002_02256af0
    cmp r0, #0x0
    bne .L_3d8
    bl func_ov002_022567c0
    cmp r0, #0x0
    bne .L_3d8
    bl func_ov002_022560f8
    cmp r0, #0x0
    bne .L_3d8
    bl func_ov002_0225499c
    cmp r0, #0x0
    bne .L_3d8
    bl func_ov002_02256c08
    cmp r0, #0x0
    bne .L_3d8
    ldr r0, _LIT0
    ldr r0, [r0, #0xd0]
    tst r0, #0x1
    bne .L_274
    bl func_ov002_02256724
    cmp r0, #0x0
    bne .L_3d8
    bl func_ov002_02255060
    cmp r0, #0x0
    bne .L_3d8
    bl func_ov002_02255774
    cmp r0, #0x0
    bne .L_3d8
    ldr r0, _LIT9
    bl func_ov002_022558b0
    cmp r0, #0x0
    bne .L_3d8
    ldr r0, _LIT10
    bl func_ov002_022558b0
    cmp r0, #0x0
    bne .L_3d8
    bl func_ov002_02255804
    cmp r0, #0x0
    bne .L_3d8
.L_274:
    mov r8, #0x0
    ldr r4, _LIT11
    ldr r9, _LIT12
    ldr sl, _LIT0
    mov r5, r8
    mov r6, #0x1
.L_28c:
    ldr r0, [sl, #0xcec]
    eor r7, r0, r8
    mov r0, r7
    bl func_ov002_021c3c10
    cmp r0, #0x0
    mov r0, r7
    beq .L_2b4
    mov r1, r6
    bl func_ov002_021e26d0
    b .L_2dc
.L_2b4:
    mov r1, r5
    bl func_ov002_021e26d0
    and r1, r7, #0x1
    mla r0, r1, r9, r4
    ldr r0, [r0, #0x11c]
    mov r0, r0, lsr #0x2
    tst r0, #0x1
    beq .L_2dc
    mov r0, r7
    bl func_ov002_021e27c4
.L_2dc:
    add r8, r8, #0x1
    cmp r8, #0x2
    blt .L_28c
    ldr r5, _LIT11
    ldr r4, _LIT0
    ldr fp, _LIT12
    mov r9, #0x0
.L_2f8:
    ldr r0, [r4, #0xcec]
    mov r6, #0x0
    eor sl, r0, r9
    and r0, sl, #0x1
    mla r8, r0, fp, r5
    add r7, r8, #0x30
.L_310:
    ldr r0, [r7]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_360
    ldrh r0, [r8, #0x38]
    cmp r0, #0x0
    bne .L_338
    mov r0, sl
    mov r1, r6
    bl func_ov002_021d5f1c
.L_338:
    mov r0, sl
    mov r1, r6
    bl func_ov002_021d5138
    cmp r0, #0x0
    bne .L_3d8
    mov r0, sl
    mov r1, r6
    bl func_ov002_021d500c
    cmp r0, #0x0
    bne .L_3d8
.L_360:
    add r6, r6, #0x1
    cmp r6, #0x5
    add r7, r7, #0x14
    add r8, r8, #0x14
    blt .L_310
    add r9, r9, #0x1
    cmp r9, #0x2
    blt .L_2f8
    ldr r0, _LIT13
    bl func_ov002_02253b04
    cmp r0, #0x0
    bne .L_3d8
    ldr r0, _LIT14
    bl func_ov002_02253b04
    cmp r0, #0x0
    bne .L_3d8
    ldr r0, _LIT15
    bl func_ov002_02253b04
    cmp r0, #0x0
    bne .L_3d8
    ldr r0, _LIT16
    bl func_ov002_02253b04
    cmp r0, #0x0
    bne .L_3d8
    bl func_ov002_021e2b6c
    ldr r1, _LIT0
    mov r0, #0x0
    str r0, [r1, #0xd3c]
    str r0, [r1, #0xd40]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_3d8:
    bl func_ov002_021e2b6c
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word data_ov002_022cd664
_LIT2: .word 0x000016da
_LIT3: .word 0x0000142c
_LIT4: .word 0x000017a4
_LIT5: .word 0x0000151a
_LIT6: .word 0x00001574
_LIT7: .word 0x00001a51
_LIT8: .word 0x000018b2
_LIT9: .word 0x0000158b
_LIT10: .word 0x0000160f
_LIT11: .word data_ov002_022cf08c
_LIT12: .word 0x00000868
_LIT13: .word 0x00001762
_LIT14: .word 0x0000186b
_LIT15: .word 0x00001862
_LIT16: .word 0x00001875
