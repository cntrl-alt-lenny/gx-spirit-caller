; func_0208241c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02082704
        .extern func_0208bec0
        .extern func_0208c0b8
        .extern func_0208c260
        .extern func_02094410
        .global func_0208241c
        .arm
func_0208241c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x5c
    mov r9, r1
    ldr r3, [r9, #0x10]
    mov sl, r0
    mov r8, r2
    cmp r3, #0x0
    bne .L_54
    add r2, r9, r8, lsl #0x1
    ldrh r4, [r2, #0x1a]
    and r2, r4, #0x300
    cmp r2, #0x100
    addne sp, sp, #0x5c
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r3, [r9, #0xc]
    and r2, r4, #0xff
    blx r3
    add sp, sp, #0x5c
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_54:
    mov r7, #0x0
    mov r3, r7
    mov r4, r9
    mov r2, r8, lsl #0x1
.L_64:
    add r0, r2, r4
    ldrh r0, [r0, #0x1a]
    and r0, r0, #0x300
    cmp r0, #0x100
    ldreq r0, [r4, #0x4]
    moveq r1, r4
    ldr r4, [r4, #0x10]
    addeq r7, r7, r0
    addeq r3, r3, #0x1
    cmp r4, #0x0
    bne .L_64
    cmp r7, #0x0
    addeq sp, sp, #0x5c
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    cmp r3, #0x1
    bne .L_cc
    add r0, r1, r8, lsl #0x1
    ldrh r2, [r0, #0x1a]
    ldr r3, [r1, #0xc]
    mov r0, sl
    and r2, r2, #0xff
    blx r3
    add sp, sp, #0x5c
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_cc:
    mov r1, sl
    mov r0, #0x0
    mov r2, #0x58
    bl func_02094410
    mvn r0, #0x0
    str r0, [sl]
    add r5, sp, #0x0
    add r4, sp, #0x4
    add fp, sp, #0x10
.L_f0:
    add r0, r9, r8, lsl #0x1
    ldrh r2, [r0, #0x1a]
    and r0, r2, #0x300
    cmp r0, #0x100
    bne .L_298
    ldr r0, [r9, #0x4]
    cmp r0, #0x0
    ble .L_298
    ldr r3, [r9, #0xc]
    mov r0, r5
    mov r1, r9
    and r2, r2, #0xff
    blx r3
    cmp r7, #0x1000
    ldreq r6, [r9, #0x4]
    beq .L_140
    ldr r0, [r9, #0x4]
    mov r1, r7
    bl func_0208bec0
    mov r6, r0
.L_140:
    ldr r3, [sp]
    mov r1, r4
    mov r2, r6
    add r0, sl, #0x4
    and r3, r3, #0x1
    bl func_02082704
    ldr r1, [sp]
    add r0, sl, #0x10
    and r3, r1, #0x8
    mov r1, fp
    mov r2, r6
    bl func_02082704
    ldr r3, [sp]
    add r0, sl, #0x1c
    add r1, sp, #0x1c
    mov r2, r6
    and r3, r3, #0x10
    bl func_02082704
    ldr r0, [sp]
    ands r0, r0, #0x4
    bne .L_1e8
    ldr r0, [sp, #0x4c]
    ldr r2, [sl, #0x4c]
    smull r1, r0, r6, r0
    mov r1, r1, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    add r0, r2, r1
    str r0, [sl, #0x4c]
    ldr r0, [sp, #0x50]
    ldr r2, [sl, #0x50]
    smull r1, r0, r6, r0
    mov r1, r1, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    add r0, r2, r1
    str r0, [sl, #0x50]
    ldr r0, [sp, #0x54]
    ldr r2, [sl, #0x54]
    smull r1, r0, r6, r0
    mov r1, r1, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    add r0, r2, r1
    str r0, [sl, #0x54]
.L_1e8:
    ldr r0, [sp]
    ands r0, r0, #0x2
    bne .L_270
    ldr r0, [sp, #0x28]
    ldr r1, [sl, #0x28]
    mul r0, r6, r0
    add r0, r1, r0, asr #0xc
    str r0, [sl, #0x28]
    ldr r0, [sp, #0x2c]
    ldr r1, [sl, #0x2c]
    mul r0, r6, r0
    add r0, r1, r0, asr #0xc
    str r0, [sl, #0x2c]
    ldr r0, [sp, #0x30]
    ldr r1, [sl, #0x30]
    mul r0, r6, r0
    add r0, r1, r0, asr #0xc
    str r0, [sl, #0x30]
    ldr r0, [sp, #0x34]
    ldr r1, [sl, #0x34]
    mul r0, r6, r0
    add r0, r1, r0, asr #0xc
    str r0, [sl, #0x34]
    ldr r0, [sp, #0x38]
    ldr r1, [sl, #0x38]
    mul r0, r6, r0
    add r0, r1, r0, asr #0xc
    str r0, [sl, #0x38]
    ldr r0, [sp, #0x3c]
    ldr r1, [sl, #0x3c]
    mul r0, r6, r0
    add r0, r1, r0, asr #0xc
    str r0, [sl, #0x3c]
    b .L_288
.L_270:
    ldr r0, [sl, #0x28]
    add r0, r0, r6
    str r0, [sl, #0x28]
    ldr r0, [sl, #0x38]
    add r0, r0, r6
    str r0, [sl, #0x38]
.L_288:
    ldr r1, [sl]
    ldr r0, [sp]
    and r0, r1, r0
    str r0, [sl]
.L_298:
    ldr r9, [r9, #0x10]
    cmp r9, #0x0
    bne .L_f0
    add r0, sl, #0x28
    add r1, sl, #0x34
    add r2, sl, #0x40
    bl func_0208c260
    add r0, sl, #0x28
    mov r1, r0
    bl func_0208c0b8
    add r0, sl, #0x40
    mov r1, r0
    bl func_0208c0b8
    add r0, sl, #0x40
    add r1, sl, #0x28
    add r2, sl, #0x34
    bl func_0208c260
    mov r0, #0x1
    add sp, sp, #0x5c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
