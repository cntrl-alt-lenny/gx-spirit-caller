; func_ov002_022a74e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104bac
        .extern data_02104f50
        .extern data_ov002_022ca480
        .extern data_ov002_022ca490
        .extern data_ov002_022ca4a0
        .extern data_ov002_022ca4b0
        .extern data_ov002_022cd73c
        .extern data_ov002_022d0f2c
        .extern data_ov002_022d11bc
        .extern data_ov002_022d1910
        .extern data_ov002_022d1a48
        .extern data_ov002_022d1a9c
        .extern func_02037208
        .extern func_ov002_0229da1c
        .extern func_ov002_0229e010
        .extern func_ov002_022a1870
        .extern func_ov002_022a6e04
        .extern func_ov002_022a6fec
        .extern func_ov002_022a82d4
        .extern func_ov002_022a8454
        .extern func_ov002_022aa7b8
        .extern func_ov002_022ae718
        .extern func_ov002_022aea30
        .extern func_ov002_022aead0
        .extern func_ov002_022aeb60
        .extern func_ov002_022aebec
        .global func_ov002_022a74e0
        .arm
func_ov002_022a74e0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x4c
    ldr r1, _LIT0
    mov r4, r0
    ldr r1, [r1, #0xd4]
    mov r0, #0x0
    str r0, [sp, #0x4]
    cmp r1, #0x0
    movgt r0, #0x1
    cmp r0, #0x0
    addne sp, sp, #0x4c
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    add r7, r4, #0x500
    ldrh r0, [r7, #0x90]
    ldr r9, _LIT1
    strh r0, [sp, #0x8]
    ldrh r0, [r9, #0x52]
    tst r0, #0x4
    bne .L_e70
    ldr r2, _LIT2
    ldr r3, _LIT3
    ldr r8, _LIT4
    mov fp, #0x1
    add r1, sp, #0x8
    mvn r6, #0x0
    mov lr, #0xcc
.L_82c:
    ldrh r0, [r9, #0x56]
    tst r0, #0x40
    beq .L_9e8
    ldrh r5, [sp, #0x8]
    ldr r0, [r8, #0x4]
    eor r0, r0, #0x1
    mov sl, r5, lsl #0x1f
    cmp r0, sl, lsr #0x1f
    mov r0, r5, lsl #0x1a
    moveq r0, r0, lsr #0x1b
    ldreqsb ip, [r3, r0]
    movne r0, r0, lsr #0x1b
    ldrh sl, [r1]
    ldrnesb ip, [r2, r0]
    bic r0, sl, #0x1
    cmp ip, #0x0
    movlt r5, fp
    movge r5, #0x0
    mov sl, sl, lsl #0x1f
    eor r5, r5, sl, lsr #0x1f
    and r5, r5, #0x1
    orr r0, r0, r5
    cmp ip, #0x0
    strh r0, [r1]
    sublt ip, r6, ip
    ldrh r0, [sp, #0x8]
    mov r5, ip, lsl #0x10
    mov r5, r5, lsr #0x10
    bic sl, r0, #0x3e
    mov r0, r5, lsl #0x1b
    orr r0, sl, r0, lsr #0x1a
    strh r0, [sp, #0x8]
    ldrh r0, [sp, #0x8]
    bic r0, r0, #0x3fc0
    strh r0, [sp, #0x8]
    ldrh r0, [sp, #0x8]
    mov r5, r0, lsl #0x1a
    mov r5, r5, lsr #0x1b
    cmp r5, #0xb
    bne .L_960
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mul r5, r0, lr
    add r0, r4, r5
    ldr r0, [r0, #0x484]
    cmp r0, #0x0
    ldreqh r0, [sp, #0x8]
    streqh r0, [r7, #0x90]
    beq .L_82c
    add r2, r4, #0x500
    ldrh r3, [r2, #0x90]
    add r0, sp, #0x24
    mov r1, r4
    mov r3, r3, lsl #0x12
    mov r3, r3, lsr #0x18
    str r3, [sp]
    ldrh r2, [r2, #0x90]
    mov r3, r2, lsl #0x1a
    mov r6, r2, lsl #0x1f
    mov r2, r6, lsr #0x1f
    mov r3, r3, lsr #0x1b
    bl func_ov002_022a6e04
    add r0, r4, #0x3e0
    ldr r1, [sp, #0x24]
    ldr r2, [sp, #0x28]
    add r0, r0, r5
    str r1, [sp, #0x44]
    str r2, [sp, #0x48]
    bl func_ov002_0229e010
    ldrh r1, [sp, #0x8]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x3fc0
    mov r0, r0, lsl #0x18
    orr r0, r1, r0, lsr #0x12
    strh r0, [sp, #0x8]
    b .L_9e8
.L_960:
    add r2, r4, #0x500
    ldrh r0, [r2, #0x90]
    mov r0, r0, lsl #0x1a
    mov r0, r0, lsr #0x1b
    cmp r0, #0xb
    bne .L_9e8
    ldrh r3, [r2, #0x90]
    add r0, sp, #0x1c
    mov r1, r4
    mov r3, r3, lsl #0x12
    mov r3, r3, lsr #0x18
    str r3, [sp]
    ldrh r2, [r2, #0x90]
    mov r3, r2, lsl #0x1a
    mov r5, r2, lsl #0x1f
    mov r2, r5, lsr #0x1f
    mov r3, r3, lsr #0x1b
    bl func_ov002_022a6e04
    ldrh r0, [sp, #0x8]
    ldr r2, [sp, #0x1c]
    ldr r3, [sp, #0x20]
    mov r1, r0, lsl #0x1f
    mov r0, r4
    mov r1, r1, lsr #0x1f
    str r2, [sp, #0x3c]
    str r3, [sp, #0x40]
    bl func_ov002_022a6fec
    ldrh r1, [sp, #0x8]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x3e
    mov r0, r0, lsl #0x1b
    orr r0, r1, r0, lsr #0x1a
    strh r0, [sp, #0x8]
.L_9e8:
    ldr r2, _LIT3
    ldr r3, _LIT2
    ldr sl, _LIT4
    ldr fp, _LIT1
    add r7, r4, #0x500
    mov lr, #0x1
    add r1, sp, #0x8
    mvn r9, #0x0
    mov r8, #0xcc
.L_a0c:
    ldrh r0, [fp, #0x56]
    tst r0, #0x80
    beq .L_bc8
    ldrh r5, [sp, #0x8]
    ldr r0, [sl, #0x4]
    ldrh ip, [r1]
    eor r0, r0, #0x1
    mov r6, r5, lsl #0x1f
    cmp r0, r6, lsr #0x1f
    mov r0, r5, lsl #0x1a
    moveq r0, r0, lsr #0x1b
    ldreqsb r6, [r3, r0]
    movne r0, r0, lsr #0x1b
    ldrnesb r6, [r2, r0]
    bic r0, ip, #0x1
    mov ip, ip, lsl #0x1f
    cmp r6, #0x0
    movlt r5, lr
    movge r5, #0x0
    eor r5, r5, ip, lsr #0x1f
    and r5, r5, #0x1
    orr r0, r0, r5
    cmp r6, #0x0
    strh r0, [r1]
    sublt r6, r9, r6
    mov r5, r6, lsl #0x10
    ldrh r0, [sp, #0x8]
    mov r5, r5, lsr #0x10
    bic r6, r0, #0x3e
    mov r0, r5, lsl #0x1b
    orr r0, r6, r0, lsr #0x1a
    strh r0, [sp, #0x8]
    ldrh r0, [sp, #0x8]
    bic r0, r0, #0x3fc0
    strh r0, [sp, #0x8]
    ldrh r0, [sp, #0x8]
    mov r5, r0, lsl #0x1a
    mov r5, r5, lsr #0x1b
    cmp r5, #0xb
    bne .L_b40
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mul r5, r0, r8
    add r0, r4, r5
    ldr r0, [r0, #0x484]
    cmp r0, #0x0
    ldreqh r0, [sp, #0x8]
    streqh r0, [r7, #0x90]
    beq .L_a0c
    add r2, r4, #0x500
    ldrh r3, [r2, #0x90]
    add r0, sp, #0x14
    mov r1, r4
    mov r3, r3, lsl #0x12
    mov r3, r3, lsr #0x18
    str r3, [sp]
    ldrh r2, [r2, #0x90]
    mov r3, r2, lsl #0x1a
    mov r6, r2, lsl #0x1f
    mov r2, r6, lsr #0x1f
    mov r3, r3, lsr #0x1b
    bl func_ov002_022a6e04
    add r0, r4, #0x3e0
    ldr r1, [sp, #0x14]
    ldr r2, [sp, #0x18]
    add r0, r0, r5
    str r1, [sp, #0x34]
    str r2, [sp, #0x38]
    bl func_ov002_0229e010
    ldrh r1, [sp, #0x8]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x3fc0
    mov r0, r0, lsl #0x18
    orr r0, r1, r0, lsr #0x12
    strh r0, [sp, #0x8]
    b .L_bc8
.L_b40:
    add r2, r4, #0x500
    ldrh r0, [r2, #0x90]
    mov r0, r0, lsl #0x1a
    mov r0, r0, lsr #0x1b
    cmp r0, #0xb
    bne .L_bc8
    ldrh r3, [r2, #0x90]
    add r0, sp, #0xc
    mov r1, r4
    mov r3, r3, lsl #0x12
    mov r3, r3, lsr #0x18
    str r3, [sp]
    ldrh r2, [r2, #0x90]
    mov r3, r2, lsl #0x1a
    mov r5, r2, lsl #0x1f
    mov r2, r5, lsr #0x1f
    mov r3, r3, lsr #0x1b
    bl func_ov002_022a6e04
    ldrh r0, [sp, #0x8]
    ldr r2, [sp, #0xc]
    ldr r3, [sp, #0x10]
    mov r1, r0, lsl #0x1f
    mov r0, r4
    mov r1, r1, lsr #0x1f
    str r2, [sp, #0x2c]
    str r3, [sp, #0x30]
    bl func_ov002_022a6fec
    ldrh r1, [sp, #0x8]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x3e
    mov r0, r0, lsl #0x1b
    orr r0, r1, r0, lsr #0x1a
    strh r0, [sp, #0x8]
.L_bc8:
    ldrh r5, [sp, #0x8]
    mov r0, r5, lsl #0x1a
    mov r3, r0, lsr #0x1b
    cmp r3, #0xb
    bne .L_cc4
    mov r0, r5, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r1, #0xcc
    mul r2, r0, r1
    add r1, r4, r2
    ldr r1, [r1, #0x484]
    cmp r1, #0x0
    beq .L_cac
    ldr r3, _LIT1
    mov r5, r5, lsl #0x12
    ldrh r6, [r3, #0x56]
    mov r5, r5, lsr #0x18
    tst r6, #0x20
    beq .L_c2c
    ldr r3, _LIT4
    ldr r3, [r3, #0x4]
    eor r3, r3, #0x1
    cmp r0, r3
    addeq r5, r5, #0x1
    subne r5, r5, #0x1
.L_c2c:
    tst r6, #0x10
    beq .L_c4c
    ldr r3, _LIT4
    ldr r3, [r3, #0x4]
    eor r3, r3, #0x1
    cmp r0, r3
    subeq r5, r5, #0x1
    addne r5, r5, #0x1
.L_c4c:
    cmp r5, #0x0
    sublt r5, r1, #0x1
    cmp r5, r1
    movge r5, #0x0
    add r0, r4, #0x3e0
    mov r1, r5
    add r0, r0, r2
    bl func_ov002_0229da1c
    cmp r0, #0x0
    beq .L_c80
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_022a82d4
.L_c80:
    ldrh r1, [sp, #0x8]
    mov r0, r5, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x3fc0
    mov r0, r0, lsl #0x18
    orr r0, r1, r0, lsr #0x12
    strh r0, [sp, #0x8]
    ldrh r0, [sp, #0x8]
    orr r0, r0, #0x4000
    strh r0, [sp, #0x8]
    b .L_df4
.L_cac:
    bic r0, r5, #0x3fc0
    strh r0, [sp, #0x8]
    ldrh r0, [sp, #0x8]
    bic r0, r0, #0x4000
    strh r0, [sp, #0x8]
    b .L_df4
.L_cc4:
    ldr r0, _LIT1
    ldrh r0, [r0, #0x56]
    tst r0, #0x20
    beq .L_d54
    ldr r1, _LIT4
    mov r2, r5, lsl #0x1f
    ldr r1, [r1, #0x4]
    eor r1, r1, #0x1
    cmp r1, r2, lsr #0x1f
    ldreq r1, _LIT5
    ldrne r1, _LIT6
    ldrsb r6, [r1, r3]
    add r3, sp, #0x8
    ldrh r2, [r3]
    cmp r6, #0x0
    movlt r5, #0x1
    movge r5, #0x0
    mov r1, r2, lsl #0x1f
    eor r1, r5, r1, lsr #0x1f
    bic r2, r2, #0x1
    and r1, r1, #0x1
    orr r1, r2, r1
    strh r1, [r3]
    cmp r6, #0x0
    mvnlt r1, #0x0
    sublt r6, r1, r6
    ldrh r2, [sp, #0x8]
    mov r1, r6, lsl #0x10
    mov r1, r1, lsr #0x10
    bic r2, r2, #0x3e
    mov r1, r1, lsl #0x1b
    orr r1, r2, r1, lsr #0x1a
    strh r1, [sp, #0x8]
    ldrh r1, [sp, #0x8]
    bic r1, r1, #0x3fc0
    strh r1, [sp, #0x8]
.L_d54:
    tst r0, #0x10
    beq .L_de8
    ldr r0, _LIT4
    ldrh r1, [sp, #0x8]
    ldr r0, [r0, #0x4]
    mov r2, r1, lsl #0x1f
    eor r0, r0, #0x1
    cmp r0, r2, lsr #0x1f
    ldreq r0, _LIT6
    mov r1, r1, lsl #0x1a
    ldrne r0, _LIT5
    mov r1, r1, lsr #0x1b
    ldrsb r5, [r0, r1]
    add r2, sp, #0x8
    ldrh r1, [r2]
    cmp r5, #0x0
    movlt r3, #0x1
    movge r3, #0x0
    mov r0, r1, lsl #0x1f
    eor r0, r3, r0, lsr #0x1f
    bic r1, r1, #0x1
    and r0, r0, #0x1
    orr r0, r1, r0
    strh r0, [r2]
    cmp r5, #0x0
    mvnlt r0, #0x0
    sublt r5, r0, r5
    ldrh r1, [sp, #0x8]
    mov r0, r5, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x3e
    mov r0, r0, lsl #0x1b
    orr r0, r1, r0, lsr #0x1a
    strh r0, [sp, #0x8]
    ldrh r0, [sp, #0x8]
    bic r0, r0, #0x3fc0
    strh r0, [sp, #0x8]
.L_de8:
    ldrh r0, [sp, #0x8]
    orr r0, r0, #0x4000
    strh r0, [sp, #0x8]
.L_df4:
    add r0, r4, #0x500
    ldrh r3, [sp, #0x8]
    ldrh r2, [r0, #0x90]
    mov r0, r3, lsl #0x1f
    mov r1, r0, lsr #0x1f
    mov r0, r2, lsl #0x1f
    cmp r1, r0, lsr #0x1f
    bne .L_e3c
    mov r0, r3, lsl #0x1a
    mov r1, r0, lsr #0x1b
    mov r0, r2, lsl #0x1a
    cmp r1, r0, lsr #0x1b
    bne .L_e3c
    mov r0, r3, lsl #0x12
    mov r1, r0, lsr #0x18
    mov r0, r2, lsl #0x12
    cmp r1, r0, lsr #0x18
    beq .L_e70
.L_e3c:
    ldr r1, _LIT7
    mov r2, #0x1
    mov r0, #0x38
    str r2, [r1, #0x20]
    rsb r6, r2, #0x10000
    ldr r5, _LIT8
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x3
    strh r6, [r5, #0xec]
    bl func_02037208
    mov r0, #0x1
    str r0, [sp, #0x4]
.L_e70:
    ldrh r2, [sp, #0x8]
    mov r0, r2, lsl #0x1a
    mov r0, r0, lsr #0x1b
    cmp r0, #0xb
    bne .L_eb8
    mov r0, r2, lsl #0x1f
    mov r1, r0, lsr #0x1f
    mov r0, #0xcc
    mla r0, r1, r0, r4
    ldr r0, [r0, #0x484]
    cmp r0, #0x0
    bne .L_eb8
    bic r0, r2, #0x3e
    orr r0, r0, #0xe
    strh r0, [sp, #0x8]
    ldrh r0, [sp, #0x8]
    bic r0, r0, #0x3fc0
    strh r0, [sp, #0x8]
.L_eb8:
    ldrh r2, [sp, #0x8]
    add r1, r4, #0x500
    ldr r0, [sp, #0x4]
    strh r2, [r1, #0x94]
    cmp r0, #0x0
    strh r2, [r1, #0x90]
    addne sp, sp, #0x4c
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT9
    ldrh r1, [r0]
    cmp r1, #0x0
    addeq sp, sp, #0x4c
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r2, _LIT1
    ldrh r5, [r2, #0x52]
    ldrh r1, [r2, #0x50]
    mvn r3, r5
    eor r1, r5, r1
    and r1, r3, r1
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    tst r1, #0x1
    beq .L_f40
    mov r0, r4
    bl func_ov002_022a8454
    cmp r0, #0x0
    beq .L_f30
    ldr r0, _LIT9
    bl func_ov002_022aead0
    b .L_101c
.L_f30:
    ldr r0, _LIT9
    mov r1, #0x1
    bl func_ov002_022aea30
    b .L_101c
.L_f40:
    ldrh r1, [r2, #0x54]
    tst r1, #0x400
    beq .L_f54
    bl func_ov002_022aeb60
    b .L_101c
.L_f54:
    tst r1, #0x2
    beq .L_f7c
    ldr r1, _LIT0
    ldr r1, [r1, #0xc8]
    cmp r1, #0x0
    beq .L_f74
    bl func_ov002_022aeb60
    b .L_101c
.L_f74:
    bl func_ov002_022aebec
    b .L_101c
.L_f7c:
    tst r1, #0x300
    beq .L_101c
    bl func_ov002_022ae718
    cmp r0, #0x0
    beq .L_1004
    ldr r0, _LIT4
    ldrh r1, [sp, #0x8]
    ldr r0, [r0, #0x4]
    ldr r3, _LIT7
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x1
    and r0, r0, #0x1
    orr r0, r1, r0
    strh r0, [sp, #0x8]
    ldrh r0, [sp, #0x8]
    add r1, r4, #0x500
    mov r6, #0x1
    bic r0, r0, #0x3e
    orr r0, r0, #0x1a
    strh r0, [sp, #0x8]
    ldrh r5, [sp, #0x8]
    ldr r2, _LIT8
    ldr r0, _LIT9
    bic r5, r5, #0x3fc0
    strh r5, [sp, #0x8]
    ldrh r7, [sp, #0x8]
    rsb r5, r6, #0x10000
    strh r7, [r1, #0x94]
    strh r7, [r1, #0x90]
    str r6, [r3, #0x20]
    strh r5, [r2, #0xec]
    bl func_ov002_022aead0
    b .L_101c
.L_1004:
    ldr r0, _LIT10
    bl func_ov002_022a1870
    cmp r0, #0x0
    bne .L_101c
    ldr r0, _LIT9
    bl func_ov002_022aeb60
.L_101c:
    ldr r0, _LIT1
    ldrh r1, [r0, #0x52]
    tst r1, #0x4
    addeq sp, sp, #0x4c
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrh r3, [r0, #0x54]
    tst r3, #0xf0
    addeq sp, sp, #0x4c
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    tst r3, #0x30
    beq .L_106c
    ldr r2, _LIT11
    ldr r1, [r2]
    mov r0, r1, lsl #0x1b
    mov r0, r0, lsr #0x1e
    eor r0, r0, #0x1
    bic r1, r1, #0x18
    mov r0, r0, lsl #0x1e
    orr r0, r1, r0, lsr #0x1b
    str r0, [r2]
.L_106c:
    tst r3, #0xc0
    beq .L_1098
    ldr r2, _LIT11
    ldr r1, [r2]
    mov r0, r1, lsl #0x1b
    mov r0, r0, lsr #0x1e
    eor r0, r0, #0x2
    bic r1, r1, #0x18
    mov r0, r0, lsl #0x1e
    orr r0, r1, r0, lsr #0x1b
    str r0, [r2]
.L_1098:
    mov r0, r4
    bl func_ov002_022aa7b8
    ldr r0, _LIT7
    mov r1, #0x0
    str r1, [r0]
    add sp, sp, #0x4c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022d0f2c
_LIT1: .word data_02104bac
_LIT2: .word data_ov002_022ca4a0
_LIT3: .word data_ov002_022ca4b0
_LIT4: .word data_ov002_022cd73c
_LIT5: .word data_ov002_022ca490
_LIT6: .word data_ov002_022ca480
_LIT7: .word data_ov002_022d1a48
_LIT8: .word data_ov002_022d1910
_LIT9: .word data_ov002_022d1a9c
_LIT10: .word data_ov002_022d11bc
_LIT11: .word data_02104f50
