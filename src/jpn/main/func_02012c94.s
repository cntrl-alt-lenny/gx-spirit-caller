; func_02012c94 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c4e08
        .extern data_020c4f08
        .extern data_020c57d0
        .extern data_020c57e4
        .extern data_020c57ec
        .extern data_020c57fc
        .extern data_020c5810
        .extern data_020c5824
        .extern data_020c5838
        .extern data_020c584c
        .extern data_020c5854
        .extern data_020c5864
        .extern data_020c586c
        .extern data_020c5874
        .extern data_020c5880
        .extern data_020c588c
        .extern data_020c5894
        .extern data_020c589c
        .extern data_020c58ac
        .extern data_020c58b0
        .extern data_020c58b4
        .extern data_020c58cc
        .extern data_020c58e0
        .extern data_02102bb0
        .extern data_02103fcc
        .extern data_02104acc
        .extern data_02104b90
        .extern data_02104e6c
        .extern data_021058a9
        .extern data_0218fda0
        .extern func_020018b4
        .extern func_02001b84
        .extern func_02001cec
        .extern func_02001d48
        .extern func_02004f3c
        .extern func_02004f6c
        .extern func_020057c0
        .extern func_020117a8
        .extern func_020119c0
        .extern func_020119e0
        .extern func_02011b50
        .extern func_02011b58
        .extern func_0201252c
        .extern func_02012578
        .extern func_020125e8
        .extern func_0202ada4
        .extern func_0202aeec
        .extern func_0202c01c
        .extern func_0202c06c
        .extern func_0202c158
        .extern func_0208de24
        .extern OS_SPrintf
        .extern func_02094410
        .global func_02012c94
        .arm
