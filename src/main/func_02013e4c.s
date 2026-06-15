; func_02013e4c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_020139b4
        .extern func_020139c4
        .extern func_02018a38
        .extern func_02018a64
        .extern func_020190ec
        .extern func_020190fc
        .extern func_020195b8
        .extern func_020195ec
        .extern func_0201969c
        .extern func_0201b7b4
        .extern func_0201b7e0
        .global func_02013e4c
        .arm
func_02013e4c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl GetSystemWork
    mov r4, r0
    ldr r0, [r4, #0x8d8]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x920]
    cmp r0, #0x9
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r3, r4, r5, pc}
    ldmia sp!, {r3, r4, r5, pc}
    b .L_440
    b .L_488
    b .L_494
    b .L_4a0
    b .L_4ac
    b .L_4e8
    b .L_4fc
    b .L_598
    b .L_5b0
.L_440:
    mov r0, #0xd
    mov r1, #0x0
    bl func_020195b8
    cmp r0, #0x0
    ldmleia sp!, {r3, r4, r5, pc}
    mov r0, #0xe
    mov r1, #0x0
    bl func_020195b8
    cmp r0, #0x0
    ldmleia sp!, {r3, r4, r5, pc}
    bl func_020190fc
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_020139c4
    cmp r0, #0x5
    ldreq r0, _LIT0
    streq r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_488:
    ldr r0, _LIT1
    str r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_494:
    ldr r0, _LIT2
    str r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_4a0:
    ldr r0, _LIT3
    str r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_4ac:
    mov r0, r5
    bl func_0201b7e0
    cmp r0, #0x4
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_020139b4
    cmp r0, #0x2
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x900]
    ldr r1, _LIT4
    orr r0, r0, #0x1000000
    str r0, [r4, #0x900]
    mov r0, #0x13
    str r1, [r5, #0x8]
    bl func_02018a38
    ldmia sp!, {r3, r4, r5, pc}
.L_4e8:
    bl func_0201969c
    cmp r0, #0x42
    ldreq r0, _LIT5
    streq r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_4fc:
    ldr r0, [r4, #0x924]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r3, r4, r5, pc}
    ldmia sp!, {r3, r4, r5, pc}
    b .L_520
    b .L_580
    b .L_554
    b .L_528
.L_520:
    mov r0, #0x4
    str r0, [r4, #0x924]
.L_528:
    bl func_0201969c
    cmp r0, #0x40
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT6
    str r0, [r5, #0x8]
    bl func_02018a64
    ldr r0, [r4, #0x8e0]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x8e0]
    ldmia sp!, {r3, r4, r5, pc}
.L_554:
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_020195ec
    cmp r0, #0x0
    ldreq r0, _LIT7
    streq r0, [r5, #0x8]
    ldrne r0, _LIT8
    strne r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_580:
    ldr r0, _LIT9
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x900]
    bic r0, r0, #0x1000000
    str r0, [r4, #0x900]
    ldmia sp!, {r3, r4, r5, pc}
.L_598:
    mov r0, r5
    bl func_0201b7e0
    cmp r0, #0x4
    ldreq r0, _LIT10
    streq r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_5b0:
    bl func_020190ec
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_020139c4
    cmp r0, #0x5
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT11
    str r0, [r5, #0x8]
    bl func_0201b7b4
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00040100
_LIT1: .word 0x00040200
_LIT2: .word 0x00040300
_LIT3: .word 0x00040400
_LIT4: .word 0x00040500
_LIT5: .word 0x00040600
_LIT6: .word 0x00040700
_LIT7: .word 0x00040701
_LIT8: .word 0x00040702
_LIT9: .word 0x00040703
_LIT10: .word 0x00040800
_LIT11: .word 0x00040900
