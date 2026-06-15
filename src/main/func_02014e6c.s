; func_02014e6c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_020139c4
        .extern func_02019034
        .extern func_020190ec
        .extern func_020190fc
        .extern func_020195ec
        .extern func_02019640
        .extern func_02019664
        .extern func_0201aabc
        .extern func_0201aaf4
        .extern func_0201b7b4
        .extern func_0201b7e0
        .extern func_ov000_021ae4ac
        .global func_02014e6c
        .arm
func_02014e6c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl GetSystemWork
    mov r4, r0
    ldr r0, [r4, #0x8d8]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x920]
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r3, r4, r5, pc}
    ldmia sp!, {r3, r4, r5, pc}
    b .L_1454
    b .L_1474
    b .L_1484
    b .L_14ec
    b .L_150c
    b .L_15fc
.L_1454:
    bl func_020190fc
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_020139c4
    cmp r0, #0x5
    ldreq r0, _LIT0
    streq r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_1474:
    ldr r0, _LIT1
    str r0, [r5, #0x8]
    bl func_0201b7b4
    ldmia sp!, {r3, r4, r5, pc}
.L_1484:
    ldr r0, [r4, #0x924]
    cmp r0, #0x1
    beq .L_14a4
    cmp r0, #0x2
    beq .L_14e0
    cmp r0, #0x3
    beq .L_14ac
    ldmia sp!, {r3, r4, r5, pc}
.L_14a4:
    mov r0, #0x3
    str r0, [r4, #0x924]
.L_14ac:
    bl func_020190ec
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_02019034
    ldr r1, [r4, #0x8dc]
    add r1, r1, #0x1
    cmp r0, r1
    ldmccia sp!, {r3, r4, r5, pc}
    bl func_020139c4
    cmp r0, #0x5
    ldreq r0, _LIT2
    streq r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_14e0:
    ldr r0, _LIT3
    str r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_14ec:
    ldr r1, _LIT4
    mov r0, #0x7b
    str r1, [r5, #0x8]
    bl func_0201aabc
    ldr r0, [r4, #0x900]
    orr r0, r0, #0x1000000
    str r0, [r4, #0x900]
    ldmia sp!, {r3, r4, r5, pc}
.L_150c:
    ldr r0, [r4, #0x924]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r3, r4, r5, pc}
    ldmia sp!, {r3, r4, r5, pc}
    b .L_1530
    b .L_15a4
    b .L_1554
    b .L_1538
.L_1530:
    mov r0, #0x4
    str r0, [r4, #0x924]
.L_1538:
    ldr r0, _LIT5
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x8e0]
    ldmia sp!, {r3, r4, r5, pc}
.L_1554:
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_020195ec
    cmp r0, #0x0
    bne .L_1598
    ldr r0, _LIT6
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x924]
    sub r0, r0, #0x1
    str r0, [r4, #0x924]
    ldmia sp!, {r3, r4, r5, pc}
.L_1598:
    ldr r0, _LIT7
    str r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_15a4:
    ldr r0, _LIT8
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    bne .L_15e0
    mov r0, #0xe
    str r0, [r4, #0x91c]
    mov r0, #0x3
    str r0, [r4, #0x920]
    mov r0, #0x4
    str r0, [r4, #0x924]
    ldr r0, [r4, #0x8e0]
    orr r0, r0, #0x4
    str r0, [r4, #0x8e0]
.L_15e0:
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, #0x0
    bl func_02019640
    ldmia sp!, {r3, r4, r5, pc}
.L_15fc:
    ldr r0, [r4, #0x924]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r3, r4, r5, pc}
    ldmia sp!, {r3, r4, r5, pc}
    b .L_1620
    b .L_16d4
    b .L_1660
    b .L_1628
.L_1620:
    mov r0, #0x4
    str r0, [r4, #0x924]
.L_1628:
    mov r0, r5
    bl func_0201b7e0
    cmp r0, #0x3
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_02019664
    cmp r0, #0x7b
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT9
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x8e0]
    ldmia sp!, {r3, r4, r5, pc}
.L_1660:
    bl func_ov000_021ae4ac
    cmp r0, #0x2
    bne .L_16a8
    mov r0, #0xe
    str r0, [r4, #0x91c]
    mov r0, #0x6
    str r0, [r4, #0x920]
    mov r0, #0x4
    str r0, [r4, #0x924]
    ldr r1, [r4, #0x8e0]
    mov r0, #0x0
    orr r1, r1, #0x4
    str r1, [r4, #0x8e0]
    bl func_02019640
    ldr r0, [r4, #0x8e0]
    orr r0, r0, #0x4
    str r0, [r4, #0x8e0]
    ldmia sp!, {r3, r4, r5, pc}
.L_16a8:
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_020195ec
    cmp r0, #0x0
    ldreq r0, _LIT10
    streq r0, [r5, #0x8]
    ldrne r0, _LIT11
    strne r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_16d4:
    ldr r0, _LIT12
    str r0, [r5, #0x8]
    bl func_0201b7b4
    mov r0, #0x7b
    bl func_0201aaf4
    ldr r0, [r4, #0x900]
    bic r0, r0, #0x1000000
    str r0, [r4, #0x900]
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x000e0100
_LIT1: .word 0x000e0200
_LIT2: .word 0x000e0300
_LIT3: .word 0x000e0301
_LIT4: .word 0x000e0400
_LIT5: .word 0x000e0500
_LIT6: .word 0x000e0504
_LIT7: .word 0x000e0502
_LIT8: .word 0x000e0503
_LIT9: .word 0x000e0600
_LIT10: .word 0x000e0601
_LIT11: .word 0x000e0602
_LIT12: .word 0x000e0603
