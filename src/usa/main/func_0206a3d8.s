; func_0206a3d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0205405c
        .extern func_020540cc
        .extern func_02068428
        .extern func_02068430
        .extern func_02068438
        .extern func_02068440
        .extern func_0206844c
        .extern func_02068aa8
        .extern func_02068ae0
        .extern func_020aace8
        .global func_0206a3d8
        .arm
func_0206a3d8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x14
    mov r8, r2
    ldrb r2, [r8]
    mov r9, r1
    mov sl, r0
    mov r7, r3
    str r2, [sp, #0x4]
    mov r0, r9
    mov r1, r2
    str r7, [sp]
    ldr r6, [sp, #0x38]
    bl func_0206844c
    ldr r0, [sp, #0x4]
    add r8, r8, #0x5
    ands r0, r0, #0x10
    sub r7, r7, #0x5
    ldr r0, [sp, #0x4]
    addne r8, r8, #0x2
    subne r7, r7, #0x2
    ands r0, r0, #0x2
    moveq r0, #0x0
    streq r0, [sp, #0xc]
    beq .L_8c
    ldrb r1, [r8]
    ldrb r0, [r8, #0x1]
    add r2, sp, #0xc
    sub r7, r7, #0x4
    strb r1, [r2]
    strb r0, [r2, #0x1]
    ldrb r1, [r8, #0x2]
    ldrb r0, [r8, #0x3]
    add r8, r8, #0x4
    strb r1, [r2, #0x2]
    strb r0, [r2, #0x3]
.L_8c:
    ldr r0, [sp, #0x4]
    ands r0, r0, #0x20
    addeq r0, sl, #0x400
    ldreqh r0, [r0, #0xa8]
    streqh r0, [sp, #0xa]
    beq .L_c0
    ldrb r1, [r8]
    ldrb r0, [r8, #0x1]
    add r2, sp, #0xa
    add r8, r8, #0x2
    strb r1, [r2]
    strb r0, [r2, #0x1]
    sub r7, r7, #0x2
.L_c0:
    ldrh r2, [sp, #0xa]
    ldr r1, [sp, #0xc]
    mov r0, r9
    bl func_02068440
    ldr r0, [sp, #0x4]
    ands r0, r0, #0x8
    beq .L_114
    ldrb r2, [r8]
    ldrb r1, [r8, #0x1]
    add r3, sp, #0xc
    mov r0, r9
    strb r2, [r3]
    strb r1, [r3, #0x1]
    ldrb r2, [r8, #0x2]
    ldrb r1, [r8, #0x3]
    add r8, r8, #0x4
    sub r7, r7, #0x4
    strb r2, [r3, #0x2]
    strb r1, [r3, #0x3]
    ldr r1, [sp, #0xc]
    bl func_02068438
.L_114:
    ldr r0, [sp, #0x4]
    ands r0, r0, #0x40
    beq .L_24c
    ldr r0, [sl, #0x8]
    bl func_020540cc
    mov r5, r0
    cmp r5, #0x0
    mov r4, #0x0
    ble .L_234
    mov fp, #0xff
.L_13c:
    ldr r0, [sl, #0x8]
    mov r1, r4
    bl func_0205405c
    mov r1, r0
    ldr r0, [r1, #0x4]
    cmp r0, #0x0
    beq .L_1d4
    cmp r0, #0x1
    beq .L_16c
    cmp r0, #0x2
    beq .L_188
    b .L_228
.L_16c:
    ldrb r2, [r8]
    ldr r1, [r1]
    mov r0, r9
    bl func_02068aa8
    add r8, r8, #0x1
    sub r7, r7, #0x1
    b .L_228
.L_188:
    ldrb ip, [r8]
    ldrb r3, [r8, #0x1]
    add r2, sp, #0x8
    mov r0, r9
    strb ip, [r2]
    strb r3, [r2, #0x1]
    ldrh r3, [sp, #0x8]
    ldr r1, [r1]
    mov r2, r3, asr #0x8
    mov r3, r3, lsl #0x8
    and r2, r2, #0xff
    and r3, r3, #0xff00
    orr r2, r2, r3
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_02068aa8
    add r8, r8, #0x2
    sub r7, r7, #0x2
    b .L_228
.L_1d4:
    cmp r6, #0x0
    ldrneb r0, [r8], #0x1
    subne r7, r7, #0x1
    moveq r0, fp
    cmp r0, #0xff
    bne .L_214
    ldr r1, [r1]
    mov r0, r9
    mov r2, r8
    bl func_02068ae0
    mov r0, r8
    bl func_020aace8
    add r0, r0, #0x1
    add r8, r8, r0
    sub r7, r7, r0
    b .L_228
.L_214:
    add r0, sl, r0, lsl #0x2
    ldr r1, [r1]
    ldr r2, [r0, #0x84]
    mov r0, r9
    bl func_02068ae0
.L_228:
    add r4, r4, #0x1
    cmp r4, r5
    blt .L_13c
.L_234:
    mov r0, r9
    bl func_02068428
    orr r1, r0, #0x1
    mov r0, r9
    and r1, r1, #0xff
    bl func_02068430
.L_24c:
    ldr r0, [sp, #0x4]
    ands r0, r0, #0x80
    beq .L_2c8
    b .L_298
.L_25c:
    mov r0, r8
    mov r4, r8
    bl func_020aace8
    add r3, r0, #0x1
    add r8, r8, r3
    mov r0, r9
    mov r1, r4
    mov r2, r8
    sub r7, r7, r3
    bl func_02068ae0
    mov r0, r8
    bl func_020aace8
    add r0, r0, #0x1
    add r8, r8, r0
    sub r7, r7, r0
.L_298:
    ldrsb r0, [r8]
    cmp r0, #0x0
    beq .L_2ac
    cmp r7, #0x0
    bgt .L_25c
.L_2ac:
    mov r0, r9
    sub r7, r7, #0x1
    bl func_02068428
    orr r1, r0, #0x2
    mov r0, r9
    and r1, r1, #0xff
    bl func_02068430
.L_2c8:
    ldr r0, [sp]
    sub r0, r0, r7
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
