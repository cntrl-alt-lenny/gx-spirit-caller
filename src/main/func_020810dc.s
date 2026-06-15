; func_020810dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02081ae0
        .global func_020810dc
        .arm
func_020810dc:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x34
    ldr r5, [r0, #0x8]
    ldr r4, [r0, #0xc]
    cmp r5, #0x0
    strge r5, [sp]
    movlt r1, #0x0
    strlt r1, [sp]
    ldr r1, [r0, #0x10]
    cmp r4, #0x0
    add sl, r5, r1
    ldr r1, [r0, #0x14]
    movge r2, r4
    movlt r2, #0x0
    cmp sl, #0x8
    add r3, r4, r1
    movge sl, #0x8
    cmp r3, #0x8
    movge r3, #0x8
    cmp r4, #0x0
    movgt r4, #0x0
    cmp r5, #0x0
    ldr r8, [r0, #0x20]
    movgt r5, #0x0
    rsb r1, r4, #0x0
    mul r7, sl, r8
    ldr r6, [r0, #0x1c]
    rsb r4, r5, #0x0
    mul r9, r6, r4
    ldr r4, [r0, #0x18]
    mov sl, r7
    str r4, [sp, #0x8]
    ldr r4, [sp]
    cmp r8, #0x4
    mul r5, r4, r8
    ldr r4, [sp, #0x8]
    str r5, [sp]
    mla fp, r1, r4, r9
    ldr r1, [r0, #0x4]
    str r1, [sp, #0x4]
    bne .L_1368
    ldr r1, [r0]
    ldr r7, [r0, #0x24]
    add r0, r1, r2, lsl #0x2
    str r0, [sp, #0xc]
    add r0, r1, r3, lsl #0x2
    ldr r1, [sp, #0xc]
    str r0, [sp, #0x10]
    cmp r1, r0
    addcs sp, sp, #0x34
    ldmcsia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, #0x0
    add r9, sp, #0x24
    mov r4, #0xf
    str r0, [sp, #0x1c]
.L_12cc:
    ldr r0, [sp, #0xc]
    mov r1, fp, lsr #0x1f
    ldr r5, [r0]
    ldr r0, [sp, #0x4]
    rsb r2, r1, fp, lsl #0x1d
    add r0, r0, fp, lsr #0x3
    str r0, [sp, #0x24]
    ldr r0, [sp, #0x1c]
    add r1, r1, r2, ror #0x1d
    strb r0, [sp, #0x28]
    strb r0, [sp, #0x29]
    mov r0, r9
    bl func_02081ae0
    ldr r8, [sp]
    mov r0, r8
    cmp r0, sl
    bcs .L_133c
.L_1310:
    mov r0, r9
    mov r1, r6
    bl func_02081ae0
    cmp r0, #0x0
    mvnne r1, r4, lsl r8
    addne r0, r7, r0
    andne r1, r5, r1
    orrne r5, r1, r0, lsl r8
    add r8, r8, #0x4
    cmp r8, sl
    bcc .L_1310
.L_133c:
    ldr r0, [sp, #0xc]
    add r1, r0, #0x4
    str r5, [r0]
    ldr r0, [sp, #0x10]
    str r1, [sp, #0xc]
    cmp r1, r0
    ldr r0, [sp, #0x8]
    add fp, fp, r0
    bcc .L_12cc
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1368:
    ldr r1, [r0]
    ldr r9, [r0, #0x24]
    add r0, r1, r2, lsl #0x3
    str r0, [sp, #0x14]
    add r0, r1, r3, lsl #0x3
    ldr r1, [sp, #0x14]
    str r0, [sp, #0x18]
    cmp r1, r0
    addcs sp, sp, #0x34
    ldmcsia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, #0x0
    mov r4, #0xff
    str r0, [sp, #0x20]
.L_139c:
    mov r1, fp, lsr #0x1f
    rsb r0, r1, fp, lsl #0x1d
    add r1, r1, r0, ror #0x1d
    ldr r0, [sp, #0x14]
    ldr r8, [r0]
    ldr r7, [r0, #0x4]
    ldr r0, [sp, #0x4]
    add r0, r0, fp, lsr #0x3
    str r0, [sp, #0x2c]
    ldr r0, [sp, #0x20]
    strb r0, [sp, #0x30]
    strb r0, [sp, #0x31]
    add r0, sp, #0x2c
    bl func_02081ae0
    ldr r0, [sp]
    cmp r0, sl
    mov r5, r0
    bcs .L_142c
.L_13e4:
    add r0, sp, #0x2c
    mov r1, r6
    bl func_02081ae0
    cmp r0, #0x0
    beq .L_1420
    cmp r5, #0x20
    mvncc r1, r4, lsl r5
    addcc r0, r9, r0
    andcc r1, r8, r1
    orrcc r8, r1, r0, lsl r5
    subcs r2, r5, #0x20
    mvncs r1, r4, lsl r2
    addcs r0, r9, r0
    andcs r1, r7, r1
    orrcs r7, r1, r0, lsl r2
.L_1420:
    add r5, r5, #0x8
    cmp r5, sl
    bcc .L_13e4
.L_142c:
    ldr r0, [sp, #0x14]
    str r8, [r0]
    add r1, r0, #0x8
    str r7, [r0, #0x4]
    ldr r0, [sp, #0x18]
    str r1, [sp, #0x14]
    cmp r1, r0
    ldr r0, [sp, #0x8]
    add fp, fp, r0
    bcc .L_139c
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
