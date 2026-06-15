; func_020421d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020fe55c
        .extern data_020fea14
        .extern data_020fea3c
        .extern data_020fea58
        .extern data_020fea74
        .extern data_020fea80
        .extern data_020fea90
        .extern data_020feaa0
        .extern data_020feac0
        .extern data_020feacc
        .extern data_020feaec
        .extern data_020feaf4
        .extern data_020feafc
        .extern data_020feb0c
        .extern data_020feb2c
        .extern data_020feb34
        .extern data_020feb3c
        .extern data_020feb48
        .extern data_020feb4c
        .extern data_020feb54
        .extern data_020feb5c
        .extern data_020feb68
        .extern data_020feb74
        .extern data_0219d9f0
        .extern data_0219d9f4
        .extern data_0219d9f8
        .extern data_0219d9fc
        .extern data_0219da00
        .extern data_0219da1c
        .extern data_021a63d0
        .extern data_021aa460
        .extern func_02040258
        .extern func_020402ec
        .extern func_0204033c
        .extern func_0204037c
        .extern func_0204052c
        .extern func_0204068c
        .extern func_02040c98
        .extern func_02040d94
        .extern func_02040de8
        .extern func_02040e3c
        .extern func_0204152c
        .extern func_020415c8
        .extern func_020418ac
        .extern func_02041f04
        .extern func_02041fd0
        .extern func_02042068
        .extern func_02042190
        .extern func_02044610
        .extern func_02091768
        .extern func_02091814
        .extern func_02091af4
        .extern func_020aaddc
        .extern func_020aaec0
        .extern func_020aaf40
        .extern func_020ace00
        .global func_020421d8
        .arm
func_020421d8:
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
.L_4d4:
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
    bl func_02042068
    cmp r0, #0x0
    beq .L_540
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_020418ac
    mov r0, #0x1
    bl func_02042190
    b .L_12b8
.L_540:
    ldr r0, [r4]
    bl func_02041fd0
    cmp r0, #0x0
    beq .L_568
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_020418ac
    mov r0, #0x1
    bl func_02042190
    b .L_12b8
