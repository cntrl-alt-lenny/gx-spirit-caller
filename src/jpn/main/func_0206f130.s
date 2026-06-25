; func_0206f130 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ee34
        .extern func_0206f3e8
        .extern func_020702b4
        .extern func_02070348
        .extern func_02070844
        .extern func_02070950
        .extern func_02074374
        .extern func_02092fc8
        .extern func_02094688
        .global func_0206f130
        .arm
func_0206f130:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x4c
    mov r9, r2
    mov r2, r9, asr #0x8
    mov sl, r1
    orr r1, r2, r9, lsl #0x8
    strh r1, [sp, #0x10]
    cmp sl, #0x20
    mov r5, #0x0
    movne r1, #0x1
    strneh r1, [sp, #0x12]
    ldreq r1, _LIT0
    strh r5, [sp, #0x16]
    streqh r1, [sp, #0x12]
    mov r1, #0x100
    strh r1, [sp, #0x14]
    add r1, sp, #0x1c
    strh r5, [sp, #0x18]
    strh r5, [sp, #0x1a]
    str r5, [sp, #0xc]
    ldrb r6, [r0], #0x1
    str r3, [sp]
    ldr r8, [sp, #0x70]
    add r2, r1, #0x1
    cmp r6, #0x0
    beq .L_c0
    add r4, sp, #0x10
.L_6c:
    cmp r6, #0x2e
    beq .L_a0
    sub r3, r2, r4
    cmp r3, #0x3c
    addge sp, sp, #0x4c
    mvnge r0, #0x0
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bxge lr
    strb r6, [r2], #0x1
    ldr r3, [sp, #0xc]
    add r3, r3, #0x1
    str r3, [sp, #0xc]
    b .L_b4
.L_a0:
    ldr r3, [sp, #0xc]
    strb r3, [r1]
    mov r1, r2
    str r5, [sp, #0xc]
    add r2, r2, #0x1
.L_b4:
    ldrb r6, [r0], #0x1
    cmp r6, #0x0
    bne .L_6c
.L_c0:
    ldr r0, [sp, #0xc]
    mov r3, #0x0
    strb r0, [r1]
    strb r3, [r2]
    mov r0, sl, lsr #0x8
    strb r0, [r2, #0x1]
    strb sl, [r2, #0x2]
    strb r3, [r2, #0x3]
    mov r3, #0x1
    add r0, sp, #0x10
    add r1, r2, #0x5
    sub r1, r1, r0
    strb r3, [r2, #0x4]
    bl func_02070348
    mov r6, #0x0
    bl func_02092fc8
    mov r5, r0, lsr #0x10
    mov r0, #0x2
    str r0, [sp, #0x8]
    mov r0, #0x1
    orr r5, r5, r1, lsl #0x10
    str r0, [sp, #0x4]
    mvn fp, #0x0
    b .L_26c
.L_120:
    bl func_020702b4
    cmp r0, #0x0
    bne .L_134
    bl func_02074374
    b .L_26c
.L_134:
    add r0, sp, #0xc
    bl func_02070950
    ldr r1, [sp, #0xc]
    cmp r1, #0xc
    bls .L_264
    ldrh r3, [r0]
    mov r2, r3, asr #0x8
    orr r2, r2, r3, lsl #0x8
    mov r2, r2, lsl #0x10
    cmp r9, r2, lsr #0x10
    bne .L_264
    ldrb r2, [r0, #0x3]
    and r2, r2, #0xf
    cmp r2, #0x3
    moveq r6, fp
    beq .L_264
    cmp r2, #0x0
    bne .L_264
    ldrb r2, [r0, #0x4]
    add r4, r0, r1
    ldrb r1, [r0, #0x5]
    add r0, r0, #0xc
    orr r1, r1, r2, lsl #0x8
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x10
    sub r7, r1, #0x1
    beq .L_1b4
.L_1a0:
    bl func_0206f3e8
    cmp r7, #0x0
    add r0, r0, #0x4
    sub r7, r7, #0x1
    bne .L_1a0
.L_1b4:
    cmp r0, r4
    bcs .L_264
.L_1bc:
    bl func_0206f3e8
    ldrb r7, [r0, #0x8]
    ldrb r1, [r0, #0x9]
    ldrb r3, [r0]
    ldrb r2, [r0, #0x1]
    orr r1, r1, r7, lsl #0x8
    mov r1, r1, lsl #0x10
    orr r3, r2, r3, lsl #0x8
    mov r2, r1, lsr #0x10
    mov r1, r3, lsl #0x10
    cmp sl, r1, lsr #0x10
    bne .L_254
    cmp sl, #0xc
    beq .L_234
    add r1, r0, #0x6
    add r3, r1, r2
    add r4, r0, #0x8
    ldrb r1, [r1, r2]
    ldrb r0, [r3, #0x1]
    add r3, r4, r2
    ldrb r2, [r4, r2]
    orr r0, r0, r1, lsl #0x8
    ldrb r1, [r3, #0x1]
    mov r0, r0, lsl #0x10
    mov r3, r0, lsr #0x10
    orr r0, r1, r2, lsl #0x8
    mov r1, r3, lsl #0x10
    mov r0, r0, lsl #0x10
    orr r6, r1, r0, lsr #0x10
    b .L_264
.L_234:
    cmp r2, r8
    ldrhi r6, [sp, #0x8]
    bhi .L_264
    ldr r1, [sp]
    add r0, r0, #0xa
    bl func_02094688
    ldr r6, [sp, #0x4]
    b .L_264
.L_254:
    add r1, r2, #0xa
    add r0, r0, r1
    cmp r0, r4
    bcc .L_1bc
.L_264:
    ldr r0, [sp, #0xc]
    bl func_02070844
.L_26c:
    ldr r0, _LIT1
    ldr r0, [r0]
    blx r0
    cmp r0, #0x0
    beq .L_2a0
    cmp r6, #0x0
    bne .L_2a0
    bl func_02092fc8
    mov r0, r0, lsr #0x10
    orr r0, r0, r1, lsl #0x10
    sub r0, r0, r5
    cmp r0, #0xf
    blt .L_120
.L_2a0:
    mov r0, r6
    add sp, sp, #0x4c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
_LIT0: .word 0x00001001
_LIT1: .word data_0219ee34
