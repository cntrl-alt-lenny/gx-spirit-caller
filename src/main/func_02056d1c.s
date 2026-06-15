; func_02056d1c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020fffec
        .extern data_020ffff8
        .extern data_02100000
        .extern data_02100030
        .extern data_02100034
        .extern data_0210003c
        .extern data_0210004c
        .extern data_02100058
        .extern data_0210005c
        .extern data_02100064
        .extern data_0210006c
        .extern data_02100074
        .extern data_02100078
        .extern data_0210007c
        .extern func_020453b4
        .extern func_020453e8
        .extern func_02054b9c
        .extern func_020552dc
        .extern func_02056b38
        .extern func_02058528
        .extern func_020585d4
        .extern func_0205d6f8
        .extern func_0205ffc0
        .extern func_0205ffd4
        .extern func_020602c4
        .extern func_020604b0
        .extern func_020aaddc
        .extern func_020aadf8
        .extern func_020ab0c4
        .extern func_020ace00
        .global func_02056d1c
        .arm
func_02056d1c:
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
    bl func_020602c4
    cmp r0, #0x0
    bne .L_328
    ldr r2, _LIT2
    mov r0, sl
    mov r1, #0x1
    bl func_0205ffd4
    mov r0, sl
    mov r1, #0x3
    mov r2, #0x1
    bl func_020585d4
    ldr ip, _LIT0
    mov r0, #0x3
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_328:
    add r0, sp, #0x38
    bl func_020ace00
    mov r5, r0
    ldr r1, _LIT3
    add r2, sp, #0x38
    mov r0, r4
    mov r3, #0x1000
    bl func_020602c4
    cmp r0, #0x0
    bne .L_380
    ldr r2, _LIT2
    mov r0, sl
    mov r1, #0x1
    bl func_0205ffd4
    mov r0, sl
    mov r1, #0x3
    mov r2, #0x1
    bl func_020585d4
    ldr ip, _LIT0
    mov r0, #0x3
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_380:
    add r0, sp, #0x38
    bl func_020ace00
    mov r8, r0
    ldr r1, _LIT4
    add r2, sp, #0x38
    mov r0, r4
    mov r3, #0x1000
    bl func_020602c4
    cmp r0, #0x0
    beq .L_3b8
    add r0, sp, #0x38
    bl func_020ace00
    mov r9, r0
    b .L_3c4
.L_3b8:
    mov r0, #0x0
    bl func_02054b9c
    mov r9, r0
.L_3c4:
    cmp r5, #0x64
    bgt .L_3f8
    cmp r5, #0x64
    bge .L_6f4
    cmp r5, #0x2
    bgt .L_c84
    cmp r5, #0x1
    blt .L_c84
    cmp r5, #0x1
    beq .L_41c
    cmp r5, #0x2
    beq .L_530
    b .L_c84
.L_3f8:
    cmp r5, #0x66
    bgt .L_c84
    cmp r5, #0x65
    blt .L_c84
    cmp r5, #0x65
    beq .L_a84
    cmp r5, #0x66
    beq .L_c24
    b .L_c84
