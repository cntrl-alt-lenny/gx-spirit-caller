; func_02012cc8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c4ee8
        .extern data_020c4fe8
        .extern data_020c58b0
        .extern data_020c58c4
        .extern data_020c58cc
        .extern data_020c58dc
        .extern data_020c58f0
        .extern data_020c5904
        .extern data_020c5918
        .extern data_020c592c
        .extern data_020c5934
        .extern data_020c5944
        .extern data_020c594c
        .extern data_020c5954
        .extern data_020c5960
        .extern data_020c596c
        .extern data_020c5974
        .extern data_020c597c
        .extern data_020c598c
        .extern data_020c5990
        .extern data_020c5994
        .extern data_020c59ac
        .extern data_020c59c0
        .extern data_02102c90
        .extern data_021040ac
        .extern data_02104bac
        .extern data_02104c70
        .extern data_02104f4c
        .extern data_02105989
        .extern data_0218fe80
        .extern func_020018d4
        .extern func_02001ba4
        .extern func_02001d0c
        .extern func_02001d68
        .extern func_02004f58
        .extern func_02004f88
        .extern func_020057dc
        .extern func_020117dc
        .extern func_020119f4
        .extern func_02011a14
        .extern func_02011b84
        .extern func_02011b8c
        .extern func_02012560
        .extern func_020125ac
        .extern func_0201261c
        .extern func_0202adf8
        .extern func_0202af40
        .extern func_0202c070
        .extern func_0202c0c0
        .extern func_0202c1ac
        .extern func_0208df0c
        .extern func_02091554
        .extern func_02094504
        .global func_02012cc8
        .arm
