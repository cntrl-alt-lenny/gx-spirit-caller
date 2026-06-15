; func_ov006_021c8b74 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0208e1ac
        .extern func_02094504
        .global func_ov006_021c8b74
        .arm
func_ov006_021c8b74:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x30
    mov r4, r0
    bl func_0208e1ac
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x800
    bl func_02094504
    bl func_0208e1ac
    mov r1, #0x0
    ldr r3, [r4, #0x3c]
    ldr r2, [r4, #0x40]
    str r1, [sp, #0x20]
    orr r1, r3, r2, lsl #0xc
    strh r1, [r0]
    ldr r2, [r4, #0x7c]
    cmp r2, #0x0
    ble .L_be0
    mov r0, #0x1
    str r0, [sp, #0x10]
.L_918:
    ldr r0, [sp, #0x20]
    sub r1, r2, #0x1
    cmp r0, r1
    bge .L_960
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1f
    adds r0, r1, r0, ror #0x1f
    bne .L_94c
    mov r0, #0x1
    str r0, [sp, #0x1c]
    mov r0, #0x3
    str r0, [sp, #0x14]
    b .L_994
.L_94c:
    mov r0, #0x4
    str r0, [sp, #0x1c]
    mov r0, #0x5
    str r0, [sp, #0x14]
    b .L_994
.L_960:
    mov r1, r2, lsr #0x1f
    rsb r0, r1, r2, lsl #0x1f
    adds r0, r1, r0, ror #0x1f
    beq .L_984
    mov r0, #0x6
    str r0, [sp, #0x1c]
    mov r0, #0x8
    str r0, [sp, #0x14]
    b .L_994
.L_984:
    mov r0, #0x15
    str r0, [sp, #0x1c]
    mov r0, #0x17
    str r0, [sp, #0x14]
.L_994:
    ldr r0, [r4, #0x78]
    mov r1, #0x0
    str r1, [sp, #0x24]
    cmp r0, #0x0
    ble .L_bbc
    ldr r1, [sp, #0x10]
    mov r2, #0x18
    add r1, r1, r1, lsr #0x1f
    mov r1, r1, asr #0x1
    add r1, r1, #0x1
    str r1, [sp, #0x8]
    mov r1, #0x1
    str r1, [sp, #0xc]
    ldr r1, [sp, #0x1c]
    mov r3, #0x30
    mul r2, r1, r2
    str r2, [sp, #0x28]
    mul r2, r1, r3
    str r2, [sp, #0x2c]
.L_9e0:
    ldr r1, [sp, #0x24]
    sub r2, r0, #0x1
    cmp r1, r2
    bge .L_a24
    mov r0, r1
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1f
    adds r0, r1, r0, ror #0x1f
    bne .L_a14
    mov r0, #0x3
    mov r7, #0x1
    str r0, [sp, #0x18]
    b .L_a4c
.L_a14:
    mov r0, #0x5
    mov r7, #0x4
    str r0, [sp, #0x18]
    b .L_a4c
.L_a24:
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1f
    adds r0, r1, r0, ror #0x1f
    moveq r0, #0x17
    moveq r7, #0x15
    streq r0, [sp, #0x18]
    beq .L_a4c
    mov r0, #0x8
    mov r7, #0x6
    str r0, [sp, #0x18]
.L_a4c:
    ldr r1, [sp, #0x1c]
    ldr r0, [sp, #0x14]
    mov fp, r1
    cmp r1, r0
    bgt .L_b94
    ldr r0, [sp, #0x28]
    ldr r9, [sp, #0x2c]
    str r0, [sp, #0x4]
    ldr r0, [sp, #0xc]
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    add r0, r0, #0x1
    str r0, [sp]
.L_a80:
    ldr r0, [sp, #0x18]
    mov r6, r7
    cmp r7, r0
    bgt .L_b74
    ldr r0, [sp, #0x1c]
    sub r1, fp, r0
    ldr r0, [sp, #0x8]
    add r0, r0, r1
    mov r5, r0, lsl #0x6
.L_aa4:
    ldr r2, [r4, #0x38]
    ldr r0, [sp, #0x4]
    mov r1, r6, lsl #0x1
    add r0, r2, r0, lsl #0x1
    ldrh r8, [r1, r0]
    ldr r0, [r4, #0x78]
    sub r1, r6, r7
    cmp r0, #0x1
    cmpeq r6, r7
    addeq r0, r9, r2
    ldreqh r8, [r0, #0x2]
    ldr r0, [sp]
    add sl, r0, r1
    bl func_0208e1ac
    ldr r2, [r4, #0x3c]
    add r1, r5, r0
    ldr r0, [sp, #0x20]
    ldr r3, [r4, #0x40]
    add r2, r2, r8
    cmp r0, #0x0
    mov r0, sl, lsl #0x1
    orr r2, r2, r3, lsl #0xc
    strh r2, [r0, r1]
    ldreq r0, [sp, #0x1c]
    cmpeq fp, r0
    bne .L_b34
    ldr r1, [r4, #0x38]
    mov r0, r6, lsl #0x1
    ldrh r8, [r1, r0]
    bl func_0208e1ac
    mov r1, sl, lsl #0x1
    ldr r3, [r4, #0x40]
    ldr r2, [r4, #0x3c]
    add r2, r2, r8
    orr r2, r2, r3, lsl #0xc
    strh r2, [r0, r1]
.L_b34:
    ldr r0, [sp, #0x24]
    cmp r0, #0x0
    cmpeq r6, r7
    bne .L_b64
    ldr r0, [r4, #0x38]
    ldrh r8, [r9, r0]
    bl func_0208e1ac
    ldr r2, [r4, #0x40]
    ldr r1, [r4, #0x3c]
    add r1, r1, r8
    orr r1, r1, r2, lsl #0xc
    strh r1, [r5, r0]
.L_b64:
    ldr r0, [sp, #0x18]
    add r6, r6, #0x1
    cmp r6, r0
    ble .L_aa4
.L_b74:
    ldr r0, [sp, #0x4]
    add fp, fp, #0x1
    add r0, r0, #0x18
    str r0, [sp, #0x4]
    ldr r0, [sp, #0x14]
    add r9, r9, #0x30
    cmp fp, r0
    ble .L_a80
.L_b94:
    ldr r0, [sp, #0xc]
    add r0, r0, #0x5
    str r0, [sp, #0xc]
    ldr r0, [sp, #0x24]
    add r0, r0, #0x1
    str r0, [sp, #0x24]
    ldr r0, [r4, #0x78]
    ldr r1, [sp, #0x24]
    cmp r1, r0
    blt .L_9e0
.L_bbc:
    ldr r0, [sp, #0x20]
    ldr r2, [r4, #0x7c]
    add r0, r0, #0x1
    str r0, [sp, #0x20]
    cmp r0, r2
    ldr r0, [sp, #0x10]
    add r0, r0, #0x5
    str r0, [sp, #0x10]
    blt .L_918
.L_be0:
    mov r0, #0x1
    add sp, sp, #0x30
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
