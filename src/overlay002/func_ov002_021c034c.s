; func_ov002_021c034c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern data_ov002_022cf1a8
        .extern data_ov002_022cf1ac
        .extern func_ov002_021b314c
        .extern func_ov002_021b3ecc
        .extern func_ov002_021b9ecc
        .extern func_ov002_021bbe8c
        .extern func_ov002_021bc0d4
        .extern func_ov002_021bcf18
        .extern func_ov002_021bd198
        .extern func_ov002_021bd200
        .extern func_ov002_021bd6c8
        .extern func_ov002_021bff50
        .extern func_ov002_021c1d4c
        .extern func_ov002_021c8470
        .global func_ov002_021c034c
        .arm
func_ov002_021c034c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    mov r9, r1
    mov r5, r2
    bl func_ov002_021c1d4c
    mov r4, r0
    mov r0, sl
    mov r1, r9
    bl func_ov002_021bff50
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r2, _LIT0
    mov r0, sl
    mov r1, r9
    bl func_ov002_021b314c
    cmp r0, #0x0
    movne r0, #0x2
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r2, _LIT1
    mov r0, sl
    mov r1, r9
    bl func_ov002_021b314c
    cmp r0, #0x0
    movne r0, #0x2
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    and r0, r4, #0x2
    cmp r0, #0x0
    bgt .L_90
    ldr r2, _LIT2
    mov r0, sl
    mov r1, #0xb
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    movne r0, #0x2
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_90:
    mov r0, sl
    mov r1, r9
    bl func_ov002_021b9ecc
    ldr r1, _LIT3
    mov r4, r0
    cmp r4, r1
    bne .L_10c
    cmp r5, #0x0
    beq .L_10c
    ldr r1, _LIT4
    and r2, sl, #0x1
    mul r3, r2, r1
    mov r0, #0x14
    ldr r2, _LIT5
    mul r0, r9, r0
    add r2, r2, r3
    ldr r1, _LIT6
    ldr r6, [r0, r2]
    add r3, r1, r3
    mov r2, r6, lsr #0x6
    mov r1, r6, lsr #0x2
    and r2, r2, #0x1
    orr r1, r1, r6, lsr #0x1
    ldrh r3, [r0, r3]
    and r1, r1, #0x1
    mvn r2, r2
    mvn r0, r1
    and r1, r3, r2
    tst r1, r0
    movne r0, #0x2
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_10c:
    ldr r0, _LIT7
    cmp r4, r0
    bne .L_184
    ldr r0, _LIT4
    and r2, sl, #0x1
    mov r1, #0x14
    mul r0, r2, r0
    ldr r3, _LIT5
    ldr r2, _LIT6
    mul r1, r9, r1
    add r3, r3, r0
    ldr r7, [r1, r3]
    add r6, r2, r0
    mov r3, r7, lsr #0x6
    mov r2, r7, lsr #0x2
    and r3, r3, #0x1
    orr r2, r2, r7, lsr #0x1
    and r2, r2, #0x1
    ldrh r6, [r1, r6]
    mvn r3, r3
    mvn r2, r2
    and r3, r6, r3
    tst r3, r2
    beq .L_184
    ldr r2, _LIT8
    add r0, r2, r0
    ldr r0, [r1, r0]
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_184:
    ldr r2, _LIT9
    mov r0, sl
    mov r1, #0xb
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    cmp r5, #0x0
    beq .L_72c
    ldr r2, _LIT4
    and r0, sl, #0x1
    mov r3, #0x14
    mul r6, r0, r2
    ldr r5, _LIT5
    ldr r1, _LIT6
    mul r0, r9, r3
    add r5, r5, r6
    ldr r7, [r0, r5]
    add r6, r1, r6
    mov r5, r7, lsr #0x6
    mov r1, r7, lsr #0x2
    and r5, r5, #0x1
    orr r1, r1, r7, lsr #0x1
    and r1, r1, #0x1
    ldrh r6, [r0, r6]
    mvn r5, r5
    mvn r0, r1
    and r1, r6, r5
    tst r1, r0
    beq .L_72c
    ldr r1, _LIT10
    cmp r4, r1
    bgt .L_32c
    bge .L_44c
    ldr r2, _LIT11
    cmp r4, r2
    bgt .L_2bc
    bge .L_474
    ldr r1, _LIT12
    cmp r4, r1
    bgt .L_274
    bge .L_444
    sub r0, r1, #0x5a
    cmp r4, r0
    bgt .L_264
    sub r0, r1, #0x5b
    cmp r4, r0
    blt .L_254
    subne r0, r1, #0x5a
    cmpne r4, r0
    beq .L_444
    b .L_72c
.L_254:
    sub r0, r1, #0x65
    cmp r4, r0
    beq .L_444
    b .L_72c
.L_264:
    sub r0, r1, #0x42
    cmp r4, r0
    beq .L_444
    b .L_72c
