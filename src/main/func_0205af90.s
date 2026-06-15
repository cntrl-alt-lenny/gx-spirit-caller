; func_0205af90 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02100780
        .extern data_021007a8
        .extern data_021007d8
        .extern data_021007f4
        .extern data_021007fc
        .extern data_0210080c
        .extern data_02100820
        .extern data_0210082c
        .extern data_02100838
        .extern data_02100844
        .extern data_02100868
        .extern data_02100884
        .extern data_0210088c
        .extern data_021008cc
        .extern data_021008d4
        .extern data_021008dc
        .extern data_021008e4
        .extern data_021008ec
        .extern data_021008f4
        .extern data_021008fc
        .extern data_02100904
        .extern data_021009d8
        .extern data_021009e0
        .extern data_02100a10
        .extern data_02100a20
        .extern data_02100a2c
        .extern data_02100a34
        .extern data_02100a3c
        .extern data_02100a44
        .extern data_02100a4c
        .extern data_02100a54
        .extern data_02100a5c
        .extern func_020453b4
        .extern func_020453e8
        .extern func_020552dc
        .extern func_02058528
        .extern func_020585d4
        .extern func_02059e5c
        .extern func_0205b7a8
        .extern func_0205b9ac
        .extern func_0205bd58
        .extern func_0205d6bc
        .extern func_0205d6f8
        .extern func_0205ffc0
        .extern func_0205ffd4
        .extern func_020602c4
        .extern func_020603cc
        .extern func_020a6d54
        .extern func_020ab054
        .extern func_020ac45c
        .extern func_020ace00
        .extern func_020b1c7c
        .global func_0205af90
        .arm
func_0205af90:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x26c
    mov r4, r2
    mov sl, r0
    mov fp, r1
    mov r1, r4
    mov r2, #0x1
    ldr r8, [sl]
    bl func_020603cc
    cmp r0, #0x0
    addne sp, sp, #0x26c
    movne r0, #0x4
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT0
    mov r0, r4
    mov r2, #0x4
    bl func_020ab054
    cmp r0, #0x0
    beq .L_13c
    ldr r2, _LIT1
    mov r0, sl
    mov r1, #0x1
    bl func_0205ffd4
    mov r0, sl
    mov r1, #0x3
    mov r2, #0x1
    bl func_020585d4
    add sp, sp, #0x26c
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_13c:
    ldr r1, _LIT2
    add r2, sp, #0x14
    mov r0, r4
    mov r3, #0x40
    bl func_020602c4
    cmp r0, #0x0
    bne .L_184
    ldr r2, _LIT1
    mov r0, sl
    mov r1, #0x1
    bl func_0205ffd4
    mov r0, sl
    mov r1, #0x3
    mov r2, #0x1
    bl func_020585d4
    add sp, sp, #0x26c
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_184:
    add r0, sp, #0x14
    bl func_020ace00
    mov r9, r0
    cmp r9, #0x0
    bgt .L_1ac
    ldr r0, _LIT3
    ldr r1, _LIT4
    ldr r3, _LIT5
    mov r2, #0x0
    bl func_020a6d54
.L_1ac:
    add r2, sp, #0x8
    mov r0, sl
    mov r1, r9
    bl func_0205d6bc
    mov r0, #0x0
    add r6, sp, #0x12c
    mov r1, r0
    mov r2, r0
    mov r3, r0
    mov r5, #0x7
