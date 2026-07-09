; func_ov002_0225499c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_ov002_021b2fcc
        .extern func_ov002_021babc8
        .extern func_ov002_021bad9c
        .extern func_ov002_021bd514
        .extern func_ov002_021d58dc
        .extern func_ov002_021de32c
        .extern func_ov002_021df590
        .global func_ov002_0225499c
        .arm
func_ov002_0225499c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    ldr r0, _LIT0
    ldr r1, [r0, #0xd0]
    tst r1, #0x1
    beq .L_2c
    ldr r0, [r0, #0xd2c]
    cmp r0, #0x9
    addcc sp, sp, #0x8
    movcc r0, #0x0
    ldmccia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2c:
    mov r8, #0x0
    ldr r6, _LIT1
    ldr r5, _LIT0
    mov r7, r8
.L_3c:
    ldr r0, [r5, #0xcec]
    mov r4, r7
    eor r9, r0, r8
.L_48:
    mov r0, r9
    mov r1, r4
    mov r2, r6
    bl func_ov002_021babc8
    cmp r0, #0x0
    beq .L_1ac
    and r1, r9, #0xff
    mov r5, #0x0
    and r0, r4, #0xff
    orr r0, r1, r0, lsl #0x8
    mov r6, r5
    mov r8, r5
    str r0, [sp, #0x4]
.L_7c:
    ldr r2, _LIT2
    ldr r0, _LIT3
    and r1, r6, #0x1
    mla sl, r1, r0, r2
    ldr r0, [sp, #0x4]
    add r9, sl, #0x30
    mov r0, r0, lsl #0x10
    mov r7, #0x0
    mov r4, r0, lsr #0x10
    mov fp, #0x1
.L_a4:
    ldr r0, [r9]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    ldrneh r0, [sl, #0x38]
    cmpne r0, #0x0
    beq .L_120
    ldr r1, [sl, #0x40]
    mov r0, r1, lsr #0x2
    orr r0, r0, r1, lsr #0x1
    tst r0, #0x1
    bne .L_120
    ldr r2, _LIT1
    mov r0, r6
    mov r1, r7
    bl func_ov002_021b2fcc
    cmp r0, #0x0
    bne .L_120
    mov r0, r6
    mov r1, r7
    bl func_ov002_021bd514
    cmp r0, #0x0
    addne r0, r7, r8
    orrne r5, r5, fp, lsl r0
    bne .L_120
    mov r2, #0x0
    str r2, [sp]
    mov r0, r6
    mov r1, r7
    mov r2, r4
    mov r3, #0x9
    bl func_ov002_021d58dc
.L_120:
    add r7, r7, #0x1
    cmp r7, #0x5
    add r9, r9, #0x14
    add sl, sl, #0x14
    blt .L_a4
    add r6, r6, #0x1
    cmp r6, #0x2
    add r8, r8, #0x10
    blt .L_7c
    cmp r5, #0x0
    beq .L_1a0
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r0, [r0, #0xcec]
    mvn r2, #0x0
    bl func_ov002_021bad9c
    cmp r0, #0x0
    ldr r0, _LIT0
    moveq r3, #0x1
    ldr r2, [r0, #0xcec]
    movne r3, #0x0
    ldr r1, _LIT1
    mvn r0, #0x0
    eor r4, r2, r3
    bl func_ov002_021df590
    ldr r1, _LIT1
    mov r0, r4
    mov r2, r5
    bl func_ov002_021de32c
    add sp, sp, #0x8
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1a0:
    add sp, sp, #0x8
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1ac:
    add r4, r4, #0x1
    cmp r4, #0x5
    blt .L_48
    add r8, r8, #0x1
    cmp r8, #0x2
    blt .L_3c
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word 0x00001343
_LIT2: .word data_ov002_022cf08c
_LIT3: .word 0x00000868
