; func_ov002_022287a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd664
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf09c
        .extern data_ov002_022d008c
        .extern func_ov002_021ae434
        .extern func_ov002_021af8f0
        .extern func_ov002_021d46ac
        .extern func_ov002_02212a68
        .extern func_ov002_0226afe0
        .global func_ov002_022287a0
        .arm
func_ov002_022287a0:
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x8
    mov r2, r0
    ldrh r3, [r2, #0xc]
    cmp r3, #0x1
    beq .L_24
    cmp r3, #0x2
    beq .L_30
    b .L_1e4
.L_24:
    bl func_ov002_02212a68
    add sp, sp, #0x8
    ldmia sp!, {r3, pc}
.L_30:
    ldr r1, _LIT0
    ldr r0, [r1, #0x5a8]
    sub r0, r0, #0x7d
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_1e4
    b .L_16c
    b .L_138
    b .L_b8
    b .L_58
.L_58:
    ldrh r0, [r2, #0x2]
    ldr r1, _LIT1
    ldr r3, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb ip, r0, #0x1
    and ip, ip, #0x1
    mul r1, ip, r1
    ldr r1, [r3, r1]
    cmp r1, #0x0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r1, _LIT3
    ldr r1, [r1, r0, lsl #0x2]
    cmp r1, #0x0
    bne .L_ac
    ldrh r2, [r2]
    mov r1, #0x5
    mov r3, #0x0
    bl func_ov002_021af8f0
.L_ac:
    add sp, sp, #0x8
    mov r0, #0x7f
    ldmia sp!, {r3, pc}
.L_b8:
    ldrh r2, [r2, #0x2]
    ldr r0, _LIT1
    ldr r1, _LIT2
    mov r2, r2, lsl #0x1f
    mov r3, r2, lsr #0x1f
    rsb r2, r3, #0x1
    and r2, r2, #0x1
    mul r0, r2, r0
    ldr r0, [r1, r0]
    cmp r0, #0x2
    addcc sp, sp, #0x8
    movcc r0, #0x0
    ldmccia sp!, {r3, pc}
    ldr r0, _LIT3
    ldr r0, [r0, r3, lsl #0x2]
    cmp r0, #0x1
    bne .L_10c
    ldr r0, _LIT4
    mov r1, #0x1
    str r1, [r0, #0xd44]
    b .L_12c
.L_10c:
    ldr r0, _LIT5
    mov r3, #0x0
    str r3, [sp]
    mov ip, #0xf
    add r1, r0, #0x90
    add r2, r0, #0x91
    str ip, [sp, #0x4]
    bl func_ov002_021ae434
.L_12c:
    add sp, sp, #0x8
    mov r0, #0x7e
    ldmia sp!, {r3, pc}
.L_138:
    ldr r0, _LIT4
    ldr r3, [r0, #0xd44]
    str r3, [r1, #0x5ac]
    ldrh r0, [r2, #0x2]
    ldrh r1, [r2]
    add r2, r3, #0x3
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226afe0
    add sp, sp, #0x8
    mov r0, #0x7d
    ldmia sp!, {r3, pc}
.L_16c:
    ldr r0, [r1, #0x5ac]
    cmp r0, #0x0
    beq .L_1d8
    ldrh r0, [r2, #0x2]
    ldr r2, _LIT6
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsbs r1, r0, #0x1
    ldr r0, _LIT1
    and r1, r1, #0x1
    mla r0, r1, r0, r2
    ldr r1, [r0, #0x260]
    movne r3, #0x8000
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    moveq r3, #0x0
    orr r2, r3, #0x57
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r1, r0, r1, lsr #0x1f
    mov r0, r2, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r2, r1, lsr #0x10
    mov r0, r0, lsr #0x10
    mov r1, #0xd
    mov r3, #0x1
    bl func_ov002_021d46ac
.L_1d8:
    add sp, sp, #0x8
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_1e4:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf09c
_LIT3: .word data_ov002_022cd664
_LIT4: .word data_ov002_022d008c
_LIT5: .word 0x00000126
_LIT6: .word data_ov002_022cf08c
