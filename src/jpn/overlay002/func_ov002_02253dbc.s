; func_ov002_02253dbc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021b9af4
        .extern func_ov002_021b9dec
        .extern func_ov002_021bb83c
        .extern func_ov002_021d58dc
        .extern func_ov002_021d5a90
        .extern func_ov002_021d9054
        .extern func_ov002_021df53c
        .extern func_ov002_021e2ca4
        .global func_ov002_02253dbc
        .arm
func_ov002_02253dbc:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    mov fp, r0
    str r1, [sp, #0x4]
    mov r6, #0x0
.L_14:
    ldr r2, _LIT0
    ldr r0, _LIT1
    and r1, r6, #0x1
    mla r8, r1, r0, r2
    ldr r5, _LIT2
    add r9, r8, #0x30
    mov r7, #0x0
    add r4, r5, #0x10
.L_34:
    mov r0, r6
    mov r1, r7
    bl func_ov002_021b9dec
    cmp r0, r4
    bne .L_194
    ldrh r0, [r8, #0x38]
    cmp r0, #0x0
    beq .L_194
    ldr r1, [r8, #0x40]
    mov r0, r1, lsr #0x2
    orr r0, r0, r1, lsr #0x1
    tst r0, #0x1
    bne .L_194
    mov r0, r5
    bl func_ov002_021bb83c
    cmp r0, #0x0
    beq .L_15c
    ldr r1, [r8, #0x40]
    mov r0, r1, lsr #0x6
    tst r0, #0x1
    moveq sl, #0x1
    movne sl, #0x0
    cmp sl, #0x0
    beq .L_d8
    mov r0, r1, lsr #0x5
    tst r0, #0x1
    bne .L_d8
    ldr r3, [r9]
    mov r0, r6
    mov r2, r3, lsl #0x12
    mov r3, r3, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r3, r3, lsl #0x1
    mov r1, r7
    add r2, r3, r2, lsr #0x1f
    bl func_ov002_021df53c
    mov r0, r6
    mov r1, r7
    mov r2, #0x5
    mov r3, #0x1
    bl func_ov002_021e2ca4
.L_d8:
    cmp r6, fp
    bne .L_194
    mov r0, r6
    mov r1, r7
    bl func_ov002_021b9af4
    cmp r0, #0x4
    bge .L_194
    mov r0, r6
    mov r1, r7
    mov r2, #0x1
    bl func_ov002_021d9054
    cmp sl, #0x0
    beq .L_194
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    bne .L_194
    ldr r3, [r9]
    mov r0, r6
    mov r2, r3, lsl #0x12
    mov r3, r3, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r3, r3, lsl #0x1
    mov r1, r7
    add r2, r3, r2, lsr #0x1f
    bl func_ov002_021df53c
    mov r0, #0x0
    str r0, [sp]
    mov r0, r6
    mov r1, r7
    add r2, r5, #0x10
    mov r3, #0x3
    bl func_ov002_021d58dc
    b .L_194
.L_15c:
    mov r0, r6
    mov r1, r7
    mov r2, #0x5
    mov r3, #0x0
    bl func_ov002_021e2ca4
    mov r0, r6
    mov r1, r7
    add r2, r5, #0x10
    mov r3, #0x1
    bl func_ov002_021d5a90
    mov r0, r6
    mov r1, r7
    mov r2, #0x0
    bl func_ov002_021d9054
.L_194:
    add r8, r8, #0x14
    add r9, r9, #0x14
    add r7, r7, #0x1
    cmp r7, #0x5
    blt .L_34
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_14
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
_LIT2: .word 0x00000ff9