.L_274:
    add r0, r1, #0xef
    cmp r4, r0
    bgt .L_294
    bge .L_45c
    add r0, r1, #0x93
    cmp r4, r0
    beq .L_444
    b .L_72c
.L_294:
    add r0, r1, #0xf1
    cmp r4, r0
    bgt .L_72c
    add r0, r1, #0xf0
    cmp r4, r0
    blt .L_72c
    addne r0, r1, #0xf1
    cmpne r4, r0
    beq .L_45c
    b .L_72c
.L_2bc:
    ldr r3, _LIT13
    cmp r4, r3
    bgt .L_2fc
    bge .L_444
    sub r0, r3, #0x28
    cmp r4, r0
    bgt .L_2ec
    bge .L_490
    add r0, r2, #0x10
    cmp r4, r0
    beq .L_45c
    b .L_72c
.L_2ec:
    sub r0, r3, #0x1
    cmp r4, r0
    beq .L_444
    b .L_72c
.L_2fc:
    sub r0, r1, #0x1a
    cmp r4, r0
    bgt .L_31c
    bge .L_45c
    sub r0, r1, #0x66
    cmp r4, r0
    beq .L_43c
    b .L_72c
.L_31c:
    add r0, r3, #0x1b0
    cmp r4, r0
    beq .L_44c
    b .L_72c
.L_32c:
    ldr r0, _LIT14
    cmp r4, r0
    bgt .L_3cc
    bge .L_444
    add r3, r1, #0x56
    cmp r4, r3
    bgt .L_39c
    bge .L_4a8
    add r2, r1, #0x33
    cmp r4, r2
    bgt .L_38c
    bge .L_444
    add r2, r1, #0x2
    cmp r4, r2
    bgt .L_72c
    sub r2, r0, #0x2c8
    cmp r4, r2
    blt .L_72c
    sub r0, r0, #0x2c8
    cmp r4, r0
    addne r0, r1, #0x2
    cmpne r4, r0
    beq .L_44c
    b .L_72c
.L_38c:
    add r0, r1, #0x34
    cmp r4, r0
    beq .L_444
    b .L_72c
.L_39c:
    sub r2, r0, #0x128
    cmp r4, r2
    bgt .L_3bc
    bge .L_568
    sub r0, r0, #0x12c
    cmp r4, r0
    beq .L_580
    b .L_72c
.L_3bc:
    sub r0, r0, #0xe6
    cmp r4, r0
    beq .L_580
    b .L_72c
.L_3cc:
    add r1, r0, #0x214
    cmp r4, r1
    bgt .L_40c
    bge .L_698
    add r1, r0, #0x1d4
    cmp r4, r1
    bgt .L_3fc
    bge .L_5ec
    add r0, r0, #0x40
    cmp r4, r0
    beq .L_5cc
    b .L_72c
.L_3fc:
    ldr r0, _LIT15
    cmp r4, r0
    beq .L_610
    b .L_72c
.L_40c:
    ldr r0, _LIT16
    cmp r4, r0
    bgt .L_42c
    bge .L_444
    sub r0, r0, #0x5d
    cmp r4, r0
    beq .L_444
    b .L_72c
.L_42c:
    add r0, r0, #0x42
    cmp r4, r0
    beq .L_6e8
    b .L_72c
.L_43c:
    mov r0, #0x2
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_444:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_44c:
    mov r0, sl
    bl func_ov002_021bbe8c
    cmp r0, #0x0
    beq .L_72c
.L_45c:
    rsb r0, sl, #0x1
    bl func_ov002_021bd198
    cmp r0, #0x0
    bne .L_72c
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_474:
    mov r0, sl
    mov r1, r9
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_72c
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_490:
    rsb r0, sl, #0x1
    bl func_ov002_021bd200
    cmp r0, #0x0
    beq .L_72c
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_4a8:
    rsb r4, sl, #0x1
    ldr r1, _LIT17
    and r0, r4, #0x1
    mla r1, r0, r2, r1
    add r3, r1, #0x94
    mov r2, #0x1
    mov r1, #0x5
.L_4c4:
    ldr r0, [r3]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    movne r2, #0x0
    bne .L_4e8
    add r1, r1, #0x1
    cmp r1, #0xa
    add r3, r3, #0x14
    ble .L_4c4
.L_4e8:
    cmp r2, #0x0
    beq .L_72c
    ldr r2, _LIT17
    ldr r0, _LIT4
    and r1, r4, #0x1
    mla r8, r1, r0, r2
    add r7, r8, #0x30
    mov r6, #0x1
    mov r5, #0x0
