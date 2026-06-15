; func_ov017_021b4570 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104f4c
        .extern data_ov017_021b8180
        .extern data_ov017_021b819c
        .extern data_ov017_021b81b8
        .extern data_ov017_021b81d4
        .extern data_ov017_021b81f0
        .extern data_ov017_021b8610
        .extern data_ov017_021b8894
        .extern data_ov017_021b8994
        .extern func_02006c0c
        .extern func_02006e1c
        .extern func_0201d47c
        .extern func_0201e5b8
        .extern func_0202c0c0
        .extern func_02091554
        .extern func_02093820
        .extern func_02094504
        .extern func_ov017_021b2280
        .extern func_ov017_021b4334
        .extern func_ov017_021b6264
        .extern func_ov017_021b66a8
        .global func_ov017_021b4570
        .arm
func_ov017_021b4570:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x354
    sub sp, sp, #0x400
    mov r5, r1
    mov r9, r0
    ldr r1, _LIT0
    mov r0, #0x0
    mov r2, #0x6c
    bl func_02094504
    str r5, [r9, #0x4]
    cmp r5, #0x3
    bne .L_100
    ldr r0, _LIT1
    ldr r2, _LIT2
    ldr r3, [r0, #0xa70]
    ldr r1, _LIT3
    ldr r0, [r0, #0xa6c]
    ldr r2, [r2, #0x1d4]
    and r1, r3, r1
    str r1, [sp, #0x8]
    str r2, [r9, #0x60]
    str r0, [sp, #0x4]
    bl func_ov017_021b2280
    str r0, [r9, #0x14]
    ldr r0, [sp, #0x8]
    bl func_ov017_021b2280
    mov r4, #0x0
    ldr r1, [r9, #0x14]
    mov r2, r4
    add r0, r1, r0
    str r0, [r9, #0x14]
    mov r3, r4
    mov r1, #0x1
    add r0, sp, #0x4
.L_88:
    mov r5, r3, asr #0x4
    add r5, r3, r5, lsr #0x1b
    mov r6, r3, lsr #0x1f
    mov r7, r5, asr #0x5
    rsb r5, r6, r3, lsl #0x1b
    ldr r7, [r0, r7, lsl #0x2]
    add r5, r6, r5, ror #0x1b
    tst r7, r1, lsl r5
    beq .L_c8
    add r6, r3, #0x1
    add r5, r9, r2
    strb r6, [r5, #0x20]
    ldr r5, [r9, #0x60]
    cmp r6, r5
    moveq r4, r2
    add r2, r2, #0x1
.L_c8:
    add r3, r3, #0x1
    cmp r3, #0x40
    blt .L_88
    cmp r4, #0x5
    blt .L_f0
    sub r0, r4, #0x4
    str r0, [r9, #0xc]
    sub r0, r4, r0
    str r0, [r9, #0x10]
    b .L_2ac
.L_f0:
    mov r0, #0x0
    str r0, [r9, #0xc]
    str r4, [r9, #0x10]
    b .L_2ac
.L_100:
    cmp r5, #0x0
    beq .L_11c
    cmp r5, #0x1
    beq .L_18c
    cmp r5, #0x2
    beq .L_200
    b .L_288
.L_11c:
    ldr r1, _LIT2
    ldr r0, _LIT1
    ldrb r2, [r1, #0x1ce]
    ldr r1, _LIT3
    str r2, [r9, #0x60]
    ldr r0, [r0, #0xa68]
    mov r0, r0, lsl #0x10
    and r5, r1, r0, lsr #0x10
    mov r0, r5
    bl func_ov017_021b2280
    mov r4, #0x0
    mov r6, r4
    mov r3, r4
    str r0, [r9, #0x14]
    mov r2, #0x1
.L_158:
    tst r5, r2, lsl r3
    beq .L_17c
    add r1, r3, #0x1
    add r0, r9, r6
    strb r1, [r0, #0x20]
    ldr r0, [r9, #0x60]
    cmp r1, r0
    moveq r4, r6
    add r6, r6, #0x1
.L_17c:
    add r3, r3, #0x1
    cmp r3, #0xc
    blt .L_158
    b .L_288
.L_18c:
    ldr r1, _LIT2
    ldr r0, _LIT1
    ldrb r1, [r1, #0x1cf]
    str r1, [r9, #0x60]
    ldr r0, [r0, #0xa68]
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    and r5, r0, #0xff
    mov r0, r5
    bl func_ov017_021b2280
    mov r4, #0x0
    mov r6, r4
    mov r3, r4
    str r0, [r9, #0x14]
    mov r2, #0x1
.L_1cc:
    tst r5, r2, lsl r3
    beq .L_1f0
    add r1, r3, #0x1
    add r0, r9, r6
    strb r1, [r0, #0x20]
    ldr r0, [r9, #0x60]
    cmp r1, r0
    moveq r4, r6
    add r6, r6, #0x1
.L_1f0:
    add r3, r3, #0x1
    cmp r3, #0x8
    blt .L_1cc
    b .L_288
.L_200:
    ldr r1, _LIT4
    ldr r0, _LIT1
    ldrh r1, [r1, #0xd0]
    str r1, [r9, #0x60]
    ldr r0, [r0, #0xa74]
    mov r0, r0, lsl #0x10
    mov r5, r0, lsr #0x10
    mov r0, r5
    bl func_ov017_021b2280
    mov r4, #0x0
    mov r6, r4
    mov r3, r4
    str r0, [r9, #0x14]
    mov r2, #0x1
.L_238:
    tst r5, r2, lsl r3
    beq .L_25c
    add r1, r3, #0x1
    add r0, r9, r6
    strb r1, [r0, #0x20]
    ldr r0, [r9, #0x60]
    cmp r1, r0
    moveq r4, r6
    add r6, r6, #0x1
.L_25c:
    add r3, r3, #0x1
    cmp r3, #0x10
    blt .L_238
    ldr r0, [r9, #0x60]
    cmp r0, #0x0
    bne .L_288
    ldrb r2, [r9, #0x20]
    ldr r0, _LIT4
    mov r1, #0x10
    strh r2, [r0, #0xd0]
    strh r1, [r0, #0xd8]
.L_288:
    cmp r4, #0x5
    movlt r0, #0x0
    strlt r0, [r9, #0xc]
    strlt r4, [r9, #0x10]
    blt .L_2ac
    sub r0, r4, #0x4
    str r0, [r9, #0xc]
    sub r0, r4, r0
    str r0, [r9, #0x10]
.L_2ac:
    mov r0, r9
    bl func_ov017_021b66a8
    ldr r0, [r9, #0x14]
    cmp r0, #0x5
    ble .L_454
    mvn r7, #0x0
    add r5, sp, #0x54
    add r4, sp, #0x34
    mov r6, #0x1
    ldr r8, _LIT5
    b .L_438
.L_2d8:
    ldr r0, [r9, #0xc]
    adds r1, r0, r7
    bmi .L_434
    ldr r0, [r9, #0x4]
    cmp r0, #0x2
    mov r0, r9
    beq .L_34c
    bl func_ov017_021b6264
    str r6, [sp]
    mov r2, r0
    ldr r0, [r9, #0xc]
    mov r1, r5
    add r0, r0, #0x1
    add r0, r0, r7
    smull sl, r3, r8, r0
    add r3, r0, r3
    mov sl, r0, lsr #0x1f
    add r3, sl, r3, asr #0x2
    mov sl, #0x7
    smull r3, fp, sl, r3
    sub r3, r0, r3
    mov r0, #0xe
    mul r0, r3, r0
    add r0, r0, #0x288
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r3, #0x700
    bl func_ov017_021b4334
    b .L_434
.L_34c:
    bl func_ov017_021b6264
    mov r1, #0x0
    str r1, [sp]
    mov r2, r0
    ldr r0, [r9, #0xc]
    mov r1, r5
    add r0, r0, #0x1
    add r0, r0, r7
    smull sl, r3, r8, r0
    add r3, r0, r3
    mov sl, r0, lsr #0x1f
    add r3, sl, r3, asr #0x2
    mov sl, #0x7
    smull r3, fp, sl, r3
    sub r3, r0, r3
    mov r0, #0xe
    mul r0, r3, r0
    add r0, r0, #0x288
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r3, #0x600
    bl func_ov017_021b4334
    ldr r0, _LIT6
    bl func_0202c0c0
    ldr r2, [r9, #0xc]
    mov r1, r0
    add r2, r9, r2
    add r2, r7, r2
    ldrb r3, [r2, #0x20]
    ldr r2, _LIT1
    mov r0, r4
    add r2, r2, r3, lsl #0x3
    add r2, r2, #0xa00
    ldrh r2, [r2, #0x78]
    add r2, r2, #0x1
    bl func_02091554
    mov r0, #0x0
    str r0, [sp]
    ldr r0, [r9, #0xc]
    mov r1, r5
    add r0, r0, #0x1
    add r0, r0, r7
    smull r3, r2, r8, r0
    add r2, r0, r2
    mov r3, r0, lsr #0x1f
    add r2, r3, r2, asr #0x2
    mov r3, sl
    smull r2, sl, r3, r2
    sub r2, r0, r2
    mov r0, #0xc
    mul r0, r2, r0
    add r0, r0, #0xea
    add r0, r0, #0x200
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r2, r4
    mov r3, #0x200
    bl func_ov017_021b4334
.L_434:
    add r7, r7, #0x1
.L_438:
    ldr r0, [r9, #0x14]
    cmp r0, #0x5
    movgt r0, #0x5
    add r0, r0, #0x1
    cmp r7, r0
    blt .L_2d8
    b .L_5a0
.L_454:
    mov r7, #0x0
    mov fp, r7
    add r6, sp, #0x54
    add r5, sp, #0x34
    mov sl, #0x1
    ldr r4, _LIT5
    b .L_58c
.L_470:
    ldr r0, [r9, #0x4]
    cmp r0, #0x2
    beq .L_4d4
    mov r0, r9
    mov r1, r7
    bl func_ov017_021b6264
    mov r2, r0
    add r0, r7, #0x1
    smull r3, r1, r4, r0
    add r1, r0, r1
    mov r3, r0, lsr #0x1f
    add r1, r3, r1, asr #0x2
    mov r3, #0x7
    smull r1, r8, r3, r1
    sub r1, r0, r1
    mov r0, #0xe
    mul r0, r1, r0
    add r0, r0, #0x288
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r6
    mov r3, #0x700
    str sl, [sp]
    bl func_ov017_021b4334
    b .L_588
.L_4d4:
    add r0, r7, #0x1
    smull r1, r8, r4, r0
    add r8, r0, r8
    mov r1, r0, lsr #0x1f
    add r8, r1, r8, asr #0x2
    mov r1, #0x7
    smull r2, r3, r1, r8
    sub r8, r0, r2
    mov r0, r9
    mov r1, r7
    bl func_ov017_021b6264
    mov r2, r0
    mov r0, #0xe
    mul r0, r8, r0
    add r0, r0, #0x288
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r6
    mov r3, #0x600
    str fp, [sp]
    bl func_ov017_021b4334
    ldr r0, _LIT6
    bl func_0202c0c0
    add r2, r9, r7
    ldrb r3, [r2, #0x20]
    ldr r2, _LIT1
    mov r1, r0
    add r2, r2, r3, lsl #0x3
    add r2, r2, #0xa00
    ldrh r2, [r2, #0x78]
    mov r0, r5
    add r2, r2, #0x1
    bl func_02091554
    mov r0, #0xc
    mul r0, r8, r0
    add r0, r0, #0xea
    add r0, r0, #0x200
    mov r0, r0, lsl #0x10
    mov r1, #0x0
    str r1, [sp]
    mov r0, r0, lsr #0x10
    mov r1, r6
    mov r2, r5
    mov r3, #0x200
    bl func_ov017_021b4334
.L_588:
    add r7, r7, #0x1
.L_58c:
    ldr r0, [r9, #0x14]
    cmp r0, #0x5
    movgt r0, #0x5
    cmp r7, r0
    blt .L_470
.L_5a0:
    ldr r1, [r9, #0xc]
    ldr r0, [r9, #0x10]
    ldr r2, _LIT7
    add r0, r1, r0
    str r0, [r9, #0x1c]
    ldrh r1, [r2]
    add r0, sp, #0xc
    and r1, r1, #0x43
    orr r1, r1, #0x388
    orr r1, r1, #0xc00
    strh r1, [r2]
    bl func_0201d47c
    ldr r0, [r9, #0x4]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_64c
    b .L_5f0
    b .L_608
    b .L_620
    b .L_638
.L_5f0:
    ldr r0, _LIT8
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    str r0, [sp, #0xc]
    b .L_64c
.L_608:
    ldr r0, _LIT9
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    str r0, [sp, #0xc]
    b .L_64c
.L_620:
    ldr r0, _LIT10
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    str r0, [sp, #0xc]
    b .L_64c
.L_638:
    ldr r0, _LIT11
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    str r0, [sp, #0xc]
.L_64c:
    ldrh r0, [sp, #0x32]
    ldrh r2, [sp, #0x20]
    ldrh r1, [sp, #0x30]
    bic r0, r0, #0xff
    bic r2, r2, #0xf
    orr r0, r0, #0x20
    strh r0, [sp, #0x32]
    bic r0, r1, #0xff
    strh r0, [sp, #0x30]
    orr r2, r2, #0x7
    strh r2, [sp, #0x20]
    ldr r1, [sp, #0x24]
    ldrh r5, [sp, #0x20]
    bic r2, r1, #0x1c000
    ldrh r3, [sp, #0x30]
    ldrh r1, [sp, #0x22]
    orr r5, r5, #0x10
    bic r3, r3, #0xff00
    orr r1, r1, #0x4000
    mov r6, #0x600
    ldrh r0, [sp, #0x32]
    orr r4, r2, #0x8000
    str r6, [sp, #0x18]
    bic r2, r0, #0xff00
    bic r0, r4, #0x3f80
    orr r2, r2, #0x1000
    orr r0, r0, #0x80
    mov r4, #0x200
    strh r5, [sp, #0x20]
    strh r4, [sp, #0x1c]
    strh r3, [sp, #0x30]
    strh r2, [sp, #0x32]
    strh r1, [sp, #0x22]
    str r0, [sp, #0x24]
    bl func_02093820
    add r0, sp, #0xc
    bl func_0201e5b8
    ldr r0, [sp, #0xc]
    bl func_02006e1c
    add r0, sp, #0xc
    bl func_0201d47c
    ldr r0, _LIT12
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    str r0, [sp, #0xc]
    ldrh r0, [sp, #0x32]
    mov r1, #0x880
    ldrh r2, [sp, #0x20]
    bic r0, r0, #0xff
    orr r0, r0, #0x1b
    strh r0, [sp, #0x32]
    ldrh r0, [sp, #0x30]
    str r1, [sp, #0x18]
    bic r1, r2, #0xf
    orr r1, r1, #0x7
    strh r1, [sp, #0x20]
    mov r1, r4
    bic r0, r0, #0xff
    strh r1, [sp, #0x1c]
    strh r0, [sp, #0x30]
    ldr r1, [sp, #0x24]
    ldrh r0, [sp, #0x30]
    bic r1, r1, #0x1c000
    orr r1, r1, #0x1c000
    bic r0, r0, #0xff00
    strh r0, [sp, #0x30]
    bic r0, r1, #0x7f
    orr r0, r0, #0x1
    ldrh r1, [sp, #0x32]
    str r0, [sp, #0x24]
    ldrh r0, [sp, #0x22]
    bic r1, r1, #0xff00
    orr r1, r1, #0x200
    orr r0, r0, #0x4000
    mov r4, #0x0
    strh r1, [sp, #0x32]
    strh r0, [sp, #0x22]
    mov r5, #0x2
    mov r6, #0x5
    add r7, sp, #0xc
    b .L_7b8
.L_794:
    ldr r1, [sp, #0x24]
    mov r0, r5, lsl #0x19
    bic r1, r1, #0x3f80
    orr r1, r1, r0, lsr #0x12
    mov r0, r7
    str r1, [sp, #0x24]
    bl func_0201e5b8
    add r5, r5, #0x3
    add r4, r4, #0x1
.L_7b8:
    ldr r0, [r9, #0x14]
    cmp r0, #0x5
    movgt r0, r6
    cmp r4, r0
    blt .L_794
    ldr r0, [sp, #0xc]
    bl func_02006e1c
    ldr r3, _LIT13
    mov r0, #0x1
    ldr r2, [r3]
    ldr r1, [r3]
    and r2, r2, #0x1f00
    mov r4, r2, lsr #0x8
    bic r2, r1, #0x1f00
    orr r1, r4, #0x4
    orr r1, r2, r1, lsl #0x8
    str r1, [r3]
    add sp, sp, #0x354
    add sp, sp, #0x400
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov017_021b8610
_LIT1: .word data_02104f4c
_LIT2: .word data_ov017_021b8894
_LIT3: .word 0x00000fff
_LIT4: .word data_ov017_021b8994
_LIT5: .word 0x92492493
_LIT6: .word 0x000006ca
_LIT7: .word 0x0400100c
_LIT8: .word data_ov017_021b8180
_LIT9: .word data_ov017_021b819c
_LIT10: .word data_ov017_021b81b8
_LIT11: .word data_ov017_021b81d4
_LIT12: .word data_ov017_021b81f0
_LIT13: .word 0x04001000
