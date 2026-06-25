; func_02080a1c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02081260
        .global func_02080a1c
        .arm
func_02080a1c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x3c
    ldrb r4, [r0, #0xc]
    mov sl, r2
    str r1, [sp, #0xc]
    str r4, [sp, #0x2c]
    ldr r1, [sp, #0x2c]
    ldr r4, [sp, #0x60]
    cmp r1, #0x4
    add r1, sl, r4
    str r1, [sp, #0x18]
    ldr r2, [sp, #0x64]
    mov r1, r3
    add r1, r1, r2
    str r1, [sp, #0x1c]
    ldrne r1, [sp, #0xc]
    str r3, [sp, #0x10]
    orrne r1, r1, r1, lsl #0x8
    orrne r1, r1, r1, lsl #0x10
    strne r1, [sp, #0xc]
    bne .L_27c
    ldr r1, [sp, #0xc]
    orr r1, r1, r1, lsl #0x4
    orr r1, r1, r1, lsl #0x8
    orr r1, r1, r1, lsl #0x10
    str r1, [sp, #0xc]
.L_27c:
    ldr r1, [sp, #0x10]
    bic r1, r1, #0x7
    mov r2, r1, asr #0x2
    str r1, [sp, #0x14]
    add r1, r1, r2, lsr #0x1d
    ldr r2, [r0, #0x10]
    mov r3, r1, asr #0x3
    mul r1, r3, r2
    bic r3, sl, #0x7
    str r3, [sp, #0x28]
    ldr r3, [sp, #0x2c]
    mov r6, r3, lsl #0x6
    ldr r3, [sp, #0x28]
    mov r4, r6, asr #0x2
    mov r5, r3, asr #0x2
    add r5, r3, r5, lsr #0x1d
    add r4, r6, r4, lsr #0x1d
    mov r3, r4, asr #0x3
    str r3, [sp, #0x30]
    ldr r3, [sp, #0x1c]
    add r1, r1, r5, asr #0x3
    add r4, r3, #0x7
    ldr r3, [r0]
    ldr r0, [sp, #0x18]
    add r5, r0, #0x7
    ldr r0, [sp, #0x30]
    bic r7, r5, #0x7
    mla r1, r0, r1, r3
    bic r0, r4, #0x7
    str r0, [sp, #0x20]
    ldr r0, [sp, #0x30]
    str r1, [sp, #0x24]
    mul r0, r2, r0
    str r0, [sp, #0x34]
    ldr r1, [sp, #0x14]
    ldr r0, [sp, #0x20]
    cmp r1, r0
    addge sp, sp, #0x3c
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r5, #0x0
    mov r4, #0x8
.L_320:
    ldr r1, [sp, #0x14]
    ldr r0, [sp, #0x10]
    ldr r6, [sp, #0x24]
    cmp r1, r0
    movlt r1, r0
    ldrlt r0, [sp, #0x14]
    sublt r9, r1, r0
    ldr r1, [sp, #0x1c]
    ldr r0, [sp, #0x14]
    movge r9, r5
    sub r0, r1, r0
    cmp r0, #0x8
    movgt r0, r4
    sub fp, r0, r9
    ldr r0, [sp, #0x28]
    cmp r0, r7
    mov r8, r0
    bge .L_3bc
.L_368:
    ldr r0, [sp, #0x18]
    cmp r8, sl
    sublt r1, sl, r8
    sub r0, r0, r8
    movge r1, r5
    cmp r0, #0x8
    movgt r0, r4
    sub r3, r0, r1
    ldr r0, [sp, #0xc]
    str fp, [sp]
    str r0, [sp, #0x4]
    ldr r0, [sp, #0x2c]
    mov r2, r9
    str r0, [sp, #0x8]
    mov r0, r6
    bl func_02081260
    ldr r0, [sp, #0x30]
    add r8, r8, #0x8
    add r6, r6, r0
    cmp r8, r7
    blt .L_368
.L_3bc:
    ldr r1, [sp, #0x24]
    ldr r0, [sp, #0x34]
    add r0, r1, r0
    str r0, [sp, #0x24]
    ldr r0, [sp, #0x14]
    add r1, r0, #0x8
    ldr r0, [sp, #0x20]
    str r1, [sp, #0x14]
    cmp r1, r0
    blt .L_320
    add sp, sp, #0x3c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
