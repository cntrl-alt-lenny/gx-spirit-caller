; func_ov002_021cfab4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce870
        .extern data_ov002_022cf08c
        .extern func_0202e1e0
        .extern func_ov002_0229acd0
        .extern func_ov002_0229c6e8
        .global func_ov002_021cfab4
        .arm
func_ov002_021cfab4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    ldr r0, _LIT0
    ldrh r0, [r0]
    tst r0, #0x8000
    movne r0, #0x1
    strne r0, [sp]
    moveq r0, #0x0
    streq r0, [sp]
    ldr r0, _LIT0
    ldr r1, [r0, #0x810]
    ldrh r7, [r0, #0x2]
    ldrh r0, [r0, #0x4]
    cmp r1, #0x0
    str r0, [sp, #0x8]
    beq .L_58
    cmp r1, #0x1
    beq .L_84
    cmp r1, #0x2
    beq .L_1e8
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_58:
    ldr r1, [sp]
    mov r2, r7
    mov r0, #0x43
    mov r3, #0x0
    bl func_ov002_0229acd0
    ldr r0, _LIT0
    add sp, sp, #0xc
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_84:
    mov r0, #0x43
    bl func_ov002_0229c6e8
    cmp r0, #0x0
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r7
    mov r5, #0x0
    bl func_0202e1e0
    cmp r0, #0x0
    moveq r0, #0x5
    streq r0, [sp, #0x4]
    moveq r6, #0xa
    beq .L_c4
    mov r0, r5
    str r0, [sp, #0x4]
    mov r6, #0x4
.L_c4:
    mov fp, #0x0
.L_c8:
    ldr r0, [sp, #0x8]
    cmp r0, #0x0
    bne .L_e0
    ldr r0, [sp]
    cmp fp, r0
    bne .L_1a0
.L_e0:
    ldr r4, [sp, #0x4]
    mov r0, r4
    cmp r0, r6
    bgt .L_1a0
    ldr r1, _LIT1
    ldr r0, _LIT2
    and sl, fp, #0x1
    mla r2, sl, r0, r1
    mov r1, #0x14
    mov r0, r4
    mul r1, r0, r1
    add r0, r2, #0x30
    add r8, r0, r1
    add r9, r2, r1
.L_118:
    ldr r3, [r8]
    mov r0, r3, lsl #0x13
    cmp r7, r0, lsr #0x13
    bne .L_18c
    ldr r1, [r9, #0x40]
    ldrh r0, [r9, #0x38]
    mov r2, r1, lsr #0x6
    and r2, r2, #0x1
    mvn r2, r2
    and r0, r0, r2
    mov r2, r1, lsr #0x2
    orr r1, r2, r1, lsr #0x1
    and r1, r1, #0x1
    mvn r1, r1
    tst r0, r1
    beq .L_18c
    mov r0, r4, lsl #0x1b
    mov ip, r3, lsl #0x12
    mov r3, r3, lsl #0x2
    orr r0, sl, r0, lsr #0x1a
    mov r3, r3, lsr #0x18
    mov r0, r0, lsl #0x10
    mov r3, r3, lsl #0x1
    mov r1, r0, lsr #0x10
    mov r0, #0x20
    mov r2, r7
    add r3, r3, ip, lsr #0x1f
    bl func_ov002_0229acd0
    add r5, r5, #0x1
.L_18c:
    add r4, r4, #0x1
    cmp r4, r6
    add r8, r8, #0x14
    add r9, r9, #0x14
    ble .L_118
.L_1a0:
    add fp, fp, #0x1
    cmp fp, #0x2
    blt .L_c8
    cmp r5, #0x0
    bne .L_1d0
    ldr r0, [sp]
    mov r2, r7
    and r0, r0, #0x1
    orr r1, r0, #0x20
    mov r0, #0x20
    mov r3, #0x0
    bl func_ov002_0229acd0
.L_1d0:
    ldr r0, _LIT0
    add sp, sp, #0xc
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1e8:
    mov r0, #0x20
    bl func_ov002_0229c6e8
    cmp r0, #0x0
    ldreq r0, _LIT0
    moveq r1, #0x0
    streq r1, [r0, #0x80c]
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022ce870
_LIT1: .word data_ov002_022cf08c
_LIT2: .word 0x00000868
