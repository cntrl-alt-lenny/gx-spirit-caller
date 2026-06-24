; func_ov002_021cc984 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce950
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a2
        .extern data_ov002_022cf1a4
        .extern data_ov002_022cf1ac
        .extern func_ov002_021b0c04
        .extern func_ov002_021b2e04
        .extern func_ov002_0229ade0
        .extern func_ov002_0229cd70
        .global func_ov002_021cc984
        .arm
func_ov002_021cc984:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x20
    ldr r0, _LIT0
    ldrh r5, [r0, #0x2]
    ldrh r3, [r0, #0x4]
    ldr r1, [r0, #0x810]
    mov r4, r5, asr #0x8
    mov r2, r3, asr #0x8
    cmp r1, #0x0
    and r5, r5, #0xff
    and r6, r4, #0xff
    and r7, r3, #0xff
    and r8, r2, #0xff
    beq .L_4c
    cmp r1, #0x1
    beq .L_1f8
    cmp r1, #0x2
    beq .L_35c
    b .L_3c8
.L_4c:
    ldr r4, _LIT1
    and r3, r5, #0x1
    mul r1, r3, r4
    str r1, [sp]
    mov r2, #0x14
    mul sl, r6, r2
    ldr r1, _LIT2
    ldr r3, [sp]
    add r3, r1, r3
    add r3, r3, sl
    ldr r3, [r3, #0x30]
    mov r3, r3, lsl #0x13
    movs r3, r3, lsr #0x13
    moveq r1, #0x0
    streq r1, [r0, #0x80c]
    addeq sp, sp, #0x20
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    and r9, r7, #0x1
    mul r3, r9, r4
    str r3, [sp, #0x4]
    mul r9, r8, r2
    add r3, r1, r3
    add r1, r3, r9
    ldr r1, [r1, #0x30]
    mov r1, r1, lsl #0x13
    movs r1, r1, lsr #0x13
    moveq r1, #0x0
    streq r1, [r0, #0x80c]
    addeq sp, sp, #0x20
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    add r4, r3, #0x30
    add r0, sp, #0xc
    add r1, r4, r9
    bl func_ov002_0229cd70
    ldr r2, _LIT2
    ldr r1, [sp]
    add r0, r4, r9
    add r1, r2, r1
    add fp, r1, #0x30
    add r1, fp, sl
    mov r2, #0x14
    bl func_ov002_0229cd70
    add r0, fp, sl
    add r1, sp, #0xc
    mov r2, #0x14
    bl func_ov002_0229cd70
    add r2, r7, #0x2
    and r1, r5, #0xff
    and r0, r6, #0xff
    orr r5, r1, r0, lsl #0x8
    ldr r3, _LIT3
    ldr r0, [sp]
    ldr r1, [sp, #0x4]
    add r0, r3, r0
    add r1, r3, r1
    ldr r3, [r0, sl]
    and r8, r8, #0xff
    bic r3, r3, #0x200000
    and r2, r2, #0xff
    str r3, [r0, sl]
    ldr r3, [r1, r9]
    orr r6, r2, r8, lsl #0x8
    mov r2, r5, lsl #0x10
    mov r0, r2, lsr #0x10
    bic r3, r3, #0x200000
    mov r2, r6, lsl #0x10
    str r3, [r1, r9]
    mov r1, r2, lsr #0x10
    bl func_ov002_021b2e04
    and r0, r7, #0xff
    orr r7, r0, r8, lsl #0x8
    mov r0, r5, lsl #0x10
    mov r1, r0, lsr #0x10
    mov r0, r7, lsl #0x10
    mov r0, r0, lsr #0x10
    bl func_ov002_021b2e04
    mov r0, r6, lsl #0x10
    mov r1, r7, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021b2e04
    ldr r0, [fp, sl]
    mov r1, #0x2000
    mov r0, r0, lsl #0x13
    ldr r3, [r4, r9]
    ldr r2, _LIT0
    mov r0, r0, lsr #0x13
    strh r0, [r2, #0x6]
    ldr r0, [r2, #0x818]
    rsb r1, r1, #0x0
    and r5, r0, r1
    mov r0, r1, lsr #0x13
    mov r3, r3, lsl #0x13
    and r0, r0, r3, lsr #0x13
    orr r0, r5, r0
    str r0, [r2, #0x818]
    ldr r0, [fp, sl]
    add sp, sp, #0x20
    and r0, r0, r1
    str r0, [fp, sl]
    ldr r0, [r4, r9]
    and r0, r0, r1
    str r0, [r4, r9]
    ldr r0, [r2, #0x810]
    add r0, r0, #0x1
    str r0, [r2, #0x810]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1f8:
    cmp r6, #0x4
    cmple r8, #0x4
    bgt .L_210
    mov r0, #0x2d
    mov r1, #0x1
    bl func_ov002_021b0c04
.L_210:
    ldrh r3, [sp, #0xa]
    mov r0, r5, lsl #0x10
    mov r2, r7, lsl #0x10
    mov r0, r0, lsr #0x10
    mov sl, r2, lsr #0x10
    bic r2, r3, #0x1
    and r0, r0, #0x1
    orr r0, r2, r0
    strh r0, [sp, #0xa]
    ldrh r4, [sp, #0xa]
    mov r2, r6, lsl #0x10
    mov r3, r2, lsr #0x10
    ldrh r1, [sp, #0x8]
    mov r9, r8, lsl #0x10
    bic r4, r4, #0x3e
    bic r2, r1, #0x1
    and r1, sl, #0x1
    orr r1, r2, r1
    mov r3, r3, lsl #0x1b
    orr r3, r4, r3, lsr #0x1a
    strh r1, [sp, #0x8]
    strh r3, [sp, #0xa]
    ldrh r1, [sp, #0x8]
    and r2, r5, #0x1
    and r5, r7, #0x1
    ldrh r4, [sp, #0xa]
    mov r9, r9, lsr #0x10
    bic r3, r1, #0x3e
    mov r1, r9, lsl #0x1b
    orr r1, r3, r1, lsr #0x1a
    bic r3, r4, #0x3fc0
    strh r3, [sp, #0xa]
    ldr sl, _LIT1
    strh r1, [sp, #0x8]
    mul r3, r2, sl
    ldrh r1, [sp, #0x8]
    mov r0, #0x14
    mul r2, r5, sl
    ldr r7, _LIT4
    bic r1, r1, #0x3fc0
    strh r1, [sp, #0x8]
    mul sl, r6, r0
    add r5, r7, r3
    ldr r4, _LIT5
    ldrh r5, [sl, r5]
    add r3, r4, r3
    ldrh r3, [sl, r3]
    mul sl, r8, r0
    add r0, r7, r2
    ldrh r6, [sl, r0]
    add r0, r4, r2
    ldrh r9, [sp, #0xa]
    ldrh r0, [sl, r0]
    ldrh r1, [sp, #0x8]
    bic r4, r9, #0x8000
    mov r2, r5, lsl #0x1f
    orr r2, r4, r2, lsr #0x10
    strh r2, [sp, #0xa]
    bic r2, r1, #0x8000
    mov r1, r6, lsl #0x1f
    orr r1, r2, r1, lsr #0x10
    strh r1, [sp, #0x8]
    ldrh r1, [sp, #0x8]
    ldrh r4, [sp, #0xa]
    mov r0, r0, lsl #0x1f
    bic r1, r1, #0x4000
    orr r0, r1, r0, lsr #0x11
    strh r0, [sp, #0x8]
    mov r2, r3, lsl #0x1f
    bic r4, r4, #0x4000
    orr r2, r4, r2, lsr #0x11
    strh r2, [sp, #0xa]
    ldrh r2, [sp, #0xa]
    ldrh r3, [sp, #0x8]
    mov r0, #0x19
    mov r1, #0x0
    bl func_ov002_0229ade0
    ldr r0, _LIT0
    add sp, sp, #0x20
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_35c:
    ldr r4, _LIT2
    ldr r1, _LIT1
    mov r2, #0x14
    and r3, r5, #0x1
    mla r9, r3, r1, r4
    and r3, r7, #0x1
    mla r5, r3, r1, r4
    mov r1, #0x2000
    rsb r1, r1, #0x0
    ldrh r3, [r0, #0x6]
    mul r7, r6, r2
    add r9, r9, #0x30
    ldr r6, [r9, r7]
    mul r4, r8, r2
    and r6, r6, r1
    and r2, r3, r1, lsr #0x13
    orr r2, r6, r2
    str r2, [r9, r7]
    add r5, r5, #0x30
    ldr r0, [r0, #0x818]
    ldr r3, [r5, r4]
    mov r2, r0, lsl #0x13
    mov r0, r1, lsr #0x13
    and r1, r3, r1
    and r0, r0, r2, lsr #0x13
    orr r0, r1, r0
    str r0, [r5, r4]
.L_3c8:
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x80c]
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022ce950
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf16c
_LIT3: .word data_ov002_022cf1ac
_LIT4: .word data_ov002_022cf1a2
_LIT5: .word data_ov002_022cf1a4
