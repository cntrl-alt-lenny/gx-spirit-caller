; func_ov002_022229bc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd664
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf09c
        .extern data_ov002_022d008c
        .extern func_0202e1e0
        .extern func_ov002_021ae434
        .extern func_ov002_021af8f0
        .extern func_ov002_021d46ac
        .extern func_ov002_0226afe0
        .global func_ov002_022229bc
        .arm
func_ov002_022229bc:
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x8
    ldr r3, _LIT0
    mov r1, r0
    ldr r0, [r3, #0x5a8]
    sub r0, r0, #0x7d
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_1d8
    b .L_164
    b .L_134
    b .L_90
    b .L_34
.L_34:
    ldrh r0, [r1, #0x2]
    ldr r2, _LIT1
    ldr r3, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and ip, r0, #0x1
    mul r2, ip, r2
    ldr r2, [r3, r2]
    cmp r2, #0x0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r2, _LIT3
    ldr r2, [r2, r0, lsl #0x2]
    cmp r2, #0x0
    bne .L_84
    ldrh r2, [r1]
    mov r1, #0x5
    mov r3, #0x0
    bl func_ov002_021af8f0
.L_84:
    add sp, sp, #0x8
    mov r0, #0x7f
    ldmia sp!, {r3, pc}
.L_90:
    ldrh r3, [r1, #0x2]
    ldr r0, _LIT1
    ldr r2, _LIT2
    mov r3, r3, lsl #0x1f
    mov lr, r3, lsr #0x1f
    and r3, lr, #0x1
    mul ip, r3, r0
    ldr r2, [r2, ip]
    cmp r2, #0x2
    addcc sp, sp, #0x8
    movcc r0, #0x0
    ldmccia sp!, {r3, pc}
    ldr r2, _LIT3
    ldr r2, [r2, lr, lsl #0x2]
    cmp r2, #0x1
    bne .L_108
    ldrh r2, [r1]
    ldr r1, _LIT4
    and r2, r2, #0x1
    mla r0, r2, r0, r1
    ldr r0, [r0, #0x260]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e1e0
    cmp r0, #0x0
    moveq r1, #0x1
    ldr r0, _LIT5
    movne r1, #0x0
    str r1, [r0, #0xd44]
    b .L_128
.L_108:
    ldr r0, _LIT6
    mov r3, #0x0
    str r3, [sp]
    mov ip, #0xf
    add r1, r0, #0x90
    add r2, r0, #0x91
    str ip, [sp, #0x4]
    bl func_ov002_021ae434
.L_128:
    add sp, sp, #0x8
    mov r0, #0x7e
    ldmia sp!, {r3, pc}
.L_134:
    ldr r0, _LIT5
    ldr r2, [r0, #0xd44]
    str r2, [r3, #0x5ac]
    ldrh r0, [r1, #0x2]
    ldrh r1, [r1]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226afe0
    add sp, sp, #0x8
    mov r0, #0x7d
    ldmia sp!, {r3, pc}
.L_164:
    ldr r0, [r3, #0x5ac]
    cmp r0, #0x0
    beq .L_1cc
    ldrh r0, [r1, #0x2]
    ldr r2, _LIT4
    mov r0, r0, lsl #0x1f
    movs r1, r0, lsr #0x1f
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
.L_1cc:
    add sp, sp, #0x8
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_1d8:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf09c
_LIT3: .word data_ov002_022cd664
_LIT4: .word data_ov002_022cf08c
_LIT5: .word data_ov002_022d008c
_LIT6: .word 0x00000126
