; func_ov002_022a73a4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104acc
        .extern data_02104e70
        .extern data_ov002_022ca370
        .extern data_ov002_022ca380
        .extern data_ov002_022ca390
        .extern data_ov002_022ca3a0
        .extern data_ov002_022cd65c
        .extern data_ov002_022d0e4c
        .extern data_ov002_022d10dc
        .extern data_ov002_022d1830
        .extern data_ov002_022d1968
        .extern data_ov002_022d19bc
        .extern func_020371b8
        .extern func_ov002_0229d90c
        .extern func_ov002_0229df00
        .extern func_ov002_022a1760
        .extern func_ov002_022a6cc8
        .extern func_ov002_022a6eb0
        .extern func_ov002_022a8198
        .extern func_ov002_022a8318
        .extern func_ov002_022aa67c
        .extern func_ov002_022ae5dc
        .extern func_ov002_022ae8f4
        .extern func_ov002_022ae994
        .extern func_ov002_022aea24
        .extern func_ov002_022aeab0
        .global func_ov002_022a73a4
        .arm
func_ov002_022a73a4:
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
    bne .L_6ac
    ldr r2, _LIT2
    ldr r3, _LIT3
    ldr r8, _LIT4
    mov fp, #0x1
    add r1, sp, #0x8
    mvn r6, #0x0
    mov lr, #0xcc
