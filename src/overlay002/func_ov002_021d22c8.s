; func_ov002_021d22c8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd73c
        .extern data_ov002_022ce950
        .extern data_ov002_022cf168
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf288
        .extern data_ov002_022d016c
        .extern func_ov002_021b0c04
        .extern func_ov002_021b1f20
        .extern func_ov002_021b3e28
        .extern func_ov002_021b3ecc
        .extern func_ov002_021b91c4
        .extern func_ov002_021b9254
        .extern func_ov002_021b9aa8
        .extern func_ov002_021baa04
        .extern func_ov002_021c9b80
        .extern func_ov002_0229ade0
        .extern func_ov002_0229c7f8
        .global func_ov002_021d22c8
        .arm
func_ov002_021d22c8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    ldr r0, _LIT0
    ldr r1, _LIT0
    ldrh r0, [r0]
    ldrh r6, [r1, #0x6]
    ldrh r7, [r1, #0x4]
    tst r0, #0x8000
    movne r9, #0x1
    moveq r9, #0x0
    mov r2, r7, lsl #0x10
    mov r5, r6, asr #0x1
    ldrh fp, [r1, #0x2]
    mov r0, r9
    mov r4, r7, lsl #0x1a
    and sl, r6, #0x1
    mov r3, r7, lsl #0x11
    strh r7, [sp, #0x8]
    mov r1, r5
    mov r6, r4, lsr #0x1b
    mov r7, r3, lsr #0x1f
    mov r8, r2, lsr #0x1f
    bl func_ov002_021b9aa8
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x810]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_35c
    b .L_84
    b .L_b0
    b .L_254
    b .L_344
.L_84:
    mov r1, r9
    mov r2, fp
    mov r3, r7
    mov r0, #0x44
    bl func_ov002_0229ade0
    ldr r0, _LIT0
    add sp, sp, #0xc
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_b0:
    mov r0, #0x44
    bl func_ov002_0229c7f8
    cmp r0, #0x0
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r2, _LIT1
    ldr r0, _LIT2
    and r1, r9, #0x1
    mla r0, r1, r0, r2
    add r1, r0, #0x120
    ldr r0, _LIT3
    add r1, r1, r4, lsl #0x2
    bl func_ov002_021b91c4
    ldrh r2, [sp, #0x6]
    mov r0, r9, lsl #0x10
    mov r1, r0, lsr #0x10
    ldrh r0, [sp, #0x4]
    bic r3, r2, #0x1
    and r2, r1, #0x1
    orr r1, r3, r2
    strh r1, [sp, #0x6]
    ldrh r1, [sp, #0x6]
    bic r0, r0, #0x1
    orr r0, r0, r2
    bic r1, r1, #0x3e
    orr r1, r1, #0x16
    strh r1, [sp, #0x6]
    strh r0, [sp, #0x4]
    ldrh sl, [sp, #0x6]
    ldrh r3, [sp, #0x4]
    mov r0, r4, lsl #0x10
    mov r1, r6, lsl #0x10
    mov r2, r0, lsr #0x10
    mov r4, r1, lsr #0x10
    mov r0, r7, lsl #0x10
    bic sl, sl, #0x3fc0
    mov r1, r2, lsl #0x18
    orr r1, sl, r1, lsr #0x12
    strh r1, [sp, #0x6]
    ldrh r2, [sp, #0x6]
    mov r1, r8, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r2, r2, #0x8000
    strh r2, [sp, #0x6]
    ldrh fp, [sp, #0x6]
    mov r2, r0, lsl #0x1f
    bic sl, r3, #0x3e
    bic r0, fp, #0x4000
    orr r0, r0, r2, lsr #0x11
    strh r0, [sp, #0x6]
    ldrh r3, [sp, #0x6]
    mov r0, r4, lsl #0x1b
    orr r0, sl, r0, lsr #0x1a
    strh r0, [sp, #0x4]
    ldrh r4, [sp, #0x4]
    mov r1, r1, lsr #0x10
    mov r0, r3, lsl #0x1f
    bic r4, r4, #0x3fc0
    strh r4, [sp, #0x4]
    ldrh r4, [sp, #0x4]
    mov r1, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bic r4, r4, #0x8000
    orr r1, r4, r1, lsr #0x10
    strh r1, [sp, #0x4]
    ldrh r4, [sp, #0x4]
    mov r1, r3, lsl #0x1a
    mov r1, r1, lsr #0x1b
    bic r4, r4, #0x4000
    orr r4, r4, r2, lsr #0x11
    mov r2, r3, lsl #0x12
    mov r2, r2, lsr #0x18
    strh r4, [sp, #0x4]
    bl func_ov002_021baa04
    ldr r2, _LIT3
    mov r3, r8
    str r7, [sp]
    mov r0, r9
    mov r1, r6
    bl func_ov002_021b9254
    cmp r7, #0x0
    beq .L_20c
    mov r0, r9
    mov r1, r6
    mov r2, #0x2
    mov r3, #0x1
    bl func_ov002_021c9b80
.L_20c:
    cmp r7, #0x0
    movne r0, #0x1
    moveq r0, #0x4
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    ldrh r2, [sp, #0x6]
    ldrh r3, [sp, #0x4]
    mov r0, r5, lsl #0x10
    mov r1, r1, lsl #0x10
    orr r1, r1, r0, lsr #0x10
    mov r0, #0x18
    bl func_ov002_0229ade0
    ldr r0, _LIT0
    add sp, sp, #0xc
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_254:
    ldr r2, _LIT4
    mov r0, r9
    mov r1, #0xb
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_294
    ldr r2, _LIT4
    mov r0, r9
    mov r1, #0xb
    bl func_ov002_021b3e28
    str r0, [sp]
    ldr r3, _LIT4
    mov r0, r9
    mov r1, r6
    mov r2, #0x1
    bl func_ov002_021b1f20
.L_294:
    cmp sl, #0x0
    beq .L_2b8
    ldr r0, _LIT2
    and r1, r9, #0x1
    mul r2, r1, r0
    ldr r1, _LIT5
    ldr r0, [r1, r2]
    orr r0, r0, #0x20000
    str r0, [r1, r2]
.L_2b8:
    ldr r0, _LIT6
    ldr r1, [r0, #0xcf8]
    cmp r1, #0x2
    bne .L_2e8
    ldr r1, [r0, #0xcec]
    ldr r0, _LIT2
    and r1, r1, #0x1
    mul r2, r1, r0
    ldr r1, _LIT5
    ldr r0, [r1, r2]
    orr r0, r0, #0x100000
    str r0, [r1, r2]
.L_2e8:
    cmp r7, #0x0
    bne .L_32c
    ldr r0, _LIT7
    ldr r0, [r0, #0x4]
    cmp r9, r0
    bne .L_318
    mov r0, #0x15
    mov r1, #0x1
    bl func_ov002_021b0c04
    mov r0, #0x1c
    mov r1, #0x1
    bl func_ov002_021b0c04
.L_318:
    mov r1, r9
    mov r2, r6
    mov r3, r8
    mov r0, #0x1c
    bl func_ov002_0229ade0
.L_32c:
    ldr r0, _LIT0
    add sp, sp, #0xc
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_344:
    mov r0, #0x1c
    bl func_ov002_0229c7f8
    cmp r0, #0x0
    ldreq r0, _LIT0
    moveq r1, #0x0
    streq r1, [r0, #0x80c]
.L_35c:
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022ce950
_LIT1: .word data_ov002_022cf16c
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022cf168
_LIT4: .word 0x000015c7
_LIT5: .word data_ov002_022cf288
_LIT6: .word data_ov002_022d016c
_LIT7: .word data_ov002_022cd73c
