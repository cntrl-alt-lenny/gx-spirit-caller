; func_ov002_022205e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_ov002_021b3414
        .extern func_ov002_021b39e0
        .extern func_ov002_021c2544
        .extern func_ov002_021d5e3c
        .extern func_ov002_021de318
        .extern func_ov002_021e2a4c
        .extern func_ov002_021e2b6c
        .extern func_ov002_0223dda4
        .extern func_ov002_0223de48
        .global func_ov002_022205e8
        .arm
func_ov002_022205e8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    ldrh r2, [r0, #0x4]
    mov sl, r1
    str r0, [sp]
    mov r1, r2, lsl #0x1d
    movs r1, r1, lsr #0x1f
    addne sp, sp, #0xc
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r1, #0x0
    mov r2, r1
    bl func_ov002_0223de48
    cmp r0, #0x0
    beq .L_210
    ldr r0, [sp]
    mov r1, #0x0
    bl func_ov002_0223dda4
    str r0, [sp, #0x8]
    ldr r1, _LIT0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r2, r0, asr #0x8
    ldr r1, [r1, #0x5a8]
    ldr r0, [sp, #0x8]
    cmp r1, #0x7e
    and fp, r0, #0xff
    and r5, r2, #0xff
    beq .L_1ec
    cmp r1, #0x7f
    beq .L_a4
    cmp r1, #0x80
    bne .L_210
    ldr r0, [sp]
    mov r1, #0x0
    strh r1, [r0, #0xa]
    strh r1, [r0, #0xc]
    bl func_ov002_021e2a4c
    add sp, sp, #0xc
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_a4:
    mov r0, #0x0
    str r0, [sp, #0x4]
.L_ac:
    ldr r0, _LIT1
    ldr r2, _LIT2
    ldr r3, [r0, #0xcec]
    ldr r0, [sp, #0x4]
    ldr r1, _LIT3
    eor r6, r3, r0
    and r0, r6, #0x1
    mla r1, r0, r1, r2
    ldr r0, [sp]
    add r8, r1, #0x94
    add r9, r1, #0x64
    mov r7, #0x5
    add r4, r0, r6, lsl #0x1
.L_e0:
    ldr r0, [r8]
    mov r0, r0, lsl #0x13
    movs r2, r0, lsr #0x13
    beq .L_1b8
    mov r0, r6
    mov r1, r7
    bl func_ov002_021c2544
    cmp r0, #0x0
    beq .L_1b8
    mov r0, fp
    mov r1, r5
    mov r2, r6
    mov r3, r7
    bl func_ov002_021b3414
    cmp r0, #0x0
    bne .L_1b8
    mov r0, r6
    mov r1, r7
    mov r2, fp
    mov r3, r5
    bl func_ov002_021b39e0
    cmp r0, #0x0
    beq .L_1a8
    ldr r1, [r9, #0x40]
    mov r0, r1, lsr #0x2
    orr r0, r0, r1, lsr #0x1
    tst r0, #0x1
    beq .L_178
    ldrh r0, [sl, #0x2]
    mov r1, r0, lsl #0x1f
    cmp r6, r1, lsr #0x1f
    moveq r0, r0, lsl #0x1a
    cmpeq r7, r0, lsr #0x1b
    bne .L_1b8
    ldr r0, [sp]
    ldrh r0, [r0, #0x8]
    strh r0, [sl, #0x8]
    b .L_1b8
.L_178:
    and r1, r6, #0xff
    and r0, r7, #0xff
    orr r0, r1, r0, lsl #0x8
    mov r1, r0, lsl #0x10
    ldr r0, [sp, #0x8]
    mov r2, r0, lsl #0x10
    mov r0, r1, lsr #0x10
    mov r1, r2, lsr #0x10
    bl func_ov002_021d5e3c
    add sp, sp, #0xc
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1a8:
    ldrh r1, [r4, #0xa]
    mov r0, #0x1
    orr r0, r1, r0, lsl r7
    strh r0, [r4, #0xa]
.L_1b8:
    add r7, r7, #0x1
    cmp r7, #0xa
    add r8, r8, #0x14
    add r9, r9, #0x14
    blt .L_e0
    ldr r0, [sp, #0x4]
    add r0, r0, #0x1
    str r0, [sp, #0x4]
    cmp r0, #0x2
    blt .L_ac
    add sp, sp, #0xc
    mov r0, #0x7e
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1ec:
    ldr r0, [sp]
    ldrh r2, [r0, #0xa]
    ldrh r1, [r0, #0xc]
    orr r1, r2, r1, lsl #0x10
    bl func_ov002_021de318
    bl func_ov002_021e2b6c
    add sp, sp, #0xc
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_210:
    mov r0, #0x0
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022d008c
_LIT2: .word data_ov002_022cf08c
_LIT3: .word 0x00000868
