; func_020085c8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .extern Task_PostLocked
        .extern data_020c3f48
        .extern data_02104e5c
        .extern data_02104e6c
        .extern func_02007214
        .extern func_02007224
        .extern func_0200852c
        .extern func_0200857c
        .extern func_02008bf8
        .extern func_02020fa4
        .extern func_02090780
        .extern func_020907d8
        .extern func_020943b0
        .extern func_020946dc
        .extern func_0209bee0
        .extern func_0209bef0
        .extern func_0209bfd8
        .extern func_0209c6e8
        .global func_020085c8
        .arm
func_020085c8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x30
    mov r0, #0x0
    str r0, [sp, #0x1c]
    bl func_0200857c
    cmp r0, #0x0
    beq .L_23c
    bl func_0209bfd8
    cmp r0, #0x0
    beq .L_23c
    bl func_02090780
    mvn r1, #0x2
    str r0, [sp, #0x18]
    cmp r0, r1
    beq .L_23c
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bl func_0209bef0
    mov r7, #0x0
    mov r6, r7
    mov fp, r7
    ldr r5, _LIT0
    ldr r4, _LIT1
    b .L_1f8
.L_60:
    ldr r0, [r5, #0xc]
    add r1, sp, #0x20
    sub r0, r0, r7
    add r3, r0, #0x8
    str r6, [sp]
    str r6, [sp, #0x4]
    mov r0, #0x6
    str r0, [sp, #0x8]
    mov r0, #0x1
    str r0, [sp, #0xc]
    mov r2, r3, lsr #0x1f
    rsb r0, r2, r3, lsl #0x1d
    add r0, r2, r0, ror #0x1d
    str r0, [sp, #0x14]
    mov r0, r0, lsl #0xe
    add sl, r0, #0x20000
    str r6, [sp, #0x10]
    mov r0, sl
    mov r2, #0x10
    mov r3, r6
    bl func_0209c6e8
    cmp r0, #0x0
    moveq r1, #0x1
    ldr r0, [r5, #0x4]
    movne r1, #0x0
    orrs r0, r0, r1
    str r0, [r5, #0x4]
    ldreq r1, [sp, #0x20]
    ldreq r0, _LIT2
    cmpeq r1, r0
    bne .L_1f4
    ldr r0, [sp, #0x28]
    mov r8, #0x1
    cmp r0, r4
    movhi r8, #0x0
    bhi .L_1bc
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    str fp, [sp]
    mov r9, r0
    str fp, [sp, #0x4]
    mov r1, #0x6
    str r1, [sp, #0x8]
    mov r1, r8
    str r1, [sp, #0xc]
    str fp, [sp, #0x10]
    ldr r2, [sp, #0x28]
    add r0, sl, #0x10
    mov r1, r9
    mov r3, fp
    bl func_0209c6e8
    cmp r0, #0x0
    moveq r2, r8
    ldr r0, [r5, #0x4]
    movne r2, #0x0
    ldr r1, [sp, #0x28]
    orr r0, r0, r2
    str r0, [r5, #0x4]
    cmp r1, r4
    bne .L_180
    mov r0, r9
    bl func_02007224
    ldr r1, [sp, #0x2c]
    cmp r1, r0
    movne r8, #0x0
    bne .L_1b4
    ldr r1, _LIT3
    ldr r2, [sp, #0x28]
    mov r0, r9
    bl func_020943b0
    b .L_1b4
.L_180:
    ldr r0, [r9]
    cmp r4, r0, lsr #0x8
    bne .L_1b0
    mov r0, r9
    bl func_02007224
    ldr r1, [sp, #0x2c]
    cmp r1, r0
    bne .L_1b0
    ldr r1, _LIT3
    mov r0, r9
    bl func_020946dc
    b .L_1b4
.L_1b0:
    mov r8, #0x0
.L_1b4:
    mov r0, r9
    bl Task_InvokeLocked
.L_1bc:
    ldr r0, [r5, #0x4]
    cmp r0, #0x0
    bne .L_1f4
    cmp r8, #0x0
    beq .L_1f4
    ldr r2, _LIT0
    ldr r0, [sp, #0x14]
    ldr r3, [sp, #0x24]
    ldr r1, _LIT4
    str r0, [r2, #0xc]
    mov r0, #0x1
    str r3, [r1, #0x8]
    str r0, [sp, #0x1c]
    b .L_20c
.L_1f4:
    add r7, r7, #0x1
.L_1f8:
    cmp r7, #0x8
    bge .L_20c
    ldr r0, [r5, #0x4]
    cmp r0, #0x0
    beq .L_60
.L_20c:
    ldr r0, [sp, #0x18]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bl func_0209bee0
    ldr r0, [sp, #0x18]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bl func_020907d8
    ldr r0, [sp, #0x1c]
    cmp r0, #0x0
    beq .L_23c
    bl func_02008bf8
.L_23c:
    bl func_02007214
    cmp r0, #0x0
    beq .L_24c
    bl func_02020fa4
.L_24c:
    ldr r0, [sp, #0x1c]
    cmp r0, #0x0
    bne .L_274
    ldr r0, _LIT0
    mvn r1, #0x0
    str r1, [r0, #0xc]
    bl func_0200852c
    add sp, sp, #0x30
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_274:
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    add sp, sp, #0x30
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_02104e5c
_LIT1: .word 0x00001b0c
_LIT2: .word 0x59474454
_LIT3: .word data_02104e6c
_LIT4: .word data_020c3f48
