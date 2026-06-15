; func_0202838c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .extern Task_PostLocked
        .extern func_0202813c
        .extern func_020b3870
        .global func_0202838c
        .arm
func_0202838c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x1c
    str r0, [sp]
    ldrh r0, [r0, #0xde]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1f
    beq .L_4ec
    ldr r0, [sp]
    ldrb r1, [r0, #0x6c]
    ldr r0, [r0, #0x74]
    str r0, [sp, #0x18]
    cmp r1, #0x1
    moveq r0, #0x100
    streq r0, [sp, #0x4]
    movne r0, #0x10
    strne r0, [sp, #0x4]
    b .L_4fc
.L_4ec:
    mov r0, #0x0
    str r0, [sp, #0x18]
    mov r0, #0x100
    str r0, [sp, #0x4]
.L_4fc:
    ldr r0, [sp, #0x4]
    mov r1, #0x4
    mov r0, r0, lsl #0x1
    mov r2, #0x0
    str r0, [sp, #0x14]
    bl Task_PostLocked
    ldr r1, [sp]
    str r0, [sp, #0x10]
    ldrsh r2, [r1, #0xda]
    ldrsh sl, [r1, #0xdc]
    mov r4, #0x0
    add r0, r2, r2, lsr #0x1f
    cmp sl, r0, asr #0x1
    mov fp, r0, asr #0x1
    ldr r0, [sp]
    subgt sl, r2, sl
    ldrsh r1, [r0, #0xd8]
    ldr r0, [sp, #0x4]
    cmp r1, #0x0
    rsblt r1, r1, #0x0
    cmp r0, #0x0
    rsb r5, r1, #0x10
    ble .L_684
    rsb r8, r1, r1, lsl #0x5
    sub r9, fp, sl
.L_560:
    ldr r0, [sp]
    ldr r1, [r0, #0xd0]
    mov r0, r4, lsl #0x1
    ldrh r3, [r1, r0]
    ldr r0, [sp]
    ldrsh r0, [r0, #0xd8]
    mov r2, r3, asr #0x5
    mov r1, r3, asr #0xa
    cmp r0, #0x0
    and r0, r3, #0x1f
    and r6, r2, #0x1f
    and r7, r1, #0x1f
    blt .L_5d0
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
    b .L_608
.L_5d0:
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
.L_608:
    mul r2, r0, r9
    mla r0, r1, sl, r2
    mov r1, fp
    bl func_020b3870
    mul r2, r7, r9
    ldr r1, [sp, #0x8]
    mov r7, r0
    mla r0, r1, sl, r2
    mov r1, fp
    bl func_020b3870
    mul r2, r6, r9
    ldr r1, [sp, #0xc]
    mov r6, r0
    mla r0, r1, sl, r2
    mov r1, fp
    bl func_020b3870
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
    blt .L_560
.L_684:
    ldr r0, [sp]
    ldr r1, [sp, #0x10]
    ldr r2, [sp, #0x18]
    ldr r3, [sp, #0x14]
    bl func_0202813c
    ldr r0, [sp, #0x10]
    bl Task_InvokeLocked
    ldr r0, [sp]
    ldrsh r0, [r0, #0xdc]
    add r1, r0, #0x1
    ldr r0, [sp]
    strh r1, [r0, #0xdc]
    ldrsh r1, [r0, #0xdc]
    ldrsh r0, [r0, #0xda]
    cmp r1, r0
    ldrge r0, [sp]
    movge r1, #0x0
    strgeh r1, [r0, #0xdc]
    mov r0, #0x1
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
