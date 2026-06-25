; func_02088880 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a516c
        .extern func_02087240
        .extern func_02087260
        .extern func_020872a4
        .extern func_020872c0
        .extern func_02087314
        .extern func_020885b8
        .extern func_0208afbc
        .extern func_0208afe8
        .extern func_0209281c
        .extern func_02094ce4
        .extern func_02094d9c
        .extern func_02094eac
        .extern func_02094ef0
        .extern func_02094fac
        .extern func_020b377c
        .extern func_020b3988
        .global func_02088880
        .arm
func_02088880:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x3c
    mov sl, r3
    str r0, [sp, #0x18]
    str r2, [sp, #0x20]
    mov r2, #0x0
    str r1, [sp, #0x1c]
    mov r0, r1
    mov r1, sl
    ldr r9, [sp, #0x6c]
    ldr r8, [sp, #0x74]
    str r2, [sp, #0x2c]
    mvn r6, #0x0
    ldr r4, _LIT0
    bl func_0209281c
    ldr r0, [sp, #0x20]
    mov r1, sl
    bl func_0209281c
    ldr r0, [sp, #0x60]
    ldr r1, [sp, #0x70]
    cmp r0, #0x1
    moveq r7, #0x1
    ldr r0, _LIT1
    movne r7, #0x0
    bl func_020b377c
    ldr r1, [sp, #0x84]
    mov fp, r0
    cmp r1, #0x0
    beq .L_bc
    add r1, fp, #0x10
    bic fp, r1, #0x1f
    mov r2, fp, asr #0x5
    mov r0, sl
    cmp r7, #0x0
    ldr r1, [sp, #0x80]
    moveq r0, sl, lsr #0x1
    str r2, [sp, #0x34]
    bl func_020b3988
    ldr r1, [sp, #0x34]
    mov r5, #0x20
    mul r0, r1, r0
    str r0, [sp, #0x30]
    cmp r7, #0x0
    ldr r0, [sp, #0x34]
    moveq r5, r5, lsr #0x1
    mul r0, r5, r0
    mov r5, r0
.L_bc:
    cmp r7, #0x0
    movne r0, #0x0
    strne r0, [sp, #0x28]
    moveq r0, #0x1
    streq r0, [sp, #0x28]
    cmp r7, #0x0
    movne r0, #0x1
    strne r0, [sp, #0x24]
    moveq r0, #0x0
    streq r0, [sp, #0x24]
    ldr r0, [sp, #0x18]
    cmp r0, #0x2
    movne r0, #0xa
    strne r0, [sp, #0x2c]
    ldr r0, [sp, #0x84]
    cmp r0, #0x0
    beq .L_114
    bl func_02087260
    movs r6, r0
    addmi sp, sp, #0x3c
    movmi r0, #0x0
    ldmmiia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_114:
    mov r0, #0x3
    bl func_020872c0
    cmp r0, #0x0
    bne .L_140
    cmp r6, #0x0
    blt .L_134
    mov r0, r6
    bl func_02087240
.L_134:
    add sp, sp, #0x3c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_140:
    mov r0, #0xa
    bl func_02087314
    cmp r0, #0x0
    bne .L_174
    cmp r6, #0x0
    blt .L_160
    mov r0, r6
    bl func_02087240
.L_160:
    mov r0, #0x3
    bl func_020872a4
    add sp, sp, #0x3c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_174:
    mov r0, #0x0
    mov r7, sl, lsr #0x2
    str r0, [sp]
    str r7, [sp, #0x4]
    str r8, [sp, #0x8]
    str r0, [sp, #0xc]
    cmp r9, #0x0
    movne r3, #0x1
    ldr r1, [sp, #0x78]
    str fp, [sp, #0x10]
    str r1, [sp, #0x14]
    ldr r1, [sp, #0x28]
    ldr r2, [sp, #0x1c]
    moveq r3, #0x2
    mov r0, #0x1
    bl func_02094d9c
    ldr r1, [sp, #0x64]
    str r9, [sp]
    str r1, [sp, #0x4]
    ldr r0, [sp, #0x68]
    ldr r1, [sp, #0x24]
    str r0, [sp, #0x8]
    ldr r2, [sp, #0x1c]
    mov r0, #0x0
    mov r3, r7
    bl func_02094ef0
    mov r0, #0x0
    str r0, [sp]
    str r7, [sp, #0x4]
    str r8, [sp, #0x8]
    str r0, [sp, #0xc]
    cmp r9, #0x0
    movne r3, #0x1
    ldr r2, [sp, #0x7c]
    str fp, [sp, #0x10]
    str r2, [sp, #0x14]
    ldr r1, [sp, #0x28]
    ldr r2, [sp, #0x20]
    moveq r3, #0x2
    mov r0, #0x3
    bl func_02094d9c
    ldr r2, [sp, #0x64]
    str r9, [sp]
    str r2, [sp, #0x4]
    ldr r0, [sp, #0x68]
    ldr r1, [sp, #0x24]
    str r0, [sp, #0x8]
    ldr r2, [sp, #0x20]
    mov r3, r7
    mov r0, #0x1
    bl func_02094ef0
    cmp r6, #0x0
    blt .L_264
    ldr r2, [sp, #0x30]
    ldr r3, _LIT2
    mov r1, r2
    mov r0, r6
    add r1, r1, r5
    str r4, [sp]
    bl func_02094eac
.L_264:
    ldr r0, [sp, #0x18]
    cmp r0, #0x1
    bne .L_284
    mov r0, #0x1
    mov r2, r0
    mov r3, r0
    mov r1, #0x2
    bl func_02094ce4
.L_284:
    cmp r6, #0x0
    movge r0, #0x1
    movge r2, r0, lsl r6
    ldr r0, [sp, #0x2c]
    movlt r2, #0x0
    mov r1, #0x3
    mov r3, #0x0
    bl func_02094fac
    mov r0, #0x1
    str r0, [r4]
    ldr r0, [sp, #0x18]
    ldr r1, [sp, #0x80]
    str r0, [r4, #0x4]
    mov r0, #0xa
    str r0, [r4, #0x20]
    ldr r0, [sp, #0x2c]
    str r0, [r4, #0x24]
    mov r0, #0x3
    str r0, [r4, #0x28]
    ldr r0, [sp, #0x60]
    str r6, [r4, #0x2c]
    str r0, [r4, #0x8]
    ldr r0, [sp, #0x1c]
    str r0, [r4, #0xc]
    ldr r0, [sp, #0x20]
    str r0, [r4, #0x10]
    mov r0, sl
    str sl, [r4, #0x14]
    bl func_020b3988
    str r0, [r4, #0x18]
    mov r1, #0x0
    str r1, [r4, #0x1c]
    ldr r0, [sp, #0x80]
    ldr r1, [sp, #0x84]
    str r0, [r4, #0x30]
    ldr r0, [sp, #0x88]
    str r1, [r4, #0x34]
    str r0, [r4, #0x38]
    add r0, r4, #0x3c
    str r8, [r4, #0x50]
    bl func_0208afe8
    add r0, r4, #0x3c
    mov r1, r8, lsl #0x8
    mov r2, #0x1
    bl func_0208afbc
    mov r0, #0x0
    str r0, [r4, #0x4c]
    mov r0, #0x1
    add sp, sp, #0x3c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_021a516c
_LIT1: .word 0x00ffb0ff
_LIT2: .word func_020885b8
