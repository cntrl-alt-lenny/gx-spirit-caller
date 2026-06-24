; func_ov002_022133fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a2
        .extern data_ov002_022cf1a4
        .extern func_ov002_021d5d48
        .extern func_ov002_021d6808
        .extern func_ov002_021e2b3c
        .extern func_ov002_021e2c5c
        .extern func_ov002_0223df38
        .global func_ov002_022133fc
        .arm
func_ov002_022133fc:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0xc
    mov r4, r0
    ldrh r1, [r4, #0x4]
    mov r2, r1, lsl #0x1d
    movs r2, r2, lsr #0x1f
    beq .L_30
    orr r0, r1, #0x8
    strh r0, [r4, #0x4]
    add sp, sp, #0xc
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_30:
    ldr r1, _LIT0
    ldr r2, [r1, #0x5a8]
    cmp r2, #0x7e
    beq .L_22c
    cmp r2, #0x7f
    beq .L_120
    cmp r2, #0x80
    mov r0, #0x0
    bne .L_23c
    str r0, [r1, #0x5ac]
    bl func_ov002_021e2b3c
    ldrh r0, [r4, #0xc]
    cmp r0, #0x2
    beq .L_114
    ldr r0, _LIT0
    add r2, sp, #0x8
    ldr r1, [r0, #0x5ac]
    mov r0, r4
    bl func_ov002_0223df38
    cmp r0, #0x0
    beq .L_104
    ldr r3, [sp, #0x8]
    ldr r0, _LIT1
    and r1, r3, #0xff
    and r2, r1, #0x1
    mul r0, r2, r0
    mov r2, r3, lsl #0x10
    mov r2, r2, lsr #0x10
    mov r2, r2, asr #0x8
    ldr r5, _LIT2
    and r2, r2, #0xff
    mov r3, #0x14
    smulbb r6, r2, r3
    add r3, r5, r0
    add r3, r3, r6
    ldr r3, [r3, #0x30]
    mov r3, r3, lsl #0x13
    movs r3, r3, lsr #0x13
    beq .L_104
    ldr r3, _LIT3
    add r0, r3, r0
    ldrh r0, [r6, r0]
    cmp r0, #0x0
    bne .L_104
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r1
    beq .L_104
    mov r3, #0x0
    mov r0, r4
    str r3, [sp]
    bl func_ov002_021d6808
.L_104:
    ldr r0, _LIT0
    ldr r1, [r0, #0x5ac]
    add r1, r1, #0x1
    str r1, [r0, #0x5ac]
.L_114:
    add sp, sp, #0xc
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_120:
    ldrh r2, [r4, #0xc]
    cmp r2, #0x1
    beq .L_214
    ldr r1, [r1, #0x5ac]
    add r2, sp, #0x4
    bl func_ov002_0223df38
    cmp r0, #0x0
    beq .L_214
    ldrh r1, [r4, #0x2]
    ldr r6, [sp, #0x4]
    ldrh r8, [r4, #0x4]
    mov r0, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r2, r1, lsl #0x1a
    ldr ip, _LIT2
    ldr r7, _LIT1
    and r1, r0, #0x1
    mla r3, r1, r7, ip
    mov lr, r2, lsr #0x1b
    mov r1, #0x14
    mov r2, r6, lsl #0x10
    mov r2, r2, lsr #0x10
    mov r5, r2, asr #0x8
    mul r9, lr, r1
    add r3, r3, #0x30
    ldr r9, [r3, r9]
    mov r3, r8, lsl #0x11
    mov r8, r9, lsl #0x2
    mov r8, r8, lsr #0x18
    mov r9, r9, lsl #0x12
    mov r8, r8, lsl #0x1
    add r8, r8, r9, lsr #0x1f
    cmp r8, r3, lsr #0x17
    and r6, r6, #0xff
    and r8, r5, #0xff
    bne .L_214
    and r5, r6, #0x1
    mul r3, r5, r7
    mul r1, r8, r1
    add r5, ip, r3
    add r5, r5, r1
    ldr r5, [r5, #0x30]
    mov r5, r5, lsl #0x13
    movs r5, r5, lsr #0x13
    beq .L_214
    ldr r5, _LIT4
    add r3, r5, r3
    ldrh r1, [r1, r3]
    cmp r1, #0x0
    beq .L_214
    cmp r0, r6
    bne .L_214
    and r3, r0, #0xff
    and r1, lr, #0xff
    orr r1, r3, r1, lsl #0x8
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021d5d48
    add sp, sp, #0xc
    mov r0, #0x7e
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_214:
    ldrh r1, [r4, #0x4]
    add sp, sp, #0xc
    mov r0, #0x7e
    orr r1, r1, #0x8
    strh r1, [r4, #0x4]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_22c:
    bl func_ov002_021e2c5c
    add sp, sp, #0xc
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_23c:
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf16c
_LIT3: .word data_ov002_022cf1a2
_LIT4: .word data_ov002_022cf1a4
