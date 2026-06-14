; func_ov003_021ce4e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov003_021cf6c0
        .extern func_ov003_021ceb84
        .extern func_ov003_021cedf8
        .global func_ov003_021ce4e4
        .arm
func_ov003_021ce4e4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x24
    mov r4, r0
    ldr r0, [r4, #0x4]
    ldr r1, _LIT0
    sub r0, r0, #0xa
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    b .L_48bc
    b .L_4264
    b .L_4334
    b .L_4468
    b .L_4794
    b .L_4794
    b .L_4794
.L_4264:
    ldr r0, [r1, #0x50]
    cmp r0, #0x0
    movge r8, #0x0
    movge r1, r8
    movge r7, #0x2
    bge .L_4288
    mov r7, #0x1
    mov r8, r7
    mov r1, #0x2
.L_4288:
    add r0, r4, r8, lsl #0x6
    mov r9, #0x0
    mov sl, #0x90
    add r5, r0, r1, lsl #0x2
    mov r6, #0x1
    mov fp, #0x4c00
.L_42a0:
    ldr r2, [r4, #0xc]
    mov r1, #0xa0
    mul r3, r2, r1
    mov r1, r3, asr #0x3
    add r1, r3, r1, lsr #0x1c
    mov r1, r1, asr #0x4
    rsb r1, r1, #0x100
    stmia sp, {r1, sl}
    str r6, [sp, #0x8]
    str r6, [sp, #0xc]
    str fp, [sp, #0x10]
    mov r1, #0xc0
    str r1, [sp, #0x14]
    ldr r2, [r5, #0x40]
    mov r0, r4
    mov r1, r7
    mov r3, #0x0
    bl func_ov003_021cedf8
    ldr r2, [r4, #0xc]
    mov r1, #0xa0
    mul r3, r2, r1
    mov r1, r3, asr #0x3
    add r1, r3, r1, lsr #0x1c
    mov r1, r1, asr #0x4
    rsb r1, r1, #0x100
    str r1, [sp]
    mov r0, r4
    mov r1, r8
    mov r2, r9
    mov r3, #0xa
    bl func_ov003_021ceb84
    add r9, r9, #0x1
    add sl, sl, #0x18
    cmp r9, #0x2
    blt .L_42a0
    add sp, sp, #0x24
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_4334:
    ldr r0, [r1, #0x50]
    cmp r0, #0x0
    bge .L_435c
    ldr r0, [r1, #0x4c]
    mov fp, #0x1
    mov r1, #0x2
    mov r9, fp
    str r1, [sp, #0x1c]
    rsb r5, r0, #0x1
    b .L_4370
.L_435c:
    mov r9, #0x0
    ldr r5, [r1, #0x4c]
    mov r1, r9
    str r9, [sp, #0x1c]
    mov fp, #0x2
.L_4370:
    add r0, r4, r9, lsl #0x6
    add r0, r0, r1, lsl #0x2
    mov r6, #0x0
    mov r7, #0x90
    str r0, [sp, #0x20]
.L_4384:
    cmp r5, r6
    moveq sl, #0x1
    movne sl, #0x0
    mov r0, sl, lsl #0x4
    rsb r8, r0, #0x70
    str r8, [sp]
    str r7, [sp, #0x4]
    mov r0, #0x1
    str r0, [sp, #0x8]
    str r0, [sp, #0xc]
    mov r0, #0x4c00
    ldr r2, [sp, #0x20]
    str r0, [sp, #0x10]
    mov r0, #0xc0
    str r0, [sp, #0x14]
    add r2, r2, sl, lsl #0x2
    ldr r2, [r2, #0x40]
    mov r0, r4
    mov r1, fp
    mov r3, #0x0
    bl func_ov003_021cedf8
    cmp sl, #0x0
    movne r3, #0xb
    moveq r3, #0xa
    mov r0, r4
    mov r1, r9
    mov r2, r6
    str r8, [sp]
    bl func_ov003_021ceb84
    add r6, r6, #0x1
    add r7, r7, #0x18
    cmp r6, #0x2
    blt .L_4384
    mov r0, #0x18
    mul r0, r5, r0
    mov r1, #0x5f
    str r1, [sp]
    add r0, r0, #0x8f
    str r0, [sp, #0x4]
    mov r0, #0x0
    str r0, [sp, #0x8]
    mov r0, #0x1
    str r0, [sp, #0xc]
    mov r0, #0x5600
    str r0, [sp, #0x10]
    mov r3, #0x100
    str r3, [sp, #0x14]
    ldr r0, [sp, #0x1c]
    add r1, r4, r9, lsl #0x6
    add r0, r1, r0, lsl #0x2
    ldr r2, [r0, #0x60]
    mov r0, r4
    mov r1, fp
    rsb r3, r3, #0xff
    bl func_ov003_021cedf8
    add sp, sp, #0x24
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_4468:
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq .L_4484
    cmp r0, #0x1
    beq .L_45d4
    add sp, sp, #0x24
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_4484:
    ldr r0, [r1, #0x50]
    cmp r0, #0x0
    bge .L_44b0
    ldr r0, [r1, #0x4c]
    mov r7, #0x1
    rsb r9, r0, #0x1
    mov r0, #0x3
    mov r8, r7
    mov r1, #0x2
    str r0, [sp, #0x18]
    b .L_44c8
.L_44b0:
    mov r0, #0x1
    mov r8, #0x0
    ldr r9, [r1, #0x4c]
    mov r1, r8
    mov r7, #0x2
    str r0, [sp, #0x18]
.L_44c8:
    add r0, r4, r8, lsl #0x6
    mov r5, #0x0
    mov r6, #0x90
    add fp, r0, r1, lsl #0x2
.L_44d8:
    cmp r9, r5
    moveq sl, #0x1
    movne sl, #0x0
    cmp sl, #0x0
    movne r0, #0x60
    ldreq r0, [r4, #0xc]
    add r2, fp, sl, lsl #0x2
    moveq r0, r0, lsl #0x3
    addeq r0, r0, #0x70
    stmia sp, {r0, r6}
    mov r0, #0x1
    str r0, [sp, #0x8]
    str r0, [sp, #0xc]
    mov r0, #0x4c00
    str r0, [sp, #0x10]
    mov r0, #0xc0
    str r0, [sp, #0x14]
    ldr r2, [r2, #0x40]
    mov r0, r4
    mov r1, r7
    mov r3, #0x0
    bl func_ov003_021cedf8
    cmp sl, #0x0
    movne r0, #0x60
    ldreq r0, [r4, #0xc]
    mov r1, r8
    moveq r0, r0, lsl #0x3
    addeq r0, r0, #0x70
    cmp sl, #0x0
    movne r3, #0xb
    str r0, [sp]
    moveq r3, #0xa
    mov r0, r4
    mov r2, r5
    bl func_ov003_021ceb84
    add r5, r5, #0x1
    add r6, r6, #0x18
    cmp r5, #0x2
    blt .L_44d8
    mov r0, #0x18
    mul r0, r9, r0
    mov r1, #0x5f
    str r1, [sp]
    add r0, r0, #0x8f
    str r0, [sp, #0x4]
    mov r0, #0x0
    str r0, [sp, #0x8]
    mov r0, #0x1
    str r0, [sp, #0xc]
    mov r0, #0x5600
    str r0, [sp, #0x10]
    mov r3, #0x100
    str r3, [sp, #0x14]
    ldr r0, [sp, #0x18]
    add r1, r4, r8, lsl #0x6
    add r0, r1, r0, lsl #0x2
    ldr r2, [r0, #0x60]
    mov r0, r4
    mov r1, r7
    rsb r3, r3, #0xff
    bl func_ov003_021cedf8
    add sp, sp, #0x24
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_45d4:
    ldr r0, [r1, #0x50]
    cmp r0, #0x0
    bge .L_45f8
    ldr r0, [r1, #0x4c]
    mov r7, #0x1
    mov r6, r7
    rsb r9, r0, #0x1
    mov r8, #0x3
    b .L_4608
.L_45f8:
    ldr r9, [r1, #0x4c]
    mov r7, #0x0
    mov r6, #0x2
    mov r8, #0x1
.L_4608:
    mov r0, #0x18
    mul r5, r9, r0
    mov r0, #0x60
    str r0, [sp]
    add r0, r5, #0x90
    str r0, [sp, #0x4]
    mov r1, #0x1
    str r1, [sp, #0x8]
    str r1, [sp, #0xc]
    mov r1, #0x4c00
    add r0, r4, r7, lsl #0x6
    str r1, [sp, #0x10]
    mov r1, #0xc0
    str r1, [sp, #0x14]
    add r0, r0, r8, lsl #0x2
    ldr r2, [r0, #0x40]
    mov r0, r4
    mov r1, r6
    mov r3, #0x0
    bl func_ov003_021cedf8
    mov r3, #0x60
    str r3, [sp]
    mov r0, r4
    mov r1, r7
    mov r2, r9
    mov r3, #0xb
    bl func_ov003_021ceb84
    mov r1, #0x5f
    str r1, [sp]
    add r0, r5, #0x8f
    str r0, [sp, #0x4]
    mov r3, #0x0
    add r2, r4, r7, lsl #0x6
    str r3, [sp, #0x8]
    mov r0, #0x1
    str r0, [sp, #0xc]
    mov r0, #0x5600
    str r0, [sp, #0x10]
    mov r0, #0x100
    str r0, [sp, #0x14]
    add r2, r2, r8, lsl #0x2
    ldr r2, [r2, #0x60]
    mov r0, r4
    mov r1, r6
    bl func_ov003_021cedf8
    cmp r6, #0x1
    ldr r2, [r4, #0xc]
    moveq r1, #0x2
    mov r3, r2, lsr #0x1f
    rsb r2, r3, r2, lsl #0x1c
    add r3, r3, r2, ror #0x1c
    mov r2, #0xa0
    mul r5, r3, r2
    mov r2, r5, asr #0x3
    add r2, r5, r2, lsr #0x1c
    mov r2, r2, asr #0x4
    rsb r3, r2, #0x100
    str r3, [sp]
    rsb r6, r7, #0x1
    movne r1, #0x1
    cmp r8, #0x3
    moveq r0, #0x1
    rsb r5, r9, #0x1
    mov r2, #0x18
    mul r2, r5, r2
    add r2, r2, #0x90
    str r2, [sp, #0x4]
    mov r2, #0x1
    str r2, [sp, #0x8]
    str r2, [sp, #0xc]
    mov r2, #0x4c00
    str r2, [sp, #0x10]
    mov r2, #0xc0
    movne r0, #0x3
    add r7, r4, r6, lsl #0x6
    add r0, r7, r0, lsl #0x2
    str r2, [sp, #0x14]
    ldr r2, [r0, #0x40]
    mov r0, r4
    mov r3, #0x0
    bl func_ov003_021cedf8
    ldr r0, [r4, #0xc]
    mov r2, #0xa0
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1c
    add r0, r1, r0, ror #0x1c
    mul r1, r0, r2
    mov r0, r1, asr #0x3
    add r0, r1, r0, lsr #0x1c
    mov r0, r0, asr #0x4
    rsb r7, r0, #0x100
    mov r0, r4
    mov r1, r6
    mov r2, r5
    mov r3, #0xb
    str r7, [sp]
    bl func_ov003_021ceb84
    add sp, sp, #0x24
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_4794:
    ldr r0, [r1, #0x50]
    cmp r0, #0x0
    bge .L_47b8
    ldr r0, [r1, #0x4c]
    mov r6, #0x1
    mov r5, r6
    rsb r8, r0, #0x1
    mov r7, #0x3
    b .L_47c8
.L_47b8:
    ldr r8, [r1, #0x4c]
    mov r6, #0x0
    mov r5, #0x2
    mov r7, #0x1
.L_47c8:
    mov r0, #0x18
    mul r0, r8, r0
    mov r1, #0x60
    str r1, [sp]
    add r0, r0, #0x90
    str r0, [sp, #0x4]
    mov r1, #0x1
    str r1, [sp, #0x8]
    str r1, [sp, #0xc]
    mov r1, #0x4c00
    add r0, r4, r6, lsl #0x6
    str r1, [sp, #0x10]
    mov r1, #0xc0
    str r1, [sp, #0x14]
    add r0, r0, r7, lsl #0x2
    ldr r2, [r0, #0x40]
    mov r0, r4
    mov r1, r5
    mov r3, #0x0
    bl func_ov003_021cedf8
    mov r9, #0x60
    mov r0, r4
    mov r1, r6
    mov r2, r8
    mov r3, #0xb
    str r9, [sp]
    bl func_ov003_021ceb84
    cmp r5, #0x1
    mov r3, #0x60
    moveq r1, #0x2
    movne r1, #0x1
    cmp r7, #0x3
    moveq r0, #0x1
    rsb r5, r8, #0x1
    mov r2, #0x18
    mul r2, r5, r2
    str r3, [sp]
    add r3, r2, #0x90
    str r3, [sp, #0x4]
    mov r3, #0x1
    str r3, [sp, #0x8]
    rsb r6, r6, #0x1
    str r3, [sp, #0xc]
    mov r3, #0x4c00
    str r3, [sp, #0x10]
    mov r3, #0xc0
    str r3, [sp, #0x14]
    movne r0, #0x3
    add r2, r4, r6, lsl #0x6
    add r0, r2, r0, lsl #0x2
    ldr r2, [r0, #0x40]
    mov r0, r4
    mov r3, #0x0
    bl func_ov003_021cedf8
    mov r7, #0x60
    mov r0, r4
    mov r1, r6
    mov r2, r5
    mov r3, #0xb
    str r7, [sp]
    bl func_ov003_021ceb84
.L_48bc:
    add sp, sp, #0x24
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov003_021cf6c0
