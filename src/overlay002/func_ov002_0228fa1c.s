; func_ov002_0228fa1c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd524
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern func_0202b8a8
        .extern func_0202e2c8
        .extern func_ov002_021c84e0
        .extern func_ov002_022536e8
        .extern func_ov002_02257750
        .extern func_ov002_02259774
        .extern func_ov002_02259834
        .extern func_ov002_0228c584
        .extern func_ov002_0228c864
        .extern func_ov002_0228cb48
        .extern func_ov002_0228cdc0
        .extern func_ov002_0228cf94
        .extern func_ov002_0228d0ac
        .extern func_ov002_0228db8c
        .extern func_ov002_0228dbe4
        .extern func_ov002_0228dc90
        .extern func_ov002_0228de58
        .global func_ov002_0228fa1c
        .arm
func_ov002_0228fa1c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    ldr r3, _LIT0
    mov r5, r0
    ldr r0, [r3, #0x48c]
    mov r6, r1
    mov r1, r2
    bl func_ov002_02257750
    ldr r3, _LIT1
    ldr r1, _LIT2
    ldr r2, _LIT3
    str r5, [r3]
    mov r4, r0
    str r5, [r2, #0xd6c]
    cmp r6, r1
    bgt .L_308
    bge .L_7dc
    ldr r0, _LIT4
    cmp r6, r0
    bgt .L_188
    bge .L_784
    ldr r2, _LIT5
    cmp r6, r2
    bgt .L_e0
    bge .L_834
    ldr r1, _LIT6
    cmp r6, r1
    bgt .L_9c
    bge .L_7dc
    sub r0, r2, #0x328
    cmp r6, r0
    bgt .L_8c
    bge .L_88c
    cmp r6, #0x1
    beq .L_784
    b .L_9ec
.L_8c:
    sub r0, r1, #0xa9
    cmp r6, r0
    beq .L_7dc
    b .L_9ec
.L_9c:
    add r0, r1, #0x64
    cmp r6, r0
    bgt .L_bc
    bge .L_7dc
    add r0, r1, #0x4b
    cmp r6, r0
    beq .L_784
    b .L_9ec
.L_bc:
    add r0, r1, #0xd5
    cmp r6, r0
    bgt .L_d0
    beq .L_784
    b .L_9ec
.L_d0:
    add r0, r1, #0xf3
    cmp r6, r0
    beq .L_7dc
    b .L_9ec
.L_e0:
    add r1, r2, #0xe4
    cmp r6, r1
    bgt .L_13c
    add r0, r2, #0xe3
    cmp r6, r0
    blt .L_10c
    beq .L_8bc
    mov r0, r1
    cmp r6, r0
    beq .L_5a0
    b .L_9ec
.L_10c:
    add r0, r2, #0x81
    cmp r6, r0
    bgt .L_12c
    bge .L_784
    add r0, r2, #0x6a
    cmp r6, r0
    beq .L_88c
    b .L_9ec
.L_12c:
    add r0, r2, #0xd5
    cmp r6, r0
    beq .L_784
    b .L_9ec
.L_13c:
    sub r1, r0, #0x55
    cmp r6, r1
    bgt .L_15c
    bge .L_7dc
    sub r0, r0, #0x8f
    cmp r6, r0
    beq .L_7dc
    b .L_9ec
.L_15c:
    sub r1, r0, #0x4f
    cmp r6, r1
    bgt .L_178
    sub r0, r0, #0x4f
    cmp r6, r0
    beq .L_8bc
    b .L_9ec
.L_178:
    sub r0, r0, #0x3b
    cmp r6, r0
    beq .L_8bc
    b .L_9ec
.L_188:
    sub r2, r1, #0x104
    cmp r6, r2
    bgt .L_234
    bge .L_784
    add r2, r0, #0xde
    cmp r6, r2
    bgt .L_1e0
    mov r1, r2
    cmp r6, r1
    bge .L_5a0
    add r1, r0, #0x59
    cmp r6, r1
    bgt .L_1d0
    bge .L_88c
    add r0, r0, #0x1f
    cmp r6, r0
    beq .L_784
    b .L_9ec
.L_1d0:
    add r0, r0, #0xc7
    cmp r6, r0
    beq .L_784
    b .L_9ec
.L_1e0:
    sub r2, r1, #0x17c
    cmp r6, r2
    bgt .L_208
    mov r0, r2
    cmp r6, r0
    bge .L_834
    sub r0, r1, #0x1c0
    cmp r6, r0
    beq .L_7dc
    b .L_9ec
.L_208:
    sub r2, r1, #0x154
    cmp r6, r2
    bgt .L_224
    mov r0, r2
    cmp r6, r0
    beq .L_784
    b .L_9ec
.L_224:
    add r0, r0, #0x1b8
    cmp r6, r0
    beq .L_784
    b .L_9ec
.L_234:
    add r2, r0, #0x254
    cmp r6, r2
    bgt .L_2c4
    sub r2, r1, #0x8c
    cmp r6, r2
    blt .L_270
    sub r1, r1, #0x8c
    cmp r6, r1
    addne r1, r0, #0x250
    cmpne r6, r1
    beq .L_784
    add r0, r0, #0x254
    cmp r6, r0
    beq .L_834
    b .L_9ec
.L_270:
    sub r2, r1, #0x9d
    cmp r6, r2
    bgt .L_298
    mov r0, r2
    cmp r6, r0
    bge .L_784
    sub r0, r1, #0xff
    cmp r6, r0
    beq .L_784
    b .L_9ec
.L_298:
    sub r2, r1, #0x97
    cmp r6, r2
    bgt .L_2b4
    mov r0, r2
    cmp r6, r0
    beq .L_784
    b .L_9ec
.L_2b4:
    add r0, r0, #0x24c
    cmp r6, r0
    beq .L_7dc
    b .L_9ec
.L_2c4:
    sub r0, r1, #0x4c
    cmp r6, r0
    bgt .L_2e4
    bge .L_784
    sub r0, r1, #0x67
    cmp r6, r0
    beq .L_7dc
    b .L_9ec
.L_2e4:
    sub r0, r1, #0x37
    cmp r6, r0
    bgt .L_2f8
    beq .L_9c0
    b .L_9ec
.L_2f8:
    sub r0, r1, #0x4
    cmp r6, r0
    beq .L_784
    b .L_9ec
.L_308:
    ldr r0, _LIT7
    cmp r6, r0
    bgt .L_46c
    bge .L_784
    sub r2, r0, #0xec
    cmp r6, r2
    bgt .L_3c4
    bge .L_994
    add r2, r1, #0x4d
    cmp r6, r2
    bgt .L_370
    bge .L_834
    sub r2, r0, #0x160
    cmp r6, r2
    bgt .L_360
    sub r0, r0, #0x160
    cmp r6, r0
    bge .L_784
    add r0, r1, #0x19
    cmp r6, r0
    beq .L_7dc
    b .L_9ec
.L_360:
    add r0, r1, #0x4b
    cmp r6, r0
    beq .L_7dc
    b .L_9ec
.L_370:
    sub r2, r0, #0x14c
    cmp r6, r2
    bgt .L_398
    sub r0, r0, #0x14c
    cmp r6, r0
    bge .L_920
    add r0, r1, #0x53
    cmp r6, r0
    beq .L_7dc
    b .L_9ec
.L_398:
    add r2, r1, #0x6f
    cmp r6, r2
    bgt .L_3b4
    mov r0, r2
    cmp r6, r0
    beq .L_784
    b .L_9ec
.L_3b4:
    sub r0, r0, #0x10c
    cmp r6, r0
    beq .L_784
    b .L_9ec
.L_3c4:
    sub r1, r0, #0x77
    cmp r6, r1
    bgt .L_404
    bge .L_784
    sub r1, r0, #0xc3
    cmp r6, r1
    bgt .L_3f4
    bge .L_784
    sub r0, r0, #0xc9
    cmp r6, r0
    beq .L_7dc
    b .L_9ec
.L_3f4:
    sub r0, r0, #0xb5
    cmp r6, r0
    beq .L_784
    b .L_9ec
.L_404:
    sub r1, r0, #0x19
    cmp r6, r1
    bgt .L_424
    bge .L_9c0
    sub r0, r0, #0x1a
    cmp r6, r0
    beq .L_5a0
    b .L_9ec
.L_424:
    sub r1, r0, #0x18
    cmp r6, r1
    bgt .L_440
    sub r0, r0, #0x18
    cmp r6, r0
    beq .L_994
    b .L_9ec
.L_440:
    sub r1, r0, #0x13
    cmp r6, r1
    bgt .L_9ec
    sub r1, r0, #0x17
    cmp r6, r1
    blt .L_9ec
    beq .L_9c0
    sub r0, r0, #0x13
    cmp r6, r0
    beq .L_7dc
    b .L_9ec
.L_46c:
    add r1, r0, #0x120
    cmp r6, r1
    bgt .L_508
    bge .L_784
    add r1, r0, #0xea
    cmp r6, r1
    bgt .L_4bc
    bge .L_784
    add r1, r0, #0x64
    cmp r6, r1
    bgt .L_4ac
    bge .L_784
    add r0, r0, #0x16
    cmp r6, r0
    beq .L_5a0
    b .L_9ec
.L_4ac:
    add r0, r0, #0x74
    cmp r6, r0
    beq .L_784
    b .L_9ec
.L_4bc:
    add r1, r0, #0xec
    cmp r6, r1
    bgt .L_4dc
    bge .L_784
    add r0, r0, #0xeb
    cmp r6, r0
    beq .L_784
    b .L_9ec
.L_4dc:
    add r1, r0, #0xed
    cmp r6, r1
    bgt .L_4f8
    add r0, r0, #0xed
    cmp r6, r0
    beq .L_784
    b .L_9ec
.L_4f8:
    add r0, r0, #0xf4
    cmp r6, r0
    beq .L_7dc
    b .L_9ec
.L_508:
    ldr r1, _LIT8
    cmp r6, r1
    bgt .L_55c
    bge .L_834
    sub r0, r1, #0xc
    cmp r6, r0
    bgt .L_538
    bge .L_9c0
    sub r0, r1, #0xe
    cmp r6, r0
    beq .L_94c
    b .L_9ec
.L_538:
    sub r0, r1, #0x6
    cmp r6, r0
    bgt .L_54c
    beq .L_784
    b .L_9ec
.L_54c:
    sub r0, r1, #0x3
    cmp r6, r0
    beq .L_784
    b .L_9ec
.L_55c:
    add r0, r1, #0x51
    cmp r6, r0
    bgt .L_57c
    bge .L_994
    add r0, r1, #0x15
    cmp r6, r0
    beq .L_994
    b .L_9ec
.L_57c:
    add r0, r1, #0x78
    cmp r6, r0
    bgt .L_590
    beq .L_784
    b .L_9ec
.L_590:
    add r0, r1, #0x79
    cmp r6, r0
    beq .L_784
    b .L_9ec
.L_5a0:
    ldr r1, _LIT9
    cmp r6, r1
    bgt .L_5c0
    bge .L_6d8
    sub r0, r1, #0x198
    cmp r6, r0
    beq .L_674
    b .L_784
.L_5c0:
    add r0, r1, #0x384
    cmp r6, r0
    bgt .L_5d4
    beq .L_5e4
    b .L_784
.L_5d4:
    add r0, r1, #0x3b4
    cmp r6, r0
    beq .L_748
    b .L_784
.L_5e4:
    ldr r2, _LIT10
    ldr r0, _LIT11
    and r1, r5, #0x1
    mla r9, r1, r0, r2
    mov r8, r5, lsl #0x4
    add sl, r9, #0x30
    mov r7, #0x0
    mov r6, #0x1
.L_604:
    tst r4, r6, lsl r8
    beq .L_658
    ldr r0, [r9, #0x40]
    mov r1, r0, lsr #0x16
    mov r0, r0, lsr #0x17
    and r1, r1, #0x1
    and r0, r0, #0x1
    adds r0, r1, r0
    beq .L_658
    ldr r0, [sl]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b8a8
    cmp r0, #0x4
    bgt .L_658
    mov r0, r5
    mov r1, r7
    mov r2, #0x0
    mov r3, #0xb
    bl func_ov002_02259774
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_658:
    add r7, r7, #0x1
    cmp r7, #0x5
    add r8, r8, #0x1
    add r9, r9, #0x14
    add sl, sl, #0x14
    blt .L_604
    b .L_784
.L_674:
    mov r8, r5, lsl #0x4
    mov r9, #0x0
    mov r7, #0x1
.L_680:
    tst r4, r7, lsl r8
    beq .L_6c4
    mov r0, r5
    mov r1, r9
    bl func_ov002_021c84e0
    mov r2, r0
    mov r0, r5
    mov r1, r6
    bl func_ov002_022536e8
    cmp r0, #0x0
    beq .L_6c4
    mov r0, r5
    mov r1, r9
    mov r2, #0x0
    mov r3, #0xb
    bl func_ov002_02259774
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_6c4:
    add r9, r9, #0x1
    cmp r9, #0x5
    add r8, r8, #0x1
    blt .L_680
    b .L_784
.L_6d8:
    ldr r2, _LIT10
    ldr r0, _LIT11
    and r1, r5, #0x1
    mla r0, r1, r0, r2
    mov r7, r5, lsl #0x4
    add r8, r0, #0x30
    mov r9, #0x0
    mov r6, #0x1
.L_6f8:
    tst r4, r6, lsl r7
    beq .L_730
    ldr r0, [r8]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e2c8
    cmp r0, #0x0
    bne .L_730
    mov r0, r5
    mov r1, r9
    mov r2, #0x0
    mov r3, #0xb
    bl func_ov002_02259774
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_730:
    add r9, r9, #0x1
    cmp r9, #0x5
    add r7, r7, #0x1
    add r8, r8, #0x14
    blt .L_6f8
    b .L_784
.L_748:
    mov r0, r5, lsl #0x4
    add r2, r0, #0x5
    mov r1, #0x5
    mov r0, #0x1
.L_758:
    tst r4, r0, lsl r2
    beq .L_774
    mov r0, r5
    mov r2, #0x0
    mov r3, #0xb
    bl func_ov002_02259774
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_774:
    add r1, r1, #0x1
    cmp r1, #0xa
    add r2, r2, #0x1
    blt .L_758
.L_784:
    rsb r6, r5, #0x1
    mov r0, r6
    mov r1, r4
    mov r2, #0x0
    bl func_ov002_0228cdc0
    movs r1, r0
    mov r2, #0x0
    bmi .L_7b4
    mov r0, r6
    mov r3, #0xb
    bl func_ov002_02259774
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_7b4:
    mov r0, r5
    mov r1, r4
    bl func_ov002_0228d0ac
    movs r1, r0
    bmi .L_9ec
    mov r0, r5
    mov r2, #0x0
    mov r3, #0xb
    bl func_ov002_02259774
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_7dc:
    rsb r6, r5, #0x1
    mov r0, r6
    mov r1, r4
    mov r2, #0x1
    bl func_ov002_0228cdc0
    movs r1, r0
    bmi .L_80c
    mov r0, r6
    mov r2, #0x0
    mov r3, #0xb
    bl func_ov002_02259774
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_80c:
    mov r0, r5
    mov r1, r4
    bl func_ov002_0228cf94
    movs r1, r0
    bmi .L_9ec
    mov r0, r5
    mov r2, #0x0
    mov r3, #0xb
    bl func_ov002_02259774
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_834:
    rsb r6, r5, #0x1
    mov r0, r6
    mov r1, r4
    mov r2, #0x0
    bl func_ov002_0228cdc0
    movs r1, r0
    bmi .L_864
    mov r0, r6
    mov r2, #0x0
    mov r3, #0xb
    bl func_ov002_02259774
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_864:
    mov r0, r5
    mov r1, r4
    bl func_ov002_0228cf94
    movs r1, r0
    bmi .L_9ec
    mov r0, r5
    mov r2, #0x0
    mov r3, #0xb
    bl func_ov002_02259774
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_88c:
    mov r0, r5
    mov r1, r4
    mov r2, #0x1
    mov r3, #0x0
    bl func_ov002_0228c584
    movs r1, r0
    bmi .L_9ec
    mov r0, r5
    mov r2, #0x0
    mov r3, #0xb
    bl func_ov002_02259774
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_8bc:
    rsb r6, r5, #0x1
    mvn r2, #0x0
    mov r0, r6
    mov r1, r4
    mov r3, r2
    bl func_ov002_0228c584
    movs r1, r0
    bmi .L_8f0
    mov r0, r6
    mov r2, #0x0
    mov r3, #0xb
    bl func_ov002_02259774
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_8f0:
    mov r2, #0x1
    mov r0, r5
    mov r1, r4
    mov r3, r2
    bl func_ov002_0228c584
    movs r1, r0
    bmi .L_9ec
    mov r0, r5
    mov r2, #0x0
    mov r3, #0xb
    bl func_ov002_02259774
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_920:
    ldr r2, _LIT12
    mov r0, r5
    mov r1, r4
    bl func_ov002_0228c864
    movs r1, r0
    bmi .L_9ec
    mov r0, r5
    mov r2, #0x0
    mov r3, #0xb
    bl func_ov002_02259774
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_94c:
    ldr r0, _LIT0
    ldr r0, [r0, #0x48c]
    ldrh r0, [r0, #0xc]
    cmp r0, #0x0
    beq .L_968
    bl func_ov002_02259834
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_968:
    ldr r2, _LIT13
    mov r0, r5
    mov r1, r4
    bl func_ov002_0228c864
    movs r1, r0
    bmi .L_9ec
    mov r0, r5
    mov r2, #0x0
    mov r3, #0xb
    bl func_ov002_02259774
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_994:
    ldr r2, _LIT14
    mov r0, r5
    mov r1, r4
    bl func_ov002_0228c864
    movs r1, r0
    bmi .L_9ec
    mov r0, r5
    mov r2, #0x0
    mov r3, #0xb
    bl func_ov002_02259774
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_9c0:
    ldr r2, _LIT15
    mov r0, r5
    mov r1, r4
    bl func_ov002_0228c864
    movs r1, r0
    bmi .L_9ec
    mov r0, r5
    mov r2, #0x0
    mov r3, #0xb
    bl func_ov002_02259774
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_9ec:
    rsb r6, r5, #0x1
    mov r0, r6
    mov r1, r4
    bl func_ov002_0228cb48
    movs r1, r0
    bmi .L_a18
    mov r0, r6
    mov r2, #0x0
    mov r3, #0xb
    bl func_ov002_02259774
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_a18:
    mov r0, r5
    mov r1, r4
    bl func_ov002_0228cb48
    movs r1, r0
    ldmmiia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    mov r0, r5
    mov r2, #0x0
    mov r3, #0xb
    bl func_ov002_02259774
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022cd524
_LIT2: .word 0x0000179f
_LIT3: .word data_ov002_022d016c
_LIT4: .word 0x000014c5
_LIT5: .word 0x00001327
_LIT6: .word 0x000011f0
_LIT7: .word 0x00001941
_LIT8: .word 0x00001aa6
_LIT9: .word 0x000015a3
_LIT10: .word data_ov002_022cf16c
_LIT11: .word 0x00000868
_LIT12: .word func_ov002_0228dbe4
_LIT13: .word func_ov002_0228de58
_LIT14: .word func_ov002_0228db8c
_LIT15: .word func_ov002_0228dc90
