; func_02042188 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020fe47c
        .extern data_020fe934
        .extern data_020fe95c
        .extern data_020fe978
        .extern data_020fe994
        .extern data_020fe9a0
        .extern data_020fe9b0
        .extern data_020fe9c0
        .extern data_020fe9e0
        .extern data_020fe9ec
        .extern data_020fea0c
        .extern data_020fea14
        .extern data_020fea1c
        .extern data_020fea2c
        .extern data_020fea4c
        .extern data_020fea54
        .extern data_020fea5c
        .extern data_020fea68
        .extern data_020fea6c
        .extern data_020fea74
        .extern data_020fea7c
        .extern data_020fea88
        .extern data_020fea94
        .extern data_0219d910
        .extern data_0219d914
        .extern data_0219d918
        .extern data_0219d91c
        .extern data_0219d920
        .extern data_0219d93c
        .extern data_021a62f0
        .extern data_021aa380
        .extern func_02040208
        .extern func_0204029c
        .extern func_020402ec
        .extern func_0204032c
        .extern func_020404dc
        .extern func_0204063c
        .extern func_02040c48
        .extern func_02040d44
        .extern func_02040d98
        .extern func_02040dec
        .extern func_020414dc
        .extern func_02041578
        .extern func_0204185c
        .extern func_02041eb4
        .extern func_02041f80
        .extern func_02042018
        .extern func_02042140
        .extern func_020445c0
        .extern func_02091680
        .extern func_0209172c
        .extern func_02091a0c
        .extern func_020aace8
        .extern func_020aadcc
        .extern func_020aae4c
        .extern func_020acd0c
        .global func_02042188
        .arm
