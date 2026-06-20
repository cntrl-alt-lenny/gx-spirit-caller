; func_ov002_022b4380 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern data_ov002_022cd428
        .extern data_ov002_022cd434
        .extern data_ov002_022cd438
        .extern data_ov002_022cd43c
        .extern data_ov002_022cd440
        .extern data_ov002_022cd73c
        .extern data_ov002_022d0f7c
        .extern func_0207f05c
        .global func_ov002_022b4380
        .arm
func_ov002_022b4380:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    ldr r0, [r0, #0x60]
    cmp r0, #0x0
    addeq sp, sp, #0x8
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT0
    ldr r2, [r0, #0x8]
    cmp r2, #0x0
    ldrne r0, [r0]
    cmpne r1, r0
    addne sp, sp, #0x8
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT1
    mov r3, #0x2000
    ldr r0, [r0, #0x4]
    mov r2, #0x0
    cmp r1, r0
    ldr r0, _LIT0
    moveq r8, #0x20
    ldr r0, [r0]
    movne r8, #0x98
    cmp r1, r0
    moveq r9, r0
    rsbne r9, r0, #0x1
    str r3, [sp]
    strh r2, [sp, #0x4]
    cmp r1, r0
    beq .L_ac4
    mov r0, #0x38
    mul r1, r9, r0
    ldr r0, _LIT2
    ldr r0, [r0, r1]
    cmp r0, #0x0
    movne sl, #0x1
    bne .L_ac8
.L_ac4:
    mov sl, #0x0
.L_ac8:
    add r0, sl, sl, lsl #0x1
    mov r5, #0x400
    ldr fp, _LIT3
    ldr r4, _LIT4
    add r7, r0, #0xa
    mov r6, #0x0
    rsb r5, r5, #0x0
.L_ae4:
    mov r1, r7, lsl #0x6
    ldrh r0, [sp, #0x4]
    ldr r2, [sp]
    add r3, r1, #0x3480
    and r1, r2, r4
    mov r2, r3, asr #0x4
    add r2, r3, r2, lsr #0x1b
    and r0, r0, r5
    orr r3, r0, r2, asr #0x5
    orr r0, r1, #0xb0
    mov r2, r8, lsl #0x17
    orr r2, r0, r2, lsr #0x7
    str r2, [sp]
    mov r0, fp
    add r1, sp, #0x0
    mov r2, #0x1
    strh r3, [sp, #0x4]
    bl func_0207f05c
    add r6, r6, #0x1
    cmp r6, #0x3
    add r8, r8, #0x8
    add r7, r7, #0x1
    blt .L_ae4
    mov r0, #0x38
    cmp sl, #0x0
    muleq r2, r9, r0
    add r8, r8, #0x28
    ldreq r1, _LIT5
    ldreq r0, _LIT6
    beq .L_b68
    mul r2, r9, r0
    ldr r1, _LIT7
    ldr r0, _LIT8
.L_b68:
    ldr r9, [r1, r2]
    ldr r0, [r0, r2]
    cmp r9, r0
    movgt sl, #0x3880
    bgt .L_b84
    movlt sl, #0x3b00
    movge sl, #0x3480
.L_b84:
    mov r5, #0x400
    ldr fp, _LIT3
    ldr r4, _LIT4
    ldr r7, _LIT9
    rsb r5, r5, #0x0
    mov r6, #0xa
.L_b9c:
    smull r1, r2, r7, r9
    mov r0, r9, lsr #0x1f
    add r2, r0, r2, asr #0x2
    smull r0, r1, r6, r2
    sub r2, r9, r0
    ldr r0, [sp]
    add r1, sl, r2, lsl #0x6
    and r0, r0, r4
    orr r0, r0, #0xb0
    mov r2, r8, lsl #0x17
    orr r0, r0, r2, lsr #0x7
    str r0, [sp]
    mov r0, r1, asr #0x4
    ldrh r2, [sp, #0x4]
    add r0, r1, r0, lsr #0x1b
    and r1, r2, r5
    orr r1, r1, r0, asr #0x5
    strh r1, [sp, #0x4]
    mov r0, fp
    add r1, sp, #0x0
    mov r2, #0x1
    bl func_0207f05c
    mov r1, r9
    smull r0, r9, r7, r1
    mov r0, r1, lsr #0x1f
    adds r9, r0, r9, asr #0x2
    sub r8, r8, #0x8
    bne .L_b9c
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cd3f4
_LIT1: .word data_ov002_022cd73c
_LIT2: .word data_ov002_022cd428
_LIT3: .word data_ov002_022d0f7c
_LIT4: .word 0xfe00ff00
_LIT5: .word data_ov002_022cd43c
_LIT6: .word data_ov002_022cd434
_LIT7: .word data_ov002_022cd440
_LIT8: .word data_ov002_022cd438
_LIT9: .word 0x66666667