.L_41c:
    ldr r1, [r6, #0x1bc]
    ldr r0, [r6, #0x1c0]
    cmp r1, #0x0
    str r1, [sp, #0x8]
    str r0, [sp, #0xc]
    beq .L_c84
    mov r0, #0xc
    bl func_020453e8
    movs r5, r0
    bne .L_460
    ldr r1, _LIT5
    mov r0, sl
    bl func_0205ffc0
    ldr ip, _LIT0
    mov r0, #0x1
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_460:
    ldr r1, _LIT6
    add r2, sp, #0x38
    mov r0, r4
    mov r3, #0x1000
    bl func_020602c4
    cmp r0, #0x0
    bne .L_4ac
    ldr r2, _LIT2
    mov r0, sl
    mov r1, #0x1
    bl func_0205ffd4
    mov r0, sl
    mov r1, #0x3
    mov r2, #0x1
    bl func_020585d4
    ldr ip, _LIT0
    mov r0, #0x3
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_4ac:
    add r0, sp, #0x38
    bl func_020aaddc
    add r0, r0, #0x1
    bl func_020453e8
    str r0, [r5, #0x8]
    ldr r0, [r5, #0x8]
    cmp r0, #0x0
    bne .L_4e8
    ldr r1, _LIT5
    mov r0, sl
    bl func_0205ffc0
    ldr ip, _LIT0
    mov r0, #0x1
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_4e8:
    add r1, sp, #0x38
    bl func_020aadf8
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
    bl func_02058528
    cmp r0, #0x0
    beq .L_c84
    ldr ip, _LIT0
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_530:
    mov r0, sl
    mov r1, r8
    bl func_0205d6f8
    movs r5, r0
    bne .L_560
    ldr r1, _LIT5
    mov r0, sl
    bl func_0205ffc0
    ldr ip, _LIT0
    mov r0, #0x1
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_560:
    ldr r1, _LIT6
    add r2, sp, #0x38
    mov r0, r4
    mov r3, #0x1000
    bl func_020602c4
    cmp r0, #0x0
    bne .L_5ac
    ldr r2, _LIT2
    mov r0, sl
    mov r1, #0x1
    bl func_0205ffd4
    mov r0, sl
    mov r1, #0x3
    mov r2, #0x1
    bl func_020585d4
    ldr ip, _LIT0
    mov r0, #0x3
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_5ac:
    ldr r1, _LIT7
    add r0, sp, #0x38
    bl func_020ab0c4
    movs r4, r0
    bne .L_5f0
    ldr r2, _LIT2
    mov r0, sl
    mov r1, #0x1
    bl func_0205ffd4
    mov r0, sl
    mov r1, #0x3
    mov r2, #0x1
    bl func_020585d4
    ldr ip, _LIT0
    mov r0, #0x3
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_5f0:
    mov r1, #0x0
    add r0, r4, #0x8
    strb r1, [r4]
    bl func_020aaddc
    cmp r0, #0x20
    beq .L_638
    ldr r2, _LIT2
    mov r0, sl
    mov r1, #0x1
    bl func_0205ffd4
    mov r0, sl
    mov r1, #0x3
    mov r2, #0x1
    bl func_020585d4
    ldr ip, _LIT0
    mov r0, #0x3
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_638:
    ldr r0, [r5, #0x10]
    bl func_020453b4
    mov r0, #0x0
    str r0, [r5, #0x10]
    add r0, r4, #0x8
    bl func_020552dc
    str r0, [r5, #0x10]
    ldr r0, [r5, #0x14]
    add r0, r0, #0x1
    str r0, [r5, #0x14]
    ldr r1, [r6, #0x1ac]
    ldr r0, [r6, #0x1b0]
    cmp r1, #0x0
    str r1, [sp, #0x20]
    str r0, [sp, #0x24]
    beq .L_c84
    ldr r0, _LIT8
    bl func_020453e8
    movs r4, r0
    bne .L_6a4
    ldr r1, _LIT5
    mov r0, sl
    bl func_0205ffc0
    ldr ip, _LIT0
    mov r0, #0x1
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_6a4:
    ldr r2, _LIT9
    add r1, sp, #0x38
    add r0, r4, #0x8
    bl func_020604b0
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
    bl func_02058528
    cmp r0, #0x0
    beq .L_c84
    ldr ip, _LIT0
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_6f4:
    mov r0, sl
    mov r1, r8
    bl func_0205d6f8
    movs r5, r0
    bne .L_724
    ldr r1, _LIT5
    mov r0, sl
    bl func_0205ffc0
    ldr ip, _LIT0
    mov r0, #0x1
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_724:
    ldr r0, [r5, #0x8]
    cmp r0, #0x0
    bne .L_798
    mov r0, #0x18
    bl func_020453e8
    str r0, [r5, #0x8]
    ldr r2, [r5, #0x8]
    cmp r2, #0x0
    bne .L_764
    ldr r1, _LIT5
    mov r0, sl
    bl func_0205ffc0
    ldr ip, _LIT0
    mov r0, #0x1
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_764:
    mov r1, #0x6
    mov r0, #0x0
.L_76c:
    strb r0, [r2], #0x1
    strb r0, [r2], #0x1
    strb r0, [r2], #0x1
    strb r0, [r2], #0x1
    subs r1, r1, #0x1
    bne .L_76c
    ldr r1, [r6, #0x430]
    add r0, r1, #0x1
    str r0, [r6, #0x430]
    ldr r0, [r5, #0x8]
    str r1, [r0]
.L_798:
    ldr r1, _LIT6
    add r2, sp, #0x38
    mov r0, r4
    mov r3, #0x1000
    ldr r7, [r5, #0x8]
    bl func_020602c4
    cmp r0, #0x0
    bne .L_7e8
    ldr r2, _LIT2
    mov r0, sl
    mov r1, #0x1
    bl func_0205ffd4
    mov r0, sl
    mov r1, #0x3
    mov r2, #0x1
    bl func_020585d4
    ldr ip, _LIT0
    mov r0, #0x3
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_7e8:
    ldr r1, _LIT10
    add r0, sp, #0x38
    add r2, sp, #0x28
    mov r3, #0x10
    bl func_020602c4
    cmp r0, #0x0
    bne .L_834
    ldr r2, _LIT2
    mov r0, sl
    mov r1, #0x1
    bl func_0205ffd4
    mov r0, sl
    mov r1, #0x3
    mov r2, #0x1
    bl func_020585d4
    ldr ip, _LIT0
    mov r0, #0x3
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_834:
    add r0, sp, #0x28
    bl func_020ace00
    str r0, [r7, #0x4]
    ldr r0, [r7, #0x8]
    bl func_020453b4
    mov r0, #0x0
    add r2, sp, #0x1000
    str r0, [r7, #0x8]
    ldr r1, _LIT11
    add r0, sp, #0x38
    add r2, r2, #0x38
    mov r3, #0x100
    bl func_020602c4
    cmp r0, #0x0
    addeq r0, sp, #0x1000
    moveq r1, #0x0
    addeq r0, r0, #0x8
    streqb r1, [r0, #0x30]
    add r0, sp, #0x1000
    add r0, r0, #0x38
    bl func_020552dc
    str r0, [r7, #0x8]
    ldr r0, [r7, #0x8]
    cmp r0, #0x0
    bne .L_8b4
    ldr r1, _LIT5
    mov r0, sl
    bl func_0205ffc0
    ldr ip, _LIT0
    mov r0, #0x1
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_8b4:
    ldr r0, [r7, #0xc]
    bl func_020453b4
    add r2, sp, #0x1000
    mov r4, #0x0
    ldr r1, _LIT12
    add r0, sp, #0x38
    add r2, r2, #0x38
    mov r3, #0x100
    str r4, [r7, #0xc]
    bl func_020602c4
    cmp r0, #0x0
    addeq r0, sp, #0x1000
    moveq r1, r4
    addeq r0, r0, #0x8
    streqb r1, [r0, #0x30]
    add r0, sp, #0x1000
    add r0, r0, #0x38
    bl func_020552dc
    str r0, [r7, #0xc]
    ldr r0, [r7, #0xc]
    cmp r0, #0x0
    bne .L_928
    ldr r1, _LIT5
    mov r0, sl
    bl func_0205ffc0
    ldr ip, _LIT0
    mov r0, #0x1
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_928:
    ldr r1, _LIT13
    add r0, sp, #0x38
    add r2, sp, #0x28
    mov r3, #0x10
    bl func_020602c4
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [r7, #0x10]
    beq .L_9a8
    add r0, sp, #0x28
    bl func_020ace00
    mov r5, r0
    add r0, sp, #0x28
    bl func_020ace00
    mov r4, r0
    add r0, sp, #0x28
    bl func_020ace00
    mov fp, r0
    add r0, sp, #0x28
    bl func_020ace00
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
.L_9a8:
    ldr r1, _LIT14
    add r0, sp, #0x38
    add r2, sp, #0x28
    mov r3, #0x10
    bl func_020602c4
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [r7, #0x14]
    beq .L_9fc
    add r0, sp, #0x28
    bl func_020ace00
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
.L_9fc:
    ldr r1, [r6, #0x1b4]
    ldr r0, [r6, #0x1b8]
    cmp r1, #0x0
    str r1, [sp, #0x18]
    str r0, [sp, #0x1c]
    beq .L_c84
    mov r0, #0xc
    bl func_020453e8
    movs r3, r0
    bne .L_a40
    ldr r1, _LIT5
    mov r0, sl
    bl func_0205ffc0
    ldr ip, _LIT0
    mov r0, #0x1
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_a40:
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
    bl func_02058528
    cmp r0, #0x0
    beq .L_c84
    ldr ip, _LIT0
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_a84:
    ldr r1, _LIT6
    add r2, sp, #0x38
    mov r0, r4
    mov r3, #0x1000
    bl func_020602c4
    cmp r0, #0x0
    bne .L_ad0
    ldr r2, _LIT2
    mov r0, sl
    mov r1, #0x1
    bl func_0205ffd4
    mov r0, sl
    mov r1, #0x3
    mov r2, #0x1
    bl func_020585d4
    ldr ip, _LIT0
    mov r0, #0x3
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_ad0:
    ldr r1, _LIT14
    add r0, sp, #0x38
    bl func_020ab0c4
    cmp r0, #0x0
    bne .L_b14
    ldr r2, _LIT2
    mov r0, sl
    mov r1, #0x1
    bl func_0205ffd4
    mov r0, sl
    mov r1, #0x3
    mov r2, #0x1
    bl func_020585d4
    ldr ip, _LIT0
    mov r0, #0x3
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_b14:
    ldrsb r1, [r0, #0x3]
    cmp r1, #0x0
    bne .L_b50
    ldr r2, _LIT2
    mov r0, sl
    mov r1, #0x1
    bl func_0205ffd4
    mov r0, sl
    mov r1, #0x3
    mov r2, #0x1
    bl func_020585d4
    ldr ip, _LIT0
    mov r0, #0x3
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_b50:
    add r0, r0, #0x3
    bl func_020ace00
    mov r4, r0
    ldr r1, _LIT15
    add r0, sp, #0x38
    bl func_020ab0c4
    movs r1, r0
    addeq r0, sp, #0x1000
    moveq r1, #0x0
    addeq r0, r0, #0x8
    streqb r1, [r0, #0x30]
    beq .L_b94
    add r0, sp, #0x1000
    add r0, r0, #0x38
    add r1, r1, #0x3
    mov r2, #0x100
    bl func_020604b0
.L_b94:
    ldr r1, [r6, #0x1c4]
    ldr r0, [r6, #0x1c8]
    cmp r1, #0x0
    str r1, [sp, #0x10]
    str r0, [sp, #0x14]
    beq .L_c84
    mov r0, #0x108
    bl func_020453e8
    movs r5, r0
    bne .L_bd8
    ldr r1, _LIT5
    mov r0, sl
    bl func_0205ffc0
    ldr ip, _LIT0
    mov r0, #0x1
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_bd8:
    add r1, sp, #0x1000
    str r8, [r5]
    add r1, r1, #0x38
    add r0, r5, #0x8
    str r4, [r5, #0x4]
    bl func_020aadf8
    mov r0, #0x0
    str r0, [sp]
    str r0, [sp, #0x4]
    add r1, sp, #0x10
    mov r0, sl
    mov r3, r5
    ldmia r1, {r1, r2}
    bl func_02058528
    cmp r0, #0x0
    beq .L_c84
    ldr ip, _LIT0
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_c24:
    ldr r1, _LIT6
    add r2, sp, #0x38
    mov r0, r4
    mov r3, #0x1000
    bl func_020602c4
    cmp r0, #0x0
    bne .L_c70
    ldr r2, _LIT2
    mov r0, sl
    mov r1, #0x1
    bl func_0205ffd4
    mov r0, sl
    mov r1, #0x3
    mov r2, #0x1
    bl func_020585d4
    ldr ip, _LIT0
    mov r0, #0x3
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_c70:
    ldr r3, _LIT16
    mov r0, sl
    mov r1, r8
    mov r2, #0x67
    bl func_02056b38
.L_c84:
    mov r0, #0x0
    ldr ip, _LIT0
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x0000113c
_LIT1: .word data_020fffec
_LIT2: .word data_02100000
_LIT3: .word data_02100030
_LIT4: .word data_02100034
_LIT5: .word data_0210003c
_LIT6: .word data_020ffff8
_LIT7: .word data_0210004c
_LIT8: .word 0x0000040c
_LIT9: .word 0x00000401
_LIT10: .word data_02100058
_LIT11: .word data_0210005c
_LIT12: .word data_02100064
_LIT13: .word data_0210006c
_LIT14: .word data_02100074
_LIT15: .word data_02100078
_LIT16: .word data_0210007c