func_02012cc8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x11c
    ldr r1, _LIT0
    ldr r4, [r1, #0xb6c]
    cmp r4, #0x0
    beq .L_748
    cmp r4, #0x1
    beq .L_7c0
    cmp r4, #0x2
    beq .L_124c
    b .L_1278
.L_748:
    mov r3, #0x0
    str r3, [r1, #0xc3c]
    str r3, [r1, #0xc48]
    ldr r0, [r1, #0x38]
    mov r2, #0x1
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [r1, #0xc38]
    str r3, [r1, #0xbc4]
    str r2, [r1, #0xbc8]
    str r3, [r1, #0xbb0]
    sub r0, r2, #0x2
    str r0, [r1, #0xbb4]
    str r3, [r1, #0xc40]
    ldr r2, [r1, #0xe64]
    add r0, r4, #0x1
    bic r2, r2, #0x1
    orr r2, r2, #0x1
    str r2, [r1, #0xe64]
    str r0, [r1, #0xb6c]
    str r3, [r1, #0xb70]
    str r3, [r1, #0xb74]
    mov r0, #0x2
    str r3, [r1, #0xb78]
    bl func_020018d4
    ldr r0, _LIT1
    bl func_0202adf8
    mov r0, #0x0
    bl func_0202c070
    b .L_1278
.L_7c0:
    ldr r0, [r1, #0xb74]
    cmp r0, #0x0
    beq .L_7dc
    ldr r0, _LIT2
    ldrh r0, [r0, #0x56]
    cmp r0, #0x0
    beq .L_1158
.L_7dc:
    ldr r1, _LIT0
    mov r2, #0x1
    ldr r0, _LIT2
    str r2, [r1, #0xb74]
    ldrh r4, [r0, #0x56]
    mov r3, #0x0
    tst r4, #0x80
    beq .L_808
    ldr r0, [r1, #0xb70]
    cmp r0, #0xa
    movcc r3, r2
.L_808:
    tst r4, #0x40
    ldrne r0, _LIT0
    ldr r2, _LIT0
    ldrne r0, [r0, #0xb70]
    cmpne r0, #0x0
    movne r1, #0x1
    ldr r0, [r2, #0xb70]
    moveq r1, #0x0
    sub r0, r0, r1
    add r5, r0, r3
    str r5, [r2, #0xb70]
    cmp r5, #0xa
    addls pc, pc, r5, lsl #0x2
    b .L_d14
    b .L_86c
    b .L_86c
    b .L_8e0
    b .L_938
    b .L_990
    b .L_9e8
    b .L_b28
    b .L_b78
    b .L_bc8
    b .L_c30
    b .L_ca4
.L_86c:
    ldr r0, _LIT2
    mov r4, #0x0
    ldrh r0, [r0, #0x56]
    tst r0, #0x10
    beq .L_898
    bl func_020117dc
    ldr r1, _LIT3
    sub r0, r0, #0x1
    ldr r1, [r1, r5, lsl #0x2]
    cmp r1, r0
    movlt r4, #0x1
.L_898:
    ldr r0, _LIT2
    ldrh r0, [r0, #0x56]
    tst r0, #0x20
    beq .L_8bc
    ldr r0, _LIT3
    ldr r0, [r0, r5, lsl #0x2]
    cmp r0, #0x0
    movgt r3, #0x1
    bgt .L_8c0
.L_8bc:
    mov r3, #0x0
.L_8c0:
    ldr r0, _LIT0
    ldr r1, _LIT3
    ldr r2, [r0, #0xb70]
    ldr r0, [r1, r2, lsl #0x2]
    sub r0, r0, r3
    add r0, r0, r4
    str r0, [r1, r2, lsl #0x2]
    b .L_d14
.L_8e0:
    ldr r0, _LIT2
    mov r3, #0x0
    ldrh r1, [r0, #0x56]
    tst r1, #0x10
    beq .L_900
    ldr r0, [r2, #0xc40]
    cmp r0, #0x2
    movlt r3, #0x1
.L_900:
    tst r1, #0x20
    beq .L_91c
    ldr r0, _LIT0
    ldr r0, [r0, #0xc40]
    cmp r0, #0x0
    movgt r2, #0x1
    bgt .L_920
.L_91c:
    mov r2, #0x0
.L_920:
    ldr r0, _LIT0
    ldr r1, [r0, #0xc40]
    sub r1, r1, r2
    add r1, r1, r3
    str r1, [r0, #0xc40]
    b .L_d14
.L_938:
    ldr r0, _LIT2
    mov r3, #0x0
    ldrh r1, [r0, #0x56]
    tst r1, #0x10
    beq .L_958
    ldr r0, [r2, #0xc48]
    cmp r0, #0x2
    movlt r3, #0x1
.L_958:
    tst r1, #0x20
    beq .L_974
    ldr r0, _LIT0
    ldr r0, [r0, #0xc48]
    cmp r0, #0x0
    movgt r2, #0x1
    bgt .L_978
.L_974:
    mov r2, #0x0
.L_978:
    ldr r0, _LIT0
    ldr r1, [r0, #0xc48]
    sub r1, r1, r2
    add r1, r1, r3
    str r1, [r0, #0xc48]
    b .L_d14
.L_990:
    ldr r0, _LIT2
    mov r3, #0x0
    ldrh r1, [r0, #0x56]
    tst r1, #0x10
    beq .L_9b0
    ldr r0, [r2, #0xbb0]
    cmp r0, #0x1
    movlt r3, #0x1
.L_9b0:
    tst r1, #0x20
    beq .L_9cc
    ldr r0, _LIT0
    ldr r0, [r0, #0xbb0]
    cmp r0, #0x0
    movgt r2, #0x1
    bgt .L_9d0
.L_9cc:
    mov r2, #0x0
.L_9d0:
    ldr r0, _LIT0
    ldr r1, [r0, #0xbb0]
    sub r1, r1, r2
    add r1, r1, r3
    str r1, [r0, #0xbb0]
    b .L_d14
.L_9e8:
    ldr r0, _LIT2
    mov r3, #0x0
    ldrh r1, [r0, #0x56]
    tst r1, #0x200
    beq .L_a08
    ldr r0, [r2, #0xb78]
    cmp r0, #0x4
    movcc r3, #0x1
.L_a08:
    tst r1, #0x100
    ldrne r0, _LIT0
    ldr r5, _LIT4
    ldrne r0, [r0, #0xb78]
    mov r1, #0x0
    cmpne r0, #0x0
    ldr r0, _LIT0
    movne r4, #0x1
    ldr r2, [r0, #0xb78]
    moveq r4, #0x0
    sub r2, r2, r4
    add r2, r2, r3
    str r2, [r0, #0xb78]
    ldr r7, [r0, #0xc38]
    add r0, sp, #0x8
    mov r4, #0xa
.L_a48:
    mov r2, r7, lsr #0x1f
    smull r3, r6, r5, r7
    add r6, r2, r6, asr #0x2
    smull r2, r3, r4, r6
    mov r3, r7
    sub r6, r7, r2
    str r6, [r0, r1, lsl #0x2]
    add r1, r1, #0x1
    smull r2, r7, r5, r3
    mov r2, r3, lsr #0x1f
    cmp r1, #0x5
    add r7, r2, r7, asr #0x2
    blt .L_a48
    ldr r2, _LIT2
    mov r1, #0x0
    ldrh r3, [r2, #0x56]
    tst r3, #0x10
    beq .L_aa4
    ldr r2, _LIT0
    ldr r2, [r2, #0xb78]
    ldr r0, [r0, r2, lsl #0x2]
    cmp r0, #0x9
    movlt r1, #0x1
.L_aa4:
    tst r3, #0x20
    beq .L_ac8
    ldr r0, _LIT0
    add r2, sp, #0x8
    ldr r0, [r0, #0xb78]
    ldr r0, [r2, r0, lsl #0x2]
    cmp r0, #0x0
    movgt r6, #0x1
    bgt .L_acc
.L_ac8:
    mov r6, #0x0
.L_acc:
    ldr r2, _LIT0
    add r4, sp, #0x8
    ldr r5, [r2, #0xb78]
    mov r0, #0x0
    ldr r3, [r4, r5, lsl #0x2]
    str r0, [r2, #0xc38]
    sub r2, r3, r6
    add r1, r2, r1
    str r1, [r4, r5, lsl #0x2]
    mov r3, #0x4
    mov r1, #0xa
.L_af8:
    ldr r2, [r4, r3, lsl #0x2]
    subs r3, r3, #0x1
    mla r0, r1, r0, r2
    bpl .L_af8
    ldr r2, _LIT0
    ldr r1, _LIT5
    str r0, [r2, #0xc38]
    cmp r0, r1
    movcs r0, r1
    ldr r1, _LIT0
    str r0, [r1, #0xc38]
    b .L_d14
.L_b28:
    ldr r0, _LIT2
    mov r3, #0x0
    ldrh r1, [r0, #0x56]
    tst r1, #0x10
    beq .L_b48
    ldr r0, [r2, #0xb88]
    cmp r0, #0x3
    movcc r3, #0x1
.L_b48:
    tst r1, #0x20
    ldrne r0, _LIT0
    ldrne r0, [r0, #0xb88]
    cmpne r0, #0x0
    ldr r0, _LIT0
    movne r2, #0x1
    ldr r1, [r0, #0xb88]
    moveq r2, #0x0
    sub r1, r1, r2
    add r1, r1, r3
    str r1, [r0, #0xb88]
    b .L_d14
.L_b78:
    ldr r0, _LIT2
    mov r3, #0x0
    ldrh r1, [r0, #0x56]
    tst r1, #0x10
    beq .L_b98
    ldr r0, [r2, #0xb84]
    cmp r0, #0x40
    movcc r3, #0x1
.L_b98:
    tst r1, #0x20
    ldrne r0, _LIT0
    ldrne r0, [r0, #0xb84]
    cmpne r0, #0x0
    ldr r0, _LIT0
    movne r2, #0x1
    ldr r1, [r0, #0xb84]
    moveq r2, #0x0
    sub r1, r1, r2
    add r1, r1, r3
    str r1, [r0, #0xb84]
    b .L_d14
.L_bc8:
    ldr r0, _LIT2
    ldrh r0, [r0, #0x56]
    tst r0, #0x10
    beq .L_bf4
    bl func_02011b84
    ldr r1, _LIT0
    sub r0, r0, #0x1
    ldr r1, [r1, #0xb8c]
    cmp r1, r0
    movcc r2, #0x1
    bcc .L_bf8
.L_bf4:
    mov r2, #0x0
.L_bf8:
    ldr r0, _LIT2
    ldrh r0, [r0, #0x56]
    tst r0, #0x20
    ldrne r0, _LIT0
    ldrne r0, [r0, #0xb8c]
    cmpne r0, #0x0
    ldr r0, _LIT0
    movne r3, #0x1
    ldr r1, [r0, #0xb8c]
    moveq r3, #0x0
    sub r1, r1, r3
    add r1, r1, r2
    str r1, [r0, #0xb8c]
    b .L_d14
.L_c30:
    ldr r1, _LIT2
    mov r0, #0x0
    ldrh r3, [r1, #0x56]
    tst r3, #0x10
    beq .L_c58
    ldr r1, [r2, #0xe64]
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    cmp r1, #0x1
    movcc r0, #0x1
.L_c58:
    tst r3, #0x20
    beq .L_c78
    ldr r1, _LIT0
    ldr r1, [r1, #0xe64]
    mov r1, r1, lsl #0x1f
    movs r1, r1, lsr #0x1f
    movne r4, #0x1
    bne .L_c7c
.L_c78:
    mov r4, #0x0
.L_c7c:
    ldr r1, _LIT0
    ldr r3, [r1, #0xe64]
    mov r2, r3, lsl #0x1f
    rsb r2, r4, r2, lsr #0x1f
    add r0, r2, r0
    bic r2, r3, #0x1
    and r0, r0, #0x1
    orr r0, r2, r0
    str r0, [r1, #0xe64]
    b .L_d14
.L_ca4:
    ldr r1, _LIT2
    mov r0, #0x0
    ldrh r3, [r1, #0x56]
    tst r3, #0x10
    beq .L_ccc
    ldr r1, [r2, #0xe64]
    mov r1, r1, lsl #0x1e
    mov r1, r1, lsr #0x1f
    cmp r1, #0x1
    movcc r0, #0x1
.L_ccc:
    tst r3, #0x20
    beq .L_cec
    ldr r1, _LIT0
    ldr r1, [r1, #0xe64]
    mov r1, r1, lsl #0x1e
    movs r1, r1, lsr #0x1f
    movne r4, #0x1
    bne .L_cf0
.L_cec:
    mov r4, #0x0
.L_cf0:
    ldr r1, _LIT0
    ldr r3, [r1, #0xe64]
    mov r2, r3, lsl #0x1e
    rsb r2, r4, r2, lsr #0x1f
    add r0, r2, r0
    bic r2, r3, #0x2
    mov r0, r0, lsl #0x1f
    orr r0, r2, r0, lsr #0x1e
    str r0, [r1, #0xe64]
.L_d14:
    ldr r0, _LIT6
    mov r1, #0x20
    mov r2, #0x18
    mov r7, #0x0
    bl func_02001d0c
    bl func_0208df0c
    mov r1, r0
    mov r0, r7
    mov r2, #0x8000
    bl func_02094504
    mov r0, r7
    bl func_02001d68
    mov r6, r7
    ldr r5, _LIT0
    mov r9, r6
    add r4, sp, #0x1c
    mov fp, r7
.L_d58:
    add r0, r5, r6, lsl #0x2
    ldr r8, [r0, #0xbc4]
    cmp r8, #0x0
    bne .L_d94
    str fp, [r0, #0xbbc]
    ldr r0, _LIT7
    ldr r1, _LIT8
    str r0, [sp]
    ldr r0, _LIT9
    mov r3, r8
    str r0, [sp, #0x4]
    mov r0, r4
    mov r2, r6
    bl func_02091554
    b .L_e0c
.L_d94:
    bl func_020117dc
    cmp r8, r0
    bge .L_e0c
    mov r0, r8
    bl func_020119f4
    add r1, r5, r6, lsl #0x2
    str r0, [r1, #0xbbc]
    ldr r0, _LIT10
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d68
    add r0, r5, r6, lsl #0x2
    ldr r0, [r0, #0xbbc]
    cmp r0, #0x0
    ldreq sl, _LIT11
    beq .L_de8
    add r0, r0, #0x178
    add r0, r0, #0x400
    bl func_0202c0c0
    mov sl, r0
.L_de8:
    mov r0, r8
    bl func_02011a14
    str sl, [sp]
    str r0, [sp, #0x4]
    ldr r1, _LIT12
    mov r3, r8
    mov r0, r4
    mov r2, r6
    bl func_02091554
.L_e0c:
    bl func_0208df0c
    mov r2, r0
    add r0, r9, #0xa
    str r0, [sp]
    mov r0, #0xa
    str r0, [sp, #0x4]
    ldr r0, _LIT6
    mov r1, r4
    mov r3, #0x10
    bl func_02004f58
    add r6, r6, #0x1
    add r9, r9, #0xa
    add r7, r7, #0x1
    cmp r6, #0x2
    blt .L_d58
    mov r0, #0x0
    bl func_02001d68
    ldr r0, _LIT0
    ldr r0, [r0, #0xc40]
    cmp r0, #0x0
    beq .L_e74
    cmp r0, #0x1
    beq .L_e84
    cmp r0, #0x2
    beq .L_e94
    b .L_ea0
.L_e74:
    ldr r1, _LIT13
    add r0, sp, #0x1c
    bl func_02091554
    b .L_ea0
.L_e84:
    ldr r1, _LIT14
    add r0, sp, #0x1c
    bl func_02091554
    b .L_ea0
.L_e94:
    ldr r1, _LIT15
    add r0, sp, #0x1c
    bl func_02091554
.L_ea0:
    bl func_0208df0c
    add r1, r7, #0x1
    mov r4, #0xa
    mul r3, r1, r4
    str r3, [sp]
    mov r2, r0
    ldr r0, _LIT6
    add r1, sp, #0x1c
    mov r3, #0x10
    str r4, [sp, #0x4]
    bl func_02004f88
    ldr r0, _LIT0
    ldr r2, [r0, #0xc48]
    add r0, sp, #0x1c
    cmp r2, #0x2
    bge .L_eec
    ldr r1, _LIT16
    bl func_02091554
    b .L_ef4
.L_eec:
    ldr r1, _LIT17
    bl func_02091554
.L_ef4:
    bl func_0208df0c
    add r1, r7, #0x2
    mov r4, #0xa
    mul r3, r1, r4
    str r3, [sp]
    mov r2, r0
    ldr r0, _LIT6
    add r1, sp, #0x1c
    mov r3, #0x10
    str r4, [sp, #0x4]
    bl func_02004f88
    ldr r0, _LIT0
    ldr r1, _LIT18
    ldr r0, [r0, #0xbb0]
    cmp r0, #0x0
    ldrne r2, _LIT19
    add r0, sp, #0x1c
    ldreq r2, _LIT20
    bl func_02091554
    bl func_0208df0c
    mov r2, r0
    add r0, r7, #0x3
    mov r4, #0xa
    mul r1, r0, r4
    str r1, [sp]
    ldr r0, _LIT6
    add r1, sp, #0x1c
    mov r3, #0x10
    str r4, [sp, #0x4]
    bl func_02004f88
    ldr r1, _LIT0
    add r0, sp, #0x1c
    ldr r2, [r1, #0xc38]
    ldr r1, _LIT21
    bl func_02091554
    bl func_0208df0c
    mov r2, r0
    add r1, r7, #0x4
    mov r0, r4
    mul r3, r1, r0
    str r3, [sp]
    str r0, [sp, #0x4]
    ldr r0, _LIT6
    add r1, sp, #0x1c
    mov r3, #0x10
    bl func_02004f88
    ldr r2, _LIT0
    ldr r3, _LIT22
    ldr r2, [r2, #0xb88]
    ldr r1, _LIT23
    ldr r2, [r3, r2, lsl #0x2]
    add r0, sp, #0x1c
    bl func_02091554
    bl func_0208df0c
    mov r2, r0
    add r1, r7, #0x5
    mov r0, r4
    mul r3, r1, r0
    str r3, [sp]
    str r0, [sp, #0x4]
    ldr r0, _LIT6
    add r1, sp, #0x1c
    mov r3, #0x10
    bl func_02004f88
    ldr r2, _LIT0
    ldr r3, _LIT24
    ldr r2, [r2, #0xb84]
    ldr r1, _LIT25
    ldr r2, [r3, r2, lsl #0x2]
    add r0, sp, #0x1c
    bl func_02091554
    bl func_0208df0c
    mov r2, r0
    add r1, r7, #0x6
    mov r0, r4
    mul r3, r1, r0
    str r3, [sp]
    str r0, [sp, #0x4]
    ldr r0, _LIT6
    add r1, sp, #0x1c
    mov r3, #0x10
    bl func_02004f88
    ldr r0, _LIT0
    ldr r0, [r0, #0xb8c]
    bl func_02011b8c
    mov r2, r0
    ldr r1, _LIT26
    add r0, sp, #0x1c
    bl func_02091554
    bl func_0208df0c
    mov r2, r0
    add r1, r7, #0x7
    mov r0, r4
    mul r3, r1, r0
    str r3, [sp]
    str r0, [sp, #0x4]
    ldr r0, _LIT6
    add r1, sp, #0x1c
    mov r3, #0x10
    bl func_02004f88
    ldr r0, _LIT0
    ldr r1, _LIT27
    ldr r0, [r0, #0xe64]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldrne r2, _LIT28
    add r0, sp, #0x1c
    ldreq r2, _LIT29
    bl func_02091554
    bl func_0208df0c
    mov r2, r0
    add r0, r7, #0x8
    mov r4, #0xa
    mul r1, r0, r4
    str r1, [sp]
    ldr r0, _LIT6
    add r1, sp, #0x1c
    mov r3, #0x10
    str r4, [sp, #0x4]
    bl func_02004f88
    ldr r0, _LIT0
    ldr r1, _LIT30
    ldr r0, [r0, #0xe64]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    ldrne r2, _LIT28
    add r0, sp, #0x1c
    ldreq r2, _LIT29
    bl func_02091554
    bl func_0208df0c
    mov r2, r0
    add r0, r7, #0x9
    mov r4, #0xa
    mul r1, r0, r4
    str r1, [sp]
    ldr r0, _LIT6
    add r1, sp, #0x1c
    mov r3, #0x10
    str r4, [sp, #0x4]
    bl func_02004f88
    bl func_0208df0c
    mov r2, r0
    ldr r0, _LIT0
    mov r1, r4
    ldr r3, [r0, #0xb70]
    ldr r0, _LIT6
    add r3, r3, #0x1
    mul r4, r3, r1
    str r4, [sp]
    str r1, [sp, #0x4]
    ldr r1, _LIT31
    mov r3, #0x0
    bl func_02004f88
.L_1158:
    ldr r0, _LIT2
    ldrh r0, [r0, #0x54]
    tst r0, #0xc00
    beq .L_1184
    mov r0, #0x0
    bl func_020125ac
    ldr r0, _LIT0
    ldr r1, [r0, #0xb6c]
    add r1, r1, #0x1
    str r1, [r0, #0xb6c]
    b .L_1278
.L_1184:
    tst r0, #0x3
    beq .L_1278
    ldr r0, _LIT0
    ldr r1, [r0, #0xb88]
    cmp r1, #0x3
    bne .L_11ac
    ldr r0, [r0, #0xb8c]
    mov r1, #0x0
    bl func_02012560
    b .L_1210
.L_11ac:
    ldr r1, [r0, #0xc40]
    cmp r1, #0x0
    beq .L_11cc
    cmp r1, #0x1
    beq .L_11e4
    cmp r1, #0x2
    beq .L_11fc
    b .L_1210
.L_11cc:
    mov r1, #0x0
    str r1, [r0, #0xc3c]
    str r1, [r0, #0xc40]
    mov r1, #0x1
    str r1, [r0, #0xc44]
    b .L_1210
.L_11e4:
    mov r1, #0x0
    str r1, [r0, #0xc3c]
    mov r1, #0x1
    str r1, [r0, #0xc40]
    str r1, [r0, #0xc44]
    b .L_1210
.L_11fc:
    mov r2, #0x1
    str r2, [r0, #0xc3c]
    mov r1, #0x0
    str r1, [r0, #0xc44]
    str r2, [r0, #0xc40]
.L_1210:
    ldr r0, _LIT0
    ldr r1, [r0, #0xbb0]
    cmp r1, #0x0
    beq .L_1230
    ldr r0, [r0, #0xb88]
    cmp r0, #0x1
    ldreq r1, _LIT32
    beq .L_1234
.L_1230:
    mvn r1, #0x0
.L_1234:
    ldr r0, _LIT0
    str r1, [r0, #0xbb4]
    ldr r1, [r0, #0xb6c]
    add r1, r1, #0x1
    str r1, [r0, #0xb6c]
    b .L_1278
.L_124c:
    bl func_0202c1ac
    bl func_0202af40
    bl func_02001ba4
    ldr r1, _LIT0
    mov r2, #0x0
    ldr r0, _LIT33
    str r2, [r1, #0xba0]
    bl func_020057dc
    add sp, sp, #0x11c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1278:
    mov r0, #0x0
    add sp, sp, #0x11c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_021040ac
_LIT1: .word data_0218fe80
_LIT2: .word data_02104bac
_LIT3: .word data_02104c70
_LIT4: .word 0x66666667
_LIT5: .word 0x0000ffff
_LIT6: .word data_02102c90
_LIT7: .word data_020c58c4
_LIT8: .word data_020c58b0
_LIT9: .word data_020c58cc
_LIT10: .word data_02104f4c
_LIT11: .word data_02105989
_LIT12: .word data_020c58dc
_LIT13: .word data_020c58f0
_LIT14: .word data_020c5904
_LIT15: .word data_020c5918
_LIT16: .word data_020c592c
_LIT17: .word data_020c5934
_LIT18: .word data_020c5954
_LIT19: .word data_020c5944
_LIT20: .word data_020c594c
_LIT21: .word data_020c5960
_LIT22: .word data_020c4ee8
_LIT23: .word data_020c596c
_LIT24: .word data_020c4fe8
_LIT25: .word data_020c5974
_LIT26: .word data_020c597c
_LIT27: .word data_020c5994
_LIT28: .word data_020c598c
_LIT29: .word data_020c5990
_LIT30: .word data_020c59ac
_LIT31: .word data_020c59c0
_LIT32: .word 0x00023280
_LIT33: .word func_0201261c
