; func_ov002_0228b684 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern func_0202b8c0
        .extern func_0202b9b0
        .extern func_ov002_021bcf18
        .extern func_ov002_022815a4
        .extern func_ov002_0228b5f4
        .global func_ov002_0228b684
        .arm
func_ov002_0228b684:
    stmdb sp!, {r3, r4, r5, lr}
    movs r4, r1
    mov r5, r0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r0, [r4, #0x2]
    ldrh r1, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r1, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r1, lsr #0x1f
    mov r0, r1, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r2, #0x1
    mov r3, r2
    rsb r0, r0, #0x1
    mov r1, #0x0
    bl func_ov002_021bcf18
    cmp r0, #0x0
    beq .L_80
    ldrh r1, [r4]
    ldr r0, _LIT0
    cmp r1, r0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov002_0228b5f4
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
.L_80:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1a
    mov r0, r0, lsr #0x1b
    cmp r0, #0xa
    movhi r0, #0x0
    ldmhiia sp!, {r3, r4, r5, pc}
    ldrh r0, [r4]
    bl func_0202b8c0
    cmp r0, #0x2
    cmpne r0, #0x3
    beq .L_b8
    cmp r0, #0x4
    beq .L_dc
    b .L_170
.L_b8:
    ldrh r1, [r4]
    ldr r0, _LIT1
    cmp r1, r0
    ldreq r0, _LIT2
    ldreq r0, [r0, #0xcf8]
    cmpeq r0, #0x1
    moveq r0, #0x0
    movne r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_dc:
    ldrh r3, [r4, #0x2]
    ldr r0, _LIT3
    ldr r1, _LIT4
    mov r2, r3, lsl #0x1f
    mov r2, r2, lsr #0x1f
    and r5, r2, #0x1
    mla r2, r5, r0, r1
    mov r0, r3, lsl #0x1a
    mov r1, r0, lsr #0x1b
    mov r0, #0x14
    mla r0, r1, r0, r2
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b9b0
    cmp r0, #0x3
    movlt r0, #0x1
    ldmltia sp!, {r3, r4, r5, pc}
    ldrh r3, [r4, #0x2]
    ldr r0, _LIT3
    ldr r1, _LIT4
    mov r2, r3, lsl #0x1f
    mov r2, r2, lsr #0x1f
    and r4, r2, #0x1
    mla r2, r4, r0, r1
    mov r0, r3, lsl #0x1a
    mov r1, r0, lsr #0x1b
    mov r0, #0x14
    mla r0, r1, r0, r2
    ldr r0, [r0, #0x30]
    mov r1, #0x1
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_ov002_022815a4
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
.L_170:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x0000131b
_LIT1: .word 0x00001322
_LIT2: .word data_ov002_022d016c
_LIT3: .word 0x00000868
_LIT4: .word data_ov002_022cf16c
