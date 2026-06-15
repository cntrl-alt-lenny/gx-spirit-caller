; func_020705d4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ef14
        .extern func_020707f0
        .extern func_0207445c
        .extern func_020930b0
        .global func_020705d4
        .arm
func_020705d4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x1c
    mov r4, #0x0
    mov sl, r0
    ldr r8, [sp, #0x40]
    mov r0, r4
    str r4, [sp, #0xc]
    mov r9, r1
    mov fp, r2
    str r3, [sp, #0x8]
    mov r6, r4
    str r0, [r8, #0x34]
    bl func_020930b0
    mov r0, r0, lsr #0x10
    str r0, [sp, #0x10]
    orr r0, r0, r1, lsl #0x10
    str r0, [sp, #0x10]
    mov r0, r6
    str r0, [sp, #0x18]
    mov r0, #0x1
    ldr r4, _LIT0
    str r0, [sp, #0x14]
    b .L_b30
.L_9c4:
    ldr r7, [r8, #0x28]
    ldr r3, [sp, #0x8]
    str r8, [sp]
    mov r0, sl
    mov r1, r9
    mov r2, fp
    str r6, [sp, #0x4]
    bl func_020707f0
    bl func_020930b0
    mov r5, r0, lsr #0x10
    orr r5, r5, r1, lsl #0x10
.L_9f0:
    bl func_0207445c
    ldr r0, [r4]
    blx r0
    cmp r0, #0x0
    beq .L_a4c
    ldrb r0, [r8, #0x8]
    cmp r0, #0x4
    bne .L_a4c
    ldr r1, [r8, #0x28]
    ldr r0, [r8, #0x30]
    cmp r1, r0
    beq .L_a4c
    bl func_020930b0
    mov r0, r0, lsr #0x10
    orr r0, r0, r1, lsl #0x10
    sub r0, r0, r5
    cmp r0, #0xf
    bge .L_a4c
    cmp r6, #0x0
    beq .L_9f0
    ldrh r0, [r8, #0x2c]
    cmp r0, #0x0
    beq .L_9f0
.L_a4c:
    ldr r0, [r8, #0x30]
    subs r7, r0, r7
    ldr r0, [sp, #0xc]
    add r0, r0, r7
    str r0, [sp, #0xc]
    beq .L_a78
    bl func_020930b0
    mov r0, r0, lsr #0x10
    str r0, [sp, #0x10]
    orr r0, r0, r1, lsl #0x10
    str r0, [sp, #0x10]
.L_a78:
    ldr r0, [r8, #0x30]
    str r0, [r8, #0x28]
    ldrb r0, [r8, #0x8]
    cmp r0, #0x4
    bne .L_b00
    ldrh r0, [r8, #0x2c]
    cmp r0, #0x0
    bne .L_b00
    cmp r7, #0x0
    bne .L_b00
    cmp r6, #0x0
    bne .L_b04
    bl func_020930b0
    mov r5, r0, lsr #0x10
    orr r5, r5, r1, lsl #0x10
    b .L_ac8
.L_ab8:
    bl func_0207445c
    ldrh r0, [r8, #0x2c]
    cmp r0, #0x0
    bne .L_af0
.L_ac8:
    ldr r0, [r4]
    blx r0
    cmp r0, #0x0
    beq .L_af0
    bl func_020930b0
    mov r0, r0, lsr #0x10
    orr r0, r0, r1, lsl #0x10
    sub r0, r0, r5
    cmp r0, #0xf
    blt .L_ab8
.L_af0:
    ldrh r0, [r8, #0x2c]
    cmp r0, #0x0
    ldreq r6, [sp, #0x14]
    b .L_b04
.L_b00:
    ldr r6, [sp, #0x18]
.L_b04:
    cmp r7, r9
    addcc sl, sl, r7
    subcc r9, r9, r7
    bcc .L_b30
    sub r1, r7, r9
    add sl, fp, r1
    ldr r0, [sp, #0x8]
    ldr fp, [sp, #0x18]
    sub r9, r0, r1
    mov r0, fp
    str r0, [sp, #0x8]
.L_b30:
    ldr r0, [r4]
    blx r0
    cmp r0, #0x0
    beq .L_b70
    cmp r9, #0x0
    beq .L_b70
    ldrb r0, [r8, #0x8]
    cmp r0, #0x4
    bne .L_b70
    bl func_020930b0
    mov r2, r0, lsr #0x10
    ldr r0, [sp, #0x10]
    orr r2, r2, r1, lsl #0x10
    sub r0, r2, r0
    cmp r0, #0x9f
    blt .L_9c4
.L_b70:
    ldr r0, [sp, #0xc]
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
_LIT0: .word data_0219ef14
