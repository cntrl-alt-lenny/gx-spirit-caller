; func_ov002_02215d60 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern data_ov002_022ce1a8
        .extern data_ov002_022d008c
        .extern data_ov002_022d0d8c
        .extern func_ov002_021be2a4
        .extern func_ov002_021d46ac
        .extern func_ov002_021d58dc
        .extern func_ov002_022015cc
        .extern func_ov002_0223dda4
        .extern func_ov002_0223de48
        .extern func_ov002_02257564
        .extern func_ov002_0226b02c
        .extern func_ov002_0226b114
        .global func_ov002_02215d60
        .arm
func_ov002_02215d60:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r1
    mov r7, r0
    mov r1, #0x0
    bl func_ov002_0223dda4
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r3, r1, asr #0x8
    ldrh r2, [r7, #0x4]
    and r4, r0, #0xff
    and r5, r3, #0xff
    mov r1, r2, lsl #0x1d
    movs r0, r1, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, _LIT0
    ldr r0, [r0, #0x5a8]
    cmp r0, #0x7e
    beq .L_188
    cmp r0, #0x7f
    beq .L_108
    cmp r0, #0x80
    bne .L_198
    mov r0, r7
    mov r1, r6
    bl func_ov002_022015cc
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, _LIT1
    ldr r0, [r0, #0xd0]
    tst r0, #0x1
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r0, lsr #0x1
    tst r0, #0x1
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    mov r1, #0x0
    mov r0, r7
    mov r2, r1
    bl func_ov002_0223de48
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r7
    mov r1, r4
    mov r2, r5
    bl func_ov002_02257564
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r2, [r7, #0x2]
    mov r0, r4
    mov r1, r5
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    str r2, [sp]
    ldrh r2, [r7]
    mov r3, #0x1
    bl func_ov002_021d58dc
    mov r0, r4
    mov r1, r5
    bl func_ov002_0226b02c
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_108:
    ldr r1, _LIT2
    ldr r0, _LIT3
    ldrh r1, [r1, #0xb0]
    cmp r1, r0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r1, _LIT4
    mov r2, #0x0
    ldr r0, [r1]
    ldr r1, [r1, #0x1c]
    bl func_ov002_021be2a4
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r0, [r7, #0x2]
    ldr r2, _LIT2
    mov r0, r0, lsl #0x1f
    mov r3, r0, lsr #0x1f
    rsbs r0, r3, #0x1
    ldr r0, _LIT4
    movne r4, #0x8000
    ldr r1, [r0, #0x1c]
    moveq r4, #0x0
    orr r0, r4, #0x19
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    ldrh r2, [r2, #0xb0]
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021d46ac
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_188:
    mov r0, #0x1
    bl func_ov002_0226b114
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_198:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022d008c
_LIT2: .word data_ov002_022d0d8c
_LIT3: .word 0x0000ffff
_LIT4: .word data_ov002_022cd314
