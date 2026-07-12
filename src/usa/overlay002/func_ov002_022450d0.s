; func_ov002_022450d0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd664
        .extern data_ov002_022ce1a8
        .extern data_ov002_022d008c
        .extern func_0202e1e0
        .extern func_0203141c
        .global func_ov002_022450d0
        .arm
func_ov002_022450d0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x154
    ldr r7, _LIT0
    mov r9, r0
    ldr r0, [r7, #0x5d4]
    mov r8, r1
    cmp r0, #0x0
    mov r6, #0x0
    bls .L_ae0
    ldr r0, _LIT1
    ldr r4, _LIT2
    add sl, r0, #0x43
    add fp, r0, #0x4f0
    ldr r0, _LIT3
    str r7, [sp]
    add r0, r0, #0x3a
    str r0, [sp, #0x10]
    ldr r0, _LIT1
    mov r5, sl
    sub r0, r0, #0xd9
    str r0, [sp, #0x8]
    ldr r0, _LIT3
    add r0, r0, #0x3a
    str r0, [sp, #0xc]
    ldr r0, _LIT3
    add r0, r0, #0x154
    str r0, [sp, #0x14]
    ldr r0, _LIT4
    sub r0, r0, #0x8a
    str r0, [sp, #0x18]
    ldr r0, _LIT1
    sub r0, r0, #0xd9
    str r0, [sp, #0x4]
    ldr r0, _LIT4
    add r0, r0, #0x244
    str r0, [sp, #0x1c]
    ldr r0, _LIT3
    add r0, r0, #0x154
    str r0, [sp, #0x20]
    ldr r0, _LIT4
    add r0, r0, #0x244
    str r0, [sp, #0x24]
    ldr r0, _LIT3
    sub r0, r0, #0x51
    str r0, [sp, #0x34]
    ldr r0, _LIT3
    sub r0, r0, #0xcf
    str r0, [sp, #0x40]
    ldr r0, _LIT3
    sub r0, r0, #0xce
    str r0, [sp, #0x44]
    ldr r0, _LIT3
    sub r0, r0, #0x3a
    str r0, [sp, #0x4c]
    ldr r0, _LIT1
    sub r0, r0, #0x95
    str r0, [sp, #0x2c]
    ldr r0, _LIT3
    sub r0, r0, #0x51
    str r0, [sp, #0x30]
    ldr r0, _LIT3
    sub r0, r0, #0x3a
    str r0, [sp, #0x48]
    ldr r0, _LIT4
    rsb r0, r0, #0x2c80
    str r0, [sp, #0x50]
    ldr r0, _LIT4
    sub r0, r0, #0x314
    str r0, [sp, #0x60]
    ldr r0, _LIT1
    add r0, r0, #0x46
    str r0, [sp, #0x58]
    ldr r0, _LIT4
    sub r0, r0, #0x314
    str r0, [sp, #0x5c]
    ldr r0, _LIT4
    sub r0, r0, #0x2c0
    str r0, [sp, #0x64]
    ldr r0, _LIT1
    add r0, r0, #0x4b
    str r0, [sp, #0x6c]
    ldr r0, _LIT1
    sub r0, r0, #0x95
    str r0, [sp, #0x28]
    ldr r0, _LIT1
    add r0, r0, #0x46
    str r0, [sp, #0x54]
    ldr r0, _LIT1
    add r0, r0, #0x4b
    str r0, [sp, #0x68]
    ldr r0, _LIT3
    sub r0, r0, #0xcf
    str r0, [sp, #0x3c]
    sub r0, r4, #0x490
    str r0, [sp, #0x38]
    ldr r0, _LIT3
    sub r0, r0, #0x51
    str r0, [sp, #0x7c]
    ldr r0, _LIT3
    sub r0, r0, #0xcf
    str r0, [sp, #0x88]
    sub r0, r4, #0x490
    str r0, [sp, #0x8c]
    sub r0, r4, #0x3fc
    str r0, [sp, #0x94]
    sub r0, r4, #0x1c8
    str r0, [sp, #0x74]
    ldr r0, _LIT3
    sub r0, r0, #0x51
    str r0, [sp, #0x78]
    sub r0, r4, #0x3fc
    str r0, [sp, #0x90]
    ldr r0, _LIT4
    rsb r0, r0, #0x2c80
    str r0, [sp, #0x98]
    ldr r0, _LIT4
    sub r0, r0, #0x2c0
    str r0, [sp, #0xa0]
    ldr r0, _LIT4
    sub r0, r0, #0x314
    str r0, [sp, #0xa4]
    sub r0, r4, #0xe8
    str r0, [sp, #0xac]
    sub r0, r4, #0x1c8
    str r0, [sp, #0x70]
    ldr r0, _LIT4
    sub r0, r0, #0x2c0
    str r0, [sp, #0x9c]
    sub r0, r4, #0xe8
    str r0, [sp, #0xa8]
    ldr r0, _LIT3
    sub r0, r0, #0xcf
    str r0, [sp, #0x84]
    sub r0, r4, #0x490
    str r0, [sp, #0x80]
    ldr r0, _LIT3
    sub r0, r0, #0x51
    str r0, [sp, #0xbc]
    ldr r0, _LIT3
    add r0, r0, #0xf1
    str r0, [sp, #0xb4]
    ldr r0, _LIT3
    sub r0, r0, #0x51
    str r0, [sp, #0xb8]
    ldr r0, _LIT4
    rsb r0, r0, #0x2c80
    str r0, [sp, #0xc0]
    sub r0, r4, #0x1c8
    str r0, [sp, #0xc8]
    ldr r0, _LIT3
    add r0, r0, #0xf1
    str r0, [sp, #0xb0]
    sub r0, r4, #0x1c8
    str r0, [sp, #0xc4]
    sub r0, r4, #0xe8
    str r0, [sp, #0xcc]
    add r0, r4, #0x1f8
    str r0, [sp, #0xe0]
    add r0, r4, #0x1fc
    str r0, [sp, #0xe4]
    ldr r0, _LIT4
    add r0, r0, #0xd7
    str r0, [sp, #0xd4]
    add r0, r4, #0x1fc
    str r0, [sp, #0xd8]
    ldr r0, _LIT4
    add r0, r0, #0xa8
    str r0, [sp, #0xe8]
    ldr r0, _LIT4
    add r0, r0, #0x108
    str r0, [sp, #0xf0]
    ldr r0, _LIT4
    add r0, r0, #0xd7
    str r0, [sp, #0xd0]
    ldr r0, _LIT4
    add r0, r0, #0x108
    str r0, [sp, #0xec]
    add r0, r4, #0x1f8
    str r0, [sp, #0xdc]
    ldr r0, _LIT3
    sub r0, r0, #0x47
    str r0, [sp, #0xf4]
    ldr r0, _LIT3
    add r0, r0, #0xf1
    str r0, [sp, #0xf8]
    ldr r0, _LIT4
    add r0, r0, #0xa8
    str r0, [sp, #0xfc]
    ldr r0, _LIT3
    add r0, r0, #0x34
    str r0, [sp, #0x100]
    ldr r0, _LIT3
    add r0, r0, #0x3c
    str r0, [sp, #0x104]
    ldr r0, _LIT3
    add r0, r0, #0x30
    str r0, [sp, #0x108]
    ldr r0, _LIT3
    add r0, r0, #0x35
    str r0, [sp, #0x10c]
    sub r0, r4, #0x1c4
    str r0, [sp, #0x110]
    ldr r0, _LIT3
    add r0, r0, #0x3d
    str r0, [sp, #0x120]
    ldr r0, _LIT3
    add r0, r0, #0x2d
    str r0, [sp, #0x12c]
    sub r0, r4, #0x394
    str r0, [sp, #0x130]
    ldr r0, _LIT3
    add r0, r0, #0x2f
    str r0, [sp, #0x134]
    ldr r0, _LIT4
    add r0, r0, #0xd8
    str r0, [sp, #0x118]
    ldr r0, _LIT3
    add r0, r0, #0x3d
    str r0, [sp, #0x11c]
    ldr r0, _LIT1
    add r0, r0, #0x8
    str r0, [sp, #0x138]
    ldr r0, _LIT5
    sub r0, r0, #0x36
    str r0, [sp, #0x140]
    ldr r0, _LIT5
    sub r0, r0, #0x8b
    str r0, [sp, #0x144]
    ldr r0, _LIT4
    add r0, r0, #0xd8
    str r0, [sp, #0x114]
    ldr r0, _LIT5
    sub r0, r0, #0x36
    str r0, [sp, #0x13c]
    ldr r0, _LIT5
    add r0, r0, #0x8
    str r0, [sp, #0x148]
    sub r0, r4, #0x38c
    str r0, [sp, #0x14c]
    ldr r0, _LIT3
    sub r0, r0, #0x2b
    str r0, [sp, #0x150]
    ldr r0, _LIT3
    add r0, r0, #0x2d
    str r0, [sp, #0x128]
    ldr r0, _LIT3
    add r0, r0, #0x2f
    str r0, [sp, #0x124]
.L_3e0:
    ldrb r0, [r7, #0x5dc]
    cmp r0, #0x21
    addls pc, pc, r0, lsl #0x2
    b .L_ac8
    b .L_ac8
    b .L_478
    b .L_494
    b .L_4dc
    b .L_558
    b .L_a34
    b .L_578
    b .L_6a4
    b .L_7a4
    b .L_8e0
    b .L_ac8
    b .L_8c8
    b .L_ac8
    b .L_abc
    b .L_abc
    b .L_abc
    b .L_900
    b .L_ac8
    b .L_920
    b .L_920
    b .L_abc
    b .L_abc
    b .L_abc
    b .L_a88
    b .L_92c
    b .L_944
    b .L_ac8
    b .L_964
    b .L_ac8
    b .L_a1c
    b .L_ac8
    b .L_ab0
    b .L_ab0
    b .L_ab0
.L_478:
    ldr r0, _LIT6
    add sp, sp, #0x154
    ldr r0, [r0, r9, lsl #0x2]
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_494:
    ldr r0, _LIT1
    cmp r8, r0
    bgt .L_4b4
    bge .L_4d0
    ldr r0, _LIT3
    cmp r8, r0
    beq .L_4d0
    b .L_ac8
.L_4b4:
    cmp r8, r5
    bgt .L_4c8
    cmp r8, sl
    beq .L_4d0
    b .L_ac8
.L_4c8:
    cmp r8, fp
    bne .L_ac8
.L_4d0:
    add sp, sp, #0x154
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_4dc:
    ldr r0, [sp, #0x4]
    cmp r8, r0
    bgt .L_520
    ldr r0, [sp, #0x8]
    cmp r8, r0
    bge .L_54c
    ldr r0, [sp, #0xc]
    cmp r8, r0
    bgt .L_510
    ldr r0, [sp, #0x10]
    cmp r8, r0
    beq .L_54c
    b .L_ac8
.L_510:
    ldr r0, [sp, #0x14]
    cmp r8, r0
    beq .L_54c
    b .L_ac8
.L_520:
    ldr r0, _LIT4
    cmp r8, r0
    bgt .L_540
    bge .L_54c
    ldr r0, [sp, #0x18]
    cmp r8, r0
    beq .L_54c
    b .L_ac8
.L_540:
    ldr r0, [sp, #0x1c]
    cmp r8, r0
    bne .L_ac8
.L_54c:
    add sp, sp, #0x154
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_558:
    ldr r0, [sp, #0x20]
    cmp r8, r0
    ldrne r0, [sp, #0x24]
    cmpne r8, r0
    bne .L_ac8
    add sp, sp, #0x154
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_578:
    ldr r0, [sp, #0x28]
    cmp r8, r0
    bgt .L_604
    ldr r0, [sp, #0x2c]
    cmp r8, r0
    bge .L_66c
    ldr r0, [sp, #0x30]
    cmp r8, r0
    bgt .L_5d8
    ldr r0, [sp, #0x34]
    cmp r8, r0
    bge .L_66c
    ldr r0, [sp, #0x38]
    cmp r8, r0
    bgt .L_678
    ldr r0, [sp, #0x3c]
    cmp r8, r0
    blt .L_678
    ldr r0, [sp, #0x40]
    cmp r8, r0
    ldrne r0, [sp, #0x44]
    cmpne r8, r0
    beq .L_66c
    b .L_678
.L_5d8:
    ldr r0, [sp, #0x48]
    cmp r8, r0
    bgt .L_5f4
    ldr r0, [sp, #0x4c]
    cmp r8, r0
    beq .L_66c
    b .L_678
.L_5f4:
    ldr r0, [sp, #0x50]
    cmp r8, r0
    beq .L_66c
    b .L_678
.L_604:
    ldr r0, [sp, #0x54]
    cmp r8, r0
    bgt .L_648
    ldr r0, [sp, #0x58]
    cmp r8, r0
    bge .L_66c
    ldr r0, [sp, #0x5c]
    cmp r8, r0
    bgt .L_638
    ldr r0, [sp, #0x60]
    cmp r8, r0
    beq .L_66c
    b .L_678
.L_638:
    ldr r0, [sp, #0x64]
    cmp r8, r0
    beq .L_66c
    b .L_678
.L_648:
    ldr r0, [sp, #0x68]
    cmp r8, r0
    bgt .L_664
    ldr r0, [sp, #0x6c]
    cmp r8, r0
    beq .L_66c
    b .L_678
.L_664:
    cmp r8, r4
    bne .L_678
.L_66c:
    add sp, sp, #0x154
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_678:
    mov r0, r8
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_ac8
    mov r0, r8
    bl func_0203141c
    cmp r0, #0x0
    bne .L_ac8
    add sp, sp, #0x154
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_6a4:
    ldr r0, [sp, #0x70]
    cmp r8, r0
    bgt .L_730
    ldr r0, [sp, #0x74]
    cmp r8, r0
    bge .L_77c
    ldr r0, [sp, #0x78]
    cmp r8, r0
    bgt .L_704
    ldr r0, [sp, #0x7c]
    cmp r8, r0
    bge .L_77c
    ldr r0, [sp, #0x80]
    cmp r8, r0
    bgt .L_788
    ldr r0, [sp, #0x84]
    cmp r8, r0
    blt .L_788
    ldr r0, [sp, #0x88]
    cmp r8, r0
    ldrne r0, [sp, #0x8c]
    cmpne r8, r0
    beq .L_77c
    b .L_788
.L_704:
    ldr r0, [sp, #0x90]
    cmp r8, r0
    bgt .L_720
    ldr r0, [sp, #0x94]
    cmp r8, r0
    beq .L_77c
    b .L_788
.L_720:
    ldr r0, [sp, #0x98]
    cmp r8, r0
    beq .L_77c
    b .L_788
.L_730:
    ldr r0, [sp, #0x9c]
    cmp r8, r0
    bgt .L_758
    ldr r0, [sp, #0xa0]
    cmp r8, r0
    bge .L_77c
    ldr r0, [sp, #0xa4]
    cmp r8, r0
    beq .L_77c
    b .L_788
.L_758:
    ldr r0, [sp, #0xa8]
    cmp r8, r0
    bgt .L_774
    ldr r0, [sp, #0xac]
    cmp r8, r0
    beq .L_77c
    b .L_788
.L_774:
    cmp r8, r4
    bne .L_788
.L_77c:
    add sp, sp, #0x154
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_788:
    mov r0, r8
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_ac8
    add sp, sp, #0x154
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_7a4:
    cmp r8, r4
    bgt .L_820
    bge .L_8a0
    ldr r0, [sp, #0xb0]
    cmp r8, r0
    bgt .L_7f4
    ldr r0, [sp, #0xb4]
    cmp r8, r0
    bge .L_8a0
    ldr r0, [sp, #0xb8]
    cmp r8, r0
    bgt .L_7e4
    ldr r0, [sp, #0xbc]
    cmp r8, r0
    beq .L_8a0
    b .L_8ac
.L_7e4:
    ldr r0, [sp, #0xc0]
    cmp r8, r0
    beq .L_8a0
    b .L_8ac
.L_7f4:
    ldr r0, [sp, #0xc4]
    cmp r8, r0
    bgt .L_810
    ldr r0, [sp, #0xc8]
    cmp r8, r0
    beq .L_8a0
    b .L_8ac
.L_810:
    ldr r0, [sp, #0xcc]
    cmp r8, r0
    beq .L_8a0
    b .L_8ac
.L_820:
    ldr r0, [sp, #0xd0]
    cmp r8, r0
    bgt .L_878
    ldr r0, [sp, #0xd4]
    cmp r8, r0
    bge .L_8a0
    ldr r0, [sp, #0xd8]
    cmp r8, r0
    bgt .L_868
    ldr r0, [sp, #0xdc]
    cmp r8, r0
    blt .L_8ac
    ldr r0, [sp, #0xe0]
    cmp r8, r0
    ldrne r0, [sp, #0xe4]
    cmpne r8, r0
    beq .L_8a0
    b .L_8ac
.L_868:
    ldr r0, [sp, #0xe8]
    cmp r8, r0
    beq .L_8a0
    b .L_8ac
.L_878:
    ldr r0, [sp, #0xec]
    cmp r8, r0
    bgt .L_894
    ldr r0, [sp, #0xf0]
    cmp r8, r0
    beq .L_8a0
    b .L_8ac
.L_894:
    ldr r0, _LIT5
    cmp r8, r0
    bne .L_8ac
.L_8a0:
    add sp, sp, #0x154
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_8ac:
    mov r0, r8
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_ac8
    add sp, sp, #0x154
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_8c8:
    ldr r0, [sp, #0xf4]
    cmp r8, r0
    bne .L_ac8
    add sp, sp, #0x154
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_8e0:
    ldr r0, [sp, #0xf8]
    cmp r8, r0
    ldrne r0, [sp, #0xfc]
    cmpne r8, r0
    bne .L_ac8
    add sp, sp, #0x154
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_900:
    ldr r0, [sp, #0x100]
    cmp r8, r0
    ldrne r0, [sp, #0x104]
    cmpne r8, r0
    bne .L_ac8
    add sp, sp, #0x154
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_920:
    add sp, sp, #0x154
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_92c:
    ldr r0, [sp, #0x108]
    cmp r8, r0
    bne .L_ac8
    add sp, sp, #0x154
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_944:
    ldr r0, [sp, #0x10c]
    cmp r8, r0
    ldrne r0, [sp, #0x110]
    cmpne r8, r0
    bne .L_ac8
    add sp, sp, #0x154
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_964:
    ldr r0, [sp, #0x114]
    cmp r8, r0
    bgt .L_9dc
    ldr r0, [sp, #0x118]
    cmp r8, r0
    bge .L_a10
    ldr r0, [sp, #0x11c]
    cmp r8, r0
    bgt .L_9cc
    ldr r0, [sp, #0x120]
    cmp r8, r0
    bge .L_a10
    ldr r0, [sp, #0x124]
    cmp r8, r0
    bgt .L_ac8
    ldr r0, [sp, #0x128]
    cmp r8, r0
    blt .L_ac8
    ldr r0, [sp, #0x12c]
    cmp r8, r0
    ldrne r0, [sp, #0x130]
    cmpne r8, r0
    ldrne r0, [sp, #0x134]
    cmpne r8, r0
    beq .L_a10
    b .L_ac8
.L_9cc:
    ldr r0, [sp, #0x138]
    cmp r8, r0
    beq .L_a10
    b .L_ac8
.L_9dc:
    ldr r0, [sp, #0x13c]
    cmp r8, r0
    bgt .L_a04
    ldr r0, [sp, #0x140]
    cmp r8, r0
    bge .L_a10
    ldr r0, [sp, #0x144]
    cmp r8, r0
    beq .L_a10
    b .L_ac8
.L_a04:
    ldr r0, [sp, #0x148]
    cmp r8, r0
    bne .L_ac8
.L_a10:
    add sp, sp, #0x154
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_a1c:
    ldr r0, [sp, #0x14c]
    cmp r8, r0
    bne .L_ac8
    add sp, sp, #0x154
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_a34:
    ldr r0, _LIT6
    ldr r0, [r0, r9, lsl #0x2]
    cmp r0, #0x1
    addeq sp, sp, #0x154
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT7
    cmp r8, r0
    addne r0, r0, #0x7a
    cmpne r8, r0
    bne .L_a6c
    add sp, sp, #0x154
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_a6c:
    ldr r0, _LIT8
    add sp, sp, #0x154
    ldr r0, [r0, #0xcec]
    cmp r9, r0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_a88:
    ldr r0, _LIT8
    ldr r0, [r0, #0xcec]
    cmp r9, r0
    beq .L_ac8
    ldr r0, [sp, #0x150]
    cmp r8, r0
    bne .L_ac8
    add sp, sp, #0x154
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_ab0:
    add sp, sp, #0x154
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_abc:
    add sp, sp, #0x154
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_ac8:
    ldr r0, [sp]
    add r6, r6, #0x1
    ldr r0, [r0, #0x5d4]
    add r7, r7, #0x1
    cmp r6, r0
    bcc .L_3e0
.L_ae0:
    mov r0, #0x0
    add sp, sp, #0x154
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x000015ad
_LIT2: .word 0x000016e0
_LIT3: .word 0x0000131e
_LIT4: .word 0x00001886
_LIT5: .word 0x00001aa1
_LIT6: .word data_ov002_022cd664
_LIT7: .word 0x00001aa8
_LIT8: .word data_ov002_022d008c
