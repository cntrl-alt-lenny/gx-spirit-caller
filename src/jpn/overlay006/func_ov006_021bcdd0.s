; func_ov006_021bcdd0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov006_021cbf1c
        .extern data_ov006_021cbf30
        .extern data_ov006_021cbf44
        .extern data_ov006_021cbf58
        .extern data_ov006_021cc01c
        .extern data_ov006_021cc5ac
        .extern data_ov006_021cc804
        .extern data_ov006_0224f328
        .extern data_ov006_0225de1c
        .extern func_0202160c
        .extern func_0202165c
        .extern func_0202de48
        .extern func_ov006_021b6c1c
        .extern func_ov006_021b6e50
        .extern func_ov006_021b7bac
        .extern func_ov006_021b7be0
        .extern func_ov006_021bd5b0
        .extern func_ov006_021c7e50
        .global func_ov006_021bcdd0
        .arm
func_ov006_021bcdd0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x80
    mov r4, r0
    ldr r3, [r4, #0x40]
    mov r0, #0x0
    str r2, [sp, #0x4]
    cmp r3, #0x6
    streq r0, [sp, #0x4]
    ldr fp, _LIT0
    str r1, [sp]
    str r0, [sp, #0x1c]
    cmp r3, #0x6
    addls pc, pc, r3, lsl #0x2
    b .L_84
    b .L_54
    b .L_60
    b .L_6c
    b .L_54
    b .L_84
    b .L_54
    b .L_78
.L_54:
    mov r7, #0x0
    mov r5, #0x3
    b .L_8c
.L_60:
    mov r7, #0x1
    mov r5, #0x2
    b .L_8c
.L_6c:
    mov r7, #0x0
    mov r5, #0x1
    b .L_8c
.L_78:
    mov r7, #0x0
    mov r5, r7
    b .L_8c
.L_84:
    mov r7, #0x1
    mov r5, #0x3
.L_8c:
    mov r1, #0x0
    mov r6, r1
    add r0, sp, #0x6c
.L_98:
    str r6, [r0, r1, lsl #0x2]
    add r1, r1, #0x1
    cmp r1, #0x5
    blt .L_98
    mvn r3, #0x0
    add r2, sp, #0x48
    mov r1, #0x0
    add r0, sp, #0x24
.L_b8:
    str r3, [r2, r6, lsl #0x2]
    str r1, [r0, r6, lsl #0x2]
    add r6, r6, #0x1
    cmp r6, #0x9
    blt .L_b8
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_19c
    ldr r1, [r4, #0x50]
    add r2, r4, #0xa0
    mov r0, #0x24
    mla r6, r1, r0, r2
    mov r0, r4
    bl func_ov006_021bd5b0
    movs r2, r0
    bmi .L_148
    ldr r0, [r6, #0x20]
    ldr r1, [r4, #0x50]
    mov r3, r0, lsl #0x1f
    mov r0, fp
    mov r3, r3, lsr #0x1f
    bl func_ov006_021b6c1c
    mov r6, r0
    bl func_0202de48
    str r0, [sp, #0x1c]
    cmp r7, r5
    bgt .L_148
    add r8, sp, #0x6c
.L_128:
    mov r0, fp
    mov r1, r7
    mov r2, r6
    bl func_ov006_021b6e50
    str r0, [r8, r7, lsl #0x2]
    add r7, r7, #0x1
    cmp r7, r5
    ble .L_128
.L_148:
    mov r7, #0x0
    mov r9, r7
    add r1, sp, #0x48
    add r0, sp, #0x24
    mov r3, r7
    add r2, sp, #0x6c
.L_160:
    mov r6, r3
    mov r5, r3
    ldr r8, [r2, r9, lsl #0x2]
    cmp r8, #0x0
    ble .L_190
.L_174:
    str r9, [r1, r7, lsl #0x2]
    str r6, [r0, r7, lsl #0x2]
    add r6, r6, #0x1
    add r7, r7, #0x1
    add r5, r5, #0x1
    cmp r5, r8
    blt .L_174
.L_190:
    add r9, r9, #0x1
    cmp r9, #0x5
    blt .L_160
.L_19c:
    ldr r0, _LIT1
    mov r9, #0x0
    str r0, [sp, #0x10]
    ldr r0, _LIT2
    str r0, [sp, #0xc]
    ldr r0, _LIT3
    str r0, [sp, #0x8]
    ldr r0, _LIT4
    rsb r6, r0, #0x8c0
    orr r0, r0, #0x10
    str r0, [sp, #0x20]
.L_1c8:
    ldr r1, [r4, #0x40]
    cmp r1, #0x6
    addls pc, pc, r1, lsl #0x2
    b .L_204
    b .L_1f4
    b .L_204
    b .L_1fc
    b .L_1f4
    b .L_204
    b .L_204
    b .L_204
.L_1f4:
    ldr r7, [sp, #0x10]
    b .L_208
.L_1fc:
    ldr r7, [sp, #0xc]
    b .L_208
.L_204:
    ldr r7, [sp, #0x8]
.L_208:
    cmp r9, #0x0
    mov r8, #0x0
    blt .L_288
    cmp r9, #0xf
    bgt .L_288
    ldr r0, [sp]
    cmp r0, #0x0
    beq .L_778
    cmp r1, #0x0
    cmpne r1, #0x2
    cmpne r1, #0x3
    cmpne r9, #0x0
    cmpne r9, #0x8
    bne .L_778
    ldrsh r0, [r7]
    ldr r2, [r7, #0x8]
    ldr r1, [r4, #0x54]
    add r0, r0, #0x8
    str r0, [sp, #0x18]
    ldrsh r0, [r7, #0x2]
    cmp r2, r1
    moveq r1, #0x1
    movne r1, #0x0
    add r0, r0, #0x8
    add r0, r0, r1
    cmp r9, #0x8
    ldr sl, _LIT4
    str r0, [sp, #0x14]
    blt .L_368
    cmp r9, #0xf
    ldrle sl, [sp, #0x20]
    b .L_368
.L_288:
    cmp r9, #0x10
    blt .L_368
    cmp r9, #0x18
    bgt .L_368
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    sub r0, r9, #0x10
    beq .L_778
    add r2, sp, #0x48
    ldr r2, [r2, r0, lsl #0x2]
    cmp r2, #0x0
    blt .L_358
    cmp r1, #0x6
    addls pc, pc, r1, lsl #0x2
    b .L_304
    b .L_2e0
    b .L_2ec
    b .L_2f8
    b .L_2e0
    b .L_304
    b .L_2e0
    b .L_304
.L_2e0:
    ldr r1, _LIT5
    add r3, r1, r2, lsl #0x2
    b .L_30c
.L_2ec:
    ldr r1, _LIT6
    add r3, r1, r2, lsl #0x2
    b .L_30c
.L_2f8:
    ldr r1, _LIT7
    add r3, r1, r2, lsl #0x2
    b .L_30c
.L_304:
    ldr r1, _LIT8
    add r3, r1, r2, lsl #0x2
.L_30c:
    add r1, sp, #0x24
    ldr r1, [r1, r0, lsl #0x2]
    add r0, sp, #0x6c
    ldr r0, [r0, r2, lsl #0x2]
    add r2, r1, r1, lsl #0x1
    sub r0, r0, #0x1
    ldrsh r1, [r3]
    ldrsh r3, [r3, #0x2]
    add r0, r0, r0, lsl #0x1
    add r0, r0, r0, lsr #0x1f
    str r3, [sp, #0x14]
    sub r0, r1, r0, asr #0x1
    add r0, r2, r0
    ldr r5, _LIT9
    ldr r3, [sp, #0x1c]
    str r0, [sp, #0x18]
    ldr r8, [r5, r3, lsl #0x2]
    ldr sl, _LIT4
    b .L_368
.L_358:
    mov r0, #0x0
    str r0, [sp, #0x18]
    str r0, [sp, #0x14]
    mov sl, r0
.L_368:
    ldr r0, [r7, #0x8]
    mov r5, #0x0
    cmp r0, #0xd
    addls pc, pc, r0, lsl #0x2
    b .L_6b4
    b .L_6b4
    b .L_6b4
    b .L_6b4
    b .L_3b4
    b .L_6b4
    b .L_6b4
    b .L_6b4
    b .L_3e4
    b .L_44c
    b .L_4b4
    b .L_51c
    b .L_584
    b .L_5ec
    b .L_654
.L_3b4:
    ldr r1, [r4, #0x50]
    mov r0, fp
    bl func_ov006_021b7bac
    mov r2, r0
    ldr r0, [r4, #0x88]
    mov r1, #0x1
    cmp r0, #0x4
    ldreq r2, [r4, #0x8c]
    ldr r0, _LIT10
    bl func_ov006_021c7e50
    mov r8, r0
    b .L_6b4
.L_3e4:
    ldr r1, [r4, #0x50]
    mov r0, fp
    mov r2, #0x1
    bl func_ov006_021b7be0
    mov r2, r0
    ldr r0, [r4, #0x78]
    cmp r0, #0x0
    beq .L_410
    cmp r2, #0x0
    movlt r5, #0x1
    blt .L_414
.L_410:
    mov r5, #0x0
.L_414:
    ldr r0, [r4, #0x88]
    cmp r0, #0x5
    bne .L_438
    ldr r0, [r4, #0x8c]
    cmp r0, #0x0
    movlt r2, r6
    blt .L_438
    cmp r0, #0x1
    ldreq r2, [r4, #0x90]
.L_438:
    ldr r0, _LIT10
    mov r1, #0x3
    bl func_ov006_021c7e50
    mov r8, r0
    b .L_6b4
.L_44c:
    ldr r1, [r4, #0x50]
    mov r0, fp
    mov r2, #0x2
    bl func_ov006_021b7be0
    mov r2, r0
    ldr r0, [r4, #0x78]
    cmp r0, #0x0
    beq .L_478
    cmp r2, #0x0
    movlt r5, #0x1
    blt .L_47c
.L_478:
    mov r5, #0x0
.L_47c:
    ldr r0, [r4, #0x88]
    cmp r0, #0x5
    bne .L_4a0
    ldr r0, [r4, #0x8c]
    cmp r0, #0x0
    movlt r2, r6
    blt .L_4a0
    cmp r0, #0x2
    ldreq r2, [r4, #0x90]
.L_4a0:
    ldr r0, _LIT10
    mov r1, #0x4
    bl func_ov006_021c7e50
    mov r8, r0
    b .L_6b4
.L_4b4:
    ldr r1, [r4, #0x50]
    mov r0, fp
    mov r2, #0x3
    bl func_ov006_021b7be0
    mov r2, r0
    ldr r0, [r4, #0x78]
    cmp r0, #0x0
    beq .L_4e0
    cmp r2, #0x0
    movlt r5, #0x1
    blt .L_4e4
.L_4e0:
    mov r5, #0x0
.L_4e4:
    ldr r0, [r4, #0x88]
    cmp r0, #0x5
    bne .L_508
    ldr r0, [r4, #0x8c]
    cmp r0, #0x0
    movlt r2, r6
    blt .L_508
    cmp r0, #0x3
    ldreq r2, [r4, #0x90]
.L_508:
    ldr r0, _LIT10
    mov r1, #0x5
    bl func_ov006_021c7e50
    mov r8, r0
    b .L_6b4
.L_51c:
    ldr r1, [r4, #0x50]
    mov r0, fp
    mov r2, #0x4
    bl func_ov006_021b7be0
    mov r2, r0
    ldr r0, [r4, #0x78]
    cmp r0, #0x0
    beq .L_548
    cmp r2, #0x0
    movlt r5, #0x1
    blt .L_54c
.L_548:
    mov r5, #0x0
.L_54c:
    ldr r0, [r4, #0x88]
    cmp r0, #0x5
    bne .L_570
    ldr r0, [r4, #0x8c]
    cmp r0, #0x0
    movlt r2, r6
    blt .L_570
    cmp r0, #0x4
    ldreq r2, [r4, #0x90]
.L_570:
    ldr r0, _LIT10
    mov r1, #0x6
    bl func_ov006_021c7e50
    mov r8, r0
    b .L_6b4
.L_584:
    ldr r1, [r4, #0x50]
    mov r0, fp
    mov r2, #0x5
    bl func_ov006_021b7be0
    mov r2, r0
    ldr r0, [r4, #0x78]
    cmp r0, #0x0
    beq .L_5b0
    cmp r2, #0x0
    movlt r5, #0x1
    blt .L_5b4
.L_5b0:
    mov r5, #0x0
.L_5b4:
    ldr r0, [r4, #0x88]
    cmp r0, #0x5
    bne .L_5d8
    ldr r0, [r4, #0x8c]
    cmp r0, #0x0
    movlt r2, r6
    blt .L_5d8
    cmp r0, #0x5
    ldreq r2, [r4, #0x90]
.L_5d8:
    ldr r0, _LIT10
    mov r1, #0x7
    bl func_ov006_021c7e50
    mov r8, r0
    b .L_6b4
.L_5ec:
    ldr r1, [r4, #0x50]
    mov r0, fp
    mov r2, #0x6
    bl func_ov006_021b7be0
    mov r2, r0
    ldr r0, [r4, #0x78]
    cmp r0, #0x0
    beq .L_618
    cmp r2, #0x0
    movlt r5, #0x1
    blt .L_61c
.L_618:
    mov r5, #0x0
.L_61c:
    ldr r0, [r4, #0x88]
    cmp r0, #0x5
    bne .L_640
    ldr r0, [r4, #0x8c]
    cmp r0, #0x0
    movlt r2, r6
    blt .L_640
    cmp r0, #0x6
    ldreq r2, [r4, #0x90]
.L_640:
    ldr r0, _LIT10
    mov r1, #0x8
    bl func_ov006_021c7e50
    mov r8, r0
    b .L_6b4
.L_654:
    ldr r1, [r4, #0x50]
    mov r0, fp
    mov r2, r5
    bl func_ov006_021b7be0
    mov r2, r0
    ldr r0, [r4, #0x78]
    cmp r0, #0x0
    beq .L_680
    cmp r2, #0x0
    movlt r5, #0x1
    blt .L_684
.L_680:
    mov r5, #0x0
.L_684:
    ldr r0, [r4, #0x88]
    cmp r0, #0x5
    bne .L_6a4
    ldr r0, [r4, #0x8c]
    cmp r0, #0x0
    movlt r2, r6
    blt .L_6a4
    ldreq r2, [r4, #0x90]
.L_6a4:
    ldr r0, _LIT10
    mov r1, #0x2
    bl func_ov006_021c7e50
    mov r8, r0
.L_6b4:
    ldr r0, [r4, #0x50]
    cmp r0, #0x4
    bne .L_6e0
    cmp r9, #0x0
    cmpne r9, #0x8
    beq .L_6e0
    cmp r9, #0x10
    blt .L_6dc
    cmp r9, #0x18
    ble .L_6e0
.L_6dc:
    mov r5, #0x1
.L_6e0:
    ldr r0, [r4]
    mov r1, #0x5
    cmp r5, #0x0
    add r2, r9, #0x4b
    orrne sl, sl, #0x4
    bl func_0202160c
    mov r1, #0x2
    mov r2, r9
    mov r5, r0
    bl func_0202165c
    ldr r2, [sp, #0x18]
    mov r0, r5
    mov r1, #0x3
    bl func_0202165c
    ldr r2, [sp, #0x14]
    mov r0, r5
    mov r1, #0x4
    bl func_0202165c
    ldrsh r2, [r7, #0x4]
    mov r0, r5
    mov r1, #0x11
    bl func_0202165c
    ldrsh r2, [r7, #0x6]
    mov r0, r5
    mov r1, #0x12
    bl func_0202165c
    mov r0, r5
    mov r1, #0xc
    mov r2, #0x0
    bl func_0202165c
    mov r2, r8
    mov r0, r5
    mov r1, #0xd
    bl func_0202165c
    mov r0, r5
    mov r1, #0x0
    mov r2, sl
    bl func_0202165c
.L_778:
    ldr r0, [sp, #0x10]
    add r9, r9, #0x1
    add r0, r0, #0xc
    str r0, [sp, #0x10]
    ldr r0, [sp, #0xc]
    cmp r9, #0x19
    add r0, r0, #0xc
    str r0, [sp, #0xc]
    ldr r0, [sp, #0x8]
    add r0, r0, #0xc
    str r0, [sp, #0x8]
    blt .L_1c8
    mov r0, #0x1
    add sp, sp, #0x80
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov006_0224f328
_LIT1: .word data_ov006_021cc5ac
_LIT2: .word data_ov006_021cc5ac+0x12c
_LIT3: .word data_ov006_021cc804
_LIT4: .word 0x000008c1
_LIT5: .word data_ov006_021cbf1c
_LIT6: .word data_ov006_021cbf30
_LIT7: .word data_ov006_021cbf44
_LIT8: .word data_ov006_021cbf58
_LIT9: .word data_ov006_021cc01c
_LIT10: .word data_ov006_0225de1c
