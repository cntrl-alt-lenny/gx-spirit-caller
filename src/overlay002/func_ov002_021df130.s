; func_ov002_021df130 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern data_ov002_022cd420
        .extern data_ov002_022cd4b8
        .extern func_0202e2f8
        .extern func_ov002_021ba0b0
        .extern func_ov002_021badb0
        .extern func_ov002_021c1e44
        .extern func_ov002_021d479c
        .extern func_ov002_021dcc48
        .global func_ov002_021df130
        .arm
func_ov002_021df130:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    movs sl, r1
    mov fp, r0
    ldreq r0, _LIT0
    mov r9, r2
    ldreq r7, [r0]
    ldrne r0, _LIT0
    ldrne r7, [r0, #0x4]
    cmp sl, #0x0
    ldreq r0, _LIT0
    ldreq r8, [r0, #0x1c]
    ldrne r0, _LIT0
    ldrne r8, [r0, #0x20]
    mov r0, #0x14
    mul r4, sl, r0
    ldr r0, _LIT1
    add r0, r0, r4
    bl func_ov002_021ba0b0
    ldr r1, _LIT1
    mov r5, r0
    ldr r2, [r1, r4]
    mov r0, r2, lsl #0x2
    mov r1, r0, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r6, r1, r2, lsr #0x1f
    mov r0, fp
    mov r1, r7
    mov r2, r8
    bl func_ov002_021c1e44
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT2
    cmp r5, r0
    bne .L_354
    ldr r0, _LIT0
    ldr r2, _LIT3
    ldr r1, [r0]
    mov r0, #0x38
    eor r1, r1, sl
    mla r0, r1, r0, r2
    bl func_ov002_021badb0
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_354:
    cmp r5, #0x0
    beq .L_418
    mov r0, r5
    bl func_0202e2f8
    cmp r0, #0x0
    beq .L_3a8
    cmp r7, #0x0
    movne r1, #0x8000
    moveq r1, #0x0
    and r0, r8, #0xff
    orr r2, r1, #0x31
    orr r1, r0, #0xff00
    mov r0, r2, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r2, r6, lsl #0x10
    mov r3, r2, lsr #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, #0x10
    bl func_ov002_021d479c
    b .L_3f8
.L_3a8:
    ldrh r0, [fp, #0x2]
    mov r3, r6, lsl #0x10
    mov r3, r3, lsr #0x10
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r7
    orrne r9, r9, #0x1
    cmp r7, #0x0
    movne r1, #0x8000
    moveq r1, #0x0
    and r0, r8, #0xff
    orr r2, r1, #0x33
    orr r1, r0, #0xff00
    mov r0, r2, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r2, r9, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    bl func_ov002_021d479c
.L_3f8:
    ldr r0, _LIT1
    mov r1, r7
    mov r2, r8
    mov r3, r9
    add r0, r0, r4
    bl func_ov002_021dcc48
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_418:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cd3f4
_LIT1: .word data_ov002_022cd4b8
_LIT2: .word 0x00001a8d
_LIT3: .word data_ov002_022cd420
