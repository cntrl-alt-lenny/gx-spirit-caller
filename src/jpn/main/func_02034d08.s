; func_02034d08 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020bea98
        .extern data_020beac8
        .extern data_020beaf8
        .extern data_020fe3a0
        .extern data_020fe3a8
        .extern data_020fe3bc
        .extern data_020fe3d0
        .extern data_0219b200
        .extern data_0219b320
        .extern data_0219cf8c
        .extern func_02034be4
        .extern func_02037918
        .extern func_02038544
        .extern func_02039790
        .extern func_0203ab90
        .extern func_0207d294
        .extern func_0207d3f4
        .extern func_0207d960
        .extern func_02087118
        .extern func_02087174
        .extern func_02088cf0
        .extern func_020895e4
        .extern func_02089850
        .extern func_0208c758
        .extern func_02097d24
        .extern func_02097e1c
        .extern func_02097efc
        .extern func_02097f94
        .extern func_02098068
        .extern func_02098294
        .extern func_02098374
        .extern func_020aace8
        .extern func_020aad04
        .extern func_020aae1c
        .global func_02034d08
        .arm
func_02034d08:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x50
    movs r8, r0
    mov r5, r1
    mov sl, r2
    mov r4, r3
    bne .L_34
    ldr r0, _LIT0
    mov r1, #0x0
    strh r1, [r0, #0x12]
    add sp, sp, #0x50
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_34:
    ldr r0, _LIT0
    cmp sl, #0x0
    rsblt sl, sl, #0x0
    mvn r1, #0x0
    str sl, [r0, #0x44]
    strh r1, [r0, #0xe]
    strh r1, [r0, #0x10]
    mov r1, #0x0
    strh r1, [r0, #0x2]
    mov r6, #0x3000
    ldrh r0, [r0, #0x12]
    movlt r6, #0x0
    mov r7, r5
    tst r0, #0x8000
    addne sp, sp, #0x50
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    bl func_0208c758
    bl func_02087174
    mov r0, #0x0
    bl func_02087118
    bl func_02098374
    ldr r2, _LIT0
    ldr r1, _LIT1
    str r0, [r2, #0x38]
    str r4, [r1, #0x4]
    ldr r0, _LIT2
    mov r1, r8
    bl func_020aad04
    ldr r0, _LIT3
    mov r1, r8
    bl func_020aad04
    ldr r0, _LIT4
    mov r1, r8
    bl func_020aad04
    add r0, sp, #0x8
    bl func_02098294
    add r0, sp, #0x8
    mov r1, r8
    bl func_02097d24
    cmp r0, #0x0
    addeq sp, sp, #0x50
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    mov r0, r8
    bl func_020aace8
    cmp r0, #0x20
    addcs sp, sp, #0x50
    movcs r0, #0x0
    ldmcsia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r0, _LIT4
    ldr r1, _LIT5
    bl func_020aae1c
    ldr r0, _LIT3
    ldr r1, _LIT6
    bl func_020aae1c
    ldr r0, _LIT2
    ldr r1, _LIT7
    bl func_020aae1c
    ldr r1, _LIT2
    add r0, sp, #0x0
    bl func_02098068
    cmp r0, #0x0
    addeq sp, sp, #0x50
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r1, _LIT0
    mov r0, #0x1
    str r5, [r1, #0x18]
    bl func_02038544
    ldr r2, [sp, #0x70]
    mov r0, r5
    mov r1, #0x600
    bl func_02037918
    ldr r0, _LIT0
    add r1, r5, #0xc00
    ldr r3, [r0, #0x44]
    sub r2, r1, r5
    ldr r1, _LIT8
    add r8, r5, #0x600
    add r0, sp, #0x8
    str r8, [r1]
    mov r9, r5
    sub sl, r3, r2
    bl func_02098294
    ldr r0, _LIT0
    add r1, r5, #0xc00
    str r1, [r0, #0x1c]
    ldr r1, _LIT3
    add r0, sp, #0x0
    bl func_02098068
    cmp r0, #0x0
    addeq sp, sp, #0x50
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    add r1, sp, #0x0
    add r0, sp, #0x8
    ldmia r1, {r1, r2}
    bl func_02097f94
    cmp r0, #0x0
    addeq sp, sp, #0x50
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    add r0, sp, #0x8
    add r1, r5, #0xc00
    mov r2, #0x14
    bl func_02097e1c
    cmp r0, #0x14
    addne sp, sp, #0x50
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r0, [r5, #0xc00]
    cmp r0, #0x130
    addne sp, sp, #0x50
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    add r1, r5, #0xc00
    ldrh r2, [r1, #0x8]
    ldr r8, [r5, #0xc04]
    ldr r0, _LIT0
    cmp sl, r8
    strh r2, [r0, #0xa]
    ldrh r3, [r1, #0xa]
    addcc sp, sp, #0x50
    strh r3, [r0]
    ldrh r2, [r0, #0xa]
    add r2, r2, r3
    strh r2, [r0, #0x14]
    ldr r2, [r5, #0xc0c]
    add r3, r1, r2
    str r3, [r0, #0x3c]
    ldr r2, [r5, #0xc10]
    add r2, r3, r2
    str r2, [r0, #0x34]
    movcc r0, #0x0
    ldmccia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    add r0, sp, #0x8
    mov r2, r8
    bl func_02097e1c
    cmp r8, r0
    addne sp, sp, #0x50
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    add r0, sp, #0x8
    bl func_02097efc
    add r0, r5, #0xc00
    add r0, r0, r8
    add r0, r0, #0x3
    bic r5, r0, #0x3
    ldr r1, _LIT0
    add r0, sp, #0x8
    str r5, [r1, #0x4c]
    ldr r2, [r1, #0x44]
    sub r1, r5, r9
    sub r8, r2, r1
    bl func_02098294
    ldr r1, _LIT4
    add r0, sp, #0x0
    bl func_02098068
    cmp r0, #0x0
    bne .L_2cc
    ldr r0, _LIT0
    mov sl, #0x0
    str sl, [r0, #0x28]
    str sl, [r0, #0x4c]
    b .L_350
.L_2cc:
    add r1, sp, #0x0
    add r0, sp, #0x8
    ldmia r1, {r1, r2}
    bl func_02097f94
    cmp r0, #0x0
    addeq sp, sp, #0x50
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    add r0, sp, #0x8
    mov r1, r5
    mov r2, #0x4
    bl func_02097e1c
    cmp r0, #0x4
    addne sp, sp, #0x50
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r0, _LIT0
    ldr r1, [r0, #0x4c]
    ldr sl, [r1]
    cmp r8, sl
    str sl, [r0, #0x28]
    addcc sp, sp, #0x50
    movcc r0, #0x0
    ldmccia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    add r0, sp, #0x8
    mov r2, sl
    bl func_02097e1c
    cmp sl, r0
    addne sp, sp, #0x50
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    add r0, sp, #0x8
    bl func_02097efc
.L_350:
    add r0, r5, sl
    add r2, r0, #0x1f
    ldr r0, _LIT0
    mov r1, #0x0
    bic r2, r2, #0x1f
    str r1, [r0, #0x58]
    cmp r6, #0x0
    strne r2, [r0, #0x58]
    ldr r0, _LIT0
    add r8, r2, r6
    ldr r1, [r0, #0x44]
    sub r0, r2, r9
    sub r1, r1, r0
    mov r0, r8
    sub r1, r1, r6
    bl func_02089850
    movs r5, r0
    addeq sp, sp, #0x50
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r0, _LIT2
    ldr r1, _LIT4
    bl func_02039790
    cmp r0, #0x0
    addlt sp, sp, #0x50
    movlt r0, #0x0
    ldmltia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r0, _LIT9
    ldr r1, _LIT2
    mov r2, r5
    mov r3, #0x0
    bl func_020895e4
    mov r0, r4
    bl func_0203ab90
    ldr r0, [r5]
    bl func_0207d960
    add r0, r8, r0
    ldr r3, _LIT0
    add r0, r0, #0x1f
    bic r0, r0, #0x1f
    sub r1, r0, r7
    ldr r6, [r3, #0x44]
    mov r2, #0x0
    sub r1, r6, r1
    str r1, [r3, #0x40]
    bl func_0207d3f4
    ldr r2, _LIT0
    mov r1, #0x1
    str r0, [r2, #0x50]
    bl func_0207d294
    ldr r0, _LIT0
    str r5, [r0, #0x30]
    ldr r0, [r0, #0x58]
    cmp r0, #0x0
    beq .L_434
    sub r0, r4, #0x1
    bl func_02088cf0
.L_434:
    bl func_02034be4
    ldr r1, _LIT0
    mov r0, #0x1
    ldrh r2, [r1, #0x12]
    orr r2, r2, #0xc000
    strh r2, [r1, #0x12]
    add sp, sp, #0x50
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_0219b200
_LIT1: .word data_020fe3a0
_LIT2: .word data_020bea98
_LIT3: .word data_020beaf8
_LIT4: .word data_020beac8
_LIT5: .word data_020fe3a8
_LIT6: .word data_020fe3bc
_LIT7: .word data_020fe3d0
_LIT8: .word data_0219cf8c
_LIT9: .word data_0219b320
