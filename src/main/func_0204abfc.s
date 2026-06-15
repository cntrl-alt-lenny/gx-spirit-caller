; func_0204abfc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dc84
        .extern func_020498dc
        .extern func_020498f0
        .extern func_0204b034
        .extern func_0204b0d0
        .extern func_0204bd8c
        .extern func_0204bf44
        .extern func_0204c40c
        .extern func_0204ce3c
        .extern func_0204cf7c
        .extern func_0204d438
        .extern func_0204ead0
        .extern func_020930b0
        .extern func_020b3808
        .global func_0204abfc
        .arm
func_0204abfc:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x8
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    addeq sp, sp, #0x8
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldrb r0, [r0]
    cmp r0, #0x0
    addeq sp, sp, #0x8
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x2
    addeq sp, sp, #0x8
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x3
    addeq sp, sp, #0x8
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0x13
    bne .L_974
    mov r0, #0x0
    bl func_0204b0d0
    ldr r1, _LIT0
    ldr r5, [r1]
    ldr r1, [r5, #0x8]
    cmp r1, r0
    bne .L_848
    ldr r1, [r5, #0xc]
    cmp r1, r0
    bne .L_7d4
    bl func_020498f0
    mov r4, r0
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    strb r0, [r4, #0x16]
    bl func_020498f0
    mov r4, r0
    bl func_020498f0
    ldrb r1, [r0, #0xd]
    mov r0, #0x0
    sub r1, r1, #0x1
    strb r1, [r4, #0x1a4]
    bl func_0204c40c
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_7d4:
    bl func_020930b0
    str r0, [r5, #0x18]
    str r1, [r5, #0x1c]
    mov r0, #0x0
    str r0, [r5, #0x8]
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x0
    bne .L_828
    mov r0, #0x3
    bl func_020498dc
    bl func_020498f0
    mov r1, #0x2
    str r1, [r0, #0xe8]
    bl func_020498f0
    mov r4, r0
    bl func_020930b0
    str r0, [r4, #0xec]
    add sp, sp, #0x8
    str r1, [r4, #0xf0]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_828:
    mov r0, #0x4
    bl func_020498dc
    mov r1, #0x0
    mov r2, r1
    mov r0, #0x1
    bl func_0204cf7c
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_848:
    ldrb r4, [r5, #0x2]
    bl func_020930b0
    ldr r3, [r5, #0x18]
    ldr r2, [r5, #0x1c]
    subs r3, r0, r3
    sbc r0, r1, r2
    mov r1, r0, lsl #0x6
    ldr r2, _LIT1
    orr r1, r1, r3, lsr #0x1a
    mov r0, r3, lsl #0x6
    mov r3, #0x0
    bl func_020b3808
    ldr r2, _LIT2
    mul r2, r4, r2
    cmp r1, r2, asr #0x1f
    cmpeq r0, r2
    addcc sp, sp, #0x8
    ldmccia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    cmp r4, #0x5
    bls .L_8b4
    mov r0, #0x1
    bl func_0204b034
    bl func_0204bd8c
    mov r0, #0x1
    bl func_0204bf44
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_8b4:
    mov r7, #0x1
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    cmp r0, #0x1
    blt .L_958
    ldr r8, _LIT0
    mov r5, #0x0
    mov r4, #0x11
    mov r6, r7
.L_8d8:
    bl func_020498f0
    add r0, r0, r7
    ldrb r0, [r0, #0x2d0]
    ldr r1, [r8]
    mov r0, r6, lsl r0
    ldr r1, [r1, #0x8]
    ands r0, r1, r0
    bne .L_944
    bl func_020498f0
    mov sl, r0
    bl func_020498f0
    mov r9, r0
    bl func_020498f0
    str r5, [sp]
    str r5, [sp, #0x4]
    add r0, r0, r7, lsl #0x1
    add r1, sl, r7, lsl #0x2
    add r2, r9, r7, lsl #0x2
    ldrh r3, [r0, #0xa4]
    ldr r1, [r1, #0xf4]
    ldr r2, [r2, #0x24]
    mov r0, r4
    bl func_0204ead0
    bl func_0204d438
    cmp r0, #0x0
    addne sp, sp, #0x8
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_944:
    add r7, r7, #0x1
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    cmp r7, r0
    ble .L_8d8
.L_958:
    ldr r0, _LIT0
    add sp, sp, #0x8
    ldr r1, [r0]
    ldrb r0, [r1, #0x2]
    add r0, r0, #0x1
    strb r0, [r1, #0x2]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_974:
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0x4
    beq .L_998
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0x3
    addne sp, sp, #0x8
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_998:
    ldr r0, _LIT0
    ldr r4, [r0]
    bl func_020498f0
    ldrb r1, [r4, #0x1]
    ldrb r2, [r0, #0xd]
    sub r0, r1, #0x1
    cmp r2, r0
    addlt sp, sp, #0x8
    ldmltia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldrb r0, [r4, #0x2]
    cmp r0, #0x0
    bne .L_a0c
    ldr r0, _LIT0
    ldr r4, [r0]
    bl func_020930b0
    ldr r3, [r4, #0x10]
    ldr r2, [r4, #0x14]
    subs r3, r0, r3
    sbc r0, r1, r2
    mov r1, r0, lsl #0x6
    ldr r2, _LIT1
    orr r1, r1, r3, lsr #0x1a
    mov r0, r3, lsl #0x6
    mov r3, #0x0
    bl func_020b3808
    ldr r2, [r4, #0x4]
    cmp r1, #0x0
    cmpeq r0, r2
    bcs .L_a64
.L_a0c:
    ldrb r0, [r4, #0x2]
    cmp r0, #0x0
    addeq sp, sp, #0x8
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r0, _LIT0
    ldr r4, [r0]
    bl func_020930b0
    ldr r3, [r4, #0x18]
    ldr r2, [r4, #0x1c]
    subs r3, r0, r3
    sbc r0, r1, r2
    mov r1, r0, lsl #0x6
    ldr r2, _LIT1
    orr r1, r1, r3, lsr #0x1a
    mov r0, r3, lsl #0x6
    mov r3, #0x0
    bl func_020b3808
    ldr r2, [r4, #0x4]
    cmp r1, #0x0
    cmpeq r0, r2, lsr #0x2
    addcc sp, sp, #0x8
    ldmccia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_a64:
    bl func_020498f0
    ldr r0, [r0, #0x204]
    cmp r0, #0x0
    beq .L_a90
    bl func_020498f0
    ldr r0, [r0, #0x204]
    bl func_0204ce3c
    bl func_0204d438
    cmp r0, #0x0
    addne sp, sp, #0x8
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_a90:
    mov r0, #0x13
    bl func_020498dc
    mov r4, #0x1
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    cmp r0, #0x1
    blt .L_b14
    mov r6, #0x0
    mov r5, #0x11
.L_ab4:
    bl func_020498f0
    mov r8, r0
    bl func_020498f0
    mov r7, r0
    bl func_020498f0
    str r6, [sp]
    str r6, [sp, #0x4]
    add r0, r0, r4, lsl #0x1
    add r1, r8, r4, lsl #0x2
    add r2, r7, r4, lsl #0x2
    ldrh r3, [r0, #0xa4]
    ldr r1, [r1, #0xf4]
    ldr r2, [r2, #0x24]
    mov r0, r5
    bl func_0204ead0
    bl func_0204d438
    cmp r0, #0x0
    addne sp, sp, #0x8
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    add r4, r4, #0x1
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    cmp r4, r0
    ble .L_ab4
.L_b14:
    ldr r0, _LIT0
    ldr r4, [r0]
    bl func_020930b0
    str r0, [r4, #0x18]
    str r1, [r4, #0x1c]
    mov r0, #0x1
    strb r0, [r4, #0x2]
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_0219dc84
_LIT1: .word 0x000082ea
_LIT2: .word 0x00001770