.L_1d4:
    stmia r6!, {r0, r1, r2, r3}
    stmia r6!, {r0, r1, r2, r3}
    subs r5, r5, #0x1
    bne .L_1d4
    stmia r6!, {r0, r1, r2, r3}
    add r3, sp, #0x73
    add r1, sp, #0xbb
    add r2, sp, #0x54
    add r5, sp, #0x88
    add r0, sp, #0xda
    str r3, [sp, #0x130]
    add r3, sp, #0x21c
    str r1, [sp, #0x138]
    str r5, [sp, #0x134]
    add r5, sp, #0xf9
    str r0, [sp, #0x13c]
    str r3, [sp, #0x140]
    ldr r1, _LIT6
    mov r0, r4
    mov r3, #0x1f
    str r2, [sp, #0x12c]
    str r5, [sp, #0x1f4]
    bl func_020602c4
    cmp r0, #0x0
    ldreq r0, [sp, #0x12c]
    moveq r1, #0x0
    streqb r1, [r0]
    ldr r2, [sp, #0x130]
    ldr r1, _LIT7
    mov r0, r4
    mov r3, #0x15
    bl func_020602c4
    cmp r0, #0x0
    ldreq r0, [sp, #0x130]
    moveq r1, #0x0
    streqb r1, [r0]
    ldr r2, [sp, #0x134]
    ldr r1, _LIT8
    mov r0, r4
    mov r3, #0x33
    bl func_020602c4
    cmp r0, #0x0
    ldreq r0, [sp, #0x134]
    moveq r1, #0x0
    streqb r1, [r0]
    ldr r2, [sp, #0x138]
    ldr r1, _LIT9
    mov r0, r4
    mov r3, #0x1f
    bl func_020602c4
    cmp r0, #0x0
    ldreq r0, [sp, #0x138]
    moveq r1, #0x0
    streqb r1, [r0]
    ldr r2, [sp, #0x13c]
    ldr r1, _LIT10
    mov r0, r4
    mov r3, #0x1f
    bl func_020602c4
    cmp r0, #0x0
    ldreq r0, [sp, #0x13c]
    moveq r1, #0x0
    streqb r1, [r0]
    ldr r1, _LIT11
    add r2, sp, #0x14
    mov r0, r4
    mov r3, #0x40
    bl func_020602c4
    cmp r0, #0x0
    mvneq r0, #0x0
    streq r0, [sp, #0x144]
    beq .L_300
    add r0, sp, #0x14
    bl func_020ace00
    str r0, [sp, #0x144]
.L_300:
    ldr r2, [sp, #0x140]
    ldr r1, _LIT12
    mov r0, r4
    mov r3, #0x4c
    bl func_020602c4
    cmp r0, #0x0
    ldreq r0, [sp, #0x140]
    moveq r1, #0x0
    streqb r1, [r0]
    ldr r1, _LIT13
    add r2, sp, #0x148
    mov r0, r4
    mov r3, #0xb
    bl func_020602c4
    cmp r0, #0x0
    moveq r0, #0x0
    add r2, sp, #0x100
    streqb r0, [sp, #0x148]
    ldr r1, _LIT14
    add r2, r2, #0x53
    mov r0, r4
    mov r3, #0x3
    bl func_020602c4
    cmp r0, #0x0
    moveq r0, #0x0
    streqb r0, [sp, #0x153]
    ldr r1, _LIT15
    add r2, sp, #0x14
    mov r0, r4
    mov r3, #0x40
    bl func_020602c4
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [sp, #0x158]
    beq .L_39c
    add r0, sp, #0x14
    bl func_020ac45c
    bl func_020b1c7c
    str r0, [sp, #0x158]
.L_39c:
    ldr r1, _LIT16
    add r2, sp, #0x14
    mov r0, r4
    mov r3, #0x40
    bl func_020602c4
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [sp, #0x15c]
    beq .L_3d0
    add r0, sp, #0x14
    bl func_020ac45c
    bl func_020b1c7c
    str r0, [sp, #0x15c]
.L_3d0:
    ldr r1, _LIT17
    add r2, sp, #0x160
    mov r0, r4
    mov r3, #0x80
    bl func_020602c4
    cmp r0, #0x0
    moveq r0, #0x0
    streqb r0, [sp, #0x160]
    ldr r1, _LIT18
    add r2, sp, #0x14
    mov r0, r4
    mov r3, #0x40
    bl func_020602c4
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [sp, #0x1e0]
    streq r0, [sp, #0x1e4]
    streq r0, [sp, #0x1e8]
    beq .L_44c
    add r0, sp, #0x14
    bl func_020ace00
    add r5, sp, #0x1e8
    mov r1, r0
    add r2, sp, #0x1e0
    add r3, sp, #0x1e4
    mov r0, sl
    str r5, [sp]
    bl func_0205b9ac
    cmp r0, #0x0
    addne sp, sp, #0x26c
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_44c:
    ldr r1, _LIT19
    add r2, sp, #0x14
    mov r0, r4
    mov r3, #0x40
    bl func_020602c4
    cmp r0, #0x0
    ldreq r0, _LIT20
    streq r0, [sp, #0x1ec]
    beq .L_498
    ldrsb r0, [sp, #0x14]
    cmp r0, #0x30
    moveq r0, #0x500
    streq r0, [sp, #0x1ec]
    beq .L_498
    cmp r0, #0x31
    ldreq r0, _LIT21
    streq r0, [sp, #0x1ec]
    ldrne r0, _LIT20
    strne r0, [sp, #0x1ec]
.L_498:
    ldr r1, _LIT22
    add r2, sp, #0x14
    mov r0, r4
    mov r3, #0x40
    bl func_020602c4
    cmp r0, #0x0
    mvneq r0, #0x0
    streq r0, [sp, #0x1f0]
    beq .L_4c8
    add r0, sp, #0x14
    bl func_020ace00
    str r0, [sp, #0x1f0]
.L_4c8:
    ldr r2, [sp, #0x1f4]
    ldr r1, _LIT23
    mov r0, r4
    mov r3, #0x33
    bl func_020602c4
    cmp r0, #0x0
    ldreq r0, [sp, #0x1f4]
    moveq r1, #0x0
    streqb r1, [r0]
    ldr r1, _LIT24
    add r2, sp, #0x14
    mov r0, r4
    mov r3, #0x40
    bl func_020602c4
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [sp, #0x1f8]
    beq .L_51c
    add r0, sp, #0x14
    bl func_020ace00
    str r0, [sp, #0x1f8]
.L_51c:
    ldr r1, _LIT25
    add r2, sp, #0x14
    mov r0, r4
    mov r3, #0x40
    bl func_020602c4
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [sp, #0x1fc]
    beq .L_54c
    add r0, sp, #0x14
    bl func_020ace00
    str r0, [sp, #0x1fc]
.L_54c:
    ldr r1, _LIT26
    add r2, sp, #0x14
    mov r0, r4
    mov r3, #0x40
    bl func_020602c4
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [sp, #0x200]
    beq .L_57c
    add r0, sp, #0x14
    bl func_020ace00
    str r0, [sp, #0x200]
.L_57c:
    ldr r1, _LIT27
    add r2, sp, #0x14
    mov r0, r4
    mov r3, #0x40
    bl func_020602c4
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [sp, #0x204]
    beq .L_5ac
    add r0, sp, #0x14
    bl func_020ace00
    str r0, [sp, #0x204]
.L_5ac:
    ldr r1, _LIT28
    add r2, sp, #0x14
    mov r0, r4
    mov r3, #0x40
    bl func_020602c4
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [sp, #0x208]
    beq .L_5dc
    add r0, sp, #0x14
    bl func_020ace00
    str r0, [sp, #0x208]
.L_5dc:
    ldr r1, _LIT29
    add r2, sp, #0x14
    mov r0, r4
    mov r3, #0x40
    bl func_020602c4
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [sp, #0x20c]
    beq .L_60c
    add r0, sp, #0x14
    bl func_020ace00
    str r0, [sp, #0x20c]
.L_60c:
    ldr r1, _LIT30
    add r2, sp, #0x14
    mov r0, r4
    mov r3, #0x40
    bl func_020602c4
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [sp, #0x210]
    beq .L_63c
    add r0, sp, #0x14
    bl func_020ace00
    str r0, [sp, #0x210]
.L_63c:
    ldr r1, _LIT31
    add r2, sp, #0x14
    mov r0, r4
    mov r3, #0x40
    bl func_020602c4
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [sp, #0x214]
    beq .L_66c
    add r0, sp, #0x14
    bl func_020ace00
    str r0, [sp, #0x214]
.L_66c:
    ldr r1, _LIT32
    add r2, sp, #0x14
    mov r0, r4
    mov r3, #0x40
    bl func_020602c4
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [sp, #0x218]
    beq .L_69c
    add r0, sp, #0x14
    bl func_020ace00
    str r0, [sp, #0x218]
.L_69c:
    ldr r1, _LIT33
    add r2, sp, #0x14
    mov r0, r4
    mov r3, #0x40
    bl func_020602c4
    cmp r0, #0x0
    bne .L_6e4
    ldr r2, _LIT1
    mov r0, sl
    mov r1, #0x1
    bl func_0205ffd4
    mov r0, sl
    mov r1, #0x3
    mov r2, #0x1
    bl func_020585d4
    add sp, sp, #0x26c
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_6e4:
    ldr r7, [r8, #0x434]
    ldr r6, [r8, #0x100]
    cmp r7, #0x0
    beq .L_744
    mov r5, #0x66
    mov r4, #0x1
.L_6fc:
    ldr r0, [r7, #0xc]
    cmp r0, r9
    bne .L_738
    ldr r0, [r7]
    cmp r0, #0x65
    bne .L_738
    ldr r0, [sp, #0x8]
    cmp r0, #0x0
    bne .L_730
    mov r0, sl
    mov r1, r9
    bl func_0205d6f8
    str r0, [sp, #0x8]
.L_730:
    mov r6, r4
    str r5, [r7]
.L_738:
    ldr r7, [r7, #0x3c]
    cmp r7, #0x0
    bne .L_6fc
.L_744:
    ldr r0, [sp, #0x8]
    cmp r0, #0x0
    bne .L_76c
    ldr r0, [r8, #0x100]
    cmp r0, #0x0
    beq .L_76c
    mov r0, sl
    mov r1, r9
    bl func_0205d6f8
    str r0, [sp, #0x8]
.L_76c:
    cmp r6, #0x0
    beq .L_79c
    ldr r0, [sp, #0x8]
    ldr r0, [r0, #0x18]
    bl func_020453b4
    ldr r1, [sp, #0x8]
    mov r2, #0x0
    add r0, sp, #0x14
    str r2, [r1, #0x18]
    bl func_020552dc
    ldr r1, [sp, #0x8]
    str r0, [r1, #0x18]
.L_79c:
    ldr r0, [r8, #0x100]
    cmp r0, #0x0
    beq .L_7b8
    ldr r1, [sp, #0x8]
    add r2, sp, #0x12c
    mov r0, sl
    bl func_02059e5c
.L_7b8:
    ldr r1, [fp, #0xc]
    ldr r0, [fp, #0x10]
    cmp r1, #0x0
    str r1, [sp, #0xc]
    str r0, [sp, #0x10]
    beq .L_838
    mov r0, #0x204
    bl func_020453e8
    movs r4, r0
    bne .L_7f8
    ldr r1, _LIT34
    mov r0, sl
    bl func_0205ffc0
    add sp, sp, #0x26c
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_7f8:
    add r0, sp, #0x12c
    mov r1, r4
    bl func_0205b7a8
    mov r0, #0x0
    str r0, [r4]
    str r9, [r4, #0x4]
    str fp, [sp]
    str r0, [sp, #0x4]
    add r1, sp, #0xc
    mov r0, sl
    mov r3, r4
    ldmia r1, {r1, r2}
    bl func_02058528
    cmp r0, #0x0
    addne sp, sp, #0x26c
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_838:
    mov r0, sl
    mov r1, fp
    bl func_0205bd58
    mov r0, #0x0
    add sp, sp, #0x26c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_021009d8
_LIT1: .word data_021009e0
_LIT2: .word data_021007a8
_LIT3: .word data_02100a10
_LIT4: .word data_02100a20
_LIT5: .word 0x0000015a
_LIT6: .word data_021007f4
_LIT7: .word data_021007fc
_LIT8: .word data_0210080c
_LIT9: .word data_02100820
_LIT10: .word data_0210082c
_LIT11: .word data_0210088c
_LIT12: .word data_02100838
_LIT13: .word data_02100844
_LIT14: .word data_02100868
_LIT15: .word data_02100a2c
_LIT16: .word data_02100a34
_LIT17: .word data_02100a3c
_LIT18: .word data_021007d8
_LIT19: .word data_02100884
_LIT20: .word 0x00000502
_LIT21: .word 0x00000501
_LIT22: .word data_02100a44
_LIT23: .word data_021008cc
_LIT24: .word data_021008d4
_LIT25: .word data_021008dc
_LIT26: .word data_021008e4
_LIT27: .word data_021008ec
_LIT28: .word data_021008f4
_LIT29: .word data_021008fc
_LIT30: .word data_02100904
_LIT31: .word data_02100a4c
_LIT32: .word data_02100a54
_LIT33: .word data_02100a5c
_LIT34: .word data_02100780
