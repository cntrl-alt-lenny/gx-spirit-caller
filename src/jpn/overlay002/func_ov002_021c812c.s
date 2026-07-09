; func_ov002_021c812c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd65c
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern data_ov002_022cf0cc
        .extern func_ov002_021bd630
        .extern func_ov002_021c26b8
        .extern func_ov002_021c2770
        .extern func_ov002_021c4bbc
        .extern func_ov002_021c7e68
        .global func_ov002_021c812c
        .arm
func_ov002_021c812c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x5c
    mov r8, r2
    mov r3, #0x0
    mov r9, r1
    mov sl, r0
    mov r5, r8
    mov r1, r3
    mov r2, r3
.L_43f0:
    mov r4, r2
.L_43f4:
    mov r0, r4, lsl #0x1
    add r4, r4, #0x1
    strh r1, [r5, r0]
    cmp r4, #0xa
    ble .L_43f4
    add r3, r3, #0x1
    cmp r3, #0x2
    add r5, r5, #0x16
    blt .L_43f0
    cmp r9, #0xa
    addgt sp, sp, #0x5c
    ldmgtia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT0
    and r2, sl, #0x1
    mov r0, #0x14
    mul r5, r2, r1
    mul r4, r9, r0
    ldr r1, _LIT1
    add r0, r1, r5
    add r0, r0, r4
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    addeq sp, sp, #0x5c
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    cmp r9, #0x5
    bge .L_448c
    mov r0, sl
    mov r1, r9
    bl func_ov002_021bd630
    cmp r0, #0x0
    beq .L_448c
    mov r0, #0x16
    mla r0, sl, r0, r8
    mov r1, r9, lsl #0x1
    mov r2, #0x7
    strh r2, [r1, r0]
    b .L_4514
.L_448c:
    ldr r0, _LIT2
    add r0, r0, r5
    ldrh r0, [r4, r0]
    cmp r0, #0x0
    beq .L_44d0
    ldr r0, _LIT3
    add r0, r0, r5
    ldr r0, [r4, r0]
    mov r0, r0, lsr #0x6
    tst r0, #0x1
    beq .L_4514
    mov r0, #0x16
    mla r0, sl, r0, r8
    mov r1, r9, lsl #0x1
    mov r2, #0x7
    strh r2, [r1, r0]
    b .L_4514
.L_44d0:
    ldr r0, _LIT4
    ldr r0, [r0, #0x4]
    cmp sl, r0
    bne .L_4514
    cmp r9, #0x5
    blt .L_4514
    mov r0, sl
    mov r1, r9
    mov r2, #0x0
    bl func_ov002_021c2770
    cmp r0, #0x0
    beq .L_4514
    mov r0, #0x16
    mla r0, sl, r0, r8
    mov r1, r9, lsl #0x1
    mov r2, #0x7
    strh r2, [r1, r0]
.L_4514:
    add r2, sp, #0x30
    mov r0, sl
    mov r1, r9
    bl func_ov002_021c4bbc
    mov r6, #0x0
.L_4528:
    ldr r2, _LIT1
    ldr r0, _LIT0
    and r1, r6, #0x1
    mla r0, r1, r0, r2
    add r5, r0, #0x30
    mov r7, #0x0
    add r4, sp, #0x4
    add fp, sp, #0x30
.L_4548:
    ldr r0, [r5]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_45f4
    mov r0, r6
    mov r1, r7
    mov r2, r4
    bl func_ov002_021c4bbc
    mov r0, r7, lsl #0x1
    ldrh r0, [r8, r0]
    cmp r0, #0x0
    bne .L_4598
    mov r0, r4
    mov r1, r6
    mov r2, r7
    mov r3, sl
    str r9, [sp]
    bl func_ov002_021c7e68
    mov r1, r7, lsl #0x1
    strh r0, [r8, r1]
.L_4598:
    mov r0, r7, lsl #0x1
    ldrh r0, [r8, r0]
    cmp r0, #0x0
    bne .L_45c8
    mov r0, fp
    mov r1, sl
    mov r2, r9
    mov r3, r6
    str r7, [sp]
    bl func_ov002_021c7e68
    mov r1, r7, lsl #0x1
    strh r0, [r8, r1]
.L_45c8:
    mov r0, r6
    mov r1, r7
    mov r2, sl
    mov r3, r9
    bl func_ov002_021c26b8
    cmp r0, #0x0
    beq .L_45f4
    mov r1, r7, lsl #0x1
    ldrh r0, [r8, r1]
    orr r0, r0, #0x100
    strh r0, [r8, r1]
.L_45f4:
    add r7, r7, #0x1
    cmp r7, #0xa
    add r5, r5, #0x14
    ble .L_4548
    add r6, r6, #0x1
    cmp r6, #0x2
    add r8, r8, #0x16
    blt .L_4528
    add sp, sp, #0x5c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022cf0c4
_LIT3: .word data_ov002_022cf0cc
_LIT4: .word data_ov002_022cd65c
