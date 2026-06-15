; func_020808f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02081348
        .extern func_02081498
        .global func_020808f0
        .arm
func_020808f0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x54
    ldrb r4, [r0, #0xc]
    mov sl, r2
    str r1, [sp, #0xc]
    str r4, [sp, #0x44]
    ldr r1, [sp, #0x44]
    ldr r4, [sp, #0x78]
    cmp r1, #0x4
    add r1, sl, r4
    str r1, [sp, #0x1c]
    ldr r2, [sp, #0x7c]
    mov r1, r3
    add r1, r1, r2
    str r1, [sp, #0x20]
    ldrne r1, [sp, #0xc]
    str r3, [sp, #0x10]
    orrne r1, r1, r1, lsl #0x8
    orrne r1, r1, r1, lsl #0x10
    strne r1, [sp, #0xc]
    bne .L_a6c
    ldr r1, [sp, #0xc]
    orr r1, r1, r1, lsl #0x4
    orr r1, r1, r1, lsl #0x8
    orr r1, r1, r1, lsl #0x10
    str r1, [sp, #0xc]
.L_a6c:
    bic r1, sl, #0x7
    str r1, [sp, #0x30]
    ldr r1, [sp, #0x10]
    ldr r2, [r0, #0x10]
    bic r1, r1, #0x7
    str r1, [sp, #0x14]
    ldr r1, [sp, #0x44]
    str r2, [sp, #0x4c]
    mov r3, r1, lsl #0x6
    mov r2, r3, asr #0x2
    ldr r1, [sp, #0x20]
    add r3, r3, r2, lsr #0x1d
    ldr r2, [sp, #0x1c]
    add r6, r1, #0x7
    add r2, r2, #0x7
    bic r5, r2, #0x7
    bic r2, r6, #0x7
    ldr r1, [sp, #0x30]
    str r2, [sp, #0x24]
    mov r2, r3, asr #0x3
    str r2, [sp, #0x48]
    mov r4, r1, asr #0x2
    ldr r2, [sp, #0x30]
    ldr r1, [sp, #0x14]
    add r2, r2, r4, lsr #0x1d
    mov r2, r2, asr #0x3
    str r2, [sp, #0x2c]
    ldr r2, [sp, #0x14]
    mov r1, r1, asr #0x2
    add r1, r2, r1, lsr #0x1d
    mov r6, r1, asr #0x3
    ldr r1, [sp, #0x24]
    cmp r2, r1
    ldr r1, [r0, #0x4]
    str r1, [sp, #0x40]
    ldr r1, [r0, #0x8]
    ldr r0, [r0]
    str r1, [sp, #0x3c]
    str r0, [sp, #0x28]
    ldrb r0, [sp, #0x4c]
    str r0, [sp, #0x38]
    ldrb r0, [sp, #0x4d]
    str r0, [sp, #0x34]
    addge sp, sp, #0x54
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r4, #0x0
    mov fp, #0x8
.L_b28:
    ldr r1, [sp, #0x14]
    ldr r0, [sp, #0x10]
    ldr r7, [sp, #0x2c]
    cmp r1, r0
    movlt r1, r0
    ldrlt r0, [sp, #0x14]
    sublt r9, r1, r0
    ldr r1, [sp, #0x20]
    ldr r0, [sp, #0x14]
    movge r9, r4
    sub r0, r1, r0
    cmp r0, #0x8
    movgt r0, fp
    sub r0, r0, r9
    str r0, [sp, #0x18]
    ldr r0, [sp, #0x30]
    cmp r0, r5
    mov r8, r0
    bge .L_bf4
.L_b74:
    ldr r0, [sp, #0x38]
    ldr r2, [sp, #0x40]
    str r0, [sp]
    ldr r0, [sp, #0x34]
    ldr r3, [sp, #0x3c]
    str r0, [sp, #0x4]
    mov r0, r7
    mov r1, r6
    bl func_02081498
    ldr r2, [sp, #0x1c]
    cmp r8, sl
    sublt r1, sl, r8
    sub r2, r2, r8
    movge r1, r4
    cmp r2, #0x8
    movgt r2, fp
    sub r3, r2, r1
    ldr r2, [sp, #0x18]
    ldr ip, [sp, #0x48]
    str r2, [sp]
    ldr r2, [sp, #0xc]
    str r2, [sp, #0x4]
    ldr r2, [sp, #0x44]
    str r2, [sp, #0x8]
    ldr r2, [sp, #0x28]
    mla r0, ip, r0, r2
    mov r2, r9
    bl func_02081348
    add r8, r8, #0x8
    add r7, r7, #0x1
    cmp r8, r5
    blt .L_b74
.L_bf4:
    ldr r0, [sp, #0x14]
    add r6, r6, #0x1
    add r1, r0, #0x8
    ldr r0, [sp, #0x24]
    str r1, [sp, #0x14]
    cmp r1, r0
    blt .L_b28
    add sp, sp, #0x54
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
