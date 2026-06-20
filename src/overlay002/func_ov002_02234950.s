; func_ov002_02234950 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd73c
        .extern data_ov002_022ce288
        .extern data_ov002_022d016c
        .extern data_ov002_022d0250
        .extern func_0202b100
        .extern func_ov002_021ae400
        .extern func_ov002_021b0c04
        .extern func_ov002_021b99b4
        .extern func_ov002_021bd030
        .extern func_ov002_021d5d58
        .extern func_ov002_021d8414
        .extern func_ov002_0223def4
        .extern func_ov002_0225764c
        .extern func_ov002_022577dc
        .extern func_ov002_0225935c
        .extern func_ov002_022593f4
        .extern func_ov002_0229ce5c
        .global func_ov002_02234950
        .arm
func_ov002_02234950:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x10c
    mov r1, #0x0
    mov r8, r0
    bl func_ov002_0223def4
    ldr r1, _LIT0
    mov r5, r0
    ldr r0, [r1, #0x5a8]
    cmp r0, #0x7e
    beq .L_fc
    cmp r0, #0x7f
    beq .L_9c
    cmp r0, #0x80
    bne .L_1d8
    ldrh r0, [r8, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bd030
    cmp r0, #0x0
    addlt sp, sp, #0x10c
    movlt r0, #0x0
    ldmltia sp!, {r3, r4, r5, r6, r7, r8, pc}
    ldrh r0, [r8, #0x2]
    mov r1, r5
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021b99b4
    cmp r0, #0x0
    addlt sp, sp, #0x10c
    movlt r0, #0x0
    ldmltia sp!, {r3, r4, r5, r6, r7, r8, pc}
    mov r0, r8
    strh r5, [r8, #0xa]
    bl func_ov002_022577dc
    cmp r0, #0x0
    movne r0, #0x7f
    add sp, sp, #0x10c
    moveq r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_9c:
    ldr r0, _LIT1
    mov r1, r5, lsl #0x2
    ldrh r0, [r0, r1]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b100
    mov r2, r0
    add r0, sp, #0xc
    mov r1, #0x45
    bl func_ov002_0229ce5c
    ldrh r0, [r8, #0x2]
    add r1, sp, #0xc
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    ldrh r0, [r8, #0x2]
    ldr r1, _LIT2
    ldr r2, _LIT3
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0225935c
    add sp, sp, #0x10c
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_fc:
    bl func_ov002_022593f4
    cmp r0, #0x0
    beq .L_1cc
    ldrh r0, [r8, #0x2]
    ldr r1, _LIT4
    mov r0, r0, lsl #0x1f
    ldr r3, [r1, #0xd74]
    ldr r2, [r1, #0xd78]
    mov r0, r0, lsr #0x1f
    add r7, r3, r2
    ldr r6, [r1, #0xd70]
    bl func_ov002_021bd030
    ldrh r2, [r8, #0x2]
    mov r4, r0
    mov r1, #0x1
    str r4, [sp]
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    str r1, [sp, #0x4]
    mov r1, #0x0
    mov r2, r5
    mov r3, r0
    str r1, [sp, #0x8]
    mov r1, #0xe
    bl func_ov002_021d8414
    ldrh r0, [r8, #0x2]
    and r1, r4, #0xff
    and r2, r6, #0xff
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r3, r0, #0xff
    orr r3, r3, r1, lsl #0x8
    and r1, r7, #0xff
    orr r2, r2, r1, lsl #0x8
    mov r1, r3, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r3, #0xb
    bl func_ov002_021d5d58
    ldrh r1, [r8, #0x2]
    ldr r0, _LIT5
    ldr r0, [r0, #0x4]
    mov r1, r1, lsl #0x1f
    cmp r0, r1, lsr #0x1f
    bne .L_1c0
    mov r0, #0x30
    mov r1, #0x1
    bl func_ov002_021b0c04
.L_1c0:
    add sp, sp, #0x10c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_1cc:
    add sp, sp, #0x10c
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_1d8:
    mov r0, #0x0
    add sp, sp, #0x10c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022d0250
_LIT2: .word 0x000010d3
_LIT3: .word func_ov002_0225764c
_LIT4: .word data_ov002_022d016c
_LIT5: .word data_ov002_022cd73c
