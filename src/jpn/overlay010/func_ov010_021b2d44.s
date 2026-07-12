; func_ov010_021b2d44 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0201d5cc
        .extern func_0201d70c
        .global func_ov010_021b2d44
        .arm
func_ov010_021b2d44:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x30
    mov r5, r1
    mov r4, r0
    ldr r1, _LIT0
    mov r0, r5
    bl func_0201d5cc
    add r0, r0, #0x14
    str r0, [sp, #0x1c]
    mov r0, r5
    bl func_0201d70c
    ldr r1, [sp, #0x1c]
    mov r3, #0x0
    add r1, r1, #0x1000
    str r1, [sp, #0x18]
    mov r5, r3
    add r1, sp, #0x20
.L_44:
    add r2, r4, r5, lsl #0x1
    str r2, [r1, r3, lsl #0x2]
    add r3, r3, #0x1
    cmp r3, #0x4
    add r5, r5, #0x80
    blt .L_44
    mov r1, #0x0
    str r1, [sp, #0x10]
.L_64:
    mov r1, #0x0
    str r1, [sp, #0x14]
    add sl, sp, #0x20
.L_70:
    ldr r1, [sp, #0x1c]
    mov r6, #0x0
    ldr r1, [r1]
    str r1, [sp, #0xc]
    ldr r1, [sp, #0x18]
    ldrh r2, [r1]
    mov r1, r2, lsl #0x12
    mov r1, r1, lsr #0x11
    tst r2, #0x8000
    add r7, r0, r1, lsl #0x1
    movne r1, #0x1
    strne r1, [sp]
    moveq r1, #0x0
    streq r1, [sp]
    tst r2, #0x4000
    movne r9, #0x1
    moveq r9, #0x0
.L_b4:
    mov r5, #0x0
.L_b8:
    ldr r1, [sp]
    cmp r1, #0x1
    ldr r1, [sp, #0xc]
    and r8, r1, #0x3
    mov r1, r1, lsr #0x2
    str r1, [sp, #0xc]
    bne .L_1e0
    cmp r8, #0x2
    blt .L_1c8
    cmp r9, #0x1
    bne .L_1c8
    cmp r8, #0x2
    ldrh r2, [r7]
    ldrh r3, [r7, #0x2]
    and r4, r2, #0x1f
    mov r1, r2, asr #0x5
    and lr, r1, #0x1f
    mov r1, r2, asr #0xa
    and ip, r1, #0x1f
    and r2, r3, #0x1f
    mov r1, r3, asr #0x5
    and r1, r1, #0x1f
    mov r3, r3, asr #0xa
    and r3, r3, #0x1f
    beq .L_128
    cmp r8, #0x3
    beq .L_170
    b .L_1a8
.L_128:
    add r4, r4, r4, lsl #0x2
    add r2, r2, r2, lsl #0x1
    add r2, r4, r2
    add r4, lr, lr, lsl #0x2
    add r1, r1, r1, lsl #0x1
    add r1, r4, r1
    mov r1, r1, asr #0x3
    mov r2, r2, asr #0x3
    and r1, r1, #0x1f
    and r2, r2, #0x1f
    add r4, ip, ip, lsl #0x2
    add r3, r3, r3, lsl #0x1
    add r3, r4, r3
    str r1, [sp, #0x4]
    mov r1, r3, asr #0x3
    str r2, [sp, #0x8]
    and fp, r1, #0x1f
    b .L_1a8
.L_170:
    add r4, r4, r4, lsl #0x1
    add r2, r4, r2, lsl #0x2
    add r4, lr, lr, lsl #0x1
    add r4, r4, r1, lsl #0x2
    add r1, ip, ip, lsl #0x1
    add r3, r1, r3, lsl #0x2
    mov r1, r2, asr #0x3
    and r1, r1, #0x1f
    str r1, [sp, #0x8]
    mov r1, r4, asr #0x3
    and r1, r1, #0x1f
    str r1, [sp, #0x4]
    mov r1, r3, asr #0x3
    and fp, r1, #0x1f
.L_1a8:
    ldr r2, [sp, #0x8]
    ldr r1, [sp, #0x4]
    orr r1, r2, r1, lsl #0x5
    orr r1, r1, fp, lsl #0xa
    orr r2, r1, #0x8000
    ldr r1, [sl, r6, lsl #0x2]
    strh r2, [r1]
    b .L_294
.L_1c8:
    mov r1, r8, lsl #0x1
    ldrh r2, [r7, r1]
    ldr r1, [sl, r6, lsl #0x2]
    orr r2, r2, #0x8000
    strh r2, [r1]
    b .L_294
.L_1e0:
    cmp r8, #0x2
    beq .L_200
    cmp r8, #0x3
    bne .L_280
    ldr r2, [sl, r6, lsl #0x2]
    mov r1, #0x0
    strh r1, [r2]
    b .L_294
.L_200:
    cmp r9, #0x1
    bne .L_268
    ldrh r1, [r7, #0x2]
    ldrh r3, [r7]
    ldr r2, [sl, r6, lsl #0x2]
    mov r4, r1, asr #0xa
    and r4, r4, #0x1f
    mov r8, r3, asr #0xa
    and r8, r8, #0x1f
    add r4, r8, r4
    mov r8, r4, asr #0x1
    and r4, r3, #0x1f
    mov r3, r3, asr #0x5
    and r3, r3, #0x1f
    and ip, r1, #0x1f
    add r4, r4, ip
    mov r1, r1, asr #0x5
    and r1, r1, #0x1f
    add r1, r3, r1
    mov r1, r1, asr #0x1
    mov r1, r1, lsl #0x5
    orr r1, r1, r4, asr #0x1
    orr r1, r1, r8, lsl #0xa
    orr r1, r1, #0x8000
    strh r1, [r2]
    b .L_294
.L_268:
    mov r1, r8, lsl #0x1
    ldrh r2, [r7, r1]
    ldr r1, [sl, r6, lsl #0x2]
    orr r2, r2, #0x8000
    strh r2, [r1]
    b .L_294
.L_280:
    mov r1, r8, lsl #0x1
    ldrh r2, [r7, r1]
    ldr r1, [sl, r6, lsl #0x2]
    orr r2, r2, #0x8000
    strh r2, [r1]
.L_294:
    ldr r1, [sl, r6, lsl #0x2]
    add r5, r5, #0x1
    add r1, r1, #0x2
    str r1, [sl, r6, lsl #0x2]
    cmp r5, #0x4
    blt .L_b8
    add r6, r6, #0x1
    cmp r6, #0x4
    blt .L_b4
    ldr r1, [sp, #0x1c]
    add r1, r1, #0x4
    str r1, [sp, #0x1c]
    ldr r1, [sp, #0x18]
    add r1, r1, #0x2
    str r1, [sp, #0x18]
    ldr r1, [sp, #0x14]
    add r1, r1, #0x1
    str r1, [sp, #0x14]
    cmp r1, #0x20
    blt .L_70
    mov r3, #0x0
    add r2, sp, #0x20
.L_2ec:
    ldr r1, [r2, r3, lsl #0x2]
    add r1, r1, #0x300
    str r1, [r2, r3, lsl #0x2]
    add r3, r3, #0x1
    cmp r3, #0x4
    blt .L_2ec
    ldr r1, [sp, #0x10]
    add r1, r1, #0x1
    str r1, [sp, #0x10]
    cmp r1, #0x20
    blt .L_64
    add sp, sp, #0x30
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x494d4745
