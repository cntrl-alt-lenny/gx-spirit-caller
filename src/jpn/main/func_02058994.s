; func_02058994 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021002e0
        .extern data_021002e8
        .extern data_021002f0
        .extern data_021002f8
        .extern data_02100328
        .extern data_02100334
        .extern data_0210033c
        .extern data_02100348
        .extern data_02100378
        .extern data_02100384
        .extern data_0210038c
        .extern data_02100398
        .extern data_021003a8
        .extern data_021003b0
        .extern data_021003b8
        .extern data_021003c8
        .extern data_021003fc
        .extern data_02100404
        .extern data_02100424
        .extern func_02045398
        .extern func_020547f4
        .extern func_020584b4
        .extern func_02058560
        .extern func_0205907c
        .extern func_02059318
        .extern func_0205bce4
        .extern func_0205d614
        .extern func_0205d684
        .extern func_0205ff4c
        .extern func_0205ff60
        .extern func_02060250
        .extern func_02060358
        .extern func_0206043c
        .extern func_020a72e0
        .extern func_020a734c
        .extern func_020a9698
        .extern func_020aace8
        .extern func_020aaf60
        .extern func_020aafd0
        .extern func_020acd0c
        .global func_02058994
        .arm
func_02058994:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x2a0
    mov r6, r2
    mov r8, r0
    mov r7, r1
    mov r1, r6
    mov r2, #0x0
    ldr r5, [r8]
    bl func_02060358
    cmp r0, #0x0
    beq .L_100
    ldr r2, [r5, #0x418]
    ldr r0, _LIT0
    cmp r2, r0
    bne .L_60
    ldr r1, [r5, #0x1a0]
    cmp r1, #0x0
    beq .L_60
    mov r0, r8
    bl func_0205d614
    mov r0, #0x0
    str r0, [r5, #0x19c]
    str r0, [r5, #0x1a0]
    b .L_94
.L_60:
    ldr r0, _LIT1
    cmp r2, r0
    bne .L_94
    ldr r1, _LIT2
    add r2, sp, #0x4e
    mov r0, r6
    mov r3, #0x200
    bl func_02060250
    cmp r0, #0x0
    beq .L_94
    add r0, sp, #0x4e
    bl func_020acd0c
    str r0, [r5, #0x1a0]
.L_94:
    ldr r1, _LIT3
    mov r0, r6
    bl func_020aafd0
    cmp r0, #0x0
    beq .L_d4
    ldr r1, [r5, #0x418]
    mov r0, r8
    mov r2, r5
    bl func_0205ff60
    mov r0, r8
    mov r1, #0x4
    mov r2, #0x1
    bl func_02058560
    add sp, sp, #0x2a0
    mov r0, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_d4:
    ldr r1, [r5, #0x418]
    mov r0, r8
    mov r2, r5
    bl func_0205ff60
    mov r0, r8
    mov r1, #0x4
    mov r2, #0x0
    bl func_02058560
    add sp, sp, #0x2a0
    mov r0, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_100:
    ldr r0, [r7, #0x14]
    ldr r4, [r7, #0x4]
    cmp r0, #0x1
    beq .L_124
    cmp r0, #0x2
    beq .L_314
    cmp r0, #0x3
    beq .L_204
    b .L_680
.L_124:
    ldr r1, _LIT4
    mov r0, r6
    mov r2, #0x5
    bl func_020aaf60
    cmp r0, #0x0
    beq .L_168
    ldr r2, _LIT5
    mov r0, r8
    mov r1, #0x1
    bl func_0205ff60
    mov r0, r8
    mov r1, #0x3
    mov r2, #0x1
    bl func_02058560
    add sp, sp, #0x2a0
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_168:
    ldr r1, _LIT6
    mov r0, r6
    mov r2, r4
    mov r3, #0x80
    bl func_02060250
    cmp r0, #0x0
    bne .L_1b0
    ldr r2, _LIT5
    mov r0, r8
    mov r1, #0x1
    bl func_0205ff60
    mov r0, r8
    mov r1, #0x3
    mov r2, #0x1
    bl func_02058560
    add sp, sp, #0x2a0
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_1b0:
    ldr r0, [r4, #0x304]
    cmp r0, #0x0
    beq .L_1e0
    mov r0, r8
    mov r1, r4
    bl func_0205907c
    cmp r0, #0x0
    addne sp, sp, #0x2a0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    mov r0, #0x3
    str r0, [r7, #0x14]
    b .L_680
.L_1e0:
    mov r0, r8
    mov r1, r4
    bl func_02059318
    cmp r0, #0x0
    addne sp, sp, #0x2a0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    mov r0, #0x2
    str r0, [r7, #0x14]
    b .L_680
.L_204:
    ldr r1, _LIT7
    mov r0, r6
    mov r2, #0x5
    bl func_020aaf60
    cmp r0, #0x0
    beq .L_248
    ldr r2, _LIT5
    mov r0, r8
    mov r1, #0x1
    bl func_0205ff60
    mov r0, r8
    mov r1, #0x3
    mov r2, #0x1
    bl func_02058560
    add sp, sp, #0x2a0
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_248:
    ldr r1, _LIT8
    add r2, sp, #0x4e
    mov r0, r6
    mov r3, #0x200
    bl func_02060250
    cmp r0, #0x0
    bne .L_290
    ldr r2, _LIT9
    mov r0, r8
    mov r1, #0x1
    bl func_0205ff60
    mov r0, r8
    mov r1, #0x3
    mov r2, #0x1
    bl func_02058560
    add sp, sp, #0x2a0
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_290:
    add r0, sp, #0x4e
    bl func_020acd0c
    str r0, [r5, #0x19c]
    ldr r1, _LIT10
    add r2, sp, #0x4e
    mov r0, r6
    mov r3, #0x200
    bl func_02060250
    cmp r0, #0x0
    bne .L_2e4
    ldr r2, _LIT9
    mov r0, r8
    mov r1, #0x1
    bl func_0205ff60
    mov r0, r8
    mov r1, #0x3
    mov r2, #0x1
    bl func_02058560
    add sp, sp, #0x2a0
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_2e4:
    add r0, sp, #0x4e
    bl func_020acd0c
    str r0, [r5, #0x1a0]
    mov r0, r8
    mov r1, r4
    bl func_02059318
    cmp r0, #0x0
    addne sp, sp, #0x2a0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    mov r0, #0x2
    str r0, [r7, #0x14]
    b .L_680
.L_314:
    ldr r1, _LIT11
    mov r0, r6
    mov r2, #0x5
    bl func_020aaf60
    cmp r0, #0x0
    beq .L_358
    ldr r2, _LIT5
    mov r0, r8
    mov r1, #0x1
    bl func_0205ff60
    mov r0, r8
    mov r1, #0x3
    mov r2, #0x1
    bl func_02058560
    add sp, sp, #0x2a0
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_358:
    ldr r1, _LIT12
    add r2, sp, #0x4e
    mov r0, r6
    mov r3, #0x200
    bl func_02060250
    cmp r0, #0x0
    bne .L_3a0
    ldr r2, _LIT9
    mov r0, r8
    mov r1, #0x1
    bl func_0205ff60
    mov r0, r8
    mov r1, #0x3
    mov r2, #0x1
    bl func_02058560
    add sp, sp, #0x2a0
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_3a0:
    add r0, sp, #0x4e
    bl func_020acd0c
    str r0, [r5, #0x198]
    ldr r1, _LIT8
    add r2, sp, #0x4e
    mov r0, r6
    mov r3, #0x200
    bl func_02060250
    cmp r0, #0x0
    bne .L_3f4
    ldr r2, _LIT9
    mov r0, r8
    mov r1, #0x1
    bl func_0205ff60
    mov r0, r8
    mov r1, #0x3
    mov r2, #0x1
    bl func_02058560
    add sp, sp, #0x2a0
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_3f4:
    add r0, sp, #0x4e
    bl func_020acd0c
    str r0, [r5, #0x19c]
    ldr r1, _LIT10
    add r2, sp, #0x4e
    mov r0, r6
    mov r3, #0x200
    bl func_02060250
    cmp r0, #0x0
    bne .L_448
    ldr r2, _LIT9
    mov r0, r8
    mov r1, #0x1
    bl func_0205ff60
    mov r0, r8
    mov r1, #0x3
    mov r2, #0x1
    bl func_02058560
    add sp, sp, #0x2a0
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_448:
    add r0, sp, #0x4e
    bl func_020acd0c
    str r0, [r5, #0x1a0]
    ldr r1, _LIT13
    add r2, sp, #0x39
    mov r0, r6
    mov r3, #0x15
    bl func_02060250
    ldr r2, _LIT14
    cmp r0, #0x0
    moveq r0, #0x0
    streqb r0, [sp, #0x39]
    ldr r1, _LIT15
    mov r0, r6
    add r2, r5, r2
    mov r3, #0x19
    bl func_02060250
    cmp r0, #0x0
    moveq r0, #0x0
    streqb r0, [r5, #0x474]
    ldrsb r0, [r4, #0xc2]
    cmp r0, #0x0
    addne r0, r4, #0xc2
    bne .L_4e0
    add r0, r5, #0x100
    ldrsb r0, [r0, #0x2f]
    cmp r0, #0x0
    ldrne r0, _LIT16
    addne r0, r5, r0
    bne .L_4e0
    add r0, sp, #0x200
    ldr r1, _LIT17
    add r0, r0, #0x4e
    add r2, r5, #0x110
    add r3, r5, #0x144
    bl func_020a9698
    add r0, sp, #0x200
    add r0, r0, #0x4e
.L_4e0:
    str r0, [sp]
    str r4, [sp, #0x4]
    add r2, r4, #0x80
    str r2, [sp, #0x8]
    add r2, r4, #0xa1
    ldr r1, _LIT18
    ldr r3, _LIT19
    add r0, sp, #0x4e
    str r2, [sp, #0xc]
    bl func_020a9698
    add r0, sp, #0x4e
    bl func_020aace8
    mov r1, r0
    add r0, sp, #0x4e
    add r2, sp, #0x18
    bl func_020547f4
    ldr r1, _LIT20
    mov r0, r6
    add r2, sp, #0x4e
    mov r3, #0x200
    bl func_02060250
    cmp r0, #0x0
    bne .L_568
    ldr r2, _LIT9
    mov r0, r8
    mov r1, #0x1
    bl func_0205ff60
    mov r0, r8
    mov r1, #0x3
    mov r2, #0x1
    bl func_02058560
    add sp, sp, #0x2a0
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_568:
    add r0, sp, #0x18
    add r1, sp, #0x4e
    mov r2, #0x20
    bl func_020a734c
    cmp r0, #0x0
    beq .L_5ac
    ldr r2, _LIT21
    mov r0, r8
    mov r1, #0x108
    bl func_0205ff60
    mov r0, r8
    mov r1, #0x3
    mov r2, #0x1
    bl func_02058560
    add sp, sp, #0x2a0
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_5ac:
    ldr r0, [r5, #0x100]
    cmp r0, #0x0
    beq .L_5d4
    ldr r1, [r5, #0x1a0]
    mov r0, r8
    bl func_0205d684
    ldr r1, [r5, #0x1a0]
    str r1, [r0]
    ldr r1, [r5, #0x19c]
    str r1, [r0, #0x4]
.L_5d4:
    mov r0, #0x3
    str r0, [r5, #0x1d8]
    ldr r1, [r7, #0xc]
    ldr r0, [r7, #0x10]
    cmp r1, #0x0
    str r1, [sp, #0x10]
    str r0, [sp, #0x14]
    beq .L_674
    mov r0, #0x20
    bl func_02045398
    movs r4, r0
    bne .L_61c
    ldr r1, _LIT22
    mov r0, r8
    bl func_0205ff4c
    add sp, sp, #0x2a0
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_61c:
    mov r1, #0x0
    mov r2, #0x20
    bl func_020a72e0
    ldr r1, [r5, #0x1a0]
    mov r0, #0x0
    str r1, [r4, #0x4]
    str r0, [r4]
    add r1, sp, #0x39
    add r0, r4, #0x8
    mov r2, #0x15
    bl func_0206043c
    str r7, [sp]
    mov r0, #0x0
    str r0, [sp, #0x4]
    add r1, sp, #0x10
    mov r0, r8
    mov r3, r4
    ldmia r1, {r1, r2}
    bl func_020584b4
    cmp r0, #0x0
    addne sp, sp, #0x2a0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
.L_674:
    mov r0, r8
    mov r1, r7
    bl func_0205bce4
.L_680:
    mov r0, #0x0
    add sp, sp, #0x2a0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x00000106
_LIT1: .word 0x00000201
_LIT2: .word data_021002e0
_LIT3: .word data_021002e8
_LIT4: .word data_021002f0
_LIT5: .word data_021002f8
_LIT6: .word data_02100328
_LIT7: .word data_02100334
_LIT8: .word data_0210033c
_LIT9: .word data_02100348
_LIT10: .word data_02100378
_LIT11: .word data_02100384
_LIT12: .word data_0210038c
_LIT13: .word data_02100398
_LIT14: .word 0x00000474
_LIT15: .word data_021003a8
_LIT16: .word 0x0000012f
_LIT17: .word data_021003b0
_LIT18: .word data_021003b8
_LIT19: .word data_021003c8
_LIT20: .word data_021003fc
_LIT21: .word data_02100404
_LIT22: .word data_02100424
