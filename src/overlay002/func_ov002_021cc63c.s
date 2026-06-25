; func_ov002_021cc63c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd73c
        .extern data_ov002_022ce950
        .extern data_ov002_022cf168
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a2
        .extern data_ov002_022cf1a4
        .extern data_ov002_022cf1a8
        .extern data_ov002_022cf1ac
        .extern data_ov002_022d016c
        .extern func_ov002_021b0c04
        .extern func_ov002_021b2240
        .extern func_ov002_021b2e04
        .extern func_ov002_021b91c4
        .extern func_ov002_021c93f0
        .extern func_ov002_0229ade0
        .extern func_ov002_0229cd5c
        .extern func_ov002_0229cd70
        .global func_ov002_021cc63c
        .arm
func_ov002_021cc63c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    ldr r0, _LIT0
    ldrh r4, [r0, #0x2]
    ldrh r3, [r0, #0x4]
    ldr r1, [r0, #0x810]
    mov r5, r4, asr #0x8
    mov r2, r3, asr #0x8
    cmp r1, #0x0
    and r4, r4, #0xff
    and r5, r5, #0xff
    and r6, r3, #0xff
    and r7, r2, #0xff
    beq .L_10fc
    cmp r1, #0x1
    beq .L_1128
    b .L_13c8
.L_10fc:
    cmp r5, #0xa
    cmple r7, #0xa
    addle r1, r1, #0x1
    strle r1, [r0, #0x810]
    addle sp, sp, #0x8
    ldmleia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x80c]
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1128:
    mov r0, r4
    mov r1, r5
    mov r2, #0x0
    bl func_ov002_021c93f0
    mov r1, r0
    ldr r0, _LIT1
    bl func_ov002_021b91c4
    ldr r0, _LIT2
    ldr r0, [r0, #0x4]
    cmp r6, r0
    bne .L_116c
    cmp r5, #0x4
    cmple r7, #0x4
    bgt .L_116c
    mov r0, #0x2d
    mov r1, #0x1
    bl func_ov002_021b0c04
.L_116c:
    ldrh r1, [sp, #0x6]
    mov r0, r4, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x1
    and r0, r0, #0x1
    orr r0, r1, r0
    strh r0, [sp, #0x6]
    ldrh r2, [sp, #0x6]
    mov r0, r5, lsl #0x10
    mov r1, r0, lsr #0x10
    bic r2, r2, #0x3e
    mov r1, r1, lsl #0x1b
    orr r1, r2, r1, lsr #0x1a
    strh r1, [sp, #0x6]
    ldrh r2, [sp, #0x6]
    ldrh r3, [sp, #0x4]
    ldr r0, _LIT3
    and r8, r4, #0x1
    bic r2, r2, #0x3fc0
    strh r2, [sp, #0x6]
    mov r1, r6, lsl #0x10
    mov r2, r1, lsr #0x10
    ldrh fp, [sp, #0x6]
    mov r1, r7, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r9, #0x14
    mul r0, r8, r0
    mul r8, r5, r9
    ldr sl, _LIT4
    bic r3, r3, #0x1
    and r2, r2, #0x1
    add r9, sl, r0
    orr r2, r3, r2
    strh r2, [sp, #0x4]
    ldrh sl, [r8, r9]
    ldrh r3, [sp, #0x4]
    ldr ip, _LIT5
    bic fp, fp, #0x8000
    mov r2, sl, lsl #0x1f
    add r9, ip, r0
    orr r2, fp, r2, lsr #0x10
    strh r2, [sp, #0x6]
    ldrh r2, [sp, #0x6]
    bic r3, r3, #0x3e
    mov r1, r1, lsl #0x1b
    orr r1, r3, r1, lsr #0x1a
    strh r1, [sp, #0x4]
    ldrh r9, [r8, r9]
    ldrh r3, [sp, #0x4]
    bic r2, r2, #0x4000
    mov r1, r9, lsl #0x1f
    orr r1, r2, r1, lsr #0x11
    strh r1, [sp, #0x6]
    bic r2, r3, #0x3fc0
    strh r2, [sp, #0x4]
    ldrh r1, [sp, #0x6]
    ldrh r3, [sp, #0x4]
    cmp r7, #0x5
    mov r2, r1, lsl #0x10
    mov r2, r2, lsr #0x1f
    mov r1, r1, lsl #0x11
    mov r1, r1, lsr #0x1f
    bic r3, r3, #0x8000
    mov r2, r2, lsl #0x1f
    orr r2, r3, r2, lsr #0x10
    strh r2, [sp, #0x4]
    ldrh r2, [sp, #0x4]
    mov r1, r1, lsl #0x1f
    bic r2, r2, #0x4000
    orr r1, r2, r1, lsr #0x11
    strh r1, [sp, #0x4]
    ldrgeh r1, [sp, #0x4]
    bicge r1, r1, #0x8000
    strgeh r1, [sp, #0x4]
    ldr r1, _LIT3
    and r2, r6, #0x1
    mul sl, r2, r1
    mov r2, #0x14
    ldr r1, _LIT6
    mul r9, r7, r2
    add r3, r1, r0
    add r0, r1, sl
    add fp, r3, #0x30
    add r0, r0, #0x30
    str r0, [sp]
    add r0, r0, r9
    add r1, fp, r8
    bl func_ov002_0229cd70
    ldr r0, [sp]
    ldr r1, _LIT1
    add r0, r0, r9
    bl func_ov002_021b91c4
    add r0, fp, r8
    mov r1, #0x14
    bl func_ov002_0229cd5c
    ldr r0, _LIT7
    add r1, r5, r4, lsl #0x4
    mov r2, #0x1
    mvn r1, r2, lsl r1
    ldr r2, [r0, #0xd4]
    cmp r4, r6
    and r1, r2, r1
    str r1, [r0, #0xd4]
    beq .L_1320
    ldr r0, _LIT8
    add r1, r0, sl
    ldr r0, [r1, r9]
    bic r0, r0, #0x200000
    str r0, [r1, r9]
.L_1320:
    and r1, r4, #0xff
    and r0, r5, #0xff
    orr r0, r1, r0, lsl #0x8
    mov r0, r0, lsl #0x10
    and r2, r6, #0xff
    and r1, r7, #0xff
    orr r1, r2, r1, lsl #0x8
    mov r1, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021b2e04
    cmp r7, #0x5
    blt .L_137c
    ldr r0, [sp]
    add r0, r0, r9
    bl func_ov002_021b2240
    ldr r1, _LIT4
    ldr r0, _LIT9
    add r1, r1, sl
    mov r2, #0x0
    strh r2, [r9, r1]
    add r0, r0, sl
    str r2, [r9, r0]
.L_137c:
    ldr r0, _LIT0
    ldrh r2, [sp, #0x6]
    ldr r1, [r0, #0x818]
    ldrh r3, [sp, #0x4]
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    mov r0, #0x18
    bl func_ov002_0229ade0
    ldr r0, _LIT0
    add sp, sp, #0x8
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_13c8:
    mov r1, #0x0
    str r1, [r0, #0x80c]
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022ce950
_LIT1: .word data_ov002_022cf168
_LIT2: .word data_ov002_022cd73c
_LIT3: .word 0x00000868
_LIT4: .word data_ov002_022cf1a2
_LIT5: .word data_ov002_022cf1a4
_LIT6: .word data_ov002_022cf16c
_LIT7: .word data_ov002_022d016c
_LIT8: .word data_ov002_022cf1ac
_LIT9: .word data_ov002_022cf1a8