func_02042188:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x2d4
    ldr r5, _LIT0
    mov r0, #0x0
    str r0, [sp]
    ldr r0, [r5]
    ldr r7, [sp]
    add r0, r0, #0x1000
    ldr r9, [r0, #0x108]
    ldr r8, [r0, #0x10c]
    mov r0, r7
    str r0, [sp, #0x8]
    str r0, [sp, #0x1c]
    mvn r0, #0x2
    str r0, [sp, #0x20]
    mov r0, r7
    str r0, [sp, #0x24]
    mvn r0, #0x3
    str r0, [sp, #0x28]
    mov r0, r7
    str r0, [sp, #0x2c]
    mov r0, #0x1000
    str r0, [sp, #0x14]
    mov r0, #0x5
    str r0, [sp, #0x30]
    mov r0, r7
    str r0, [sp, #0x34]
    str r0, [sp, #0x38]
    str r0, [sp, #0x3c]
    mov r0, #0x4
    str r0, [sp, #0x40]
    mov r0, r7
    str r0, [sp, #0x44]
    str r0, [sp, #0x48]
    str r0, [sp, #0x4c]
    str r0, [sp, #0x50]
    str r0, [sp, #0x58]
    str r0, [sp, #0x54]
    mvn r0, #0x4
    str r0, [sp, #0x5c]
    mov r0, r7
    str r0, [sp, #0x60]
    mvn r0, #0x1
    ldr r4, _LIT1
    mov r6, #0x1
    str r0, [sp, #0x18]
.L_b8:
    ldr r0, _LIT2
    ldr r1, [sp, #0x14]
    str r6, [r0, #0x4]
    str r1, [r0, #0x8]
    ldr r1, _LIT3
    str r9, [r0, #0xc]
    str r1, [r0, #0x18]
    str r8, [r0, #0x10]
    ldr r0, _LIT4
    ldr r1, [r5]
    ldr r2, [r0]
    ldr r0, _LIT2
    add r1, r1, #0x1000
    str r2, [r0]
    ldr r0, [sp, #0x18]
    str r0, [r1, #0x4]
    ldr r0, [r4]
    ldr r1, _LIT2
    bl func_02042018
    cmp r0, #0x0
    beq .L_124
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_0204185c
    mov r0, #0x1
    bl func_02042140
    b .L_e9c
.L_124:
    ldr r0, [r4]
    bl func_02041f80
    cmp r0, #0x0
    beq .L_14c
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_0204185c
    mov r0, #0x1
    bl func_02042140
    b .L_e9c
.L_14c:
    ldr r0, _LIT5
    ldr r0, [r0, #0x4]
    bl func_0209172c
    sub r1, r0, #0x1
    ldr r0, [r4]
    bl func_02041eb4
    ldr r1, [r4]
    add r0, r1, #0x1000
    ldr r0, [r0, #0xba0]
    cmp r0, #0x0
    beq .L_184
    ldr r0, _LIT6
    add r0, r1, r0
    bl func_02091a0c
.L_184:
    ldr r0, [r4]
    add r1, r0, #0x1000
    ldr r1, [r1, #0x20]
    cmp r1, #0x2
    beq .L_1a4
    cmp r1, #0x8
    beq .L_1d0
    b .L_1b8
.L_1a4:
    ldr r0, _LIT0
    mvn r1, #0x0
    ldr r0, [r0]
    add r0, r0, #0x1000
    str r1, [r0, #0x4]
.L_1b8:
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_0204185c
    mov r0, #0x3
    bl func_02042140
    b .L_e9c
.L_1d0:
    ldr r1, [sp, #0x1c]
    bl func_02040dec
    cmp r0, #0x1
    beq .L_1f8
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_0204185c
    mov r0, #0x2
    bl func_02042140
    b .L_e9c
.L_1f8:
    ldr r0, [r4]
    ldr r1, _LIT7
    bl func_02040d98
    bl func_020acd0c
    mov sl, r0
    ldr r0, _LIT8
    ldr r0, [r0]
    cmp r0, #0x22
    bne .L_228
    mov r0, #0x2
    bl func_02042140
    b .L_e9c
.L_228:
    cmp sl, #0xc8
    beq .L_53c
    ldr r0, _LIT9
    cmp sl, r0
    bne .L_524
    ldr r0, _LIT10
    str r6, [r0]
    ldr r0, [r5]
    add r0, r0, #0x1000
    ldr r1, [r0, #0x118]
    cmp r1, #0x0
    beq .L_494
    ldr r1, _LIT1
    mvn r2, #0x5
    str r2, [r0, #0x4]
    ldr r0, [r1]
    bl func_0204185c
    ldr r2, _LIT2
    ldr r0, _LIT11
    ldr r3, _LIT3
    ldr r0, [r0]
    mov r5, #0x0
    mov r4, #0x200
    ldr r1, _LIT12
    str r0, [r2]
    str r5, [r2, #0x4]
    str r4, [r2, #0x8]
    str r9, [r2, #0xc]
    str r8, [r2, #0x10]
    str r3, [r2, #0x18]
    bl func_020aae4c
    cmp r0, #0x0
    ldrne r0, _LIT2
    movne r1, #0x1
    strne r1, [r0, #0x14]
    ldr r0, _LIT1
    ldr r1, _LIT2
    ldr r0, [r0]
    bl func_02042018
    cmp r0, #0x0
    beq .L_2e4
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_0204185c
    mov r0, #0x1
    bl func_02042140
    b .L_e9c
.L_2e4:
    add r0, sp, #0x240
    bl func_02040c48
    cmp r0, #0x0
    beq .L_310
    ldr r0, _LIT1
    add r1, sp, #0x240
    ldr r0, [r0]
    mov r2, #0x1
    bl func_0204063c
    cmp r0, #0x0
    bne .L_328
.L_310:
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_0204185c
    mov r0, #0x8
    bl func_02042140
    b .L_e9c
.L_328:
    ldr r0, _LIT1
    ldr r1, _LIT13
    ldr r0, [r0]
    ldr r2, _LIT14
    mov r3, #0x7
    bl func_02041578
    cmp r0, #0x0
    bne .L_380
    ldr r0, _LIT0
    ldr r0, [r0]
    add r0, r0, #0x1000
    ldr r4, [r0, #0x118]
    mov r0, r4
    bl func_020aace8
    ldr r1, _LIT1
    mov r3, r0
    ldr r0, [r1]
    ldr r1, _LIT15
    mov r2, r4
    bl func_02041578
    cmp r0, #0x0
    beq .L_398
.L_380:
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_0204185c
    mov r0, #0x8
    bl func_02042140
    b .L_e9c
.L_398:
    ldr r1, _LIT0
    ldr r0, _LIT16
    ldr r1, [r1]
    mov r2, #0x0
    add r1, r1, #0x1000
    ldr r1, [r1, #0x118]
    blx r8
    ldr r0, _LIT0
    mov r2, #0x0
    ldr r0, [r0]
    ldr r1, _LIT1
    add r0, r0, #0x1000
    str r2, [r0, #0x118]
    ldr r0, [r1]
    bl func_02041f80
    cmp r0, #0x0
    beq .L_3f4
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_0204185c
    mov r0, #0x1
    bl func_02042140
    b .L_e9c
.L_3f4:
    ldr r0, _LIT5
    ldr r0, [r0, #0x4]
    bl func_0209172c
    ldr r2, _LIT1
    sub r1, r0, #0x1
    ldr r0, [r2]
    bl func_02041eb4
    ldr r0, _LIT1
    ldr r1, [r0]
    add r0, r1, #0x1000
    ldr r0, [r0, #0xba0]
    cmp r0, #0x0
    beq .L_434
    ldr r0, _LIT6
    add r0, r1, r0
    bl func_02091a0c
.L_434:
    ldr r0, _LIT1
    ldr r0, [r0]
    add r1, r0, #0x1000
    ldr r1, [r1, #0x20]
    cmp r1, #0x2
    beq .L_458
    cmp r1, #0x8
    beq .L_484
    b .L_46c
.L_458:
    ldr r0, _LIT0
    mvn r1, #0x0
    ldr r0, [r0]
    add r0, r0, #0x1000
    str r1, [r0, #0x4]
.L_46c:
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_0204185c
    mov r0, #0x3
    bl func_02042140
    b .L_e9c
.L_484:
    bl func_0204185c
    mov r0, #0x7
    bl func_02042140
    b .L_e9c
.L_494:
    ldr r0, [r4]
    add r1, r0, #0x1000
    ldr fp, [r1, #0xa04]
    cmp fp, #0x0
    bne .L_4b8
    bl func_0204185c
    mov r0, #0x2
    bl func_02042140
    b .L_e9c
.L_4b8:
    mov r0, fp
    bl func_020aace8
    add r1, r0, #0x1
    ldr r0, _LIT17
    blx r9
    ldr r1, [r5]
    add r1, r1, #0x1000
    str r0, [r1, #0x114]
    ldr r0, [r5]
    add r0, r0, #0x1000
    ldr r0, [r0, #0x114]
    str r0, [sp, #0xc]
    cmp r0, #0x0
    bne .L_508
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_0204185c
    mov r0, #0x4
    bl func_02042140
    b .L_e9c
.L_508:
    mov r0, fp
    bl func_020aace8
    mov r2, r0
    ldr r0, [sp, #0xc]
    mov r1, fp
    bl func_020aadcc
    b .L_53c
.L_524:
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_0204185c
    mov r0, #0xa
    bl func_02042140
    b .L_e9c
.L_53c:
    ldr r0, [r4]
    bl func_0204185c
    add r0, sp, #0x68
    bl func_020445c0
    ldr r2, [sp, #0x68]
    ldr r1, [sp, #0x6c]
    mov r0, #0x0
    cmp r1, r0
    cmpeq r2, r0
    bne .L_674
    ldr r1, [r5]
    ldr r0, _LIT18
    add r2, r1, #0x1000
    ldr r1, [sp, #0x20]
    str r1, [r2, #0x4]
    ldr r2, [sp, #0x24]
    mov r1, r0
    strh r2, [r1]
    strb r2, [r1, #0x34]
    ldr r2, [r5]
    ldr r1, [r4]
    add r3, r2, #0x1000
    ldr fp, [r3, #0x108]
    mov r2, r0
    str fp, [r2, #0x40]
    ldr r3, [r3, #0x10c]
    str r3, [r2, #0x44]
    bl func_020404dc
    cmp r0, #0x0
    beq .L_5c0
    mov r0, #0x5
    bl func_02042140
    b .L_e9c
.L_5c0:
    bl func_020402ec
    bl func_0204029c
    cmp r0, #0x15
    beq .L_670
    bl func_0204029c
    cmp r0, #0x9
    bne .L_5f4
    ldr r0, _LIT0
    mvn r1, #0x0
    ldr r0, [r0]
    add r0, r0, #0x1000
    str r1, [r0, #0x4]
    b .L_660
.L_5f4:
    add r0, sp, #0x7c
    bl func_02040208
    ldr r0, _LIT19
    ldr r0, [r0]
    cmp r0, #0x1
    bne .L_64c
    ldr r1, [sp, #0x7c]
    ldr r0, _LIT20
    cmp r1, r0
    beq .L_628
    bl func_0204029c
    cmp r0, #0xb
    bne .L_64c
.L_628:
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r0, [r0]
    add r0, r0, #0x1000
    str r1, [r0, #0x4]
    bl func_0204032c
    mov r0, #0xb
    bl func_02042140
    b .L_e9c
.L_64c:
    ldr r0, _LIT0
    ldr r1, [sp, #0x7c]
    ldr r0, [r0]
    add r0, r0, #0x1000
    str r1, [r0, #0x4]
.L_660:
    bl func_0204032c
    mov r0, #0x6
    bl func_02042140
    b .L_e9c
.L_670:
    bl func_0204032c
.L_674:
    cmp sl, #0xc8
    bne .L_69c
    ldr r0, _LIT0
    mov r2, #0x0
    ldr r1, [r0]
    mov r0, #0xb
    add r1, r1, #0x1000
    str r2, [r1, #0x4]
    bl func_02042140
    b .L_e9c
.L_69c:
    ldr r0, [r5]
    ldr r1, _LIT12
    add r2, r0, #0x1000
    ldr r0, [sp, #0x28]
    str r0, [r2, #0x4]
    ldr r0, _LIT2
    ldr r2, [sp, #0x2c]
    str r9, [r0, #0xc]
    str r2, [r0, #0x4]
    ldr r2, [sp, #0x14]
    str r8, [r0, #0x10]
    str r2, [r0, #0x8]
    ldr r2, _LIT21
    str r2, [r0, #0x18]
    ldr r0, _LIT11
    ldr r2, _LIT2
    ldr r0, [r0]
    str r0, [r2]
    bl func_020aae4c
    cmp r0, #0x0
    ldrne r0, _LIT2
    ldr r1, _LIT2
    strne r6, [r0, #0x14]
    ldr r0, [r4]
    bl func_02042018
    cmp r0, #0x0
    beq .L_720
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_0204185c
    mov r0, #0x1
    bl func_02042140
    b .L_e9c
.L_720:
    add r0, sp, #0x240
    bl func_02040c48
    cmp r0, #0x0
    beq .L_748
    ldr r0, [r4]
    add r1, sp, #0x240
    mov r2, r6
    bl func_0204063c
    cmp r0, #0x0
    bne .L_760
.L_748:
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_0204185c
    mov r0, #0x8
    bl func_02042140
    b .L_e9c
.L_760:
    ldr r0, [r4]
    ldr r1, _LIT13
    ldr r2, _LIT22
    ldr r3, [sp, #0x30]
    bl func_02041578
    cmp r0, #0x0
    bne .L_7ac
    ldr r0, [r5]
    add r0, r0, #0x1000
    ldr sl, [r0, #0x114]
    mov r0, sl
    bl func_020aace8
    mov r3, r0
    ldr r0, [r4]
    ldr r1, _LIT23
    mov r2, sl
    bl func_02041578
    cmp r0, #0x0
    beq .L_7c4
.L_7ac:
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_0204185c
    mov r0, #0x8
    bl func_02042140
    b .L_e9c
.L_7c4:
    ldr r1, [r5]
    ldr r0, _LIT24
    add r1, r1, #0x1000
    ldr r2, [sp, #0x34]
    ldr r1, [r1, #0x114]
    blx r8
    ldr r0, [r5]
    add r1, r0, #0x1000
    ldr r0, [sp, #0x38]
    str r0, [r1, #0x114]
    ldr r0, [r4]
    bl func_02041f80
    cmp r0, #0x0
    beq .L_814
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_0204185c
    mov r0, #0x1
    bl func_02042140
    b .L_e9c
.L_814:
    ldr r0, _LIT5
    ldr r0, [r0, #0x4]
    bl func_0209172c
    sub r1, r0, #0x1
    ldr r0, [r4]
    bl func_02041eb4
    ldr r1, [r4]
    add r0, r1, #0x1000
    ldr r0, [r0, #0xba0]
    cmp r0, #0x0
    beq .L_84c
    ldr r0, _LIT6
    add r0, r1, r0
    bl func_02091a0c
.L_84c:
    ldr r0, [r4]
    add r1, r0, #0x1000
    ldr r1, [r1, #0x20]
    cmp r1, #0x2
    beq .L_8b4
    cmp r1, #0x3
    beq .L_874
    cmp r1, #0x8
    beq .L_8e0
    b .L_8c8
.L_874:
    bl func_0204185c
    ldr r0, _LIT19
    ldr r0, [r0]
    cmp r0, #0x1
    bne .L_8a8
    ldr r0, _LIT0
    mov r2, #0x0
    ldr r1, [r0]
    mov r0, #0xb
    add r1, r1, #0x1000
    str r2, [r1, #0x4]
    bl func_02042140
    b .L_e9c
.L_8a8:
    mov r0, #0x3
    bl func_02042140
    b .L_e9c
.L_8b4:
    ldr r0, _LIT0
    mvn r1, #0x0
    ldr r0, [r0]
    add r0, r0, #0x1000
    str r1, [r0, #0x4]
.L_8c8:
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_0204185c
    mov r0, #0x3
    bl func_02042140
    b .L_e9c
.L_8e0:
    ldr r1, [sp, #0x3c]
    bl func_02040dec
    cmp r0, #0x1
    beq .L_908
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_0204185c
    mov r0, #0x2
    bl func_02042140
    b .L_e9c
.L_908:
    ldr r0, [r4]
    ldr r1, _LIT7
    bl func_02040d98
    bl func_020acd0c
    mov sl, r0
    ldr r0, _LIT8
    ldr r0, [r0]
    cmp r0, #0x22
    bne .L_944
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_0204185c
    mov r0, #0x2
    bl func_02042140
    b .L_e9c
.L_944:
    cmp sl, #0xc8
    beq .L_9a0
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_0204185c
    ldr r0, _LIT19
    ldr r0, [r0]
    cmp r0, #0x1
    bne .L_994
    ldr r0, _LIT9
    cmp sl, r0
    bne .L_994
    ldr r0, _LIT0
    mov r2, #0x0
    ldr r1, [r0]
    mov r0, #0xb
    add r1, r1, #0x1000
    str r2, [r1, #0x4]
    bl func_02042140
    b .L_e9c
.L_994:
    mov r0, #0x2
    bl func_02042140
    b .L_e9c
.L_9a0:
    ldr r0, [r4]
    ldr r1, _LIT25
    ldr r3, [sp, #0x40]
    add r2, sp, #0x64
    bl func_02040d44
    cmp r0, #0x0
    bgt .L_9d4
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_0204185c
    mov r0, #0x9
    bl func_02042140
    b .L_e9c
.L_9d4:
    add r0, sp, #0x64
    bl func_020acd0c
    ldr r1, _LIT8
    ldr r1, [r1]
    cmp r1, #0x22
    bne .L_a04
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_0204185c
    mov r0, #0x9
    bl func_02042140
    b .L_e9c
.L_a04:
    ldr r1, _LIT19
    ldr r1, [r1]
    cmp r1, #0x1
    bne .L_a3c
    cmp r0, #0x72
    bne .L_a3c
    ldr r0, _LIT0
    mov r2, #0x0
    ldr r1, [r0]
    mov r0, #0xb
    add r1, r1, #0x1000
    str r2, [r1, #0x4]
    bl func_02042140
    b .L_e9c
.L_a3c:
    cmp r0, #0x64
    blt .L_a5c
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_0204185c
    mov r0, #0x6
    bl func_02042140
    b .L_e9c
.L_a5c:
    ldr r2, [sp, #0x44]
    ldr r0, [r4]
    ldr r1, _LIT26
    mov r3, r2
    bl func_02040d44
    mov fp, r0
    cmp fp, #0x0
    bgt .L_a94
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_0204185c
    mov r0, #0x9
    bl func_02042140
    b .L_e9c
.L_a94:
    ldr r2, [sp, #0x48]
    ldr r0, [r4]
    ldr r1, _LIT27
    mov r3, r2
    bl func_02040d44
    str r0, [sp, #0x4]
    cmp r0, #0x0
    bgt .L_acc
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_0204185c
    mov r0, #0x9
    bl func_02042140
    b .L_e9c
.L_acc:
    ldr r2, [sp, #0x4c]
    ldr r0, [r4]
    ldr r1, _LIT28
    mov r3, r2
    bl func_02040d44
    mov sl, r0
    ldr r0, _LIT29
    add r1, fp, #0x1
    blx r9
    str r0, [sp]
    cmp r0, #0x0
    bne .L_b14
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_0204185c
    mov r0, #0x4
    bl func_02042140
    b .L_e9c
.L_b14:
    ldr r1, [sp, #0x4]
    ldr r0, _LIT30
    add r1, r1, #0x1
    blx r9
    movs r7, r0
    bne .L_b44
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_0204185c
    mov r0, #0x4
    bl func_02042140
    b .L_e9c
.L_b44:
    cmp sl, #0x0
    ble .L_b7c
    ldr r0, _LIT31
    add r1, sl, #0x1
    blx r9
    str r0, [sp, #0x8]
    cmp r0, #0x0
    bne .L_b7c
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_0204185c
    mov r0, #0x4
    bl func_02042140
    b .L_e9c
.L_b7c:
    ldr r0, [r4]
    ldr r1, _LIT26
    ldr r2, [sp]
    add r3, fp, #0x1
    bl func_02040d44
    cmp r0, #0x0
    bge .L_bb0
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_0204185c
    mov r0, #0x9
    bl func_02042140
    b .L_e9c
.L_bb0:
    ldr r1, [sp, #0x4]
    ldr r2, [sp, #0x50]
    add r3, r1, #0x1
    ldr r1, [sp]
    strb r2, [r1, r0]
    ldr r0, [r4]
    ldr r1, _LIT27
    mov r2, r7
    bl func_02040d44
    cmp r0, #0x0
    bge .L_bf4
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_0204185c
    mov r0, #0x9
    bl func_02042140
    b .L_e9c
.L_bf4:
    ldr r1, [sp, #0x54]
    cmp sl, #0x0
    strb r1, [r7, r0]
    mov fp, r1
    ble .L_c8c
    ldr r0, [r4]
    ldr r1, _LIT28
    ldr r2, [sp, #0x8]
    add r3, sl, #0x1
    bl func_02040d44
    cmp r0, #0x0
    bge .L_c3c
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_0204185c
    mov r0, #0x9
    bl func_02042140
    b .L_e9c
.L_c3c:
    ldr r2, [sp, #0x58]
    ldr r1, [sp, #0x8]
    strb r2, [r1, r0]
    mov r0, r1
    bl func_020acd0c
    ldr r1, _LIT8
    ldr r1, [r1]
    cmp r1, #0x22
    bne .L_c78
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_0204185c
    mov r0, #0x9
    bl func_02042140
    b .L_e9c
.L_c78:
    mov r1, #0x3e8
    mul fp, r0, r1
    ldr r0, _LIT32
    cmp fp, r0
    movgt fp, r0
.L_c8c:
    ldr r0, [r4]
    bl func_0204185c
    ldr r0, [r5]
    ldr r1, _LIT2
    add r2, r0, #0x1000
    ldr r0, [sp, #0x5c]
    str r0, [r2, #0x4]
    mov r0, r1
    ldr r2, [sp]
    str r9, [r0, #0xc]
    str r2, [r0]
    ldr r2, [sp, #0x60]
    str r8, [r0, #0x10]
    str r2, [r0, #0x4]
    ldr r2, [sp, #0x14]
    str r2, [r0, #0x8]
    ldr r2, _LIT33
    str r2, [r0, #0x18]
    ldr r0, [r4]
    bl func_02042018
    cmp r0, #0x0
    beq .L_cfc
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_0204185c
    mov r0, #0x1
    bl func_02042140
    b .L_e9c
.L_cfc:
    ldr r0, [r4]
    mov r1, r7
    bl func_020414dc
    cmp r0, #0x0
    beq .L_d28
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_0204185c
    mov r0, #0x8
    bl func_02042140
    b .L_e9c
.L_d28:
    ldr r0, [r4]
    bl func_02041f80
    cmp r0, #0x0
    beq .L_d50
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_0204185c
    mov r0, #0x1
    bl func_02042140
    b .L_e9c
.L_d50:
    ldr r0, _LIT5
    ldr r0, [r0, #0x4]
    bl func_0209172c
    sub r1, r0, #0x1
    ldr r0, [r4]
    bl func_02041eb4
    ldr r1, [r4]
    add r0, r1, #0x1000
    ldr r0, [r0, #0xba0]
    cmp r0, #0x0
    beq .L_d88
    ldr r0, _LIT6
    add r0, r1, r0
    bl func_02091a0c
.L_d88:
    ldr r0, [r4]
    add r1, r0, #0x1000
    ldr r1, [r1, #0x20]
    cmp r1, #0x2
    beq .L_da8
    cmp r1, #0x8
    beq .L_dd4
    b .L_dbc
.L_da8:
    ldr r0, _LIT0
    mvn r1, #0x0
    ldr r0, [r0]
    add r0, r0, #0x1000
    str r1, [r0, #0x4]
.L_dbc:
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_0204185c
    mov r0, #0x3
    bl func_02042140
    b .L_e9c
.L_dd4:
    mov r1, r6
    bl func_02040dec
    cmp r0, #0x1
    beq .L_dfc
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_0204185c
    mov r0, #0x2
    bl func_02042140
    b .L_e9c
.L_dfc:
    ldr r0, [r4]
    add r1, r0, #0x1000
    ldr sl, [r1, #0xa04]
    cmp sl, #0x0
    bne .L_e20
    bl func_0204185c
    mov r0, #0x2
    bl func_02042140
    b .L_e9c
.L_e20:
    mov r0, sl
    bl func_020aace8
    add r1, r0, #0x1
    ldr r0, _LIT34
    blx r9
    ldr r1, [r5]
    add r1, r1, #0x1000
    str r0, [r1, #0x118]
    ldr r0, [r5]
    add r0, r0, #0x1000
    ldr r0, [r0, #0x118]
    str r0, [sp, #0x10]
    cmp r0, #0x0
    bne .L_e70
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_0204185c
    mov r0, #0x4
    bl func_02042140
    b .L_e9c
.L_e70:
    mov r0, sl
    bl func_020aace8
    mov r2, r0
    ldr r0, [sp, #0x10]
    mov r1, sl
    bl func_020aadcc
    ldr r0, [r4]
    bl func_0204185c
    mov r0, fp
    bl func_02091680
    b .L_b8
.L_e9c:
    ldr r0, [sp]
    cmp r0, #0x0
    beq .L_eb8
    ldr r0, _LIT35
    ldr r1, [sp]
    mov r2, #0x0
    blx r8
.L_eb8:
    cmp r7, #0x0
    beq .L_ed0
    ldr r0, _LIT36
    mov r1, r7
    mov r2, #0x0
    blx r8
.L_ed0:
    ldr r0, [sp, #0x8]
    cmp r0, #0x0
    addeq sp, sp, #0x2d4
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT37
    ldr r1, [sp, #0x8]
    mov r2, #0x0
    blx r8
    add sp, sp, #0x2d4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_0219d910
_LIT1: .word data_0219d91c
_LIT2: .word data_0219d920
_LIT3: .word 0x00004e20
_LIT4: .word data_020fe934
_LIT5: .word data_021a62f0
_LIT6: .word 0x00001b34
_LIT7: .word data_020fe9e0
_LIT8: .word data_021aa380
_LIT9: .word 0x0000012e
_LIT10: .word data_0219d918
_LIT11: .word data_020fe47c
_LIT12: .word data_020fe9ec
_LIT13: .word data_020fea0c
_LIT14: .word data_020fea14
_LIT15: .word data_020fea1c
_LIT16: .word data_020fea2c
_LIT17: .word data_020fe95c
_LIT18: .word data_0219d93c
_LIT19: .word data_0219d914
_LIT20: .word 0xffffa4fa
_LIT21: .word 0x00009c40
_LIT22: .word data_020fea4c
_LIT23: .word data_020fea54
_LIT24: .word data_020fe978
_LIT25: .word data_020fea5c
_LIT26: .word data_020fea68
_LIT27: .word data_020fea6c
_LIT28: .word data_020fea74
_LIT29: .word data_020fe994
_LIT30: .word data_020fe9a0
_LIT31: .word data_020fe9b0
_LIT32: .word 0x0002bf20
_LIT33: .word 0x0001d4c0
_LIT34: .word data_020fe9c0
_LIT35: .word data_020fea7c
_LIT36: .word data_020fea88
_LIT37: .word data_020fea94
