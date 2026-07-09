; func_ov002_0226755c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_ov002_021b9dec
        .extern func_ov002_021e2fc4
        .global func_ov002_0226755c
        .arm
func_ov002_0226755c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x38
    mov sl, r0
    ldr r0, _LIT0
    ldr r8, [r0, #0xd28]
    cmp r8, #0x5
    bcs .L_294
    ldr r0, _LIT1
    ldr r1, _LIT2
    and r2, sl, #0x1
    mla r9, r2, r0, r1
    ldr r0, _LIT3
    add r6, r0, #0x49
    add r0, r0, #0x39
    str r0, [sp, #0x4]
    ldr r0, _LIT4
    add r0, r0, #0x1
    str r0, [sp, #0x20]
    ldr r0, _LIT4
    add r0, r0, #0x7
    str r0, [sp, #0x34]
    ldr r0, _LIT4
    add r0, r0, #0x6
    str r0, [sp, #0x30]
    ldr r0, _LIT4
    add r0, r0, #0x1
    str r0, [sp, #0x24]
    ldr r0, _LIT4
    sub r0, r0, #0x278
    str r0, [sp, #0x1c]
    ldr r0, _LIT3
    add r0, r0, #0x3e
    str r0, [sp, #0x18]
    ldr r0, _LIT3
    add r0, r0, #0x3b
    str r0, [sp, #0x14]
    ldr r0, _LIT4
    sub r0, r0, #0x2c4
    str r0, [sp, #0x8]
    ldr r0, _LIT3
    sub r0, r0, #0x4
    str r0, [sp]
    ldr r0, _LIT3
    sub fp, r0, #0x8
    ldr r0, _LIT4
    add r0, r0, #0x6
    str r0, [sp, #0x2c]
    ldr r0, _LIT4
    add r0, r0, #0x7
    str r0, [sp, #0x28]
    ldr r0, _LIT3
    add r0, r0, #0x3b
    str r0, [sp, #0x10]
    ldr r0, _LIT3
    add r0, r0, #0x3e
    str r0, [sp, #0xc]
    ldr r0, _LIT3
    sub r4, r0, #0x8
    sub r5, r0, #0x4
    ldr r0, _LIT4
    sub r7, r0, #0x2b4
.L_f4:
    mov r0, sl
    mov r1, r8
    bl func_ov002_021b9dec
    cmp r0, r7
    bgt .L_190
    cmp r0, r6
    bge .L_1f8
    ldr r1, _LIT3
    cmp r0, r1
    bgt .L_144
    bge .L_1f8
    cmp r0, r5
    bgt .L_278
    cmp r0, r4
    blt .L_278
    cmp r0, fp
    ldrne r1, [sp]
    cmpne r0, r1
    beq .L_1f8
    b .L_278
.L_144:
    ldr r1, [sp, #0x4]
    cmp r0, r1
    bgt .L_160
    ldr r1, [sp, #0x8]
    cmp r0, r1
    beq .L_1f8
    b .L_278
.L_160:
    ldr r1, [sp, #0xc]
    cmp r0, r1
    bgt .L_278
    ldr r1, [sp, #0x10]
    cmp r0, r1
    blt .L_278
    ldr r1, [sp, #0x14]
    cmp r0, r1
    ldrne r1, [sp, #0x18]
    cmpne r0, r1
    beq .L_1f8
    b .L_278
.L_190:
    ldr r1, _LIT4
    cmp r0, r1
    bgt .L_1b0
    bge .L_1f8
    ldr r1, [sp, #0x1c]
    cmp r0, r1
    beq .L_1f8
    b .L_278
.L_1b0:
    ldr r1, [sp, #0x20]
    cmp r0, r1
    bgt .L_1cc
    ldr r1, [sp, #0x24]
    cmp r0, r1
    beq .L_1f8
    b .L_278
.L_1cc:
    ldr r1, [sp, #0x28]
    cmp r0, r1
    bgt .L_278
    ldr r1, [sp, #0x2c]
    cmp r0, r1
    blt .L_278
    ldr r1, [sp, #0x30]
    cmp r0, r1
    ldrne r1, [sp, #0x34]
    cmpne r0, r1
    bne .L_278
.L_1f8:
    mov r1, #0x14
    mul r2, r8, r1
    add r1, r9, r2
    ldrh r1, [r1, #0x38]
    cmp r1, #0x0
    beq .L_278
    add r1, r9, #0x30
    ldr r2, [r1, r2]
    mov r3, sl, lsl #0x1f
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    and r4, r3, #-2147483648
    mov r3, r8, lsl #0x10
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    mov r1, r1, lsl #0x10
    orr r4, r4, #0x4200000
    and r2, r3, #0x1f0000
    mov r0, r0, lsl #0x10
    orr r2, r4, r2
    orr r0, r2, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, #0x0
    bl func_ov002_021e2fc4
    ldr r1, _LIT0
    add sp, sp, #0x38
    ldr r2, [r1, #0xd28]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd28]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_278:
    ldr r0, _LIT0
    ldr r0, [r0, #0xd28]
    add r8, r0, #0x1
    ldr r0, _LIT0
    cmp r8, #0x5
    str r8, [r0, #0xd28]
    bcc .L_f4
.L_294:
    mov r0, #0x1
    add sp, sp, #0x38
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf08c
_LIT3: .word 0x000017d9
_LIT4: .word 0x00001ad6
