; func_ov005_021ab6ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .extern Task_PostLocked
        .extern func_ov005_021ab260
        .extern func_ov005_021ab274
        .extern func_ov005_021ab2e0
        .extern func_ov005_021ab384
        .extern func_ov005_021abc88
        .global func_ov005_021ab6ac
        .arm
func_ov005_021ab6ac:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x8
    mov r8, r0
    ldrh r1, [r8, #0x5c]
    mov r7, #0x0
    mov r0, #0xc
    mov r1, r1, lsl #0x16
    mov r1, r1, lsr #0x1c
    mul r0, r1, r0
    mov r2, r7
    mov r1, #0x4
    ldr r6, [r8, #0x60]
    bl Task_PostLocked
    ldrh r2, [r8, #0x5c]
    mov r4, r0
    mov r1, #0x4
    mov r0, r2, lsl #0x16
    mov r0, r0, lsr #0x1c
    mov r0, r0, lsl #0x2
    mov r2, r7
    bl Task_PostLocked
    mov r5, r0
    ldr r0, [r8]
    mov r2, r4
    mov r1, r7
    bl func_ov005_021ab274
    str r0, [r5]
    b .L_420
.L_334:
    ldr r0, [r8]
    mov r2, #0x1
    bl func_ov005_021ab384
    cmp r0, #0x0
    beq .L_3d8
    ldr r0, [r5, r7, lsl #0x2]
    ldr r3, [r8, #0x6c]
    add r1, sp, #0x4
    add r2, sp, #0x0
    blx r3
    str r0, [r6]
    ldr r1, [r5, r7, lsl #0x2]
    mvn r0, #0x0
    str r1, [r6, #0x4]
    ldr r1, [sp, #0x4]
    strh r1, [r6, #0xc]
    ldr r1, [sp]
    strh r1, [r6, #0xe]
    strh r7, [r6, #0xa]
    strh r0, [r6, #0x8]
    ldr r0, [r8]
    ldr r1, [r5, r7, lsl #0x2]
    add r6, r6, #0x10
    bl func_ov005_021ab260
    cmp r0, #0x0
    beq .L_3d8
    ldr r0, [r8]
    ldr r1, [r5, r7, lsl #0x2]
    mov r2, #0x2
    bl func_ov005_021ab384
    cmp r0, #0x0
    beq .L_3d8
    add r7, r7, #0x1
    mov r0, #0xc
    mla r2, r7, r0, r4
    add r1, r5, r7, lsl #0x2
    ldr r0, [r8]
    ldr r1, [r1, #-4]
    bl func_ov005_021ab274
    str r0, [r5, r7, lsl #0x2]
    b .L_420
.L_3d8:
    mov r0, #0xc
    mla r9, r7, r0, r4
    ldr r0, [r8]
    mov r1, r9
    bl func_ov005_021ab2e0
    str r0, [r5, r7, lsl #0x2]
    cmp r0, #0x0
    bne .L_420
.L_3f8:
    cmp r7, #0x0
    ble .L_420
    sub r9, r9, #0xc
    ldr r0, [r8]
    mov r1, r9
    sub r7, r7, #0x1
    bl func_ov005_021ab2e0
    str r0, [r5, r7, lsl #0x2]
    cmp r0, #0x0
    beq .L_3f8
.L_420:
    ldr r1, [r5, r7, lsl #0x2]
    cmp r1, #0x0
    bne .L_334
    cmp r7, #0x0
    bgt .L_334
    mov r0, #0x0
    str r0, [r6, #0x4]
    strh r0, [r6, #0xa]
    str r0, [r6]
    ldrh r1, [r8, #0x5c]
    mov r0, r8
    mov r1, r1, lsl #0x1c
    mov r1, r1, lsr #0x1f
    bl func_ov005_021abc88
    mov r0, r5
    bl Task_InvokeLocked
    mov r0, r4
    bl Task_InvokeLocked
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
