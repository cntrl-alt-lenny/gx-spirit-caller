; func_02056ca8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020fff0c
        .extern data_020fff18
        .extern data_020fff20
        .extern data_020fff50
        .extern data_020fff54
        .extern data_020fff5c
        .extern data_020fff6c
        .extern data_020fff78
        .extern data_020fff7c
        .extern data_020fff84
        .extern data_020fff8c
        .extern data_020fff94
        .extern data_020fff98
        .extern data_020fff9c
        .extern func_02045364
        .extern func_02045398
        .extern func_02054b28
        .extern func_02055268
        .extern func_02056ac4
        .extern func_020584b4
        .extern func_02058560
        .extern func_0205d684
        .extern func_0205ff4c
        .extern func_0205ff60
        .extern func_02060250
        .extern func_0206043c
        .extern func_020aace8
        .extern func_020aad04
        .extern func_020aafd0
        .extern func_020acd0c
        .global func_02056ca8
        .arm
func_02056ca8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr ip, _LIT0
    sub sp, sp, ip
    mov r4, r1
    mov sl, r0
    ldr r1, _LIT1
    add r2, sp, #0x38
    mov r0, r4
    mov r3, #0x1000
    ldr r6, [sl]
    bl func_02060250
    cmp r0, #0x0
    bne .L_64
    ldr r2, _LIT2
    mov r0, sl
    mov r1, #0x1
    bl func_0205ff60
    mov r0, sl
    mov r1, #0x3
    mov r2, #0x1
    bl func_02058560
    ldr ip, _LIT0
    mov r0, #0x3
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_64:
    add r0, sp, #0x38
    bl func_020acd0c
    mov r5, r0
    ldr r1, _LIT3
    add r2, sp, #0x38
    mov r0, r4
    mov r3, #0x1000
    bl func_02060250
    cmp r0, #0x0
    bne .L_bc
    ldr r2, _LIT2
    mov r0, sl
    mov r1, #0x1
    bl func_0205ff60
    mov r0, sl
    mov r1, #0x3
    mov r2, #0x1
    bl func_02058560
    ldr ip, _LIT0
    mov r0, #0x3
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_bc:
    add r0, sp, #0x38
    bl func_020acd0c
    mov r8, r0
    ldr r1, _LIT4
    add r2, sp, #0x38
    mov r0, r4
    mov r3, #0x1000
    bl func_02060250
    cmp r0, #0x0
    beq .L_f4
    add r0, sp, #0x38
    bl func_020acd0c
    mov r9, r0
    b .L_100
.L_f4:
    mov r0, #0x0
    bl func_02054b28
    mov r9, r0
.L_100:
    cmp r5, #0x64
    bgt .L_134
    cmp r5, #0x64
    bge .L_430
    cmp r5, #0x2
    bgt .L_9c0
    cmp r5, #0x1
    blt .L_9c0
    cmp r5, #0x1
    beq .L_158
    cmp r5, #0x2
    beq .L_26c
    b .L_9c0
.L_134:
    cmp r5, #0x66
    bgt .L_9c0
    cmp r5, #0x65
    blt .L_9c0
    cmp r5, #0x65
    beq .L_7c0
    cmp r5, #0x66
    beq .L_960
    b .L_9c0
