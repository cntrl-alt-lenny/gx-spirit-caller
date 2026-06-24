; func_020157a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_02013990
        .extern func_02018a04
        .extern func_02018a30
        .extern func_020190b8
        .extern func_020195b8
        .extern func_0201960c
        .extern func_02019668
        .extern func_0201b774
        .global func_020157a0
        .arm
func_020157a0:
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
    beq .L_528
    cmp r0, #0x2
    beq .L_548
    cmp r0, #0x3
    beq .L_568
    ldmia sp!, {r3, r4, r5, pc}
.L_528:
    bl func_020190b8
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_02013990
    cmp r0, #0x5
    ldreq r0, _LIT0
    streq r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_548:
    ldr r1, _LIT1
    mov r0, #0x13
    str r1, [r5, #0x8]
    bl func_02018a04
    ldr r0, [r4, #0x900]
    orr r0, r0, #0x1000000
    str r0, [r4, #0x900]
    ldmia sp!, {r3, r4, r5, pc}
.L_568:
    ldr r0, [r4, #0x924]
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r3, r4, r5, pc}
    ldmia sp!, {r3, r4, r5, pc}
    b .L_590
    b .L_628
    b .L_5c8
    b .L_5ac
    b .L_598
.L_590:
    mov r0, #0x5
    str r0, [r4, #0x924]
.L_598:
    bl func_02019668
    cmp r0, #0xf
    ldreq r0, _LIT2
    streq r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_5ac:
    ldr r0, _LIT3
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x8e0]
    ldmia sp!, {r3, r4, r5, pc}
.L_5c8:
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_020195b8
    cmp r0, #0x0
    bne .L_61c
    ldr r0, _LIT4
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    ldreq r0, [r4, #0x924]
    subeq r0, r0, #0x1
    streq r0, [r4, #0x924]
    bl func_0201b774
    ldr r0, [r4, #0x900]
    bic r0, r0, #0x1000000
    str r0, [r4, #0x900]
    bl func_02018a30
    ldmia sp!, {r3, r4, r5, pc}
.L_61c:
    ldr r0, _LIT5
    str r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_628:
    ldr r0, _LIT6
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    bne .L_650
    mov r0, #0x3
    str r0, [r4, #0x920]
    mov r0, #0x6
    str r0, [r4, #0x924]
.L_650:
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, #0x0
    bl func_0201960c
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00130100
_LIT1: .word 0x00130200
_LIT2: .word 0x00130300
_LIT3: .word 0x00130301
_LIT4: .word 0x00130305
_LIT5: .word 0x00130303
_LIT6: .word 0x00130304
