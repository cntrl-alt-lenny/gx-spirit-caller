; func_ov002_022159bc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_ov002_021d7880
        .extern func_ov002_021e0f5c
        .extern func_ov002_021e2a4c
        .extern func_ov002_021e2b6c
        .global func_ov002_022159bc
        .arm
func_ov002_022159bc:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    ldrh r0, [sl, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT0
    ldr r0, [r0, #0x5a8]
    cmp r0, #0x7e
    beq .L_2c8
    cmp r0, #0x7f
    beq .L_2a8
    cmp r0, #0x80
    bne .L_2ec
    mov r7, #0x0
    ldr r6, _LIT1
    ldr fp, _LIT2
    mov r4, r7
    mov r5, #0x1
.L_23c:
    ldr r0, [fp, #0xcec]
    eor r9, r0, r7
    ldr r0, _LIT3
    and r1, r9, #0x1
    mla r2, r1, r0, r6
    ldr r1, [r2, #0xc]
    add r0, sl, r9, lsl #0x1
    strh r1, [r0, #0x8]
    ldr r0, [r2, #0xc]
    subs r8, r0, #0x1
    bmi .L_294
.L_268:
    ldrh r0, [sl, #0x2]
    mov r1, r8
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r9
    movne r2, r5
    moveq r2, r4
    mov r0, r9
    bl func_ov002_021d7880
    subs r8, r8, #0x1
    bpl .L_268
.L_294:
    add r7, r7, #0x1
    cmp r7, #0x2
    blt .L_23c
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2a8:
    bl func_ov002_021e2a4c
    ldr r0, _LIT2
    ldr r0, [r0, #0xcec]
    add r1, sl, r0, lsl #0x1
    ldrh r1, [r1, #0x8]
    bl func_ov002_021e0f5c
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2c8:
    ldr r0, _LIT2
    ldr r0, [r0, #0xcec]
    rsb r0, r0, #0x1
    add r1, sl, r0, lsl #0x1
    ldrh r1, [r1, #0x8]
    bl func_ov002_021e0f5c
    bl func_ov002_021e2b6c
    mov r0, #0x7d
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2ec:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022d008c
_LIT3: .word 0x00000868