.L_568:
    ldr r0, _LIT5
    ldr r0, [r0, #0x4]
    bl func_02091814
    sub r1, r0, #0x1
    ldr r0, [r4]
    bl func_02041f04
    ldr r1, [r4]
    add r0, r1, #0x1000
    ldr r0, [r0, #0xba0]
    cmp r0, #0x0
    beq .L_5a0
    ldr r0, _LIT6
    add r0, r1, r0
    bl func_02091af4
.L_5a0:
    ldr r0, [r4]
    add r1, r0, #0x1000
    ldr r1, [r1, #0x20]
    cmp r1, #0x2
    beq .L_5c0
    cmp r1, #0x8
    beq .L_5ec
    b .L_5d4
.L_5c0:
    ldr r0, _LIT0
    mvn r1, #0x0
    ldr r0, [r0]
    add r0, r0, #0x1000
    str r1, [r0, #0x4]
.L_5d4:
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_020418ac
    mov r0, #0x3
    bl func_02042190
    b .L_12b8
.L_5ec:
    ldr r1, [sp, #0x1c]
    bl func_02040e3c
    cmp r0, #0x1
    beq .L_614
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_020418ac
    mov r0, #0x2
    bl func_02042190
    b .L_12b8
.L_614:
    ldr r0, [r4]
    ldr r1, _LIT7
    bl func_02040de8
    bl func_020ace00
    mov sl, r0
    ldr r0, _LIT8
    ldr r0, [r0]
    cmp r0, #0x22
    bne .L_644
    mov r0, #0x2
    bl func_02042190
    b .L_12b8
.L_644:
    cmp sl, #0xc8
    beq .L_958
    ldr r0, _LIT9
    cmp sl, r0
    bne .L_940
    ldr r0, _LIT10
    str r6, [r0]
    ldr r0, [r5]
    add r0, r0, #0x1000
    ldr r1, [r0, #0x118]
    cmp r1, #0x0
    beq .L_8b0
    ldr r1, _LIT1
    mvn r2, #0x5
    str r2, [r0, #0x4]
    ldr r0, [r1]
    bl func_020418ac
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
    bl func_020aaf40
    cmp r0, #0x0
    ldrne r0, _LIT2
    movne r1, #0x1
    strne r1, [r0, #0x14]
    ldr r0, _LIT1
    ldr r1, _LIT2
    ldr r0, [r0]
    bl func_02042068
    cmp r0, #0x0
    beq .L_700
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_020418ac
    mov r0, #0x1
    bl func_02042190
    b .L_12b8
.L_700:
    add r0, sp, #0x240
    bl func_02040c98
    cmp r0, #0x0
    beq .L_72c
    ldr r0, _LIT1
    add r1, sp, #0x240
    ldr r0, [r0]
    mov r2, #0x1
    bl func_0204068c
    cmp r0, #0x0
    bne .L_744
.L_72c:
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_020418ac
    mov r0, #0x8
    bl func_02042190
    b .L_12b8
.L_744:
    ldr r0, _LIT1
    ldr r1, _LIT13
    ldr r0, [r0]
    ldr r2, _LIT14
    mov r3, #0x7
    bl func_020415c8
    cmp r0, #0x0
    bne .L_79c
    ldr r0, _LIT0
    ldr r0, [r0]
    add r0, r0, #0x1000
    ldr r4, [r0, #0x118]
    mov r0, r4
    bl func_020aaddc
    ldr r1, _LIT1
    mov r3, r0
    ldr r0, [r1]
    ldr r1, _LIT15
    mov r2, r4
    bl func_020415c8
    cmp r0, #0x0
    beq .L_7b4
.L_79c:
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_020418ac
    mov r0, #0x8
    bl func_02042190
    b .L_12b8
.L_7b4:
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
    bl func_02041fd0
    cmp r0, #0x0
    beq .L_810
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_020418ac
    mov r0, #0x1
    bl func_02042190
    b .L_12b8
.L_810:
    ldr r0, _LIT5
    ldr r0, [r0, #0x4]
    bl func_02091814
    ldr r2, _LIT1
    sub r1, r0, #0x1
    ldr r0, [r2]
    bl func_02041f04
    ldr r0, _LIT1
    ldr r1, [r0]
    add r0, r1, #0x1000
    ldr r0, [r0, #0xba0]
    cmp r0, #0x0
    beq .L_850
    ldr r0, _LIT6
    add r0, r1, r0
    bl func_02091af4
.L_850:
    ldr r0, _LIT1
    ldr r0, [r0]
    add r1, r0, #0x1000
    ldr r1, [r1, #0x20]
    cmp r1, #0x2
    beq .L_874
    cmp r1, #0x8
    beq .L_8a0
    b .L_888
.L_874:
    ldr r0, _LIT0
    mvn r1, #0x0
    ldr r0, [r0]
    add r0, r0, #0x1000
    str r1, [r0, #0x4]
.L_888:
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_020418ac
    mov r0, #0x3
    bl func_02042190
    b .L_12b8
.L_8a0:
    bl func_020418ac
    mov r0, #0x7
    bl func_02042190
    b .L_12b8
.L_8b0:
    ldr r0, [r4]
    add r1, r0, #0x1000
    ldr fp, [r1, #0xa04]
    cmp fp, #0x0
    bne .L_8d4
    bl func_020418ac
    mov r0, #0x2
    bl func_02042190
    b .L_12b8
.L_8d4:
    mov r0, fp
    bl func_020aaddc
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
    bne .L_924
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_020418ac
    mov r0, #0x4
    bl func_02042190
    b .L_12b8
.L_924:
    mov r0, fp
    bl func_020aaddc
    mov r2, r0
    ldr r0, [sp, #0xc]
    mov r1, fp
    bl func_020aaec0
    b .L_958
.L_940:
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_020418ac
    mov r0, #0xa
    bl func_02042190
    b .L_12b8
.L_958:
    ldr r0, [r4]
    bl func_020418ac
    add r0, sp, #0x68
    bl func_02044610
    ldr r2, [sp, #0x68]
    ldr r1, [sp, #0x6c]
    mov r0, #0x0
    cmp r1, r0
    cmpeq r2, r0
    bne .L_a90
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
    bl func_0204052c
    cmp r0, #0x0
    beq .L_9dc
    mov r0, #0x5
    bl func_02042190
    b .L_12b8
.L_9dc:
    bl func_0204033c
    bl func_020402ec
    cmp r0, #0x15
    beq .L_a8c
    bl func_020402ec
    cmp r0, #0x9
    bne .L_a10
    ldr r0, _LIT0
    mvn r1, #0x0
    ldr r0, [r0]
    add r0, r0, #0x1000
    str r1, [r0, #0x4]
    b .L_a7c
.L_a10:
    add r0, sp, #0x7c
    bl func_02040258
    ldr r0, _LIT19
    ldr r0, [r0]
    cmp r0, #0x1
    bne .L_a68
    ldr r1, [sp, #0x7c]
    ldr r0, _LIT20
    cmp r1, r0
    beq .L_a44
    bl func_020402ec
    cmp r0, #0xb
    bne .L_a68
.L_a44:
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r0, [r0]
    add r0, r0, #0x1000
    str r1, [r0, #0x4]
    bl func_0204037c
    mov r0, #0xb
    bl func_02042190
    b .L_12b8
.L_a68:
    ldr r0, _LIT0
    ldr r1, [sp, #0x7c]
    ldr r0, [r0]
    add r0, r0, #0x1000
    str r1, [r0, #0x4]
.L_a7c:
    bl func_0204037c
    mov r0, #0x6
    bl func_02042190
    b .L_12b8
.L_a8c:
    bl func_0204037c
.L_a90:
    cmp sl, #0xc8
    bne .L_ab8
    ldr r0, _LIT0
    mov r2, #0x0
    ldr r1, [r0]
    mov r0, #0xb
    add r1, r1, #0x1000
    str r2, [r1, #0x4]
    bl func_02042190
    b .L_12b8
.L_ab8:
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
    bl func_020aaf40
    cmp r0, #0x0
    ldrne r0, _LIT2
    ldr r1, _LIT2
    strne r6, [r0, #0x14]
    ldr r0, [r4]
    bl func_02042068
    cmp r0, #0x0
    beq .L_b3c
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_020418ac
    mov r0, #0x1
    bl func_02042190
    b .L_12b8
.L_b3c:
    add r0, sp, #0x240
    bl func_02040c98
    cmp r0, #0x0
    beq .L_b64
    ldr r0, [r4]
    add r1, sp, #0x240
    mov r2, r6
    bl func_0204068c
    cmp r0, #0x0
    bne .L_b7c
.L_b64:
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_020418ac
    mov r0, #0x8
    bl func_02042190
    b .L_12b8
.L_b7c:
    ldr r0, [r4]
    ldr r1, _LIT13
    ldr r2, _LIT22
    ldr r3, [sp, #0x30]
    bl func_020415c8
    cmp r0, #0x0
    bne .L_bc8
    ldr r0, [r5]
    add r0, r0, #0x1000
    ldr sl, [r0, #0x114]
    mov r0, sl
    bl func_020aaddc
    mov r3, r0
    ldr r0, [r4]
    ldr r1, _LIT23
    mov r2, sl
    bl func_020415c8
    cmp r0, #0x0
    beq .L_be0
.L_bc8:
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_020418ac
    mov r0, #0x8
    bl func_02042190
    b .L_12b8
.L_be0:
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
    bl func_02041fd0
    cmp r0, #0x0
    beq .L_c30
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_020418ac
    mov r0, #0x1
    bl func_02042190
    b .L_12b8
.L_c30:
    ldr r0, _LIT5
    ldr r0, [r0, #0x4]
    bl func_02091814
    sub r1, r0, #0x1
    ldr r0, [r4]
    bl func_02041f04
    ldr r1, [r4]
    add r0, r1, #0x1000
    ldr r0, [r0, #0xba0]
    cmp r0, #0x0
    beq .L_c68
    ldr r0, _LIT6
    add r0, r1, r0
    bl func_02091af4
.L_c68:
    ldr r0, [r4]
    add r1, r0, #0x1000
    ldr r1, [r1, #0x20]
    cmp r1, #0x2
    beq .L_cd0
    cmp r1, #0x3
    beq .L_c90
    cmp r1, #0x8
    beq .L_cfc
    b .L_ce4
.L_c90:
    bl func_020418ac
    ldr r0, _LIT19
    ldr r0, [r0]
    cmp r0, #0x1
    bne .L_cc4
    ldr r0, _LIT0
    mov r2, #0x0
    ldr r1, [r0]
    mov r0, #0xb
    add r1, r1, #0x1000
    str r2, [r1, #0x4]
    bl func_02042190
    b .L_12b8
.L_cc4:
    mov r0, #0x3
    bl func_02042190
    b .L_12b8
.L_cd0:
    ldr r0, _LIT0
    mvn r1, #0x0
    ldr r0, [r0]
    add r0, r0, #0x1000
    str r1, [r0, #0x4]
.L_ce4:
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_020418ac
    mov r0, #0x3
    bl func_02042190
    b .L_12b8
.L_cfc:
    ldr r1, [sp, #0x3c]
    bl func_02040e3c
    cmp r0, #0x1
    beq .L_d24
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_020418ac
    mov r0, #0x2
    bl func_02042190
    b .L_12b8
.L_d24:
    ldr r0, [r4]
    ldr r1, _LIT7
    bl func_02040de8
    bl func_020ace00
    mov sl, r0
    ldr r0, _LIT8
    ldr r0, [r0]
    cmp r0, #0x22
    bne .L_d60
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_020418ac
    mov r0, #0x2
    bl func_02042190
    b .L_12b8
.L_d60:
    cmp sl, #0xc8
    beq .L_dbc
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_020418ac
    ldr r0, _LIT19
    ldr r0, [r0]
    cmp r0, #0x1
    bne .L_db0
    ldr r0, _LIT9
    cmp sl, r0
    bne .L_db0
    ldr r0, _LIT0
    mov r2, #0x0
    ldr r1, [r0]
    mov r0, #0xb
    add r1, r1, #0x1000
    str r2, [r1, #0x4]
    bl func_02042190
    b .L_12b8
.L_db0:
    mov r0, #0x2
    bl func_02042190
    b .L_12b8
.L_dbc:
    ldr r0, [r4]
    ldr r1, _LIT25
    ldr r3, [sp, #0x40]
    add r2, sp, #0x64
    bl func_02040d94
    cmp r0, #0x0
    bgt .L_df0
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_020418ac
    mov r0, #0x9
    bl func_02042190
    b .L_12b8
.L_df0:
    add r0, sp, #0x64
    bl func_020ace00
    ldr r1, _LIT8
    ldr r1, [r1]
    cmp r1, #0x22
    bne .L_e20
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_020418ac
    mov r0, #0x9
    bl func_02042190
    b .L_12b8
.L_e20:
    ldr r1, _LIT19
    ldr r1, [r1]
    cmp r1, #0x1
    bne .L_e58
    cmp r0, #0x72
    bne .L_e58
    ldr r0, _LIT0
    mov r2, #0x0
    ldr r1, [r0]
    mov r0, #0xb
    add r1, r1, #0x1000
    str r2, [r1, #0x4]
    bl func_02042190
    b .L_12b8
.L_e58:
    cmp r0, #0x64
    blt .L_e78
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_020418ac
    mov r0, #0x6
    bl func_02042190
    b .L_12b8
.L_e78:
    ldr r2, [sp, #0x44]
    ldr r0, [r4]
    ldr r1, _LIT26
    mov r3, r2
    bl func_02040d94
    mov fp, r0
    cmp fp, #0x0
    bgt .L_eb0
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_020418ac
    mov r0, #0x9
    bl func_02042190
    b .L_12b8
.L_eb0:
    ldr r2, [sp, #0x48]
    ldr r0, [r4]
    ldr r1, _LIT27
    mov r3, r2
    bl func_02040d94
    str r0, [sp, #0x4]
    cmp r0, #0x0
    bgt .L_ee8
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_020418ac
    mov r0, #0x9
    bl func_02042190
    b .L_12b8
.L_ee8:
    ldr r2, [sp, #0x4c]
    ldr r0, [r4]
    ldr r1, _LIT28
    mov r3, r2
    bl func_02040d94
    mov sl, r0
    ldr r0, _LIT29
    add r1, fp, #0x1
    blx r9
    str r0, [sp]
    cmp r0, #0x0
    bne .L_f30
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_020418ac
    mov r0, #0x4
    bl func_02042190
    b .L_12b8
.L_f30:
    ldr r1, [sp, #0x4]
    ldr r0, _LIT30
    add r1, r1, #0x1
    blx r9
    movs r7, r0
    bne .L_f60
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_020418ac
    mov r0, #0x4
    bl func_02042190
    b .L_12b8
.L_f60:
    cmp sl, #0x0
    ble .L_f98
    ldr r0, _LIT31
    add r1, sl, #0x1
    blx r9
    str r0, [sp, #0x8]
    cmp r0, #0x0
    bne .L_f98
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_020418ac
    mov r0, #0x4
    bl func_02042190
    b .L_12b8
.L_f98:
    ldr r0, [r4]
    ldr r1, _LIT26
    ldr r2, [sp]
    add r3, fp, #0x1
    bl func_02040d94
    cmp r0, #0x0
    bge .L_fcc
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_020418ac
    mov r0, #0x9
    bl func_02042190
    b .L_12b8
.L_fcc:
    ldr r1, [sp, #0x4]
    ldr r2, [sp, #0x50]
    add r3, r1, #0x1
    ldr r1, [sp]
    strb r2, [r1, r0]
    ldr r0, [r4]
    ldr r1, _LIT27
    mov r2, r7
    bl func_02040d94
    cmp r0, #0x0
    bge .L_1010
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_020418ac
    mov r0, #0x9
    bl func_02042190
    b .L_12b8
.L_1010:
    ldr r1, [sp, #0x54]
    cmp sl, #0x0
    strb r1, [r7, r0]
    mov fp, r1
    ble .L_10a8
    ldr r0, [r4]
    ldr r1, _LIT28
    ldr r2, [sp, #0x8]
    add r3, sl, #0x1
    bl func_02040d94
    cmp r0, #0x0
    bge .L_1058
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_020418ac
    mov r0, #0x9
    bl func_02042190
    b .L_12b8
.L_1058:
    ldr r2, [sp, #0x58]
    ldr r1, [sp, #0x8]
    strb r2, [r1, r0]
    mov r0, r1
    bl func_020ace00
    ldr r1, _LIT8
    ldr r1, [r1]
    cmp r1, #0x22
    bne .L_1094
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_020418ac
    mov r0, #0x9
    bl func_02042190
    b .L_12b8
.L_1094:
    mov r1, #0x3e8
    mul fp, r0, r1
    ldr r0, _LIT32
    cmp fp, r0
    movgt fp, r0
.L_10a8:
    ldr r0, [r4]
    bl func_020418ac
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
    bl func_02042068
    cmp r0, #0x0
    beq .L_1118
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_020418ac
    mov r0, #0x1
    bl func_02042190
    b .L_12b8
.L_1118:
    ldr r0, [r4]
    mov r1, r7
    bl func_0204152c
    cmp r0, #0x0
    beq .L_1144
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_020418ac
    mov r0, #0x8
    bl func_02042190
    b .L_12b8
.L_1144:
    ldr r0, [r4]
    bl func_02041fd0
    cmp r0, #0x0
    beq .L_116c
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_020418ac
    mov r0, #0x1
    bl func_02042190
    b .L_12b8
.L_116c:
    ldr r0, _LIT5
    ldr r0, [r0, #0x4]
    bl func_02091814
    sub r1, r0, #0x1
    ldr r0, [r4]
    bl func_02041f04
    ldr r1, [r4]
    add r0, r1, #0x1000
    ldr r0, [r0, #0xba0]
    cmp r0, #0x0
    beq .L_11a4
    ldr r0, _LIT6
    add r0, r1, r0
    bl func_02091af4
.L_11a4:
    ldr r0, [r4]
    add r1, r0, #0x1000
    ldr r1, [r1, #0x20]
    cmp r1, #0x2
    beq .L_11c4
    cmp r1, #0x8
    beq .L_11f0
    b .L_11d8
.L_11c4:
    ldr r0, _LIT0
    mvn r1, #0x0
    ldr r0, [r0]
    add r0, r0, #0x1000
    str r1, [r0, #0x4]
.L_11d8:
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_020418ac
    mov r0, #0x3
    bl func_02042190
    b .L_12b8
.L_11f0:
    mov r1, r6
    bl func_02040e3c
    cmp r0, #0x1
    beq .L_1218
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_020418ac
    mov r0, #0x2
    bl func_02042190
    b .L_12b8
.L_1218:
    ldr r0, [r4]
    add r1, r0, #0x1000
    ldr sl, [r1, #0xa04]
    cmp sl, #0x0
    bne .L_123c
    bl func_020418ac
    mov r0, #0x2
    bl func_02042190
    b .L_12b8
.L_123c:
    mov r0, sl
    bl func_020aaddc
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
    bne .L_128c
    ldr r0, _LIT1
    ldr r0, [r0]
    bl func_020418ac
    mov r0, #0x4
    bl func_02042190
    b .L_12b8
.L_128c:
    mov r0, sl
    bl func_020aaddc
    mov r2, r0
    ldr r0, [sp, #0x10]
    mov r1, sl
    bl func_020aaec0
    ldr r0, [r4]
    bl func_020418ac
    mov r0, fp
    bl func_02091768
    b .L_4d4
.L_12b8:
    ldr r0, [sp]
    cmp r0, #0x0
    beq .L_12d4
    ldr r0, _LIT35
    ldr r1, [sp]
    mov r2, #0x0
    blx r8
.L_12d4:
    cmp r7, #0x0
    beq .L_12ec
    ldr r0, _LIT36
    mov r1, r7
    mov r2, #0x0
    blx r8
.L_12ec:
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
_LIT0: .word data_0219d9f0
_LIT1: .word data_0219d9fc
_LIT2: .word data_0219da00
_LIT3: .word 0x00004e20
_LIT4: .word data_020fea14
_LIT5: .word data_021a63d0
_LIT6: .word 0x00001b34
_LIT7: .word data_020feac0
_LIT8: .word data_021aa460
_LIT9: .word 0x0000012e
_LIT10: .word data_0219d9f8
_LIT11: .word data_020fe55c
_LIT12: .word data_020feacc
_LIT13: .word data_020feaec
_LIT14: .word data_020feaf4
_LIT15: .word data_020feafc
_LIT16: .word data_020feb0c
_LIT17: .word data_020fea3c
_LIT18: .word data_0219da1c
_LIT19: .word data_0219d9f4
_LIT20: .word 0xffffa4fa
_LIT21: .word 0x00009c40
_LIT22: .word data_020feb2c
_LIT23: .word data_020feb34
_LIT24: .word data_020fea58
_LIT25: .word data_020feb3c
_LIT26: .word data_020feb48
_LIT27: .word data_020feb4c
_LIT28: .word data_020feb54
_LIT29: .word data_020fea74
_LIT30: .word data_020fea80
_LIT31: .word data_020fea90
_LIT32: .word 0x0002bf20
_LIT33: .word 0x0001d4c0
_LIT34: .word data_020feaa0
_LIT35: .word data_020feb5c
_LIT36: .word data_020feb68
_LIT37: .word data_020feb74
