; func_ov002_021dee94 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
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
        .extern func_ov002_021ca5bc
        .extern func_ov002_021d479c
        .extern func_ov002_021d9828
        .extern func_ov002_021dcc48
        .extern func_ov002_02244fe4
        .global func_ov002_021dee94
        .arm
func_ov002_021dee94:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    movs sl, r1
    mov r9, r0
    ldreq r0, _LIT0
    ldr r5, _LIT1
    ldreq r6, [r0]
    ldrne r0, _LIT0
    ldrne r6, [r0, #0x4]
    cmp sl, #0x0
    ldreq r0, _LIT0
    ldreq r7, [r0, #0x1c]
    ldrne r0, _LIT0
    ldrne r7, [r0, #0x20]
    mov r0, #0x14
    mul r4, sl, r0
    add r0, r5, r4
    str r0, [sp]
    bl func_ov002_021ba0b0
    ldr r5, [r5, r4]
    mov r4, r0
    mov r0, r5, lsl #0x2
    mov r3, r0, lsr #0x18
    mov r0, r9
    mov r1, r6
    mov r2, r7
    mov r5, r5, lsl #0x12
    mov r3, r3, lsl #0x1
    add fp, r3, r5, lsr #0x1f
    bl func_ov002_021c1e44
    cmp r0, #0x0
    addne sp, sp, #0x8
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    cmp r4, #0x0
    beq .L_280
    mov r0, fp
    mov r5, #0x2
    bl func_ov002_021ca5bc
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_c4
    mov r0, r4
    bl func_0202e2f8
    cmp r0, #0x0
    moveq r8, #0x1
    beq .L_c8
.L_c4:
    mov r8, #0x0
.L_c8:
    ldrh r0, [r9, #0x2]
    add r2, sp, #0x4
    mov r1, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r6
    movne r9, #0x1
    ldr r0, _LIT2
    moveq r9, #0x0
    str r1, [r2]
    cmp r4, r0
    bne .L_11c
    ldr r0, _LIT0
    ldr r2, _LIT3
    ldr r1, [r0]
    mov r0, #0x38
    eor r1, r1, sl
    mla r0, r1, r0, r2
    bl func_ov002_021badb0
    cmp r0, #0x0
    movne r8, #0x0
.L_11c:
    mov r0, #0x200
    rsb r0, r0, #0x0
    and r1, fp, r0, lsr #0x17
    ldr r2, [sp, #0x4]
    cmp r8, #0x0
    and r0, r2, r0
    orr r3, r0, r1
    ldr r0, [sp]
    bic r3, r3, #0x200
    ldrh r2, [r0, #0x6]
    ldrh r1, [r0, #0x8]
    mov r0, r6, lsl #0x1f
    orr r3, r3, r0, lsr #0x16
    bic sl, r3, #0x3c00
    mov r3, r7, lsl #0x1c
    orr r3, sl, r3, lsr #0x12
    eor r0, r6, r9
    bic r3, r3, #0x4000
    mov r2, r2, lsl #0x1f
    orr r2, r3, r2, lsr #0x11
    bic r2, r2, #0x20000
    mov r1, r1, lsl #0x1f
    orr r1, r2, r1, lsr #0xe
    bic r1, r1, #0x40000
    mov r0, r0, lsl #0x1f
    orr r0, r1, r0, lsr #0xd
    orr r0, r0, #0x8000
    bic r0, r0, #0x800000
    str r0, [sp, #0x4]
    movne r0, #0xe
    moveq r0, #0xf
    ldr r1, [sp, #0x4]
    cmp r9, #0x0
    orrne r5, r5, #0x1
    cmp r6, #0x0
    movne r3, #0x8000
    moveq r3, #0x0
    mov r0, r0, lsl #0x1c
    bic r1, r1, #0x780000
    orr r0, r1, r0, lsr #0x9
    str r0, [sp, #0x4]
    ldr sl, [sp, #0x4]
    and r1, r9, #0xf
    mov r0, sl, lsl #0x8
    mov r0, r0, lsr #0x1f
    and r0, r0, #0xf
    mov r2, sl, lsl #0x9
    orr r0, r1, r0, lsl #0x4
    mov r2, r2, lsr #0x1c
    and fp, r7, #0xff
    mov r9, sl, lsl #0x17
    orr ip, r3, #0x31
    mov r3, r9, lsr #0x17
    orr sl, fp, #0xff00
    mov r3, r3, lsl #0x10
    and r1, r2, #0xff
    and r0, r0, #0xff
    orr r0, r1, r0, lsl #0x8
    mov sl, sl, lsl #0x10
    mov r2, r0, lsl #0x10
    mov r9, ip, lsl #0x10
    mov r0, r9, lsr #0x10
    mov r1, sl, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r3, r3, lsr #0x10
    bl func_ov002_021d479c
    add r0, sp, #0x4
    mov r2, #0x0
    ldr r0, [r0]
    ldr r1, [sp]
    mov r3, r2
    bl func_ov002_021d9828
    mov r0, r4
    bl func_0202e2f8
    cmp r0, #0x0
    bne .L_258
    ldr r1, [sp, #0x4]
    mov r0, #0x1b
    bl func_ov002_02244fe4
.L_258:
    cmp r8, #0x0
    orrne r5, r5, #0x1000000
    ldr r0, [sp]
    mov r1, r6
    mov r2, r7
    mov r3, r5
    bl func_ov002_021dcc48
    add sp, sp, #0x8
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_280:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cd3f4
_LIT1: .word data_ov002_022cd4b8
_LIT2: .word 0x000016f8
_LIT3: .word data_ov002_022cd420