.L_50c:
    ldr r0, [r7]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_544
    ldrh r0, [r8, #0x38]
    cmp r0, #0x0
    beq .L_53c
    mov r0, r4
    mov r1, r5
    bl func_ov002_021c8470
    cmp r0, #0x640
    bge .L_544
.L_53c:
    mov r6, #0x0
    b .L_558
.L_544:
    add r5, r5, #0x1
    cmp r5, #0x4
    add r7, r7, #0x14
    add r8, r8, #0x14
    ble .L_50c
.L_558:
    cmp r6, #0x0
    beq .L_72c
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_568:
    sub r0, r1, #0x470
    bl func_ov002_021bd6c8
    cmp r0, #0x0
    beq .L_72c
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_580:
    rsb r1, sl, #0x1
    ldr r2, _LIT17
    ldr r0, _LIT4
    and r1, r1, #0x1
    mla r0, r1, r0, r2
    add r3, r0, #0x94
    mov r2, #0x1
    mov r1, #0x5
.L_5a0:
    ldr r0, [r3]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    movne r2, #0x0
    bne .L_5c4
    add r1, r1, #0x1
    cmp r1, #0xa
    add r3, r3, #0x14
    ble .L_5a0
.L_5c4:
    cmp r2, #0x0
    beq .L_72c
.L_5cc:
    rsb r0, sl, #0x1
    mov r1, #0x0
    mov r2, #0x1
    bl func_ov002_021bc0d4
    cmp r0, #0x0
    bne .L_72c
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_5ec:
    mov r2, #0x1
    mov r0, sl
    mov r3, r2
    mov r1, #0x0
    bl func_ov002_021bcf18
    cmp r0, #0x0
    beq .L_72c
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_610:
    rsb r8, sl, #0x1
    ldr r1, _LIT17
    and r0, r8, #0x1
    mla r7, r0, r2, r1
    add r6, r7, #0x30
    mov fp, #0x1
    mov r5, #0x0
.L_62c:
    ldr r0, [r6]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_674
    ldrh r0, [r7, #0x38]
    cmp r0, #0x0
    beq .L_66c
    mov r0, r8
    mov r1, r5
    bl func_ov002_021c8470
    mov r4, r0
    mov r0, sl
    mov r1, r9
    bl func_ov002_021c8470
    cmp r4, r0
    bgt .L_674
.L_66c:
    mov fp, #0x0
    b .L_688
.L_674:
    add r5, r5, #0x1
    cmp r5, #0x4
    add r6, r6, #0x14
    add r7, r7, #0x14
    ble .L_62c
.L_688:
    cmp fp, #0x0
    beq .L_72c
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_698:
    rsb r0, sl, #0x1
    ldr r1, _LIT17
    and r0, r0, #0x1
    mla r1, r0, r2, r1
    add r3, r1, #0x94
    mov r2, #0x1
    mov r1, #0x5
.L_6b4:
    ldr r0, [r3]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    movne r2, #0x0
    bne .L_6d8
    add r1, r1, #0x1
    cmp r1, #0xa
    add r3, r3, #0x14
    blt .L_6b4
.L_6d8:
    cmp r2, #0x0
    beq .L_72c
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_6e8:
    rsb r0, sl, #0x1
    ldr r1, _LIT17
    and r0, r0, #0x1
    mla r2, r0, r2, r1
    rsb r1, r9, #0x4
    mla r0, r1, r3, r2
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    bne .L_72c
    rsb r1, r9, #0x9
    mla r0, r1, r3, r2
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_72c:
    ldr r2, _LIT18
    mov r0, sl
    mov r1, r9
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r2, _LIT19
    mov r0, sl
    mov r1, r9
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r2, _LIT20
    mov r0, sl
    mov r1, r9
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r2, _LIT21
    mov r0, sl
    mov r1, r9
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r2, _LIT22
    mov r0, sl
    mov r1, r9
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r2, _LIT23
    mov r0, sl
    mov r1, r9
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r2, _LIT24
    mov r0, sl
    mov r1, r9
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r2, _LIT25
    mov r0, sl
    mov r1, r9
    bl func_ov002_021b314c
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r2, _LIT26
    mov r0, sl
    mov r1, r9
    bl func_ov002_021b314c
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00001561
_LIT1: .word 0x00001852
_LIT2: .word 0x000017fd
_LIT3: .word 0x000014fe
_LIT4: .word 0x00000868
_LIT5: .word data_ov002_022cf1ac
_LIT6: .word data_ov002_022cf1a4
_LIT7: .word 0x00001a79
_LIT8: .word data_ov002_022cf1a8
_LIT9: .word 0x000015ff
_LIT10: .word 0x00001564
_LIT11: .word 0x00001295
_LIT12: .word 0x0000118e
_LIT13: .word 0x000013b3
_LIT14: .word 0x0000182d
_LIT15: .word 0x00001a08
_LIT16: .word 0x00001aaf
_LIT17: .word data_ov002_022cf16c
_LIT18: .word 0x000013ab
_LIT19: .word 0x000015cf
_LIT20: .word 0x0000169b
_LIT21: .word 0x000016a3
_LIT22: .word 0x000017aa
_LIT23: .word 0x00001893
_LIT24: .word 0x00001a13
_LIT25: .word 0x00001759
_LIT26: .word 0x0000165d
