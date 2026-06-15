; func_02099d80 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .global func_02099d80
        .arm
func_02099d80:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x4
    mov r6, r1
    mov r7, r0
    mov r5, r2
    mov r4, r3
    cmp r6, #0x1000
    bcs .L_170
    cmp r5, #0x1000
    bcs .L_170
    ldrh r8, [sp, #0x2c]
    cmp r8, #0x1000
    bcs .L_170
    ldrh r3, [sp, #0x30]
    cmp r3, #0x1000
    bcc .L_180
.L_170:
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
.L_180:
    cmp r4, #0x100
    bcs .L_1ac
    ldrh r2, [sp, #0x34]
    cmp r2, #0x100
    bcs .L_1ac
    ldrh r1, [sp, #0x28]
    cmp r1, #0xc0
    bcs .L_1ac
    ldrh r0, [sp, #0x38]
    cmp r0, #0xc0
    bcc .L_1bc
.L_1ac:
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
.L_1bc:
    cmp r4, r2
    beq .L_1dc
    cmp r1, r0
    beq .L_1dc
    cmp r6, r8
    beq .L_1dc
    cmp r5, r3
    bne .L_1ec
.L_1dc:
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
.L_1ec:
    bl OS_DisableIrq
    ldrh r1, [sp, #0x2c]
    ldr r3, _LIT0
    ldr fp, _LIT1
    str r1, [sp]
    ldr r2, [sp]
    ldrh r1, [sp, #0x34]
    sub r9, r6, r2
    mov r2, #0x0
    mov ip, r9, lsl #0x8
    strh r2, [r3]
    str ip, [fp]
    ldrh r8, [sp, #0x30]
    ldrh sl, [sp, #0x38]
    ldrh r9, [sp, #0x28]
    ldr fp, _LIT2
    sub ip, r4, r1
    str ip, [fp]
    str r2, [fp, #0x4]
    sub fp, r5, r8
    sub r2, r9, sl
.L_240:
    ldrh ip, [r3]
    ands ip, ip, #0x8000
    bne .L_240
    ldr ip, _LIT3
    mov fp, fp, lsl #0x8
    ldr lr, [ip]
    mov ip, #0x0
    strh ip, [r3]
    ldr r3, _LIT1
    cmp lr, #0x8000
    str fp, [r3]
    ldr r3, _LIT2
    str r2, [r3]
    mov r2, r3
    str ip, [r2, #0x4]
    bge .L_290
    mov r2, #0x8000
    rsb r2, r2, #0x0
    cmp lr, r2
    bge .L_2a4
.L_290:
    bl OS_RestoreIrq
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
.L_2a4:
    strh lr, [r7, #0x4]
    ldrsh fp, [r7, #0x4]
    add r3, r4, r1
    ldr r1, [sp]
    add r4, r6, r1
    mul r1, fp, r3
    mov r3, r4, lsl #0x8
    sub r1, r3, r1
    mov r1, r1, lsl #0x9
    mov r1, r1, asr #0x10
    cmp r1, #0x8000
    bge .L_2dc
    cmp r1, r2
    bge .L_2f0
.L_2dc:
    bl OS_RestoreIrq
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
.L_2f0:
    ldr r2, _LIT0
    strh r1, [r7]
.L_2f8:
    ldrh r1, [r2]
    ands r1, r1, #0x8000
    bne .L_2f8
    ldr r1, _LIT3
    ldr r4, [r1]
    bl OS_RestoreIrq
    cmp r4, #0x8000
    bge .L_328
    mov r0, #0x8000
    rsb r1, r0, #0x0
    cmp r4, r1
    bge .L_338
.L_328:
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
.L_338:
    strh r4, [r7, #0x6]
    ldrsh r2, [r7, #0x6]
    add r0, r9, sl
    add r3, r5, r8
    mul r0, r2, r0
    mov r2, r3, lsl #0x8
    sub r0, r2, r0
    mov r0, r0, lsl #0x9
    mov r0, r0, asr #0x10
    cmp r0, #0x8000
    bge .L_36c
    cmp r0, r1
    bge .L_37c
.L_36c:
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
.L_37c:
    strh r0, [r7, #0x2]
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
_LIT0: .word 0x04000280
_LIT1: .word 0x04000290
_LIT2: .word 0x04000298
_LIT3: .word 0x040002a0
