; func_0206f1a4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ef14
        .extern func_0206f45c
        .extern func_0207039c
        .extern func_02070430
        .extern func_0207092c
        .extern func_02070a38
        .extern func_0207445c
        .extern func_020930b0
        .extern func_02094688
        .global func_0206f1a4
        .arm
func_0206f1a4:
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
    beq .L_1a4
    add r4, sp, #0x10
.L_150:
    cmp r6, #0x2e
    beq .L_184
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
    b .L_198
.L_184:
    ldr r3, [sp, #0xc]
    strb r3, [r1]
    mov r1, r2
    str r5, [sp, #0xc]
    add r2, r2, #0x1
.L_198:
    ldrb r6, [r0], #0x1
    cmp r6, #0x0
    bne .L_150
.L_1a4:
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
    bl func_02070430
    mov r6, #0x0
    bl func_020930b0
    mov r5, r0, lsr #0x10
    mov r0, #0x2
    str r0, [sp, #0x8]
    mov r0, #0x1
    orr r5, r5, r1, lsl #0x10
    str r0, [sp, #0x4]
    mvn fp, #0x0
    b .L_350
.L_204:
    bl func_0207039c
    cmp r0, #0x0
    bne .L_218
    bl func_0207445c
    b .L_350
.L_218:
    add r0, sp, #0xc
    bl func_02070a38
    ldr r1, [sp, #0xc]
    cmp r1, #0xc
    bls .L_348
    ldrh r3, [r0]
    mov r2, r3, asr #0x8
    orr r2, r2, r3, lsl #0x8
    mov r2, r2, lsl #0x10
    cmp r9, r2, lsr #0x10
    bne .L_348
    ldrb r2, [r0, #0x3]
    and r2, r2, #0xf
    cmp r2, #0x3
    moveq r6, fp
    beq .L_348
    cmp r2, #0x0
    bne .L_348
    ldrb r2, [r0, #0x4]
    add r4, r0, r1
    ldrb r1, [r0, #0x5]
    add r0, r0, #0xc
    orr r1, r1, r2, lsl #0x8
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x10
    sub r7, r1, #0x1
    beq .L_298
.L_284:
    bl func_0206f45c
    cmp r7, #0x0
    add r0, r0, #0x4
    sub r7, r7, #0x1
    bne .L_284
.L_298:
    cmp r0, r4
    bcs .L_348
.L_2a0:
    bl func_0206f45c
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
    bne .L_338
    cmp sl, #0xc
    beq .L_318
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
    b .L_348
.L_318:
    cmp r2, r8
    ldrhi r6, [sp, #0x8]
    bhi .L_348
    ldr r1, [sp]
    add r0, r0, #0xa
    bl func_02094688
    ldr r6, [sp, #0x4]
    b .L_348
.L_338:
    add r1, r2, #0xa
    add r0, r0, r1
    cmp r0, r4
    bcc .L_2a0
.L_348:
    ldr r0, [sp, #0xc]
    bl func_0207092c
.L_350:
    ldr r0, _LIT1
    ldr r0, [r0]
    blx r0
    cmp r0, #0x0
    beq .L_384
    cmp r6, #0x0
    bne .L_384
    bl func_020930b0
    mov r0, r0, lsr #0x10
    orr r0, r0, r1, lsl #0x10
    sub r0, r0, r5
    cmp r0, #0xf
    blt .L_204
.L_384:
    mov r0, r6
    add sp, sp, #0x4c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
_LIT0: .word 0x00001001
_LIT1: .word data_0219ef14