func_02012c94:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x11c
    ldr r1, _LIT0
    ldr r4, [r1, #0xb6c]
    cmp r4, #0x0
    beq .L_6d8
    cmp r4, #0x1
    beq .L_750
    cmp r4, #0x2
    beq .L_11dc
    b .L_1208
.L_6d8:
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
    bl func_020018b4
    ldr r0, _LIT1
    bl func_0202ada4
    mov r0, #0x0
    bl func_0202c01c
    b .L_1208
.L_750:
    ldr r0, [r1, #0xb74]
    cmp r0, #0x0
    beq .L_76c
    ldr r0, _LIT2
    ldrh r0, [r0, #0x56]
    cmp r0, #0x0
    beq .L_10e8
.L_76c:
    ldr r1, _LIT0
    mov r2, #0x1
    ldr r0, _LIT2
    str r2, [r1, #0xb74]
    ldrh r4, [r0, #0x56]
    mov r3, #0x0
    tst r4, #0x80
    beq .L_798
    ldr r0, [r1, #0xb70]
    cmp r0, #0xa
    movcc r3, r2
.L_798:
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
    b .L_ca4
    b .L_7fc
    b .L_7fc
    b .L_870
    b .L_8c8
    b .L_920
    b .L_978
    b .L_ab8
    b .L_b08
    b .L_b58
    b .L_bc0
    b .L_c34
.L_7fc:
    ldr r0, _LIT2
    mov r4, #0x0
    ldrh r0, [r0, #0x56]
    tst r0, #0x10
    beq .L_828
    bl func_020117a8
    ldr r1, _LIT3
    sub r0, r0, #0x1
    ldr r1, [r1, r5, lsl #0x2]
    cmp r1, r0
    movlt r4, #0x1
.L_828:
    ldr r0, _LIT2
    ldrh r0, [r0, #0x56]
    tst r0, #0x20
    beq .L_84c
    ldr r0, _LIT3
    ldr r0, [r0, r5, lsl #0x2]
    cmp r0, #0x0
    movgt r3, #0x1
    bgt .L_850
.L_84c:
    mov r3, #0x0
.L_850:
    ldr r0, _LIT0
    ldr r1, _LIT3
    ldr r2, [r0, #0xb70]
    ldr r0, [r1, r2, lsl #0x2]
    sub r0, r0, r3
    add r0, r0, r4
    str r0, [r1, r2, lsl #0x2]
    b .L_ca4
.L_870:
    ldr r0, _LIT2
    mov r3, #0x0
    ldrh r1, [r0, #0x56]
    tst r1, #0x10
    beq .L_890
    ldr r0, [r2, #0xc40]
    cmp r0, #0x2
    movlt r3, #0x1
.L_890:
    tst r1, #0x20
    beq .L_8ac
    ldr r0, _LIT0
    ldr r0, [r0, #0xc40]
    cmp r0, #0x0
    movgt r2, #0x1
    bgt .L_8b0
.L_8ac:
    mov r2, #0x0
.L_8b0:
    ldr r0, _LIT0
    ldr r1, [r0, #0xc40]
    sub r1, r1, r2
    add r1, r1, r3
    str r1, [r0, #0xc40]
    b .L_ca4
.L_8c8:
    ldr r0, _LIT2
    mov r3, #0x0
    ldrh r1, [r0, #0x56]
    tst r1, #0x10
    beq .L_8e8
    ldr r0, [r2, #0xc48]
    cmp r0, #0x2
    movlt r3, #0x1
.L_8e8:
    tst r1, #0x20
    beq .L_904
    ldr r0, _LIT0
    ldr r0, [r0, #0xc48]
    cmp r0, #0x0
    movgt r2, #0x1
    bgt .L_908
.L_904:
    mov r2, #0x0
.L_908:
    ldr r0, _LIT0
    ldr r1, [r0, #0xc48]
    sub r1, r1, r2
    add r1, r1, r3
    str r1, [r0, #0xc48]
    b .L_ca4
.L_920:
    ldr r0, _LIT2
    mov r3, #0x0
    ldrh r1, [r0, #0x56]
    tst r1, #0x10
    beq .L_940
    ldr r0, [r2, #0xbb0]
    cmp r0, #0x1
    movlt r3, #0x1
.L_940:
    tst r1, #0x20
    beq .L_95c
    ldr r0, _LIT0
    ldr r0, [r0, #0xbb0]
    cmp r0, #0x0
    movgt r2, #0x1
    bgt .L_960
.L_95c:
    mov r2, #0x0
.L_960:
    ldr r0, _LIT0
    ldr r1, [r0, #0xbb0]
    sub r1, r1, r2
    add r1, r1, r3
    str r1, [r0, #0xbb0]
    b .L_ca4
.L_978:
    ldr r0, _LIT2
    mov r3, #0x0
    ldrh r1, [r0, #0x56]
    tst r1, #0x200
    beq .L_998
    ldr r0, [r2, #0xb78]
    cmp r0, #0x4
    movcc r3, #0x1
.L_998:
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
.L_9d8:
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
    blt .L_9d8
    ldr r2, _LIT2
    mov r1, #0x0
    ldrh r3, [r2, #0x56]
    tst r3, #0x10
    beq .L_a34
    ldr r2, _LIT0
    ldr r2, [r2, #0xb78]
    ldr r0, [r0, r2, lsl #0x2]
    cmp r0, #0x9
    movlt r1, #0x1
.L_a34:
    tst r3, #0x20
    beq .L_a58
    ldr r0, _LIT0
    add r2, sp, #0x8
    ldr r0, [r0, #0xb78]
    ldr r0, [r2, r0, lsl #0x2]
    cmp r0, #0x0
    movgt r6, #0x1
    bgt .L_a5c
.L_a58:
    mov r6, #0x0
.L_a5c:
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
.L_a88:
    ldr r2, [r4, r3, lsl #0x2]
    subs r3, r3, #0x1
    mla r0, r1, r0, r2
    bpl .L_a88
    ldr r2, _LIT0
    ldr r1, _LIT5
    str r0, [r2, #0xc38]
    cmp r0, r1
    movcs r0, r1
    ldr r1, _LIT0
    str r0, [r1, #0xc38]
    b .L_ca4
.L_ab8:
    ldr r0, _LIT2
    mov r3, #0x0
    ldrh r1, [r0, #0x56]
    tst r1, #0x10
    beq .L_ad8
    ldr r0, [r2, #0xb88]
    cmp r0, #0x3
    movcc r3, #0x1
.L_ad8:
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
    b .L_ca4
.L_b08:
    ldr r0, _LIT2
    mov r3, #0x0
    ldrh r1, [r0, #0x56]
    tst r1, #0x10
    beq .L_b28
    ldr r0, [r2, #0xb84]
    cmp r0, #0x40
    movcc r3, #0x1
.L_b28:
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
    b .L_ca4
.L_b58:
    ldr r0, _LIT2
    ldrh r0, [r0, #0x56]
    tst r0, #0x10
    beq .L_b84
    bl func_02011b50
    ldr r1, _LIT0
    sub r0, r0, #0x1
    ldr r1, [r1, #0xb8c]
    cmp r1, r0
    movcc r2, #0x1
    bcc .L_b88
.L_b84:
    mov r2, #0x0
.L_b88:
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
    b .L_ca4
.L_bc0:
    ldr r1, _LIT2
    mov r0, #0x0
    ldrh r3, [r1, #0x56]
    tst r3, #0x10
    beq .L_be8
    ldr r1, [r2, #0xe64]
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    cmp r1, #0x1
    movcc r0, #0x1
.L_be8:
    tst r3, #0x20
    beq .L_c08
    ldr r1, _LIT0
    ldr r1, [r1, #0xe64]
    mov r1, r1, lsl #0x1f
    movs r1, r1, lsr #0x1f
    movne r4, #0x1
    bne .L_c0c
.L_c08:
    mov r4, #0x0
.L_c0c:
    ldr r1, _LIT0
    ldr r3, [r1, #0xe64]
    mov r2, r3, lsl #0x1f
    rsb r2, r4, r2, lsr #0x1f
    add r0, r2, r0
    bic r2, r3, #0x1
    and r0, r0, #0x1
    orr r0, r2, r0
    str r0, [r1, #0xe64]
    b .L_ca4
.L_c34:
    ldr r1, _LIT2
    mov r0, #0x0
    ldrh r3, [r1, #0x56]
    tst r3, #0x10
    beq .L_c5c
    ldr r1, [r2, #0xe64]
    mov r1, r1, lsl #0x1e
    mov r1, r1, lsr #0x1f
    cmp r1, #0x1
    movcc r0, #0x1
.L_c5c:
    tst r3, #0x20
    beq .L_c7c
    ldr r1, _LIT0
    ldr r1, [r1, #0xe64]
    mov r1, r1, lsl #0x1e
    movs r1, r1, lsr #0x1f
    movne r4, #0x1
    bne .L_c80
.L_c7c:
    mov r4, #0x0
.L_c80:
    ldr r1, _LIT0
    ldr r3, [r1, #0xe64]
    mov r2, r3, lsl #0x1e
    rsb r2, r4, r2, lsr #0x1f
    add r0, r2, r0
    bic r2, r3, #0x2
    mov r0, r0, lsl #0x1f
    orr r0, r2, r0, lsr #0x1e
    str r0, [r1, #0xe64]
.L_ca4:
    ldr r0, _LIT6
    mov r1, #0x20
    mov r2, #0x18
    mov r7, #0x0
    bl func_02001cec
    bl func_0208de24
    mov r1, r0
    mov r0, r7
    mov r2, #0x8000
    bl func_02094410
    mov r0, r7
    bl func_02001d48
    mov r6, r7
    ldr r5, _LIT0
    mov r9, r6
    add r4, sp, #0x1c
    mov fp, r7
.L_ce8:
    add r0, r5, r6, lsl #0x2
    ldr r8, [r0, #0xbc4]
    cmp r8, #0x0
    bne .L_d24
    str fp, [r0, #0xbbc]
    ldr r0, _LIT7
    ldr r1, _LIT8
    str r0, [sp]
    ldr r0, _LIT9
    mov r3, r8
    str r0, [sp, #0x4]
    mov r0, r4
    mov r2, r6
    bl OS_SPrintf
    b .L_d9c
.L_d24:
    bl func_020117a8
    cmp r8, r0
    bge .L_d9c
    mov r0, r8
    bl func_020119c0
    add r1, r5, r6, lsl #0x2
    str r0, [r1, #0xbbc]
    ldr r0, _LIT10
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d48
    add r0, r5, r6, lsl #0x2
    ldr r0, [r0, #0xbbc]
    cmp r0, #0x0
    ldreq sl, _LIT11
    beq .L_d78
    add r0, r0, #0x178
    add r0, r0, #0x400
    bl func_0202c06c
    mov sl, r0
.L_d78:
    mov r0, r8
    bl func_020119e0
    str sl, [sp]
    str r0, [sp, #0x4]
    ldr r1, _LIT12
    mov r3, r8
    mov r0, r4
    mov r2, r6
    bl OS_SPrintf
.L_d9c:
    bl func_0208de24
    mov r2, r0
    add r0, r9, #0xa
    str r0, [sp]
    mov r0, #0xa
    str r0, [sp, #0x4]
    ldr r0, _LIT6
    mov r1, r4
    mov r3, #0x10
    bl func_02004f3c
    add r6, r6, #0x1
    add r9, r9, #0xa
    add r7, r7, #0x1
    cmp r6, #0x2
    blt .L_ce8
    mov r0, #0x0
    bl func_02001d48
    ldr r0, _LIT0
    ldr r0, [r0, #0xc40]
    cmp r0, #0x0
    beq .L_e04
    cmp r0, #0x1
    beq .L_e14
    cmp r0, #0x2
    beq .L_e24
    b .L_e30
.L_e04:
    ldr r1, _LIT13
    add r0, sp, #0x1c
    bl OS_SPrintf
    b .L_e30
.L_e14:
    ldr r1, _LIT14
    add r0, sp, #0x1c
    bl OS_SPrintf
    b .L_e30
.L_e24:
    ldr r1, _LIT15
    add r0, sp, #0x1c
    bl OS_SPrintf
.L_e30:
    bl func_0208de24
    add r1, r7, #0x1
    mov r4, #0xa
    mul r3, r1, r4
    str r3, [sp]
    mov r2, r0
    ldr r0, _LIT6
    add r1, sp, #0x1c
    mov r3, #0x10
    str r4, [sp, #0x4]
    bl func_02004f6c
    ldr r0, _LIT0
    ldr r2, [r0, #0xc48]
    add r0, sp, #0x1c
    cmp r2, #0x2
    bge .L_e7c
    ldr r1, _LIT16
    bl OS_SPrintf
    b .L_e84
.L_e7c:
    ldr r1, _LIT17
    bl OS_SPrintf
.L_e84:
    bl func_0208de24
    add r1, r7, #0x2
    mov r4, #0xa
    mul r3, r1, r4
    str r3, [sp]
    mov r2, r0
    ldr r0, _LIT6
    add r1, sp, #0x1c
    mov r3, #0x10
    str r4, [sp, #0x4]
    bl func_02004f6c
    ldr r0, _LIT0
    ldr r1, _LIT18
    ldr r0, [r0, #0xbb0]
    cmp r0, #0x0
    ldrne r2, _LIT19
    add r0, sp, #0x1c
    ldreq r2, _LIT20
    bl OS_SPrintf
    bl func_0208de24
    mov r2, r0
    add r0, r7, #0x3
    mov r4, #0xa
    mul r1, r0, r4
    str r1, [sp]
    ldr r0, _LIT6
    add r1, sp, #0x1c
    mov r3, #0x10
    str r4, [sp, #0x4]
    bl func_02004f6c
    ldr r1, _LIT0
    add r0, sp, #0x1c
    ldr r2, [r1, #0xc38]
    ldr r1, _LIT21
    bl OS_SPrintf
    bl func_0208de24
    mov r2, r0
    add r1, r7, #0x4
    mov r0, r4
    mul r3, r1, r0
    str r3, [sp]
    str r0, [sp, #0x4]
    ldr r0, _LIT6
    add r1, sp, #0x1c
    mov r3, #0x10
    bl func_02004f6c
    ldr r2, _LIT0
    ldr r3, _LIT22
    ldr r2, [r2, #0xb88]
    ldr r1, _LIT23
    ldr r2, [r3, r2, lsl #0x2]
    add r0, sp, #0x1c
    bl OS_SPrintf
    bl func_0208de24
    mov r2, r0
    add r1, r7, #0x5
    mov r0, r4
    mul r3, r1, r0
    str r3, [sp]
    str r0, [sp, #0x4]
    ldr r0, _LIT6
    add r1, sp, #0x1c
    mov r3, #0x10
    bl func_02004f6c
    ldr r2, _LIT0
    ldr r3, _LIT24
    ldr r2, [r2, #0xb84]
    ldr r1, _LIT25
    ldr r2, [r3, r2, lsl #0x2]
    add r0, sp, #0x1c
    bl OS_SPrintf
    bl func_0208de24
    mov r2, r0
    add r1, r7, #0x6
    mov r0, r4
    mul r3, r1, r0
    str r3, [sp]
    str r0, [sp, #0x4]
    ldr r0, _LIT6
    add r1, sp, #0x1c
    mov r3, #0x10
    bl func_02004f6c
    ldr r0, _LIT0
    ldr r0, [r0, #0xb8c]
    bl func_02011b58
    mov r2, r0
    ldr r1, _LIT26
    add r0, sp, #0x1c
    bl OS_SPrintf
    bl func_0208de24
    mov r2, r0
    add r1, r7, #0x7
    mov r0, r4
    mul r3, r1, r0
    str r3, [sp]
    str r0, [sp, #0x4]
    ldr r0, _LIT6
    add r1, sp, #0x1c
    mov r3, #0x10
    bl func_02004f6c
    ldr r0, _LIT0
    ldr r1, _LIT27
    ldr r0, [r0, #0xe64]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldrne r2, _LIT28
    add r0, sp, #0x1c
    ldreq r2, _LIT29
    bl OS_SPrintf
    bl func_0208de24
    mov r2, r0
    add r0, r7, #0x8
    mov r4, #0xa
    mul r1, r0, r4
    str r1, [sp]
    ldr r0, _LIT6
    add r1, sp, #0x1c
    mov r3, #0x10
    str r4, [sp, #0x4]
    bl func_02004f6c
    ldr r0, _LIT0
    ldr r1, _LIT30
    ldr r0, [r0, #0xe64]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    ldrne r2, _LIT28
    add r0, sp, #0x1c
    ldreq r2, _LIT29
    bl OS_SPrintf
    bl func_0208de24
    mov r2, r0
    add r0, r7, #0x9
    mov r4, #0xa
    mul r1, r0, r4
    str r1, [sp]
    ldr r0, _LIT6
    add r1, sp, #0x1c
    mov r3, #0x10
    str r4, [sp, #0x4]
    bl func_02004f6c
    bl func_0208de24
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
    bl func_02004f6c
.L_10e8:
    ldr r0, _LIT2
    ldrh r0, [r0, #0x54]
    tst r0, #0xc00
    beq .L_1114
    mov r0, #0x0
    bl func_02012578
    ldr r0, _LIT0
    ldr r1, [r0, #0xb6c]
    add r1, r1, #0x1
    str r1, [r0, #0xb6c]
    b .L_1208
.L_1114:
    tst r0, #0x3
    beq .L_1208
    ldr r0, _LIT0
    ldr r1, [r0, #0xb88]
    cmp r1, #0x3
    bne .L_113c
    ldr r0, [r0, #0xb8c]
    mov r1, #0x0
    bl func_0201252c
    b .L_11a0
.L_113c:
    ldr r1, [r0, #0xc40]
    cmp r1, #0x0
    beq .L_115c
    cmp r1, #0x1
    beq .L_1174
    cmp r1, #0x2
    beq .L_118c
    b .L_11a0
.L_115c:
    mov r1, #0x0
    str r1, [r0, #0xc3c]
    str r1, [r0, #0xc40]
    mov r1, #0x1
    str r1, [r0, #0xc44]
    b .L_11a0
.L_1174:
    mov r1, #0x0
    str r1, [r0, #0xc3c]
    mov r1, #0x1
    str r1, [r0, #0xc40]
    str r1, [r0, #0xc44]
    b .L_11a0
.L_118c:
    mov r2, #0x1
    str r2, [r0, #0xc3c]
    mov r1, #0x0
    str r1, [r0, #0xc44]
    str r2, [r0, #0xc40]
.L_11a0:
    ldr r0, _LIT0
    ldr r1, [r0, #0xbb0]
    cmp r1, #0x0
    beq .L_11c0
    ldr r0, [r0, #0xb88]
    cmp r0, #0x1
    ldreq r1, _LIT32
    beq .L_11c4
.L_11c0:
    mvn r1, #0x0
.L_11c4:
    ldr r0, _LIT0
    str r1, [r0, #0xbb4]
    ldr r1, [r0, #0xb6c]
    add r1, r1, #0x1
    str r1, [r0, #0xb6c]
    b .L_1208
.L_11dc:
    bl func_0202c158
    bl func_0202aeec
    bl func_02001b84
    ldr r1, _LIT0
    mov r2, #0x0
    ldr r0, _LIT33
    str r2, [r1, #0xba0]
    bl func_020057c0
    add sp, sp, #0x11c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1208:
    mov r0, #0x0
    add sp, sp, #0x11c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_02103fcc
_LIT1: .word data_0218fda0
_LIT2: .word data_02104acc
_LIT3: .word data_02104b90
_LIT4: .word 0x66666667
_LIT5: .word 0x0000ffff
_LIT6: .word data_02102bb0
_LIT7: .word data_020c57e4
_LIT8: .word data_020c57d0
_LIT9: .word data_020c57ec
_LIT10: .word data_02104e6c
_LIT11: .word data_021058a9
_LIT12: .word data_020c57fc
_LIT13: .word data_020c5810
_LIT14: .word data_020c5824
_LIT15: .word data_020c5838
_LIT16: .word data_020c584c
_LIT17: .word data_020c5854
_LIT18: .word data_020c5874
_LIT19: .word data_020c5864
_LIT20: .word data_020c586c
_LIT21: .word data_020c5880
_LIT22: .word data_020c4e08
_LIT23: .word data_020c588c
_LIT24: .word data_020c4f08
_LIT25: .word data_020c5894
_LIT26: .word data_020c589c
_LIT27: .word data_020c58b4
_LIT28: .word data_020c58ac
_LIT29: .word data_020c58b0
_LIT30: .word data_020c58cc
_LIT31: .word data_020c58e0
_LIT32: .word 0x00023280
_LIT33: .word func_020125e8
