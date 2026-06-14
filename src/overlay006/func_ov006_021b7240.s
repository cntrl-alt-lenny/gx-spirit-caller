; func_ov006_021b7240 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern func_020059b0
        .extern func_ov006_021b9000
        .global func_ov006_021b7240
        .arm
func_ov006_021b7240:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x8
    mov r4, #0x0
    mov sl, r2
    mov r7, r3
    str r4, [sp, #0x4]
    ldr r6, [sp, #0x28]
    mov r9, r0
    mov r8, r1
    strh r7, [sp, #0x4]
    cmp sl, #0x4
    addls pc, pc, sl, lsl #0x2
    b .L_48c
    b .L_338
    b .L_344
    b .L_350
    b .L_35c
    b .L_368
.L_338:
    add r0, r9, #0x2a0
    add r4, r0, #0x6000
    b .L_370
.L_344:
    add r0, r9, #0xa60
    add r4, r0, #0x7000
    b .L_370
.L_350:
    add r0, r9, #0xc60
    add r4, r0, #0x7000
    b .L_370
.L_35c:
    add r0, r9, #0xe60
    add r4, r0, #0x7000
    b .L_370
.L_368:
    add r0, r9, #0x60
    add r4, r0, #0x8000
.L_370:
    add r0, r9, sl, lsl #0x1
    add r0, r0, #0x8100
    ldrh r5, [r0, #0x60]
    mov r0, #0x0
    cmp r5, #0x0
    ble .L_3a8
    mov r2, r5, lsl #0x10
    ldr ip, _LIT0
    add r0, sp, #0x4
    mov r1, r4
    mov r2, r2, lsr #0x10
    mov r3, #0x4
    str ip, [sp]
    bl func_020059b0
.L_3a8:
    cmp r0, r5
    blt .L_3cc
    add r0, r9, #0x6000
    ldr r0, [r0, #0x294]
    cmp r0, #0x0
    bne .L_48c
    add sp, sp, #0x8
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_3cc:
    add r1, r9, #0x6000
    ldr r1, [r1, #0x294]
    add ip, r4, r0, lsl #0x2
    cmp r1, #0x0
    bne .L_3f4
    ldrb r1, [ip, #0x2]
    subs r1, r1, r6
    addmi sp, sp, #0x8
    movmi r0, #0x0
    ldmmiia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_3f4:
    ldrb r3, [ip, #0x2]
    sub r1, r3, r6
    cmp r1, #0x0
    bgt .L_470
    add r1, r9, #0x6a
    add r2, r1, #0x8100
    mov lr, sl, lsl #0x1
    ldrh r1, [r2, lr]
    cmp sl, #0x0
    sub r1, r1, r3
    strh r1, [r2, lr]
    addeq r1, r9, #0x6000
    ldreq r1, [r1, #0x298]
    cmpeq r1, #0x0
    moveq r0, #0x0
    streqb r0, [ip, #0x2]
    beq .L_48c
    add r2, r0, #0x1
    cmp r2, r5
    bge .L_45c
.L_444:
    ldr r1, [r4, r2, lsl #0x2]
    add r0, r4, r2, lsl #0x2
    add r2, r2, #0x1
    str r1, [r0, #-4]
    cmp r2, r5
    blt .L_444
.L_45c:
    add r0, r9, sl, lsl #0x1
    sub r1, r5, #0x1
    add r0, r0, #0x8100
    strh r1, [r0, #0x60]
    b .L_48c
.L_470:
    add r0, r9, #0x6a
    strb r1, [ip, #0x2]
    add r2, r0, #0x8100
    mov r1, sl, lsl #0x1
    ldrh r0, [r2, r1]
    sub r0, r0, r6
    strh r0, [r2, r1]
.L_48c:
    cmp r8, #0x4
    addls pc, pc, r8, lsl #0x2
    b .L_68c
    b .L_4ac
    b .L_4b8
    b .L_4c4
    b .L_4d0
    b .L_4dc
.L_4ac:
    add r0, r9, #0x2a0
    add r4, r0, #0x6000
    b .L_4e4
.L_4b8:
    add r0, r9, #0xa60
    add r4, r0, #0x7000
    b .L_4e4
.L_4c4:
    add r0, r9, #0xc60
    add r4, r0, #0x7000
    b .L_4e4
.L_4d0:
    add r0, r9, #0xe60
    add r4, r0, #0x7000
    b .L_4e4
.L_4dc:
    add r0, r9, #0x60
    add r4, r0, #0x8000
.L_4e4:
    add r0, r9, r8, lsl #0x1
    add r0, r0, #0x8100
    ldrh r5, [r0, #0x60]
    mov r0, #0x0
    cmp r5, #0x0
    ble .L_51c
    mov r2, r5, lsl #0x10
    ldr sl, _LIT0
    add r0, sp, #0x4
    mov r1, r4
    mov r2, r2, lsr #0x10
    mov r3, #0x4
    str sl, [sp]
    bl func_020059b0
.L_51c:
    cmp r0, r5
    blt .L_638
    cmp r5, #0x0
    bne .L_548
    strh r7, [r4]
    add r0, r9, r8, lsl #0x1
    strb r6, [r4, #0x2]
    add r0, r0, #0x8100
    mov r1, #0x1
    strh r1, [r0, #0x60]
    b .L_61c
.L_548:
    ldr r0, _LIT1
    ldr r0, [r0, #0x28]
    mov r1, r0, lsl #0x2
    ldrh r1, [r4, r1]
    cmp r1, r7
    bge .L_5bc
    sub r2, r5, #0x1
    b .L_56c
.L_568:
    add r0, r0, #0x1
.L_56c:
    cmp r0, r2
    bge .L_588
    add r1, r0, #0x1
    mov r1, r1, lsl #0x2
    ldrh r1, [r4, r1]
    cmp r1, r7
    blt .L_568
.L_588:
    sub sl, r5, #0x1
    add r3, r0, #0x1
    cmp sl, r3
    blt .L_5b0
.L_598:
    ldr r2, [r4, sl, lsl #0x2]
    add r1, r4, sl, lsl #0x2
    sub sl, sl, #0x1
    str r2, [r1, #0x4]
    cmp sl, r3
    bge .L_598
.L_5b0:
    add r0, r0, #0x1
    b .L_5fc
.L_5b8:
    sub r0, r0, #0x1
.L_5bc:
    cmp r0, #0x0
    ble .L_5d8
    sub r1, r0, #0x1
    mov r1, r1, lsl #0x2
    ldrh r1, [r4, r1]
    cmp r1, r7
    bgt .L_5b8
.L_5d8:
    sub r3, r5, #0x1
    cmp r3, r0
    blt .L_5fc
.L_5e4:
    ldr r2, [r4, r3, lsl #0x2]
    add r1, r4, r3, lsl #0x2
    sub r3, r3, #0x1
    str r2, [r1, #0x4]
    cmp r3, r0
    bge .L_5e4
.L_5fc:
    mov r2, r0, lsl #0x2
    add r1, r9, r8, lsl #0x1
    strh r7, [r4, r2]
    add r0, r4, r0, lsl #0x2
    strb r6, [r0, #0x2]
    add r2, r5, #0x1
    add r0, r1, #0x8100
    strh r2, [r0, #0x60]
.L_61c:
    add r0, r9, #0x6a
    add r2, r0, #0x8100
    mov r1, r8, lsl #0x1
    ldrh r0, [r2, r1]
    add r0, r0, r6
    strh r0, [r2, r1]
    b .L_68c
.L_638:
    add r7, r4, r0, lsl #0x2
    ldrb r5, [r7, #0x2]
    add r0, r9, #0x6a
    add r1, r5, r6
    cmp r1, #0x9
    blt .L_674
    add r4, r0, #0x8100
    mov r3, r8, lsl #0x1
    ldrh r2, [r4, r3]
    rsb r1, r5, #0x9
    mov r0, #0x9
    add r1, r2, r1
    strh r1, [r4, r3]
    strb r0, [r7, #0x2]
    b .L_68c
.L_674:
    strb r1, [r7, #0x2]
    add r2, r0, #0x8100
    mov r1, r8, lsl #0x1
    ldrh r0, [r2, r1]
    add r0, r0, r6
    strh r0, [r2, r1]
.L_68c:
    mov r0, #0x1
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word func_ov006_021b9000
_LIT1: .word data_021040ac
