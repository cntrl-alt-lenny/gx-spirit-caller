; func_020103ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_0218cae8
        .extern data_0218e428
        .extern data_0218fbe8
        .global func_020103ec
        .arm
func_020103ec:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x14
    ldr r4, _LIT0
    mov r7, r2
    ldrh r5, [r4, #0x42]
    ldr r4, _LIT1
    mov r2, #0x18
    mla r4, r5, r2, r4
    mov r9, r1
    mov r5, #0x0
    mov r8, r0
    mov r0, r5
    mov r1, r4
    mov r6, r3
    bl Fill32
    ldr r0, _LIT0
    ldrh r0, [r0, #0x44]
    cmp r0, #0x100
    addcs sp, sp, #0x14
    movcs r0, r5
    ldmcsia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    str r8, [r4]
    stmib r4, {r7, r9}
    ldr r1, [r4, #0xc]
    and r0, r6, #0x1
    bic r1, r1, #0x1
    orr r2, r1, r0
    bic r0, r2, #-2147483648
    orr r1, r0, #-2147483648
    mov r0, r1, lsl #0x1f
    str r1, [r4, #0xc]
    movs r0, r0, lsr #0x1f
    bne .L_a8
    ldr r0, [r9, #0x60]
    orr r2, r0, #0x2
    mov r0, r2, lsl #0x2
    mov r0, r0, lsr #0x1b
    add r0, r0, #0x1
    bic r1, r2, #0x3e000000
    mov r0, r0, lsl #0x1b
    orr r0, r1, r0, lsr #0x2
    str r0, [r9, #0x60]
.L_a8:
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq .L_c0
    cmp r0, #0x1
    beq .L_fc
    b .L_120
.L_c0:
    ldr r5, [r4]
    ldr r0, [r5, #0x8]
    str r0, [r4, #0x10]
    ldr r0, [r5, #0xc]
    str r0, [r4, #0x14]
    ldr r0, [r4, #0xc]
    orr r0, r0, #0x20000000
    str r0, [r4, #0xc]
    ldrsb r0, [r5]
    cmp r0, #0x5
    bne .L_12c
    ldr r0, [r4, #0xc]
    bic r0, r0, #0x20000000
    str r0, [r4, #0xc]
    b .L_12c
.L_fc:
    ldr r1, [r4]
    ldr r0, [r1]
    str r0, [r4, #0x10]
    ldr r0, [r1, #0x4]
    str r0, [r4, #0x14]
    ldr r0, [r4, #0xc]
    orr r0, r0, #0x20000000
    str r0, [r4, #0xc]
    b .L_12c
.L_120:
    add sp, sp, #0x14
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_12c:
    ldr r0, _LIT2
    add r0, r0, #0x3100
    ldrh r1, [r0, #0x42]
    ldrh r2, [r0, #0x44]
    add r1, r1, #0x1
    strh r1, [r0, #0x42]
    ldrh r1, [r0, #0x42]
    add r2, r2, #0x1
    strh r2, [r0, #0x44]
    cmp r1, #0x100
    movcs r1, #0x0
    strcsh r1, [r0, #0x42]
    ldr r2, [r4, #0x14]
    cmp r2, #0x4000
    bls .L_328
    ldr r0, [r4, #0x10]
    ldr r1, [r4, #0xc]
    str r0, [sp]
    bic r0, r1, #-2147483648
    str r0, [r4, #0xc]
    mov r7, #0x4000
    str r7, [r4, #0x14]
    ldr r1, [r4, #0xc]
    ldr r0, _LIT3
    subs r6, r2, #0x4000
    and r0, r1, r0
    bic r0, r0, #0x20000000
    str r0, [r4, #0xc]
    beq .L_328
    ldr r0, _LIT2
    add r1, r0, #0x144
    add r0, r0, #0x42
    add r0, r0, #0x3100
    str r0, [sp, #0x10]
    ldr r0, _LIT2
    add fp, r1, #0x3000
    add r0, r0, #0x1940
    str r0, [sp, #0x4]
    ldr r0, _LIT2
    add sl, r0, #0x3100
.L_1cc:
    ldrh ip, [sl, #0x42]
    mov r2, #0x18
    ldr r1, [sp, #0x4]
    mov r3, r2
    mla r8, ip, r3, r1
    mov r0, #0x0
    mov r1, r8
    bl Fill32
    mov r0, r7, lsl #0xa
    str r0, [sp, #0x8]
    ldr r0, [sp]
    mov lr, r4
    add r0, r0, r7
    str r0, [sp, #0xc]
    mov ip, r8
    ldmia lr!, {r0, r1, r2, r3}
    stmia ip!, {r0, r1, r2, r3}
    ldmia lr, {r0, r1}
    stmia ip, {r0, r1}
    str r6, [r8, #0x14]
    ldr r1, [r8, #0xc]
    ldr r0, _LIT3
    and r1, r1, r0
    ldr r0, [sp, #0x8]
    orr r0, r1, r0, lsr #0x9
    orr r0, r0, #0x20000000
    str r0, [r8, #0xc]
    ldr r0, [sp, #0xc]
    str r0, [r8, #0x10]
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    ldreqsb r0, [r5]
    cmpeq r0, #0x5
    ldreq r0, [r8, #0xc]
    biceq r0, r0, #0x20000000
    streq r0, [r8, #0xc]
    ldr r0, [r8, #0x14]
    cmp r0, #0x4000
    bls .L_27c
    mov r0, #0x4000
    str r0, [r8, #0x14]
    ldr r0, [r8, #0xc]
    bic r0, r0, #0x20000000
    str r0, [r8, #0xc]
.L_27c:
    sub r6, r6, #0x4000
    cmp r6, #0x0
    add r7, r7, #0x4000
    bgt .L_2bc
    ldr r0, [r8, #0xc]
    mov r6, #0x0
    bic r0, r0, #-2147483648
    orr r0, r0, #-2147483648
    str r0, [r8, #0xc]
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    ldreqsb r0, [r5]
    cmpeq r0, #0x5
    ldreq r0, [r8, #0xc]
    biceq r0, r0, #-2147483648
    streq r0, [r8, #0xc]
.L_2bc:
    ldr r0, [r4, #0xc]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    bne .L_2f0
    ldr r0, [r9, #0x60]
    orr r0, r0, #0x2
    bic r1, r0, #0x3e000000
    mov r0, r0, lsl #0x2
    mov r0, r0, lsr #0x1b
    add r0, r0, #0x1
    mov r0, r0, lsl #0x1b
    orr r0, r1, r0, lsr #0x2
    str r0, [r9, #0x60]
.L_2f0:
    ldr r0, [sp, #0x10]
    ldrh r1, [fp]
    ldrh r0, [r0]
    add r1, r1, #0x1
    strh r1, [fp]
    add r1, r0, #0x1
    ldr r0, [sp, #0x10]
    strh r1, [r0]
    ldrh r0, [sl, #0x42]
    cmp r0, #0x100
    movcs r0, #0x0
    strcsh r0, [sl, #0x42]
    cmp r6, #0x0
    bne .L_1cc
.L_328:
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    ldreqsb r0, [r5]
    cmpeq r0, #0x5
    bne .L_418
    ldr r0, _LIT2
    mov r2, #0x18
    add r0, r0, #0x3100
    ldrh r1, [r0, #0x42]
    ldr r0, _LIT2
    add r0, r0, #0x1940
    mla r6, r1, r2, r0
    mov r1, r6
    mov r0, #0x0
    bl Fill32
    mov r8, r4
    mov r7, r6
    ldmia r8!, {r0, r1, r2, r3}
    stmia r7!, {r0, r1, r2, r3}
    ldmia r8, {r0, r1}
    stmia r7, {r0, r1}
    ldr r0, [r6, #0xc]
    orr r0, r0, #0x40000000
    str r0, [r6, #0xc]
    ldr r0, [r4, #0xc]
    bic r0, r0, #-2147483648
    str r0, [r4, #0xc]
    ldr r0, [r5, #0x10]
    str r0, [r6, #0x10]
    ldr r0, [r5, #0x14]
    str r0, [r6, #0x14]
    ldr r0, [r6, #0xc]
    orr r2, r0, #0x20000000
    bic r0, r2, #-2147483648
    orr r1, r0, #-2147483648
    mov r0, r1, lsl #0x1f
    str r1, [r6, #0xc]
    movs r0, r0, lsr #0x1f
    bne .L_3e8
    ldr r0, [r9, #0x60]
    orr r2, r0, #0x2
    mov r0, r2, lsl #0x2
    mov r0, r0, lsr #0x1b
    add r0, r0, #0x1
    bic r1, r2, #0x3e000000
    mov r0, r0, lsl #0x1b
    orr r0, r1, r0, lsr #0x2
    str r0, [r9, #0x60]
.L_3e8:
    ldr r0, _LIT2
    add r0, r0, #0x3100
    ldrh r1, [r0, #0x42]
    ldrh r2, [r0, #0x44]
    add r1, r1, #0x1
    strh r1, [r0, #0x42]
    ldrh r1, [r0, #0x42]
    add r2, r2, #0x1
    strh r2, [r0, #0x44]
    cmp r1, #0x100
    movcs r1, #0x0
    strcsh r1, [r0, #0x42]
.L_418:
    mov r0, #0x1
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_0218fbe8
_LIT1: .word data_0218e428
_LIT2: .word data_0218cae8
_LIT3: .word 0xff800001
