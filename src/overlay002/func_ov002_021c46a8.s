; func_ov002_021c46a8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern data_ov002_022cf1a6
        .extern data_ov002_022cf1a8
        .extern data_ov002_022cf1ac
        .extern data_ov002_022d016c
        .extern data_ov002_022d0650
        .extern func_0202b8f0
        .extern func_0202b920
        .extern func_0202f218
        .extern func_ov002_021b3618
        .extern func_ov002_021b8fcc
        .extern func_ov002_021b9ecc
        .extern func_ov002_021bc000
        .extern func_ov002_021bd57c
        .extern func_ov002_021c2f24
        .extern func_ov002_021c4c9c
        .global func_ov002_021c46a8
        .arm
func_ov002_021c46a8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x2c
    mov sl, r0
    ldr r3, _LIT0
    and r4, sl, #0x1
    mul r7, r4, r3
    mov r9, r1
    mov r0, #0x14
    ldr r1, _LIT1
    ldr r3, _LIT2
    mul r6, r9, r0
    ldr r4, _LIT3
    add r1, r1, r7
    add r0, r4, r7
    ldr r0, [r6, r0]
    add r1, r1, r6
    add fp, r3, r7
    ldr r3, [r1, #0x30]
    mov r4, r0, lsr #0x2
    mov r1, r0, lsr #0x6
    orr r4, r4, r0, lsr #0x1
    mov r0, r3, lsl #0x13
    and r3, r4, #0x1
    and r1, r1, #0x1
    ldrh r4, [fp, r6]
    mov r0, r0, lsr #0x13
    mov r8, r2
    mvn r1, r1
    and r2, r4, r1
    mvn r1, r3
    str r0, [r8]
    and r4, r2, r1
    mov r5, #0x0
    bl func_0202b8f0
    str r0, [r8, #0x1c]
    ldr r0, [r8]
    bl func_0202b920
    str r0, [r8, #0x20]
    ldrh r0, [fp, r6]
    cmp r0, #0x0
    addeq sp, sp, #0x2c
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, sl
    mov r1, r9
    bl func_ov002_021b9ecc
    ldr r1, _LIT4
    str r0, [r8]
    cmp r0, r1
    bgt .L_a6c
    bge .L_c2c
    ldr r3, _LIT5
    cmp r0, r3
    bgt .L_a34
    bge .L_b94
    sub r2, r3, #0x1c4
    cmp r0, r2
    bgt .L_a24
    mov r1, r2
    cmp r0, r1
    bge .L_b6c
    ldr r1, _LIT6
    cmp r0, r1
    beq .L_b0c
    b .L_db4
.L_a24:
    sub r1, r1, #0x368
    cmp r0, r1
    moveq r5, #0x1
    b .L_db4
.L_a34:
    sub r2, r1, #0x5b
    cmp r0, r2
    bgt .L_a5c
    sub r1, r1, #0x5b
    cmp r0, r1
    bge .L_bd8
    add r1, r3, #0xf9
    cmp r0, r1
    beq .L_bb0
    b .L_db4
.L_a5c:
    sub r1, r1, #0x2c
    cmp r0, r1
    beq .L_bf4
    b .L_db4
.L_a6c:
    add r2, r1, #0xb7
    cmp r0, r2
    bgt .L_ac8
    bge .L_cc0
    add r2, r1, #0x61
    cmp r0, r2
    bgt .L_ab8
    bge .L_c6c
    add r2, r1, #0x50
    cmp r0, r2
    bgt .L_db4
    add r2, r1, #0x4c
    cmp r0, r2
    blt .L_db4
    beq .L_c48
    add r1, r1, #0x50
    cmp r0, r1
    beq .L_ca4
    b .L_db4
.L_ab8:
    add r1, r1, #0x97
    cmp r0, r1
    beq .L_ca4
    b .L_db4
.L_ac8:
    ldr r2, _LIT7
    cmp r0, r2
    bgt .L_ae8
    bge .L_d6c
    sub r1, r2, #0x1b
    cmp r0, r1
    beq .L_ce4
    b .L_db4
.L_ae8:
    add r1, r2, #0x31
    cmp r0, r1
    bgt .L_afc
    beq .L_d0c
    b .L_db4
.L_afc:
    add r1, r2, #0x61
    cmp r0, r1
    beq .L_d44
    b .L_db4
.L_b0c:
    ldr r0, _LIT8
    add r0, r0, r7
    ldr r1, [r6, r0]
    cmp r1, #0x0
    beq .L_db4
    ldr r0, _LIT9
    ldr r0, [r0, #0xcf0]
    cmp r0, r1
    ldr r0, [r8, #0x1c]
    bls .L_b4c
    mov r0, r0, lsl #0x1
    str r0, [r8, #0x1c]
    ldr r0, [r8, #0x20]
    mov r0, r0, lsl #0x1
    str r0, [r8, #0x20]
    b .L_db4
.L_b4c:
    add r0, r0, #0x1
    mov r0, r0, asr #0x1
    str r0, [r8, #0x1c]
    ldr r0, [r8, #0x20]
    add r0, r0, #0x1
    mov r0, r0, asr #0x1
    str r0, [r8, #0x20]
    b .L_db4
.L_b6c:
    mov r0, sl
    mov r1, r9
    bl func_ov002_021b8fcc
    cmp r0, #0x0
    beq .L_db4
    mov r0, #0x640
    str r0, [r8, #0x1c]
    add r0, r0, #0xc8
    str r0, [r8, #0x20]
    b .L_db4
.L_b94:
    mov r0, sl
    mov r1, r9
    bl func_ov002_021b8fcc
    cmp r0, #0x0
    ldrne r0, _LIT10
    strne r0, [r8, #0x20]
    b .L_db4
.L_bb0:
    mov r0, sl
    mov r1, r9
    bl func_ov002_021b8fcc
    cmp r0, #0x0
    beq .L_db4
    ldr r1, _LIT11
    mov r0, #0x1f4
    str r1, [r8, #0x1c]
    str r0, [r8, #0x20]
    b .L_db4
.L_bd8:
    mov r0, sl
    mov r1, r9
    bl func_ov002_021b8fcc
    cmp r0, #0x0
    movne r0, #0x7d0
    strne r0, [r8, #0x20]
    b .L_db4
.L_bf4:
    ldr r0, _LIT8
    add r0, r0, r7
    ldr r0, [r6, r0]
    cmp r0, #0x0
    beq .L_db4
    ldr r0, [r8, #0x1c]
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    str r0, [r8, #0x1c]
    ldr r0, [r8, #0x20]
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    str r0, [r8, #0x20]
    b .L_db4
.L_c2c:
    ldr r0, _LIT8
    add r0, r0, r7
    ldr r0, [r6, r0]
    cmp r0, #0x0
    movne r0, #0x7d0
    strne r0, [r8, #0x1c]
    b .L_db4
.L_c48:
    cmp r4, #0x0
    beq .L_db4
    mov r0, sl
    mov r1, #0x6
    bl func_ov002_021bd57c
    mov r1, #0x2bc
    mul r1, r0, r1
    str r1, [r8, #0x20]
    b .L_db4
.L_c6c:
    cmp r4, #0x0
    beq .L_db4
    ldr r1, _LIT12
    mov r0, sl
    bl func_ov002_021c2f24
    mov r4, r0
    ldr r1, _LIT13
    mov r0, sl
    bl func_ov002_021c2f24
    mov r1, #0x3e8
    mul r2, r0, r1
    mla r0, r4, r1, r2
    str r0, [r8, #0x1c]
    b .L_db4
.L_ca4:
    ldr r0, _LIT8
    add r1, r0, r7
    ldr r0, [r1, r6]
    str r0, [r8, #0x1c]
    ldr r0, [r1, r6]
    str r0, [r8, #0x20]
    b .L_db4
.L_cc0:
    cmp r4, #0x0
    beq .L_db4
    mov r0, sl
    mov r1, #0x9
    bl func_ov002_021bd57c
    mov r1, #0x3e8
    mul r1, r0, r1
    str r1, [r8, #0x1c]
    b .L_db4
.L_ce4:
    ldr r0, _LIT8
    add r0, r0, r7
    ldr r0, [r6, r0]
    cmp r0, #0x0
    beq .L_db4
    ldr r1, [r8, #0x1c]
    ldr r0, [r8, #0x20]
    str r0, [r8, #0x1c]
    str r1, [r8, #0x20]
    b .L_db4
.L_d0c:
    cmp r4, #0x0
    beq .L_db4
    ldr r1, _LIT14
    mov r0, sl
    bl func_ov002_021bc000
    cmp r0, #0x2
    blt .L_db4
    ldr r0, [r8, #0x1c]
    mov r0, r0, lsl #0x1
    str r0, [r8, #0x1c]
    ldr r0, [r8, #0x20]
    mov r0, r0, lsl #0x1
    str r0, [r8, #0x20]
    b .L_db4
.L_d44:
    ldr r1, _LIT8
    mov r0, #0x320
    add r3, r1, r7
    ldr r1, [r3, r6]
    mul r2, r1, r0
    str r2, [r8, #0x1c]
    ldr r1, [r3, r6]
    mul r0, r1, r0
    str r0, [r8, #0x20]
    b .L_db4
.L_d6c:
    mov r0, sl
    mov r1, r9
    bl func_ov002_021b3618
    ldr r1, _LIT15
    cmp r0, r1
    beq .L_db0
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    add r2, sp, #0x0
    and r0, r0, #0xff
    and r1, r1, #0xff
    bl func_ov002_021c4c9c
    ldr r0, [sp, #0x14]
    str r0, [r8, #0x1c]
    ldr r0, [sp, #0x18]
    str r0, [r8, #0x20]
.L_db0:
    mov r5, #0x1
.L_db4:
    ldr r0, _LIT16
    add r0, r0, r7
    ldrh r3, [r6, r0]
    cmp r3, #0x0
    addeq sp, sp, #0x2c
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr fp, _LIT17
    ldr r0, _LIT18
    add r7, fp, #0x1f
    ldr sl, _LIT19
    ldr r9, _LIT20
    mov ip, #0xc8
    add r4, fp, #0x6
    mov r6, r7
.L_dec:
    add r1, r0, r3, lsl #0x3
    ldrh lr, [r1, #0x2]
    mov r2, r3, lsl #0x3
    ldrh r2, [r0, r2]
    mov r3, lr, lsl #0x1c
    mov lr, r3, lsr #0x1c
    cmp lr, #0x2
    cmpne lr, #0x4
    ldrh r3, [r1, #0x6]
    cmpne lr, #0x5
    bne .L_eb0
    cmp r2, fp
    bgt .L_e44
    bge .L_e88
    cmp r2, sl
    bgt .L_e34
    beq .L_e6c
    b .L_eb0
.L_e34:
    cmp r2, r9
    ldreqh r1, [r1, #0x4]
    streq r1, [r8, #0x1c]
    b .L_eb0
.L_e44:
    cmp r2, r7
    bgt .L_e60
    cmp r2, r6
    bge .L_eac
    cmp r2, r4
    beq .L_e88
    b .L_eb0
.L_e60:
    ldr r1, _LIT21
    cmp r2, r1
    bne .L_eb0
.L_e6c:
    cmp r5, #0x0
    bne .L_eb0
    ldr r2, [r8, #0x1c]
    ldr r1, [r8, #0x20]
    str r1, [r8, #0x1c]
    str r2, [r8, #0x20]
    b .L_eb0
.L_e88:
    add r2, r0, r3, lsl #0x3
    ldrh r1, [r2, #0x4]
    str r1, [r8, #0x1c]
    ldrh r1, [r2, #0x6]
    add r2, r0, r1, lsl #0x3
    ldrh r1, [r2, #0x4]
    str r1, [r8, #0x20]
    ldrh r3, [r2, #0x6]
    b .L_eb0
.L_eac:
    str ip, [r8, #0x1c]
.L_eb0:
    cmp r3, #0x0
    bne .L_dec
    add sp, sp, #0x2c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022cf1a4
_LIT3: .word data_ov002_022cf1ac
_LIT4: .word 0x00001864
_LIT5: .word 0x00001636
_LIT6: .word 0x0000120e
_LIT7: .word 0x000019ed
_LIT8: .word data_ov002_022cf1a8
_LIT9: .word data_ov002_022d016c
_LIT10: .word 0x00000bb8
_LIT11: .word 0x00000708
_LIT12: .word 0x00000fbe
_LIT13: .word 0x000018c5
_LIT14: .word func_0202f218
_LIT15: .word 0x0000ffff
_LIT16: .word data_ov002_022cf1a6
_LIT17: .word 0x00001602
_LIT18: .word data_ov002_022d0650
_LIT19: .word 0x000012cb
_LIT20: .word 0x000014b0
_LIT21: .word 0x000019f1
