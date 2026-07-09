; func_ov002_02299278 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd444
        .extern data_ov002_022cf1a8
        .extern data_ov002_022d008c
        .extern func_ov002_021bad9c
        .extern func_ov002_021c9bb4
        .extern func_ov002_021c9d34
        .extern func_ov002_0227c540
        .extern func_ov002_0227d570
        .extern func_ov002_02280870
        .extern func_ov002_02285c58
        .extern func_ov002_02285d18
        .extern func_ov002_022863c0
        .extern func_ov002_02297b2c
        .extern func_ov002_02297c58
        .extern func_ov002_02298cbc
        .extern func_ov002_02298e68
        .global func_ov002_02299278
        .arm
func_ov002_02299278:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r2, [r0, #0x8]
    ldr r4, [r1, #0xcec]
    cmp r2, #0x4
    addls pc, pc, r2, lsl #0x2
    b .L_6f8
    b .L_444
    b .L_59c
    b .L_5d8
    b .L_608
    b .L_638
.L_444:
    mov r2, #0x0
    str r2, [r0, #0x1cc]
    ldr r0, [r1, #0xcf0]
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT2
    and r1, r4, #0x1
    mul r2, r1, r0
    ldr r0, _LIT3
    ldr r0, [r0, r2]
    mov r0, r0, lsr #0x11
    tst r0, #0x1
    bne .L_4c4
    mov r0, r4
    bl func_ov002_0227c540
    cmp r0, #0x0
    beq .L_4c4
    mov r0, r4
    bl func_ov002_021c9d34
    cmp r0, #0x0
    bne .L_4ac
    mov r0, r4
    bl func_ov002_021c9bb4
    cmp r0, #0x0
    beq .L_4c4
.L_4ac:
    ldr r1, _LIT4
    rsb r0, r4, #0x1
    mvn r2, #0x0
    bl func_ov002_021bad9c
    cmp r0, #0x0
    ble .L_4dc
.L_4c4:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x8]
    add r2, r2, #0x1
    str r2, [r1, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_4dc:
    mov r0, r4
    bl func_ov002_02298e68
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r4
    bl func_ov002_021c9d34
    cmp r0, #0x0
    beq .L_584
    mov r0, r4
    mov r1, #0x1
    mvn r5, #0x0
    bl func_ov002_0227d570
    cmp r0, #0x0
    mov r0, r4
    blt .L_52c
    mov r1, #0x1
    bl func_ov002_02285d18
    mov r5, r0
    b .L_548
.L_52c:
    bl func_ov002_02285c58
    cmp r0, #0x0
    beq .L_548
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_02285d18
    mov r5, r0
.L_548:
    mvn r1, #0x0
    cmp r5, r1
    bne .L_560
    mov r0, r4
    bl func_ov002_02285d18
    mov r5, r0
.L_560:
    cmp r5, #0x0
    blt .L_584
    mov r0, r4
    mov r1, r5
    mov r2, #0x0
    bl func_ov002_02298cbc
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
.L_584:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x8]
    add r2, r2, #0x1
    str r2, [r1, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_59c:
    mov r0, r4
    bl func_ov002_02280870
    cmp r0, #0x0
    blt .L_5c0
    mov r0, r4
    bl func_ov002_02285c58
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
.L_5c0:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x8]
    add r2, r2, #0x1
    str r2, [r1, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_5d8:
    mov r0, r4
    bl func_ov002_02297c58
    cmp r0, #0x0
    ldrne r1, _LIT0
    mov r0, #0x0
    strne r0, [r1, #0x8]
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT0
    ldr r2, [r1, #0x8]
    add r2, r2, #0x1
    str r2, [r1, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_608:
    mov r0, r4
    bl func_ov002_02297b2c
    cmp r0, #0x0
    ldrne r1, _LIT0
    mov r0, #0x0
    strne r0, [r1, #0x8]
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT0
    ldr r2, [r1, #0x8]
    add r2, r2, #0x1
    str r2, [r1, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_638:
    mov r0, r4
    bl func_ov002_0227c540
    cmp r0, #0x0
    beq .L_688
    ldr r0, _LIT2
    and r1, r4, #0x1
    mul r2, r1, r0
    ldr r0, _LIT3
    ldr r0, [r0, r2]
    mov r0, r0, lsr #0x11
    tst r0, #0x1
    bne .L_688
    mov r0, r4
    bl func_ov002_021c9d34
    cmp r0, #0x0
    bne .L_6a0
    mov r0, r4
    bl func_ov002_021c9bb4
    cmp r0, #0x0
    bne .L_6a0
.L_688:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x8]
    add r2, r2, #0x1
    str r2, [r1, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_6a0:
    add r1, sp, #0x0
    mov r0, r4
    bl func_ov002_022863c0
    movs r1, r0
    bmi .L_6f0
    ldr r0, [sp]
    cmp r0, #0x0
    bne .L_6f0
    mov r0, r4
    mov r2, #0x0
    bl func_ov002_02298cbc
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ble .L_6f0
    ldr r0, _LIT0
    mov r1, #0x1
    str r1, [r0, #0x8]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_6f0:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_6f8:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022cd444
_LIT1: .word data_ov002_022d008c
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022cf1a8
_LIT4: .word 0x00001102
