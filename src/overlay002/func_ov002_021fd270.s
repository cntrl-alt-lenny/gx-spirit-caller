; func_ov002_021fd270 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd73c
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern data_ov002_022cf19c
        .extern data_ov002_022cf1a4
        .extern data_ov002_022cf288
        .extern data_ov002_022cf28c
        .extern data_ov002_022d016c
        .extern func_0202b8c0
        .extern func_0202e234
        .extern func_02030c7c
        .extern func_ov002_021b9aa8
        .extern func_ov002_021bb068
        .extern func_ov002_021bd030
        .extern func_ov002_021f3458
        .extern func_ov002_021fca38
        .extern func_ov002_02257b48
        .extern func_ov002_0229cd5c
        .global func_ov002_021fd270
        .arm
func_ov002_021fd270:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x4
    mov r8, r0
    ldrh r2, [r8, #0x2]
    mov r7, r1
    mov sl, #0x0
    mov r1, r2, lsl #0x11
    mov r2, r2, lsl #0x1f
    mov r1, r1, lsr #0x1f
    eor r4, r1, r2, lsr #0x1f
    bl func_ov002_021fca38
    cmp r0, #0x0
    addne sp, sp, #0x4
    movne r0, sl
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
    cmp r7, #0x0
    beq .L_8c8
    ldrh r0, [r8]
    bl func_02030c7c
    mov r5, r0
    ldrh r0, [r7]
    bl func_02030c7c
    cmp r5, r0
    addlt sp, sp, #0x4
    movlt r0, sl
    ldmltia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
    ldrh r1, [r7]
    ldr r0, _LIT0
    cmp r1, r0
    bne .L_8c8
    ldrh r0, [r8]
    bl func_0202e234
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, sl
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_8c8:
    mov r0, r8
    bl func_ov002_021f3458
    ldrh r1, [r8, #0x2]
    mov r5, r0
    mov r0, r1, lsl #0x1a
    mov r0, r0, lsr #0x1b
    cmp r0, #0xb
    bne .L_8f8
    ldr r0, _LIT1
    bl func_ov002_021bb068
    mov r1, #0x1f4
    mla r5, r0, r1, r5
.L_8f8:
    ldr r0, _LIT2
    and r1, r4, #0x1
    mul r2, r1, r0
    ldr r0, _LIT3
    ldr r0, [r0, r2]
    cmp r0, r5
    bgt .L_938
    ldr r0, _LIT4
    add sp, sp, #0x4
    ldr r0, [r0, #0x4]
    cmp r4, r0
    ldreq r0, _LIT5
    moveq r1, #0x17
    streq r1, [r0, #0xd80]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_938:
    ldrh r0, [r8, #0x2]
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x1f
    cmpne r0, #0x20
    cmpne r0, #0x21
    ldreq r0, _LIT6
    moveq r1, #0x1
    streq r1, [r0, #0x5c8]
    ldrh r0, [r8, #0x2]
    mov r0, r0, lsl #0x12
    movs r0, r0, lsr #0x1e
    bne .L_af4
    ldrh r0, [r8]
    bl func_0202e234
    cmp r0, #0x0
    bne .L_af4
    ldrh r0, [r8]
    bl func_0202b8c0
    cmp r0, #0x2
    beq .L_af4
    ldrh r1, [r8, #0x2]
    mov r0, r1, lsl #0x1a
    mov r1, r1, lsl #0x1f
    mov r5, r0, lsr #0x1b
    cmp r5, #0xb
    mov r4, r1, lsr #0x1f
    bne .L_a9c
    mov r0, r4
    bl func_ov002_021bd030
    ldrh r1, [r8, #0x4]
    mov sl, r0
    mov r0, r4
    mov r1, r1, lsl #0x11
    mov r1, r1, lsr #0x17
    bl func_ov002_021b9aa8
    mov r2, #0x14
    ldr r1, _LIT2
    and r3, r4, #0x1
    mov r9, r0
    mul r4, r3, r1
    ldr r0, _LIT7
    ldr r1, _LIT8
    add r6, r0, r4
    ldr r3, [r6, r9, lsl #0x2]
    ldr r0, _LIT9
    mul r5, sl, r2
    add r2, r1, r4
    add r0, r0, r4
    mov r1, sl, lsl #0x10
    mov r1, r1, lsr #0x10
    mov sl, r1, lsl #0x1b
    mov r1, r7
    str r3, [sp]
    mov r7, #0x1
    strh r7, [r5, r2]
    ldr r2, _LIT10
    str r3, [r5, r0]
    ldr r7, _LIT11
    add r2, r2, r4
    ldr r3, [r7, r4]
    mov r0, r8
    ldr r2, [r2, r3, lsl #0x2]
    str r2, [r6, r9, lsl #0x2]
    ldr r2, [r7, r4]
    sub r2, r2, #0x1
    str r2, [r7, r4]
    ldrh r2, [r8, #0x2]
    bic r2, r2, #0x3e
    orr r2, r2, sl, lsr #0x1a
    strh r2, [r8, #0x2]
    bl func_ov002_02257b48
    ldrh r2, [r8, #0x2]
    ldr r1, _LIT3
    mov sl, r0
    bic r0, r2, #0x3e
    orr r0, r0, #0x16
    strh r0, [r8, #0x2]
    ldr r2, [r7, r4]
    add r0, r1, r4
    add r1, r2, #0x1
    str r1, [r7, r4]
    add r0, r0, #0x30
    ldr r2, [sp]
    add r0, r0, r5
    mov r1, #0x14
    str r2, [r6, r9, lsl #0x2]
    bl func_ov002_0229cd5c
    b .L_b04
.L_a9c:
    cmp r5, #0xa
    bcs .L_b04
    ldr r3, _LIT8
    mov r1, #0x14
    ldr r0, _LIT2
    and r2, r4, #0x1
    mla r4, r2, r0, r3
    mul r2, r5, r1
    mov r3, #0x1
    mov r0, r8
    mov r1, r7
    strh r3, [r4, r2]
    bl func_ov002_02257b48
    ldrh r2, [r8, #0x2]
    mov r1, #0x14
    mov r3, #0x0
    mov r2, r2, lsl #0x1a
    mov r2, r2, lsr #0x1b
    mul r1, r2, r1
    mov sl, r0
    strh r3, [r4, r1]
    b .L_b04
.L_af4:
    mov r0, r8
    mov r1, r7
    bl func_ov002_02257b48
    mov sl, r0
.L_b04:
    ldr r1, _LIT6
    mov r2, #0x0
    mov r0, sl
    str r2, [r1, #0x5c8]
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0x000019a3
_LIT1: .word 0x0000132c
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022cf16c
_LIT4: .word data_ov002_022cd73c
_LIT5: .word data_ov002_022d016c
_LIT6: .word data_ov002_022ce288
_LIT7: .word data_ov002_022cf28c
_LIT8: .word data_ov002_022cf1a4
_LIT9: .word data_ov002_022cf19c
_LIT10: .word data_ov002_022cf288
_LIT11: .word data_ov002_022cf178
