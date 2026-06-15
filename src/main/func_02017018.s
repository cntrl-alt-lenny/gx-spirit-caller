; func_02017018 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_02018a38
        .extern func_020195ec
        .extern func_02019664
        .extern func_0201967c
        .extern func_0201969c
        .extern func_0201abb0
        .extern func_0201abd4
        .extern func_0201b708
        .extern func_0201b7b4
        .global func_02017018
        .arm
func_02017018:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl GetSystemWork
    mov r4, r0
    ldr r0, [r4, #0x8d8]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x920]
    cmp r0, #0x1
    beq .L_35f4
    cmp r0, #0x2
    beq .L_3628
    cmp r0, #0x3
    beq .L_3718
    ldmia sp!, {r3, r4, r5, pc}
.L_35f4:
    bl func_02019664
    cmp r0, #0x65
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_0201969c
    cmp r0, #0x4
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, #0x4
    bl func_0201abd4
    mov r0, #0x2
    bl func_0201abb0
    ldr r0, _LIT0
    str r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_3628:
    ldr r0, [r4, #0x924]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r3, r4, r5, pc}
    ldmia sp!, {r3, r4, r5, pc}
    b .L_364c
    b .L_36e4
    b .L_3694
    b .L_3654
.L_364c:
    mov r0, #0x4
    str r0, [r4, #0x924]
.L_3654:
    bl func_02019664
    cmp r0, #0x65
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_0201969c
    cmp r0, #0x2
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT1
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x8e0]
    ldr r0, [r4, #0x900]
    orr r0, r0, #0x1000000
    str r0, [r4, #0x900]
    ldmia sp!, {r3, r4, r5, pc}
.L_3694:
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_020195ec
    cmp r0, #0x0
    bne .L_36d8
    ldr r0, _LIT2
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    ldreq r0, [r4, #0x924]
    subeq r0, r0, #0x1
    streq r0, [r4, #0x924]
    bl func_0201b7b4
    ldmia sp!, {r3, r4, r5, pc}
.L_36d8:
    ldr r0, _LIT3
    str r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_36e4:
    ldr r0, _LIT4
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    bne .L_370c
    mov r0, #0x2
    str r0, [r4, #0x920]
    mov r0, #0x5
    str r0, [r4, #0x924]
.L_370c:
    mov r0, #0x0
    bl func_0201967c
    ldmia sp!, {r3, r4, r5, pc}
.L_3718:
    ldr r0, [r4, #0x924]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r3, r4, r5, pc}
    ldmia sp!, {r3, r4, r5, pc}
    b .L_373c
    b .L_37dc
    b .L_3778
    b .L_3744
.L_373c:
    mov r0, #0x4
    str r0, [r4, #0x924]
.L_3744:
    bl func_02019664
    cmp r0, #0x65
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_0201969c
    cmp r0, #0x2
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT5
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x8e0]
    ldmia sp!, {r3, r4, r5, pc}
.L_3778:
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_020195ec
    cmp r0, #0x0
    bne .L_37d0
    ldr r1, _LIT6
    mov r0, #0xb
    str r1, [r5, #0x8]
    bl func_0201b708
    mov r0, #0x2
    bl func_0201abd4
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    ldreq r0, [r4, #0x924]
    subeq r0, r0, #0x1
    streq r0, [r4, #0x924]
    mov r0, #0x14
    bl func_02018a38
    ldmia sp!, {r3, r4, r5, pc}
.L_37d0:
    ldr r0, _LIT7
    str r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_37dc:
    ldr r0, _LIT8
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, #0x3
    str r0, [r4, #0x920]
    mov r0, #0x5
    str r0, [r4, #0x924]
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00200100
_LIT1: .word 0x00200200
_LIT2: .word 0x00200204
_LIT3: .word 0x00200202
_LIT4: .word 0x00200203
_LIT5: .word 0x00200300
_LIT6: .word 0x00200304
_LIT7: .word 0x00200302
_LIT8: .word 0x00200303
