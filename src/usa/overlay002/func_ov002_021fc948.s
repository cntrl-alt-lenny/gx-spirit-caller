; func_ov002_021fc948 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd65c
        .extern data_ov002_022ce1a8
        .extern data_ov002_022ce7a4
        .extern data_ov002_022cf098
        .extern data_ov002_022d008c
        .extern data_ov002_022d0170
        .extern func_0202b824
        .extern func_0202b86c
        .extern func_0202e1e0
        .extern func_0202f994
        .extern func_02031740
        .extern func_ov002_021b2fcc
        .extern func_ov002_021b3dec
        .extern func_ov002_021b3e2c
        .extern func_ov002_021b3ef8
        .extern func_ov002_021b3ffc
        .extern func_ov002_021b4040
        .extern func_ov002_021b77d8
        .extern func_ov002_021b939c
        .extern func_ov002_021babc8
        .extern func_ov002_021bad9c
        .extern func_ov002_021baf88
        .extern func_ov002_021bb338
        .extern func_ov002_021bd630
        .extern func_ov002_021bd77c
        .extern func_ov002_021f3ab0
        .global func_ov002_021fc948
        .arm
func_ov002_021fc948:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r9, r0
    ldrh r2, [r9, #0x2]
    mov r3, r2, lsl #0x1f
    mov r0, r2, lsl #0x1a
    mov r1, r0, lsr #0x1b
    mov r0, r3, lsr #0x1f
    mov r2, r2, lsl #0x11
    cmp r1, #0x4
    eor r6, r0, r2, lsr #0x1f
    bhi .L_3c
    bl func_ov002_021bd630
    cmp r0, #0x0
    bne .L_788
    b .L_58
.L_3c:
    ldrh r1, [r9, #0x4]
    ldrh r0, [r9]
    mov r1, r1, lsl #0x11
    mov r1, r1, lsr #0x17
    bl func_ov002_021bd77c
    cmp r0, #0x0
    bne .L_788
.L_58:
    ldrh r0, [r9]
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_84
    ldrh r0, [r9, #0x2]
    mov r0, r0, lsl #0x1a
    mov r0, r0, lsr #0x1b
    cmp r0, #0x5
    bcc .L_c8
    cmp r0, #0xa
    bhi .L_c8
.L_84:
    ldr r2, _LIT0
    mov r0, #0x0
    mov r1, #0xb
    bl func_ov002_021b3dec
    cmp r0, #0x0
    bne .L_788
    ldrh r0, [r9, #0x2]
    mov r1, r0, lsl #0x1a
    mov r1, r1, lsr #0x1b
    cmp r1, #0xa
    bhi .L_c8
    mov r0, r0, lsl #0x1f
    ldr r2, _LIT1
    mov r0, r0, lsr #0x1f
    bl func_ov002_021b3dec
    cmp r0, #0x0
    bne .L_788
.L_c8:
    ldrh r0, [r9]
    bl func_02031740
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldrh r0, [r9, #0x2]
    mov r0, r0, lsl #0x1a
    mov r0, r0, lsr #0x1b
    cmp r0, #0x4
    bhi .L_150
    ldrh r0, [r9, #0x4]
    mov r0, r0, lsl #0x11
    mov r0, r0, lsr #0x17
    bl func_ov002_021b939c
    mov r1, r0, lsr #0x10
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x10
    mov r1, r0, lsl #0x10
    ldr r2, _LIT2
    mov r1, r1, lsr #0x10
    beq .L_138
    mov r1, r1, asr #0x8
    and r0, r0, #0xff
    and r1, r1, #0xff
    bl func_ov002_021b3e2c
    cmp r0, #0x0
    bne .L_788
    b .L_150
.L_138:
    mov r1, r1, asr #0x8
    and r0, r0, #0xff
    and r1, r1, #0xff
    bl func_ov002_021b3dec
    cmp r0, #0x0
    bne .L_788
.L_150:
    ldrh r1, [r9, #0x4]
    ldr r0, _LIT3
    ldr r2, _LIT4
    mov r1, r1, lsl #0x11
    ldr r0, [r0, #0xcec]
    mov r3, r1, lsr #0x17
    mov r1, #0xb
    bl func_ov002_021b3ef8
    cmp r0, #0x0
    bne .L_788
    ldrh r0, [r9]
    bl func_0202f994
    cmp r0, #0x1
    bne .L_198
    ldr r0, _LIT5
    bl func_ov002_021baf88
    cmp r0, #0x0
    bne .L_788
.L_198:
    ldr r0, _LIT6
    bl func_ov002_021bb338
    cmp r0, #0x0
    beq .L_1b8
    mov r0, r9
    bl func_ov002_021f3ab0
    cmp r0, #0x0
    bne .L_788
.L_1b8:
    ldrh r0, [r9]
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_1e4
    ldrh r0, [r9, #0x2]
    mov r0, r0, lsl #0x1a
    mov r0, r0, lsr #0x1b
    cmp r0, #0x5
    bcc .L_21c
    cmp r0, #0xa
    bhi .L_21c
.L_1e4:
    ldr r2, _LIT7
    mov r0, #0x0
    mov r1, #0xb
    bl func_ov002_021b3dec
    cmp r0, #0x0
    bne .L_788
    ldr r2, _LIT8
    mov r0, r6
    mov r1, #0xb
    mov r3, #0x2
    bl func_ov002_021b3ef8
    cmp r0, #0x0
    bne .L_788
    b .L_238
.L_21c:
    ldr r2, _LIT8
    mov r0, r6
    mov r1, #0xb
    mov r3, #0x1
    bl func_ov002_021b3ef8
    cmp r0, #0x0
    bne .L_788
.L_238:
    ldrh r0, [r9, #0x2]
    mov r0, r0, lsl #0x12
    movs r0, r0, lsr #0x1e
    cmpne r0, #0x3
    bne .L_2f4
    ldrh r0, [r9]
    bl func_ov002_021b77d8
    ldr r1, _LIT3
    mov r4, r0
    ldr r0, [r1, #0xcf8]
    cmp r0, #0x0
    beq .L_2ac
    tst r4, #0x1
    beq .L_288
    ldr r1, _LIT9
    rsb r0, r6, #0x1
    mvn r2, #0x0
    bl func_ov002_021bad9c
    cmp r0, #0x0
    bne .L_788
.L_288:
    tst r4, #0x2
    beq .L_2f4
    ldr r1, _LIT9
    mov r0, r6
    mvn r2, #0x0
    bl func_ov002_021bad9c
    cmp r0, #0x0
    bne .L_788
    b .L_2f4
.L_2ac:
    ldr r0, [r1, #0xcec]
    ldr r2, _LIT10
    mov r1, #0xb
    mov r3, #0x0
    bl func_ov002_021b3ffc
    cmp r0, #0x0
    beq .L_2f4
    tst r4, #0x1
    beq .L_2e0
    ldr r0, _LIT3
    ldr r0, [r0, #0xcec]
    cmp r6, r0
    beq .L_788
.L_2e0:
    tst r4, #0x2
    ldrne r0, _LIT3
    ldrne r0, [r0, #0xcec]
    cmpne r6, r0
    bne .L_788
.L_2f4:
    ldrh r0, [r9, #0x2]
    mov r1, r0, lsl #0x1a
    mov r1, r1, lsr #0x1b
    cmp r1, #0xa
    bls .L_314
    mov r0, r0, lsl #0x12
    movs r0, r0, lsr #0x1e
    bne .L_418
.L_314:
    ldrh r0, [r9]
    bl func_0202b824
    cmp r0, #0x17
    bne .L_3c8
    ldr r4, _LIT11
    mov r7, #0x0
    mov sl, r7
    sub r5, r4, #0x3d
.L_334:
    mov r8, sl
.L_338:
    mov r0, r7
    mov r1, r8
    mov r2, r5
    bl func_ov002_021babc8
    cmp r0, #0x0
    beq .L_378
    ldrh r0, [r9, #0x2]
    mov r0, r0, lsl #0x1f
    cmp r7, r0, lsr #0x1f
    bne .L_788
    mov r0, r7
    mov r1, r8
    mov r2, r4
    bl func_ov002_021b2fcc
    cmp r0, #0x0
    beq .L_788
.L_378:
    add r8, r8, #0x1
    cmp r8, #0x4
    ble .L_338
    add r7, r7, #0x1
    cmp r7, #0x2
    blt .L_334
    ldr r0, _LIT12
    bl func_ov002_021baf88
    cmp r0, #0x0
    bne .L_788
    ldrh r0, [r9, #0x2]
    mov r1, #0xb
    mov r2, #0x1840
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021b3dec
    cmp r0, #0x0
    bne .L_788
    b .L_418
.L_3c8:
    ldrh r0, [r9]
    bl func_0202e1e0
    cmp r0, #0x0
    bne .L_418
    ldrh r0, [r9, #0x2]
    mov r1, r0, lsl #0x1a
    mov r1, r1, lsr #0x1b
    cmp r1, #0x5
    bcs .L_3f8
    mov r0, r0, lsl #0x12
    movs r0, r0, lsr #0x1e
    bne .L_418
.L_3f8:
    ldr r0, _LIT13
    bl func_ov002_021baf88
    cmp r0, #0x0
    bne .L_788
    ldr r0, _LIT14
    bl func_ov002_021baf88
    cmp r0, #0x0
    bne .L_788
.L_418:
    ldrh r0, [r9, #0x2]
    mov r0, r0, lsl #0x12
    movs r0, r0, lsr #0x1e
    bne .L_4d0
    ldrh r0, [r9]
    bl func_0202e1e0
    cmp r0, #0x0
    bne .L_4d0
    ldrh r0, [r9, #0x2]
    ldr r2, _LIT15
    mov r1, #0xb
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_48c
    ldrh r0, [r9, #0x2]
    ldr r2, _LIT15
    mov r1, #0xb
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021b4040
    bl func_ov002_021b939c
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    and r0, r0, #0xff
    cmp r0, #0xa
    bls .L_788
.L_48c:
    ldrh r0, [r9, #0x2]
    ldr r2, _LIT10
    mov r1, #0xb
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x1
    bl func_ov002_021b3ef8
    cmp r0, #0x0
    bne .L_788
    ldrh r0, [r9, #0x2]
    ldr r2, _LIT16
    mov r1, #0xb
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021b3dec
    cmp r0, #0x0
    bne .L_788
.L_4d0:
    ldrh r0, [r9, #0x2]
    mov r0, r0, lsl #0x12
    movs r0, r0, lsr #0x1e
    bne .L_5c8
    ldrh r0, [r9]
    bl func_0202b824
    cmp r0, #0x16
    bne .L_5c8
    ldrh r0, [r9, #0x2]
    ldr r2, _LIT17
    mov r3, r0, lsl #0x1f
    mov r1, r0, lsl #0x1a
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021b2fcc
    cmp r0, #0x0
    bne .L_788
    ldrh r0, [r9, #0x2]
    ldr r2, _LIT18
    mov r1, #0xb
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021b3dec
    cmp r0, #0x0
    bne .L_788
    ldrh r0, [r9, #0x2]
    ldr r1, _LIT19
    ldr r2, _LIT20
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    and r3, r0, #0x1
    mul r1, r3, r1
    ldr r1, [r2, r1]
    cmp r1, #0x0
    bne .L_574
    ldr r1, _LIT21
    mvn r2, #0x0
    bl func_ov002_021bad9c
    cmp r0, #0x0
    bne .L_788
.L_574:
    ldrh r0, [r9]
    bl func_0202b86c
    cmp r0, #0x5
    bne .L_5a8
    ldrh r0, [r9, #0x2]
    ldr r1, _LIT22
    mvn r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021bad9c
    cmp r0, #0x0
    bne .L_788
.L_5a8:
    ldrh r0, [r9, #0x2]
    ldr r2, _LIT23
    mov r1, #0xb
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021b3dec
    cmp r0, #0x0
    bne .L_788
.L_5c8:
    ldrh r0, [r9, #0x2]
    mov r0, r0, lsl #0x12
    movs r0, r0, lsr #0x1e
    bne .L_6e4
    ldrh r0, [r9]
    bl func_0202b824
    cmp r0, #0x17
    bne .L_6e4
    ldr r1, _LIT24
    mov r0, #0x0
    ldr r3, [r1, #0x5d4]
    cmp r3, #0x0
    bls .L_65c
    ldr r2, _LIT25
    ldr r7, _LIT26
    ldr r4, _LIT27
.L_608:
    ldrb r5, [r1, #0x5dc]
    cmp r5, #0x6
    bne .L_648
    ldr r5, [r2]
    mov r5, r5, lsl #0x17
    mov r5, r5, lsr #0x15
    ldrh r5, [r7, r5]
    mov r5, r5, lsl #0x13
    rsb r5, r4, r5, lsr #0x13
    cmp r5, #0x3
    addls pc, pc, r5, lsl #0x2
    b .L_648
    b .L_788
    b .L_788
    b .L_788
    b .L_788
.L_648:
    add r0, r0, #0x1
    cmp r0, r3
    add r1, r1, #0x1
    add r2, r2, #0x4
    bcc .L_608
.L_65c:
    ldr r2, _LIT28
    mov r0, #0x0
    mov r1, #0xb
    bl func_ov002_021b3dec
    cmp r0, #0x0
    bne .L_788
    ldr r0, _LIT3
    ldr r0, [r0, #0xcf8]
    cmp r0, #0x3
    bne .L_6e4
    ldrh r0, [r9, #0x2]
    ldr r1, _LIT29
    mvn r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021bad9c
    cmp r0, #0x0
    bne .L_788
    ldrh r0, [r9, #0x2]
    ldr r1, _LIT30
    mvn r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021bad9c
    cmp r0, #0x0
    bne .L_788
    ldr r2, _LIT31
    mov r0, #0x0
    mov r1, #0xb
    bl func_ov002_021b3dec
    cmp r0, #0x0
    bne .L_788
.L_6e4:
    ldrh r2, [r9, #0x2]
    mov r0, r2, lsl #0x12
    movs r0, r0, lsr #0x1e
    bne .L_71c
    mov r0, r2, lsl #0x1a
    mov r1, r0, lsr #0x1b
    cmp r1, #0xa
    bhi .L_71c
    mov r0, r2, lsl #0x1f
    ldr r2, _LIT32
    mov r0, r0, lsr #0x1f
    bl func_ov002_021b2fcc
    cmp r0, #0x0
    bne .L_788
.L_71c:
    ldrh r0, [r9, #0x2]
    mov r0, r0, lsl #0x12
    movs r0, r0, lsr #0x1e
    cmpne r0, #0x2
    bne .L_780
    ldrh r0, [r9]
    bl func_0202e1e0
    cmp r0, #0x0
    bne .L_780
    ldrh r1, [r9, #0x4]
    ldr r2, _LIT33
    mov r0, r6
    mov r1, r1, lsl #0x11
    mov r3, r1, lsr #0x17
    mov r1, #0xb
    bl func_ov002_021b3ef8
    cmp r0, #0x0
    bne .L_788
    ldrh r3, [r9]
    ldr r2, _LIT34
    mov r0, r6
    mov r1, #0xb
    bl func_ov002_021b3ef8
    cmp r0, #0x0
    bne .L_788
.L_780:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_788:
    ldr r0, _LIT35
    ldr r0, [r0, #0x4]
    cmp r6, r0
    ldreq r0, _LIT3
    moveq r1, #0x14
    streq r1, [r0, #0xd80]
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0x00001407
_LIT1: .word 0x000019ae
_LIT2: .word 0x00001944
_LIT3: .word data_ov002_022d008c
_LIT4: .word 0x000015ff
_LIT5: .word 0x0000148e
_LIT6: .word 0x0000168a
_LIT7: .word 0x00001684
_LIT8: .word 0x00001679
_LIT9: .word 0x0000178b
_LIT10: .word 0x00001885
_LIT11: .word 0x000012d3
_LIT12: .word 0x00001760
_LIT13: .word 0x000015da
_LIT14: .word 0x00001765
_LIT15: .word 0x000018ab
_LIT16: .word 0x00001a2a
_LIT17: .word 0x00001390
_LIT18: .word 0x000013bd
_LIT19: .word 0x00000868
_LIT20: .word data_ov002_022cf098
_LIT21: .word 0x00001910
_LIT22: .word 0x00001722
_LIT23: .word 0x00001af7
_LIT24: .word data_ov002_022ce1a8
_LIT25: .word data_ov002_022ce7a4
_LIT26: .word data_ov002_022d0170
_LIT27: .word 0x0000182f
_LIT28: .word 0x0000188e
_LIT29: .word 0x00001833
_LIT30: .word 0x00001834
_LIT31: .word 0x000019bb
_LIT32: .word 0x0000184a
_LIT33: .word 0x00001664
_LIT34: .word 0x000016dd
_LIT35: .word data_ov002_022cd65c
