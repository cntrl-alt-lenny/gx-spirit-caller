; func_020704ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ee34
        .extern func_02070708
        .extern func_02074374
        .extern func_02092fc8
        .global func_020704ec
        .arm
func_020704ec:
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
    bl func_02092fc8
    mov r0, r0, lsr #0x10
    str r0, [sp, #0x10]
    orr r0, r0, r1, lsl #0x10
    str r0, [sp, #0x10]
    mov r0, r6
    str r0, [sp, #0x18]
    mov r0, #0x1
    ldr r4, _LIT0
    str r0, [sp, #0x14]
    b .L_1c8
.L_5c:
    ldr r7, [r8, #0x28]
    ldr r3, [sp, #0x8]
    str r8, [sp]
    mov r0, sl
    mov r1, r9
    mov r2, fp
    str r6, [sp, #0x4]
    bl func_02070708
    bl func_02092fc8
    mov r5, r0, lsr #0x10
    orr r5, r5, r1, lsl #0x10
.L_88:
    bl func_02074374
    ldr r0, [r4]
    blx r0
    cmp r0, #0x0
    beq .L_e4
    ldrb r0, [r8, #0x8]
    cmp r0, #0x4
    bne .L_e4
    ldr r1, [r8, #0x28]
    ldr r0, [r8, #0x30]
    cmp r1, r0
    beq .L_e4
    bl func_02092fc8
    mov r0, r0, lsr #0x10
    orr r0, r0, r1, lsl #0x10
    sub r0, r0, r5
    cmp r0, #0xf
    bge .L_e4
    cmp r6, #0x0
    beq .L_88
    ldrh r0, [r8, #0x2c]
    cmp r0, #0x0
    beq .L_88
.L_e4:
    ldr r0, [r8, #0x30]
    subs r7, r0, r7
    ldr r0, [sp, #0xc]
    add r0, r0, r7
    str r0, [sp, #0xc]
    beq .L_110
    bl func_02092fc8
    mov r0, r0, lsr #0x10
    str r0, [sp, #0x10]
    orr r0, r0, r1, lsl #0x10
    str r0, [sp, #0x10]
.L_110:
    ldr r0, [r8, #0x30]
    str r0, [r8, #0x28]
    ldrb r0, [r8, #0x8]
    cmp r0, #0x4
    bne .L_198
    ldrh r0, [r8, #0x2c]
    cmp r0, #0x0
    bne .L_198
    cmp r7, #0x0
    bne .L_198
    cmp r6, #0x0
    bne .L_19c
    bl func_02092fc8
    mov r5, r0, lsr #0x10
    orr r5, r5, r1, lsl #0x10
    b .L_160
.L_150:
    bl func_02074374
    ldrh r0, [r8, #0x2c]
    cmp r0, #0x0
    bne .L_188
.L_160:
    ldr r0, [r4]
    blx r0
    cmp r0, #0x0
    beq .L_188
    bl func_02092fc8
    mov r0, r0, lsr #0x10
    orr r0, r0, r1, lsl #0x10
    sub r0, r0, r5
    cmp r0, #0xf
    blt .L_150
.L_188:
    ldrh r0, [r8, #0x2c]
    cmp r0, #0x0
    ldreq r6, [sp, #0x14]
    b .L_19c
.L_198:
    ldr r6, [sp, #0x18]
.L_19c:
    cmp r7, r9
    addcc sl, sl, r7
    subcc r9, r9, r7
    bcc .L_1c8
    sub r1, r7, r9
    add sl, fp, r1
    ldr r0, [sp, #0x8]
    ldr fp, [sp, #0x18]
    sub r9, r0, r1
    mov r0, fp
    str r0, [sp, #0x8]
.L_1c8:
    ldr r0, [r4]
    blx r0
    cmp r0, #0x0
    beq .L_208
    cmp r9, #0x0
    beq .L_208
    ldrb r0, [r8, #0x8]
    cmp r0, #0x4
    bne .L_208
    bl func_02092fc8
    mov r2, r0, lsr #0x10
    ldr r0, [sp, #0x10]
    orr r2, r2, r1, lsl #0x10
    sub r0, r2, r0
    cmp r0, #0x9f
    blt .L_5c
.L_208:
    ldr r0, [sp, #0xc]
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
_LIT0: .word data_0219ee34
