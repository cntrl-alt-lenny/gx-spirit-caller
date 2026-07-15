; func_020b1188 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102834
        .extern data_02102b00
        .extern data_02102c1c
        .extern func_020b0034
        .extern func_020b0138
        .extern func_020b0384
        .extern func_020b06dc
        .extern func_020b0afc
        .extern func_020b0bdc
        .extern func_020b0cbc
        .extern func_020b0f60
        .extern func_020b1854
        .extern func_020b1964
        .extern func_020b1e0c
        .extern func_020b1e4c
        .extern func_020b1e88
        .extern func_020b23a0
        .extern func_020b2b50
        .extern func_020b30e4
        .extern func_020b3c78
        .global func_020b1188
        .arm
func_020b1188:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xfc
    mov r4, r0
    ldrb r0, [r4, #0x4]
    cmp r0, #0x0
    bne .L_40
    ldrsb r0, [r4]
    mov r2, #0x0
    cmp r0, #0x0
    ldreq r3, _LIT0
    mov r0, #0x0
    ldrne r3, _LIT1
    mov r1, r0
    bl func_020b0034
    add sp, sp, #0xfc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_40:
    ldrb r0, [r4, #0x5]
    cmp r0, #0x30
    beq .L_60
    cmp r0, #0x49
    beq .L_88
    cmp r0, #0x4e
    beq .L_bc
    b .L_104
.L_60:
    ldrsb r0, [r4]
    mov r2, #0x0
    cmp r0, #0x0
    ldreq r3, _LIT0
    mov r0, #0x0
    ldrne r3, _LIT1
    mov r1, r0
    bl func_020b0034
    add sp, sp, #0xfc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_88:
    ldrsb r0, [r4]
    mov r5, #0x0
    cmp r0, #0x0
    ldreq r4, _LIT0
    ldr r0, _LIT2
    ldrne r4, _LIT1
    ldr r0, [r0]
    bl func_020b30e4
    mov r2, r5
    mov r3, r4
    bl func_020b0034
    add sp, sp, #0xfc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_bc:
    ldr r1, _LIT3
    add r3, sp, #0x10
    mov r2, #0x0
    str r2, [r3]
    str r1, [r3, #0x4]
    ldrsb r0, [r4]
    cmp r0, #0x0
    beq .L_ec
    orr r0, r1, #-2147483648
    orr r1, r2, r2
    str r1, [r3]
    str r0, [r3, #0x4]
.L_ec:
    ldmia r3, {r0, r1}
    orr r0, r0, #0x0
    orr r1, r1, #0x80000
    stmia r3, {r0, r1}
    add sp, sp, #0xfc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_104:
    add r3, sp, #0xd6
    mov r5, r4
    mov r2, #0x9
.L_110:
    ldrh r1, [r5]
    ldrh r0, [r5, #0x2]
    add r5, r5, #0x4
    subs r2, r2, #0x1
    strh r1, [r3]
    strh r0, [r3, #0x2]
    add r3, r3, #0x4
    bne .L_110
    ldrh r0, [r5]
    add r1, sp, #0xdb
    strh r0, [r3]
    ldrb r0, [sp, #0xda]
    add r5, r1, r0
    cmp r1, r5
    bcs .L_160
.L_14c:
    ldrb r0, [r1]
    sub r0, r0, #0x30
    strb r0, [r1], #0x1
    cmp r1, r5
    bcc .L_14c
.L_160:
    ldrb r1, [sp, #0xda]
    ldrsh r2, [sp, #0xd8]
    add r0, sp, #0xb0
    sub r1, r1, #0x1
    add r1, r2, r1
    strh r1, [sp, #0xd8]
    ldr r1, _LIT4
    mov r2, #0x134
    ldrsh fp, [sp, #0xd8]
    bl func_020b06dc
    add r0, sp, #0xb0
    add r1, sp, #0xd6
    bl func_020b0bdc
    cmp r0, #0x0
    beq .L_1d0
    ldrsb r0, [r4]
    mov r5, #0x0
    cmp r0, #0x0
    ldreq r4, _LIT0
    ldr r0, _LIT2
    ldrne r4, _LIT1
    ldr r0, [r0]
    bl func_020b30e4
    mov r2, r5
    mov r3, r4
    bl func_020b0034
    add sp, sp, #0xfc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1d0:
    add r1, sp, #0xdb
    ldrb r0, [r1]
    add r8, r1, #0x1
    bl func_020b1e4c
    str r0, [sp, #0x8]
    str r1, [sp, #0xc]
    cmp r8, r5
    bcs .L_2a8
.L_1f0:
    sub r0, r5, r8
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1d
    adds r7, r1, r0, ror #0x1d
    moveq r7, #0x8
    mov r6, #0x0
    mov r2, #0x0
    cmp r7, #0x0
    ble .L_22c
    mov r0, #0xa
.L_218:
    ldrb r1, [r8], #0x1
    add r2, r2, #0x1
    cmp r2, r7
    mla r6, r0, r6, r1
    blt .L_218
.L_22c:
    ldr r0, _LIT5
    ldr r1, [sp, #0xc]
    add r3, r0, r7, lsl #0x3
    ldr r2, [r3, #-8]
    ldr r0, [sp, #0x8]
    ldr r3, [r3, #-4]
    bl func_020b1e88
    mov r4, r0
    mov r9, r1
    mov r0, r6
    bl func_020b1e4c
    mov r2, r0
    mov r3, r1
    mov r0, r4
    mov r1, r9
    bl func_020b1964
    cmp r6, #0x0
    mov r6, r0
    mov sl, r1
    beq .L_294
    mov r0, r4
    mov r1, r9
    mov r2, r6
    mov r3, sl
    bl func_020b2b50
    beq .L_2a8
.L_294:
    str r6, [sp, #0x8]
    str sl, [sp, #0xc]
    cmp r8, r5
    sub fp, fp, r7
    bcc .L_1f0
.L_2a8:
    cmp fp, #0x0
    bge .L_2ec
    rsb r0, fp, #0x0
    bl func_020b1e0c
    mov r3, r1
    mov r2, r0
    ldr r1, _LIT6
    mov r0, #0x0
    bl func_020b0384
    mov r2, r0
    mov r3, r1
    ldr r0, [sp, #0x8]
    ldr r1, [sp, #0xc]
    bl func_020b3c78
    str r0, [sp, #0x8]
    str r1, [sp, #0xc]
    b .L_324
.L_2ec:
    mov r0, fp
    bl func_020b1e0c
    mov r3, r1
    mov r2, r0
    ldr r1, _LIT6
    mov r0, #0x0
    bl func_020b0384
    mov r2, r0
    mov r3, r1
    ldr r0, [sp, #0x8]
    ldr r1, [sp, #0xc]
    bl func_020b1e88
    str r0, [sp, #0x8]
    str r1, [sp, #0xc]
.L_324:
    ldr r0, [sp, #0x8]
    ldr r1, [sp, #0xc]
    mov r2, fp
    bl func_020b0138
    str r0, [sp, #0x8]
    str r1, [sp, #0xc]
    bl func_020b1854
    cmp r0, #0x2
    bne .L_358
    ldr r0, _LIT7
    mvn r1, #0x0
    str r1, [sp, #0x8]
    str r0, [sp, #0xc]
.L_358:
    ldr r1, [sp, #0x8]
    ldr r2, [sp, #0xc]
    add r0, sp, #0x8a
    add r4, sp, #0x0
    mov r5, #0x0
    bl func_020b0f60
    add r0, sp, #0x8a
    add r1, sp, #0xd6
    bl func_020b0afc
    cmp r0, #0x0
    bne .L_5cc
    add r0, sp, #0x8a
    add r1, sp, #0xd6
    bl func_020b0bdc
    cmp r0, #0x0
    movne r5, #0x1
    ldr r1, [sp, #0x8]
    ldr r0, [sp, #0xc]
    cmp r5, #0x0
    moveq r6, #0x1
    str r1, [sp]
    str r0, [sp, #0x4]
    movne r6, #0x0
.L_3b4:
    cmp r6, #0x0
    bne .L_3dc
    ldmia r4, {r0, r1}
    adds r0, r0, #0x1
    adc r1, r1, #0x0
    stmia r4, {r0, r1}
    bl func_020b1854
    cmp r0, #0x2
    beq .L_5cc
    b .L_3f4
.L_3dc:
    ldr r1, [r4]
    ldr r0, [r4, #0x4]
    subs r1, r1, #0x1
    sbc r0, r0, #0x0
    str r1, [r4]
    str r0, [r4, #0x4]
.L_3f4:
    ldr r1, [sp]
    ldr r2, [sp, #0x4]
    add r0, sp, #0x64
    bl func_020b0f60
    cmp r5, #0x0
    beq .L_420
    add r0, sp, #0x64
    add r1, sp, #0xd6
    bl func_020b0bdc
    cmp r0, #0x0
    beq .L_544
.L_420:
    cmp r5, #0x0
    bne .L_4fc
    add r0, sp, #0xd6
    add r1, sp, #0x64
    bl func_020b0bdc
    cmp r0, #0x0
    bne .L_4fc
    add r3, sp, #0x8a
    add r5, sp, #0x3e
    mov r2, #0x9
.L_448:
    ldrh r1, [r3]
    ldrh r0, [r3, #0x2]
    add r3, r3, #0x4
    strh r1, [r5]
    strh r0, [r5, #0x2]
    add r5, r5, #0x4
    subs r2, r2, #0x1
    bne .L_448
    ldrh r0, [r3]
    add r3, sp, #0x64
    add r4, sp, #0x8a
    strh r0, [r5]
    mov r2, #0x9
.L_47c:
    ldrh r1, [r3]
    ldrh r0, [r3, #0x2]
    add r3, r3, #0x4
    strh r1, [r4]
    strh r0, [r4, #0x2]
    add r4, r4, #0x4
    subs r2, r2, #0x1
    bne .L_47c
    ldrh r0, [r3]
    add r3, sp, #0x3e
    add r5, sp, #0x64
    strh r0, [r4]
    mov r2, #0x9
.L_4b0:
    ldrh r1, [r3]
    ldrh r0, [r3, #0x2]
    add r3, r3, #0x4
    strh r1, [r5]
    strh r0, [r5, #0x2]
    add r5, r5, #0x4
    subs r2, r2, #0x1
    bne .L_4b0
    ldrh r4, [r3]
    ldr r3, [sp, #0x8]
    ldr r1, [sp]
    ldr r2, [sp, #0xc]
    ldr r0, [sp, #0x4]
    strh r4, [r5]
    str r1, [sp, #0x8]
    str r0, [sp, #0xc]
    str r3, [sp]
    str r2, [sp, #0x4]
    b .L_544
.L_4fc:
    add r7, sp, #0x64
    add r3, sp, #0x8a
    mov r2, #0x9
.L_508:
    ldrh r1, [r7]
    ldrh r0, [r7, #0x2]
    add r7, r7, #0x4
    strh r1, [r3]
    strh r0, [r3, #0x2]
    add r3, r3, #0x4
    subs r2, r2, #0x1
    bne .L_508
    ldrh r2, [r7]
    ldr r1, [sp]
    ldr r0, [sp, #0x4]
    strh r2, [r3]
    str r1, [sp, #0x8]
    str r0, [sp, #0xc]
    b .L_3b4
.L_544:
    add r0, sp, #0x3e
    add r1, sp, #0xd6
    add r2, sp, #0x8a
    bl func_020b0cbc
    add r0, sp, #0x18
    add r1, sp, #0x64
    add r2, sp, #0xd6
    bl func_020b0cbc
    add r0, sp, #0x3e
    add r1, sp, #0x18
    bl func_020b0afc
    cmp r0, #0x0
    beq .L_5a8
    ldr r1, [sp, #0x8]
    ldr r0, [sp, #0xc]
    and r1, r1, #0x1
    and r0, r0, #0x0
    cmp r0, #0x0
    cmpeq r1, #0x0
    beq .L_5cc
    ldr r1, [sp]
    ldr r0, [sp, #0x4]
    str r1, [sp, #0x8]
    str r0, [sp, #0xc]
    b .L_5cc
.L_5a8:
    add r0, sp, #0x3e
    add r1, sp, #0x18
    bl func_020b0bdc
    cmp r0, #0x0
    bne .L_5cc
    ldr r1, [sp]
    ldr r0, [sp, #0x4]
    str r1, [sp, #0x8]
    str r0, [sp, #0xc]
.L_5cc:
    ldrsb r0, [sp, #0xd6]
    cmp r0, #0x0
    beq .L_5f4
    mov r0, #0x0
    ldr r2, [sp, #0x8]
    ldr r3, [sp, #0xc]
    mov r1, r0
    bl func_020b23a0
    str r0, [sp, #0x8]
    str r1, [sp, #0xc]
.L_5f4:
    ldr r0, [sp, #0x8]
    ldr r1, [sp, #0xc]
    add sp, sp, #0xfc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x3ff00000
_LIT1: .word 0xbff00000
_LIT2: .word data_02102834
_LIT3: .word 0x7ff00000
_LIT4: .word data_02102c1c
_LIT5: .word data_02102b00+0x8
_LIT6: .word 0x40140000
_LIT7: .word 0x7fefffff
