; func_020368fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219b200
        .extern data_0219b680
        .extern func_02088c94
        .global func_020368fc
        .arm
func_020368fc:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x18
    ldr r4, _LIT0
    str r0, [sp]
    mov r0, r0, lsl #0x10
    ldr r5, [r4, #0x34]
    mov r4, r0, lsr #0x10
    mov r0, #0xc
    mla r0, r4, r0, r5
    ldrb r4, [r0, #0xa]
    ldr r0, [sp]
    str r1, [sp, #0x4]
    mov r0, r0, lsr #0x14
    and r0, r0, #0xf
    mov r7, r2
    str r3, [sp, #0x8]
    cmp r0, #0x4
    and r6, r4, #0x1f
    ldr fp, [sp, #0x40]
    beq .L_68
    cmp fp, #0x0
    moveq r4, #0x0
    moveq r5, #0x4
    movne r4, #0x4
    movne r5, #0x14
    b .L_84
.L_68:
    cmp r7, #0x0
    andge r7, r7, #0x7
    mov r4, #0x14
    mov r5, #0x1c
    bl func_02088c94
    cmp r0, #0x0
    subne r5, r5, #0x1
.L_84:
    ldr r1, _LIT1
    mov r0, #0x78
    mla ip, r4, r0, r1
    mov lr, #0x0
    mov r8, r4
    mov r9, lr
    mov sl, lr
    cmp r7, #0x0
    sub r0, lr, #0x1
    blt .L_18c
    ldr r1, [sp, #0x8]
    cmp r1, #0x1
    addeq sp, sp, #0x18
    addeq r0, r4, r7
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    cmp r4, r5
    bge .L_284
    ldr r1, _LIT0
    ldr r1, [r1, #0x34]
    str r1, [sp, #0x14]
.L_d4:
    ldrsb r1, [ip, #0x6a]
    cmp r1, #0x0
    blt .L_174
    ldrsb r2, [ip, #0x6d]
    ldr fp, [ip, #0x34]
    mov r3, #0xc
    mov r1, fp, lsl #0x10
    cmp r2, r7
    ldr r2, [sp, #0x14]
    mov r1, r1, lsr #0x10
    mla r2, r1, r3, r2
    bne .L_178
    ldrh r3, [ip, #0x68]
    ldr r1, _LIT2
    tst r3, r1
    bne .L_178
    cmp r6, #0x0
    add r9, r9, #0x1
    beq .L_134
    ldrb r1, [r2, #0xa]
    and r1, r1, #0x1f
    cmp r6, r1
    moveq sl, #0x1
    movne sl, #0x0
.L_134:
    cmp sl, #0x0
    bne .L_154
    ldr r1, [sp]
    cmp fp, r1
    ldrneh r2, [ip, #0x74]
    ldrne r1, [sp, #0x4]
    cmpne r2, r1
    bne .L_178
.L_154:
    cmp lr, #0x0
    beq .L_16c
    ldrsb r2, [ip, #0x6e]
    ldrsb r1, [lr, #0x6e]
    cmp r2, r1
    bge .L_178
.L_16c:
    mov lr, ip
    b .L_178
.L_174:
    mov r0, r4
.L_178:
    add r4, r4, #0x1
    cmp r4, r5
    add ip, ip, #0x78
    blt .L_d4
    b .L_284
.L_18c:
    cmp r4, r5
    bge .L_284
    ldr r1, _LIT0
    ldr r1, [r1, #0x34]
    str r1, [sp, #0xc]
.L_1a0:
    ldrsb r1, [ip, #0x6a]
    cmp r1, #0x0
    blt .L_270
    cmp fp, #0x0
    beq .L_1c0
    ldr r1, [ip, #0x34]
    tst r1, #0x1000000
    beq .L_274
.L_1c0:
    cmp fp, #0x0
    bne .L_1d4
    ldr r1, [ip, #0x34]
    tst r1, #0x1000000
    bne .L_274
.L_1d4:
    ldr r1, [ip, #0x34]
    mov r2, #0xc
    str r1, [sp, #0x10]
    mov r1, r1, lsl #0x10
    mov r3, r1, lsr #0x10
    ldr r1, [sp, #0xc]
    cmp r6, #0x0
    mla r1, r3, r2, r1
    beq .L_20c
    ldrb r1, [r1, #0xa]
    and r1, r1, #0x1f
    cmp r6, r1
    moveq sl, #0x1
    movne sl, #0x0
.L_20c:
    ldrsb r1, [ip, #0x6d]
    cmp r1, r7
    bne .L_274
    cmp sl, #0x0
    bne .L_23c
    ldr r2, [sp]
    ldr r1, [sp, #0x10]
    cmp r1, r2
    ldrneh r2, [ip, #0x74]
    ldrne r1, [sp, #0x4]
    cmpne r2, r1
    bne .L_274
.L_23c:
    ldrh r2, [ip, #0x68]
    ldr r1, _LIT2
    tst r2, r1
    bne .L_274
    cmp lr, #0x0
    add r9, r9, #0x1
    beq .L_268
    ldrsb r2, [ip, #0x6e]
    ldrsb r1, [lr, #0x6e]
    cmp r2, r1
    bge .L_274
.L_268:
    mov lr, ip
    b .L_274
.L_270:
    mov r0, r4
.L_274:
    add r4, r4, #0x1
    cmp r4, r5
    add ip, ip, #0x78
    blt .L_1a0
.L_284:
    ldr r1, [sp, #0x8]
    cmp r9, r1
    bcs .L_2a0
    cmp r0, #0x0
    bge .L_2a4
    cmp lr, #0x0
    beq .L_2a4
.L_2a0:
    ldrsb r0, [lr, #0x6a]
.L_2a4:
    cmp r0, #0x0
    addge sp, sp, #0x18
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r2, _LIT1
    mov r1, #0x78
    mla r4, r8, r1, r2
    cmp r8, r5
    cmplt r8, r5
    mov r3, #0xff
    addge sp, sp, #0x18
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2d0:
    ldrsb r1, [r4, #0x6a]
    cmp r1, #0x0
    blt .L_2f8
    ldrsb r2, [r4, #0x6f]
    cmp r2, r3
    bge .L_2f8
    ldr r1, [r4, #0x34]
    tst r1, #0x1000000
    movne r3, r2
    movne r0, r8
.L_2f8:
    add r8, r8, #0x1
    cmp r8, r5
    add r4, r4, #0x78
    blt .L_2d0
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_0219b200
_LIT1: .word data_0219b680
_LIT2: .word 0x00003003