.L_68:
    ldrh r0, [r9, #0x56]
    tst r0, #0x40
    beq .L_224
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
    bne .L_19c
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mul r5, r0, lr
    add r0, r4, r5
    ldr r0, [r0, #0x484]
    cmp r0, #0x0
    ldreqh r0, [sp, #0x8]
    streqh r0, [r7, #0x90]
    beq .L_68
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
    bl func_ov002_022a6cc8
    add r0, r4, #0x3e0
    ldr r1, [sp, #0x24]
    ldr r2, [sp, #0x28]
    add r0, r0, r5
    str r1, [sp, #0x44]
    str r2, [sp, #0x48]
    bl func_ov002_0229df00
    ldrh r1, [sp, #0x8]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x3fc0
    mov r0, r0, lsl #0x18
    orr r0, r1, r0, lsr #0x12
    strh r0, [sp, #0x8]
    b .L_224
.L_19c:
    add r2, r4, #0x500
    ldrh r0, [r2, #0x90]
    mov r0, r0, lsl #0x1a
    mov r0, r0, lsr #0x1b
    cmp r0, #0xb
    bne .L_224
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
    bl func_ov002_022a6cc8
    ldrh r0, [sp, #0x8]
    ldr r2, [sp, #0x1c]
    ldr r3, [sp, #0x20]
    mov r1, r0, lsl #0x1f
    mov r0, r4
    mov r1, r1, lsr #0x1f
    str r2, [sp, #0x3c]
    str r3, [sp, #0x40]
    bl func_ov002_022a6eb0
    ldrh r1, [sp, #0x8]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x3e
    mov r0, r0, lsl #0x1b
    orr r0, r1, r0, lsr #0x1a
    strh r0, [sp, #0x8]
.L_224:
    ldr r2, _LIT3
    ldr r3, _LIT2
    ldr sl, _LIT4
    ldr fp, _LIT1
    add r7, r4, #0x500
    mov lr, #0x1
    add r1, sp, #0x8
    mvn r9, #0x0
    mov r8, #0xcc
.L_248:
    ldrh r0, [fp, #0x56]
    tst r0, #0x80
    beq .L_404
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
    bne .L_37c
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mul r5, r0, r8
    add r0, r4, r5
    ldr r0, [r0, #0x484]
    cmp r0, #0x0
    ldreqh r0, [sp, #0x8]
    streqh r0, [r7, #0x90]
    beq .L_248
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
    bl func_ov002_022a6cc8
    add r0, r4, #0x3e0
    ldr r1, [sp, #0x14]
    ldr r2, [sp, #0x18]
    add r0, r0, r5
    str r1, [sp, #0x34]
    str r2, [sp, #0x38]
    bl func_ov002_0229df00
    ldrh r1, [sp, #0x8]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x3fc0
    mov r0, r0, lsl #0x18
    orr r0, r1, r0, lsr #0x12
    strh r0, [sp, #0x8]
    b .L_404
.L_37c:
    add r2, r4, #0x500
    ldrh r0, [r2, #0x90]
    mov r0, r0, lsl #0x1a
    mov r0, r0, lsr #0x1b
    cmp r0, #0xb
    bne .L_404
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
    bl func_ov002_022a6cc8
    ldrh r0, [sp, #0x8]
    ldr r2, [sp, #0xc]
    ldr r3, [sp, #0x10]
    mov r1, r0, lsl #0x1f
    mov r0, r4
    mov r1, r1, lsr #0x1f
    str r2, [sp, #0x2c]
    str r3, [sp, #0x30]
    bl func_ov002_022a6eb0
    ldrh r1, [sp, #0x8]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x3e
    mov r0, r0, lsl #0x1b
    orr r0, r1, r0, lsr #0x1a
    strh r0, [sp, #0x8]
.L_404:
    ldrh r5, [sp, #0x8]
    mov r0, r5, lsl #0x1a
    mov r3, r0, lsr #0x1b
    cmp r3, #0xb
    bne .L_500
    mov r0, r5, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r1, #0xcc
    mul r2, r0, r1
    add r1, r4, r2
    ldr r1, [r1, #0x484]
    cmp r1, #0x0
    beq .L_4e8
    ldr r3, _LIT1
    mov r5, r5, lsl #0x12
    ldrh r6, [r3, #0x56]
    mov r5, r5, lsr #0x18
    tst r6, #0x20
    beq .L_468
    ldr r3, _LIT4
    ldr r3, [r3, #0x4]
    eor r3, r3, #0x1
    cmp r0, r3
    addeq r5, r5, #0x1
    subne r5, r5, #0x1
.L_468:
    tst r6, #0x10
    beq .L_488
    ldr r3, _LIT4
    ldr r3, [r3, #0x4]
    eor r3, r3, #0x1
    cmp r0, r3
    subeq r5, r5, #0x1
    addne r5, r5, #0x1
.L_488:
    cmp r5, #0x0
    sublt r5, r1, #0x1
    cmp r5, r1
    movge r5, #0x0
    add r0, r4, #0x3e0
    mov r1, r5
    add r0, r0, r2
    bl func_ov002_0229d90c
    cmp r0, #0x0
    beq .L_4bc
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_022a8198
.L_4bc:
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
    b .L_630
.L_4e8:
    bic r0, r5, #0x3fc0
    strh r0, [sp, #0x8]
    ldrh r0, [sp, #0x8]
    bic r0, r0, #0x4000
    strh r0, [sp, #0x8]
    b .L_630
.L_500:
    ldr r0, _LIT1
    ldrh r0, [r0, #0x56]
    tst r0, #0x20
    beq .L_590
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
.L_590:
    tst r0, #0x10
    beq .L_624
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
.L_624:
    ldrh r0, [sp, #0x8]
    orr r0, r0, #0x4000
    strh r0, [sp, #0x8]
.L_630:
    add r0, r4, #0x500
    ldrh r3, [sp, #0x8]
    ldrh r2, [r0, #0x90]
    mov r0, r3, lsl #0x1f
    mov r1, r0, lsr #0x1f
    mov r0, r2, lsl #0x1f
    cmp r1, r0, lsr #0x1f
    bne .L_678
    mov r0, r3, lsl #0x1a
    mov r1, r0, lsr #0x1b
    mov r0, r2, lsl #0x1a
    cmp r1, r0, lsr #0x1b
    bne .L_678
    mov r0, r3, lsl #0x12
    mov r1, r0, lsr #0x18
    mov r0, r2, lsl #0x12
    cmp r1, r0, lsr #0x18
    beq .L_6ac
.L_678:
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
    bl func_020371b8
    mov r0, #0x1
    str r0, [sp, #0x4]
.L_6ac:
    ldrh r2, [sp, #0x8]
    mov r0, r2, lsl #0x1a
    mov r0, r0, lsr #0x1b
    cmp r0, #0xb
    bne .L_6f4
    mov r0, r2, lsl #0x1f
    mov r1, r0, lsr #0x1f
    mov r0, #0xcc
    mla r0, r1, r0, r4
    ldr r0, [r0, #0x484]
    cmp r0, #0x0
    bne .L_6f4
    bic r0, r2, #0x3e
    orr r0, r0, #0xe
    strh r0, [sp, #0x8]
    ldrh r0, [sp, #0x8]
    bic r0, r0, #0x3fc0
    strh r0, [sp, #0x8]
.L_6f4:
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
    beq .L_77c
    mov r0, r4
    bl func_ov002_022a8318
    cmp r0, #0x0
    beq .L_76c
    ldr r0, _LIT9
    bl func_ov002_022ae994
    b .L_858
.L_76c:
    ldr r0, _LIT9
    mov r1, #0x1
    bl func_ov002_022ae8f4
    b .L_858
.L_77c:
    ldrh r1, [r2, #0x54]
    tst r1, #0x400
    beq .L_790
    bl func_ov002_022aea24
    b .L_858
.L_790:
    tst r1, #0x2
    beq .L_7b8
    ldr r1, _LIT0
    ldr r1, [r1, #0xc8]
    cmp r1, #0x0
    beq .L_7b0
    bl func_ov002_022aea24
    b .L_858
.L_7b0:
    bl func_ov002_022aeab0
    b .L_858
.L_7b8:
    tst r1, #0x300
    beq .L_858
    bl func_ov002_022ae5dc
    cmp r0, #0x0
    beq .L_840
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
    bl func_ov002_022ae994
    b .L_858
.L_840:
    ldr r0, _LIT10
    bl func_ov002_022a1760
    cmp r0, #0x0
    bne .L_858
    ldr r0, _LIT9
    bl func_ov002_022aea24
.L_858:
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
    beq .L_8a8
    ldr r2, _LIT11
    ldr r1, [r2]
    mov r0, r1, lsl #0x1b
    mov r0, r0, lsr #0x1e
    eor r0, r0, #0x1
    bic r1, r1, #0x18
    mov r0, r0, lsl #0x1e
    orr r0, r1, r0, lsr #0x1b
    str r0, [r2]
.L_8a8:
    tst r3, #0xc0
    beq .L_8d4
    ldr r2, _LIT11
    ldr r1, [r2]
    mov r0, r1, lsl #0x1b
    mov r0, r0, lsr #0x1e
    eor r0, r0, #0x2
    bic r1, r1, #0x18
    mov r0, r0, lsl #0x1e
    orr r0, r1, r0, lsr #0x1b
    str r0, [r2]
.L_8d4:
    mov r0, r4
    bl func_ov002_022aa67c
    ldr r0, _LIT7
    mov r1, #0x0
    str r1, [r0]
    add sp, sp, #0x4c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022d0e4c
_LIT1: .word data_02104acc
_LIT2: .word data_ov002_022ca390
_LIT3: .word data_ov002_022ca3a0
_LIT4: .word data_ov002_022cd65c
_LIT5: .word data_ov002_022ca380
_LIT6: .word data_ov002_022ca370
_LIT7: .word data_ov002_022d1968
_LIT8: .word data_ov002_022d1830
_LIT9: .word data_ov002_022d19bc
_LIT10: .word data_ov002_022d10dc
_LIT11: .word data_02104e70
