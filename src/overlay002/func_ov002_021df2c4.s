; func_ov002_021df2c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern data_ov002_022cd420
        .extern data_ov002_022cd4b8
        .extern func_0202e2f8
        .extern func_ov002_021ba0b0
        .extern func_ov002_021badb0
        .extern func_ov002_021ca5bc
        .extern func_ov002_021d479c
        .extern func_ov002_021d9828
        .extern func_ov002_021dcc48
        .extern func_ov002_02244fe4
        .global func_ov002_021df2c4
        .arm
func_ov002_021df2c4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    movs sl, r0
    ldreq r0, _LIT0
    ldr r5, _LIT1
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
    add fp, r5, r4
    mov r0, fp
    bl func_ov002_021ba0b0
    ldr r1, [r5, r4]
    movs r4, r0
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r5, r0, r1, lsr #0x1f
    beq .L_1fc
    mov r0, r5
    mov r6, #0x0
    bl func_ov002_021ca5bc
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, r6
    cmp r0, #0x0
    bne .L_98
    mov r0, r4
    bl func_0202e2f8
    cmp r0, #0x0
    moveq r9, #0x1
    beq .L_9c
.L_98:
    mov r9, #0x0
.L_9c:
    ldr r0, _LIT2
    add r2, sp, #0x0
    mov r1, #0x0
    str r1, [r2]
    cmp r4, r0
    bne .L_d8
    ldr r0, _LIT0
    ldr r2, _LIT3
    ldr r1, [r0]
    mov r0, #0x38
    eor r1, r1, sl
    mla r0, r1, r0, r2
    bl func_ov002_021badb0
    cmp r0, #0x0
    movne r9, #0x0
.L_d8:
    mov r0, #0x200
    rsb r0, r0, #0x0
    ldr r2, [sp]
    and r1, r5, r0, lsr #0x17
    and r0, r2, r0
    orr r0, r0, r1
    bic r3, r0, #0x200
    mov r0, r7, lsl #0x1f
    ldrh r2, [fp, #0x6]
    orr r3, r3, r0, lsr #0x16
    bic r5, r3, #0x3c00
    mov r3, r8, lsl #0x1c
    ldrh r1, [fp, #0x8]
    orr r3, r5, r3, lsr #0x12
    bic r3, r3, #0x4000
    mov r2, r2, lsl #0x1f
    orr r2, r3, r2, lsr #0x11
    bic r2, r2, #0x20000
    mov r1, r1, lsl #0x1f
    orr r1, r2, r1, lsr #0xe
    bic r1, r1, #0x40000
    orr r0, r1, r0, lsr #0xd
    orr r0, r0, #0x8000
    bic r0, r0, #0x800000
    str r0, [sp]
    cmp r9, #0x0
    movne r0, #0xe
    moveq r0, #0xf
    ldr r1, [sp]
    mov r0, r0, lsl #0x1c
    bic r1, r1, #0x780000
    orr r0, r1, r0, lsr #0x9
    str r0, [sp]
    cmp r7, #0x0
    movne r1, #0x8000
    moveq r1, #0x0
    ldr r0, [sp]
    orr r5, r1, #0x46
    mov r1, r0, lsl #0x9
    mov r2, r1, lsr #0x1c
    mov r0, r0, lsl #0x17
    mov r3, r0, lsr #0x17
    mov r0, r5, lsl #0x10
    mov r1, r8, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r3, r3, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r3, r3, lsr #0x10
    bl func_ov002_021d479c
    add r0, sp, #0x0
    mov r2, #0x0
    ldr r0, [r0]
    mov r1, fp
    mov r3, r2
    bl func_ov002_021d9828
    mov r0, r4
    bl func_0202e2f8
    cmp r0, #0x0
    bne .L_1d8
    ldr r1, [sp]
    mov r0, #0x1b
    bl func_ov002_02244fe4
.L_1d8:
    cmp r9, #0x0
    orrne r6, r6, #0x1000000
    mov r0, fp
    mov r1, r7
    mov r2, r8
    mov r3, r6
    bl func_ov002_021dcc48
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1fc:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cd3f4
_LIT1: .word data_ov002_022cd4b8
_LIT2: .word 0x000016f8
_LIT3: .word data_ov002_022cd420
