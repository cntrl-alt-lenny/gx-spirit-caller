; func_02029f20 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .extern Task_PostLocked
        .extern func_02029c2c
        .extern func_020b377c
        .global func_02029f20
        .arm
func_02029f20:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x20
    str r0, [sp]
    add r0, r0, #0x100
    ldrh r0, [r0, #0x9a]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1f
    beq .L_27c
    ldr r0, [sp]
    ldrb r1, [r0, #0x6c]
    ldr r0, [r0, #0x74]
    str r0, [sp, #0x18]
    cmp r1, #0x1
    moveq r0, #0x100
    streq r0, [sp, #0x4]
    movne r0, #0x10
    strne r0, [sp, #0x4]
    b .L_2a0
.L_27c:
    ldr r0, [sp]
    ldrb r1, [r0, #0x78]
    ldr r0, [r0, #0x80]
    str r0, [sp, #0x18]
    cmp r1, #0x1
    moveq r0, #0x100
    streq r0, [sp, #0x4]
    movne r0, #0x10
    strne r0, [sp, #0x4]
.L_2a0:
    ldr r0, [sp, #0x4]
    mov r1, #0x4
    mov r0, r0, lsl #0x1
    mov r2, #0x0
    str r0, [sp, #0x14]
    bl Task_PostLocked
    ldr r1, [sp]
    str r0, [sp, #0x10]
    add r1, r1, #0x100
    ldrsh r2, [r1, #0x94]
    ldrsh sl, [r1, #0x96]
    mov r4, #0x0
    add r0, r2, r2, lsr #0x1f
    cmp sl, r0, asr #0x1
    mov fp, r0, asr #0x1
    ldr r0, [sp]
    subgt sl, r2, sl
    add r0, r0, #0x100
    ldrsh r1, [r0, #0x92]
    ldr r0, [sp, #0x4]
    cmp r1, #0x0
    rsblt r1, r1, #0x0
    cmp r0, #0x0
    rsb r5, r1, #0x10
    ble .L_43c
    ldr r0, [sp]
    rsb r8, r1, r1, lsl #0x5
    add r0, r0, #0x100
    sub r9, fp, sl
    str r0, [sp, #0x1c]
.L_318:
    ldr r0, [sp]
    ldr r1, [r0, #0x188]
    mov r0, r4, lsl #0x1
    ldrh r2, [r1, r0]
    ldr r0, [sp, #0x1c]
    ldrsh r1, [r0, #0x92]
    and r0, r2, #0x1f
    cmp r1, #0x0
    mov r1, r2, asr #0x5
    and r6, r1, #0x1f
    mov r1, r2, asr #0xa
    and r7, r1, #0x1f
    blt .L_388
    mla r2, r0, r5, r8
    mov r1, r2, asr #0x3
    add r1, r2, r1, lsr #0x1c
    mla r3, r6, r5, r8
    mov r2, r3, asr #0x3
    add r2, r3, r2, lsr #0x1c
    mov r2, r2, asr #0x4
    mla r3, r7, r5, r8
    str r2, [sp, #0xc]
    mov r2, r3, asr #0x3
    add r2, r3, r2, lsr #0x1c
    mov r2, r2, asr #0x4
    mov r1, r1, asr #0x4
    str r2, [sp, #0x8]
    b .L_3c0
.L_388:
    mul r2, r0, r5
    mov r1, r2, asr #0x3
    add r1, r2, r1, lsr #0x1c
    mul r3, r6, r5
    mov r2, r3, asr #0x3
    add r2, r3, r2, lsr #0x1c
    mov r2, r2, asr #0x4
    mul r3, r7, r5
    str r2, [sp, #0xc]
    mov r2, r3, asr #0x3
    add r2, r3, r2, lsr #0x1c
    mov r2, r2, asr #0x4
    mov r1, r1, asr #0x4
    str r2, [sp, #0x8]
.L_3c0:
    mul r2, r0, r9
    mla r0, r1, sl, r2
    mov r1, fp
    bl func_020b377c
    mul r2, r7, r9
    ldr r1, [sp, #0x8]
    mov r7, r0
    mla r0, r1, sl, r2
    mov r1, fp
    bl func_020b377c
    mul r2, r6, r9
    ldr r1, [sp, #0xc]
    mov r6, r0
    mla r0, r1, sl, r2
    mov r1, fp
    bl func_020b377c
    mov r2, r6, lsl #0x1b
    mov r2, r2, lsr #0x11
    mov r0, r0, lsl #0x1b
    mov r2, r2, lsl #0x10
    mov r0, r0, lsr #0x16
    and r1, r7, #0x1f
    orr r0, r0, r2, lsr #0x10
    orr r2, r1, r0
    mov r1, r4, lsl #0x1
    ldr r0, [sp, #0x10]
    add r4, r4, #0x1
    strh r2, [r0, r1]
    ldr r0, [sp, #0x4]
    cmp r4, r0
    blt .L_318
.L_43c:
    ldr r0, [sp]
    ldr r1, [sp, #0x10]
    ldr r2, [sp, #0x18]
    ldr r3, [sp, #0x14]
    bl func_02029c2c
    ldr r0, [sp, #0x10]
    bl Task_InvokeLocked
    ldr r0, [sp]
    add r0, r0, #0x100
    ldrsh r1, [r0, #0x96]
    add r1, r1, #0x1
    strh r1, [r0, #0x96]
    ldrsh r2, [r0, #0x96]
    ldrsh r1, [r0, #0x94]
    cmp r2, r1
    movge r1, #0x0
    strgeh r1, [r0, #0x96]
    mov r0, #0x1
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