.L_158:
    ldr r1, [r6, #0x1bc]
    ldr r0, [r6, #0x1c0]
    cmp r1, #0x0
    str r1, [sp, #0x8]
    str r0, [sp, #0xc]
    beq .L_9c0
    mov r0, #0xc
    bl func_02045398
    movs r5, r0
    bne .L_19c
    ldr r1, _LIT5
    mov r0, sl
    bl func_0205ff4c
    ldr ip, _LIT0
    mov r0, #0x1
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_19c:
    ldr r1, _LIT6
    add r2, sp, #0x38
    mov r0, r4
    mov r3, #0x1000
    bl func_02060250
    cmp r0, #0x0
    bne .L_1e8
    ldr r2, _LIT2
    mov r0, sl
    mov r1, #0x1
    bl func_0205ff60
    mov r0, sl
    mov r1, #0x3
    mov r2, #0x1
    bl func_02058560
    ldr ip, _LIT0
    mov r0, #0x3
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1e8:
    add r0, sp, #0x38
    bl func_020aace8
    add r0, r0, #0x1
    bl func_02045398
    str r0, [r5, #0x8]
    ldr r0, [r5, #0x8]
    cmp r0, #0x0
    bne .L_224
    ldr r1, _LIT5
    mov r0, sl
    bl func_0205ff4c
    ldr ip, _LIT0
    mov r0, #0x1
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_224:
    add r1, sp, #0x38
    bl func_020aad04
    str r8, [r5]
    str r9, [r5, #0x4]
    mov r0, #0x0
    str r0, [sp]
    mov r0, #0x2
    str r0, [sp, #0x4]
    add r1, sp, #0x8
    mov r0, sl
    mov r3, r5
    ldmia r1, {r1, r2}
    bl func_020584b4
    cmp r0, #0x0
    beq .L_9c0
    ldr ip, _LIT0
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_26c:
    mov r0, sl
    mov r1, r8
    bl func_0205d684
    movs r5, r0
    bne .L_29c
    ldr r1, _LIT5
    mov r0, sl
    bl func_0205ff4c
    ldr ip, _LIT0
    mov r0, #0x1
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_29c:
    ldr r1, _LIT6
    add r2, sp, #0x38
    mov r0, r4
    mov r3, #0x1000
    bl func_02060250
    cmp r0, #0x0
    bne .L_2e8
    ldr r2, _LIT2
    mov r0, sl
    mov r1, #0x1
    bl func_0205ff60
    mov r0, sl
    mov r1, #0x3
    mov r2, #0x1
    bl func_02058560
    ldr ip, _LIT0
    mov r0, #0x3
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2e8:
    ldr r1, _LIT7
    add r0, sp, #0x38
    bl func_020aafd0
    movs r4, r0
    bne .L_32c
    ldr r2, _LIT2
    mov r0, sl
    mov r1, #0x1
    bl func_0205ff60
    mov r0, sl
    mov r1, #0x3
    mov r2, #0x1
    bl func_02058560
    ldr ip, _LIT0
    mov r0, #0x3
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_32c:
    mov r1, #0x0
    add r0, r4, #0x8
    strb r1, [r4]
    bl func_020aace8
    cmp r0, #0x20
    beq .L_374
    ldr r2, _LIT2
    mov r0, sl
    mov r1, #0x1
    bl func_0205ff60
    mov r0, sl
    mov r1, #0x3
    mov r2, #0x1
    bl func_02058560
    ldr ip, _LIT0
    mov r0, #0x3
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_374:
    ldr r0, [r5, #0x10]
    bl func_02045364
    mov r0, #0x0
    str r0, [r5, #0x10]
    add r0, r4, #0x8
    bl func_02055268
    str r0, [r5, #0x10]
    ldr r0, [r5, #0x14]
    add r0, r0, #0x1
    str r0, [r5, #0x14]
    ldr r1, [r6, #0x1ac]
    ldr r0, [r6, #0x1b0]
    cmp r1, #0x0
    str r1, [sp, #0x20]
    str r0, [sp, #0x24]
    beq .L_9c0
    ldr r0, _LIT8
    bl func_02045398
    movs r4, r0
    bne .L_3e0
    ldr r1, _LIT5
    mov r0, sl
    bl func_0205ff4c
    ldr ip, _LIT0
    mov r0, #0x1
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_3e0:
    ldr r2, _LIT9
    add r1, sp, #0x38
    add r0, r4, #0x8
    bl func_0206043c
    str r8, [r4]
    str r9, [r4, #0x4]
    mov r0, #0x0
    str r0, [sp]
    mov r0, #0x6
    str r0, [sp, #0x4]
    add r1, sp, #0x20
    mov r0, sl
    mov r3, r4
    ldmia r1, {r1, r2}
    bl func_020584b4
    cmp r0, #0x0
    beq .L_9c0
    ldr ip, _LIT0
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_430:
    mov r0, sl
    mov r1, r8
    bl func_0205d684
    movs r5, r0
    bne .L_460
    ldr r1, _LIT5
    mov r0, sl
    bl func_0205ff4c
    ldr ip, _LIT0
    mov r0, #0x1
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_460:
    ldr r0, [r5, #0x8]
    cmp r0, #0x0
    bne .L_4d4
    mov r0, #0x18
    bl func_02045398
    str r0, [r5, #0x8]
    ldr r2, [r5, #0x8]
    cmp r2, #0x0
    bne .L_4a0
    ldr r1, _LIT5
    mov r0, sl
    bl func_0205ff4c
    ldr ip, _LIT0
    mov r0, #0x1
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_4a0:
    mov r1, #0x6
    mov r0, #0x0
.L_4a8:
    strb r0, [r2], #0x1
    strb r0, [r2], #0x1
    strb r0, [r2], #0x1
    strb r0, [r2], #0x1
    subs r1, r1, #0x1
    bne .L_4a8
    ldr r1, [r6, #0x430]
    add r0, r1, #0x1
    str r0, [r6, #0x430]
    ldr r0, [r5, #0x8]
    str r1, [r0]
.L_4d4:
    ldr r1, _LIT6
    add r2, sp, #0x38
    mov r0, r4
    mov r3, #0x1000
    ldr r7, [r5, #0x8]
    bl func_02060250
    cmp r0, #0x0
    bne .L_524
    ldr r2, _LIT2
    mov r0, sl
    mov r1, #0x1
    bl func_0205ff60
    mov r0, sl
    mov r1, #0x3
    mov r2, #0x1
    bl func_02058560
    ldr ip, _LIT0
    mov r0, #0x3
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_524:
    ldr r1, _LIT10
    add r0, sp, #0x38
    add r2, sp, #0x28
    mov r3, #0x10
    bl func_02060250
    cmp r0, #0x0
    bne .L_570
    ldr r2, _LIT2
    mov r0, sl
    mov r1, #0x1
    bl func_0205ff60
    mov r0, sl
    mov r1, #0x3
    mov r2, #0x1
    bl func_02058560
    ldr ip, _LIT0
    mov r0, #0x3
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_570:
    add r0, sp, #0x28
    bl func_020acd0c
    str r0, [r7, #0x4]
    ldr r0, [r7, #0x8]
    bl func_02045364
    mov r0, #0x0
    add r2, sp, #0x1000
    str r0, [r7, #0x8]
    ldr r1, _LIT11
    add r0, sp, #0x38
    add r2, r2, #0x38
    mov r3, #0x100
    bl func_02060250
    cmp r0, #0x0
    addeq r0, sp, #0x1000
    moveq r1, #0x0
    addeq r0, r0, #0x8
    streqb r1, [r0, #0x30]
    add r0, sp, #0x1000
    add r0, r0, #0x38
    bl func_02055268
    str r0, [r7, #0x8]
    ldr r0, [r7, #0x8]
    cmp r0, #0x0
    bne .L_5f0
    ldr r1, _LIT5
    mov r0, sl
    bl func_0205ff4c
    ldr ip, _LIT0
    mov r0, #0x1
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_5f0:
    ldr r0, [r7, #0xc]
    bl func_02045364
    add r2, sp, #0x1000
    mov r4, #0x0
    ldr r1, _LIT12
    add r0, sp, #0x38
    add r2, r2, #0x38
    mov r3, #0x100
    str r4, [r7, #0xc]
    bl func_02060250
    cmp r0, #0x0
    addeq r0, sp, #0x1000
    moveq r1, r4
    addeq r0, r0, #0x8
    streqb r1, [r0, #0x30]
    add r0, sp, #0x1000
    add r0, r0, #0x38
    bl func_02055268
    str r0, [r7, #0xc]
    ldr r0, [r7, #0xc]
    cmp r0, #0x0
    bne .L_664
    ldr r1, _LIT5
    mov r0, sl
    bl func_0205ff4c
    ldr ip, _LIT0
    mov r0, #0x1
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_664:
    ldr r1, _LIT13
    add r0, sp, #0x38
    add r2, sp, #0x28
    mov r3, #0x10
    bl func_02060250
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [r7, #0x10]
    beq .L_6e4
    add r0, sp, #0x28
    bl func_020acd0c
    mov r5, r0
    add r0, sp, #0x28
    bl func_020acd0c
    mov r4, r0
    add r0, sp, #0x28
    bl func_020acd0c
    mov fp, r0
    add r0, sp, #0x28
    bl func_020acd0c
    mov r1, fp, lsr #0x18
    mov r0, r0, lsr #0x8
    mov r2, r4, lsl #0x8
    and r1, r1, #0xff
    and r0, r0, #0xff00
    mov r3, r5, lsl #0x18
    orr r0, r1, r0
    and r2, r2, #0xff0000
    and r1, r3, #-16777216
    orr r0, r2, r0
    orr r0, r1, r0
    str r0, [r7, #0x10]
.L_6e4:
    ldr r1, _LIT14
    add r0, sp, #0x38
    add r2, sp, #0x28
    mov r3, #0x10
    bl func_02060250
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [r7, #0x14]
    beq .L_738
    add r0, sp, #0x28
    bl func_020acd0c
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r0, asr #0x8
    mov r0, r0, lsl #0x8
    and r1, r1, #0xff
    and r0, r0, #0xff00
    orr r0, r1, r0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [r7, #0x14]
.L_738:
    ldr r1, [r6, #0x1b4]
    ldr r0, [r6, #0x1b8]
    cmp r1, #0x0
    str r1, [sp, #0x18]
    str r0, [sp, #0x1c]
    beq .L_9c0
    mov r0, #0xc
    bl func_02045398
    movs r3, r0
    bne .L_77c
    ldr r1, _LIT5
    mov r0, sl
    bl func_0205ff4c
    ldr ip, _LIT0
    mov r0, #0x1
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_77c:
    str r8, [r3]
    ldr r1, [r7]
    mov r0, #0x0
    str r1, [r3, #0x8]
    str r9, [r3, #0x4]
    str r0, [sp]
    mov r0, #0x5
    str r0, [sp, #0x4]
    add r1, sp, #0x18
    mov r0, sl
    ldmia r1, {r1, r2}
    bl func_020584b4
    cmp r0, #0x0
    beq .L_9c0
    ldr ip, _LIT0
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_7c0:
    ldr r1, _LIT6
    add r2, sp, #0x38
    mov r0, r4
    mov r3, #0x1000
    bl func_02060250
    cmp r0, #0x0
    bne .L_80c
    ldr r2, _LIT2
    mov r0, sl
    mov r1, #0x1
    bl func_0205ff60
    mov r0, sl
    mov r1, #0x3
    mov r2, #0x1
    bl func_02058560
    ldr ip, _LIT0
    mov r0, #0x3
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_80c:
    ldr r1, _LIT14
    add r0, sp, #0x38
    bl func_020aafd0
    cmp r0, #0x0
    bne .L_850
    ldr r2, _LIT2
    mov r0, sl
    mov r1, #0x1
    bl func_0205ff60
    mov r0, sl
    mov r1, #0x3
    mov r2, #0x1
    bl func_02058560
    ldr ip, _LIT0
    mov r0, #0x3
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_850:
    ldrsb r1, [r0, #0x3]
    cmp r1, #0x0
    bne .L_88c
    ldr r2, _LIT2
    mov r0, sl
    mov r1, #0x1
    bl func_0205ff60
    mov r0, sl
    mov r1, #0x3
    mov r2, #0x1
    bl func_02058560
    ldr ip, _LIT0
    mov r0, #0x3
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_88c:
    add r0, r0, #0x3
    bl func_020acd0c
    mov r4, r0
    ldr r1, _LIT15
    add r0, sp, #0x38
    bl func_020aafd0
    movs r1, r0
    addeq r0, sp, #0x1000
    moveq r1, #0x0
    addeq r0, r0, #0x8
    streqb r1, [r0, #0x30]
    beq .L_8d0
    add r0, sp, #0x1000
    add r0, r0, #0x38
    add r1, r1, #0x3
    mov r2, #0x100
    bl func_0206043c
.L_8d0:
    ldr r1, [r6, #0x1c4]
    ldr r0, [r6, #0x1c8]
    cmp r1, #0x0
    str r1, [sp, #0x10]
    str r0, [sp, #0x14]
    beq .L_9c0
    mov r0, #0x108
    bl func_02045398
    movs r5, r0
    bne .L_914
    ldr r1, _LIT5
    mov r0, sl
    bl func_0205ff4c
    ldr ip, _LIT0
    mov r0, #0x1
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_914:
    add r1, sp, #0x1000
    str r8, [r5]
    add r1, r1, #0x38
    add r0, r5, #0x8
    str r4, [r5, #0x4]
    bl func_020aad04
    mov r0, #0x0
    str r0, [sp]
    str r0, [sp, #0x4]
    add r1, sp, #0x10
    mov r0, sl
    mov r3, r5
    ldmia r1, {r1, r2}
    bl func_020584b4
    cmp r0, #0x0
    beq .L_9c0
    ldr ip, _LIT0
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_960:
    ldr r1, _LIT6
    add r2, sp, #0x38
    mov r0, r4
    mov r3, #0x1000
    bl func_02060250
    cmp r0, #0x0
    bne .L_9ac
    ldr r2, _LIT2
    mov r0, sl
    mov r1, #0x1
    bl func_0205ff60
    mov r0, sl
    mov r1, #0x3
    mov r2, #0x1
    bl func_02058560
    ldr ip, _LIT0
    mov r0, #0x3
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_9ac:
    ldr r3, _LIT16
    mov r0, sl
    mov r1, r8
    mov r2, #0x67
    bl func_02056ac4
.L_9c0:
    mov r0, #0x0
    ldr ip, _LIT0
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x0000113c
_LIT1: .word data_020fff0c
_LIT2: .word data_020fff20
_LIT3: .word data_020fff50
_LIT4: .word data_020fff54
_LIT5: .word data_020fff5c
_LIT6: .word data_020fff18
_LIT7: .word data_020fff6c
_LIT8: .word 0x0000040c
_LIT9: .word 0x00000401
_LIT10: .word data_020fff78
_LIT11: .word data_020fff7c
_LIT12: .word data_020fff84
_LIT13: .word data_020fff8c
_LIT14: .word data_020fff94
_LIT15: .word data_020fff98
_LIT16: .word data_020fff9c
